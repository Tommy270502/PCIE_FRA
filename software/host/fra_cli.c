/*
 * fra_cli.c -- Host-side FRA control over PCIe BAR0.
 *
 * Drives fra_core directly from the host instead of through the board's UART
 * console. The measurement maths mirrors software/FRA_Controller/src/main.c so
 * that a host sweep and a firmware sweep produce identical numbers.
 *
 *   fra_cli id
 *   fra_cli status
 *   fra_cli single 1000
 *   fra_cli sweep [--csv out.csv]
 *   fra_cli cal
 *   fra_cli selftest
 *
 * Common options:
 *   --start HZ --stop HZ --points N --amp N --settle N --measure N
 *   --loopback        route the DDS output back into the ADC path in gateware
 *   --bdf BDF         target a specific endpoint
 */
#define _GNU_SOURCE
#include "fra_pcie.h"

#include <errno.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

typedef struct {
    double   start_hz;
    double   stop_hz;
    unsigned points;
    unsigned amplitude;
    unsigned settle_cycles;
    unsigned measure_cycles;
    int      loopback;
} fra_config_t;

typedef struct {
    double   freq_hz;
    double   mag_counts;
    double   phase_deg;
    int64_t  i_acc;
    int64_t  q_acc;
    uint32_t sample_count;
    uint32_t adc_min;
    uint32_t adc_max;
    uint32_t status;
} fra_result_t;

typedef struct {
    double mag_counts[FRA_MAX_POINTS];
    double phase_deg[FRA_MAX_POINTS];
    int    valid[FRA_MAX_POINTS];
} fra_cal_t;

static fra_config_t cfg = {
    .start_hz       = 10.0,
    .stop_hz        = 20000.0,
    .points         = 20u,
    .amplitude      = 128u,
    .settle_cycles  = 2u,
    .measure_cycles = 4u,
    .loopback       = 0,
};

/*
 * Calibration lives in a file so it survives between invocations -- the board
 * firmware keeps it in RAM only, which is fine for an interactive console but
 * useless for a one-shot host command.
 */
#define CAL_PATH_DEFAULT "fra_cal.csv"
static const char *cal_path = CAL_PATH_DEFAULT;

static uint32_t dds_phase_inc(double freq_hz)
{
    if (!isfinite(freq_hz) || freq_hz <= 0.0 ||
        freq_hz >= (FRA_DDS_CLK_HZ / 2.0)) {
        return 0u;
    }
    return (uint32_t)((freq_hz * FRA_DDS_PHASE_SCALE) / FRA_DDS_CLK_HZ + 0.5);
}

static double sweep_freq(unsigned index)
{
    double ratio;

    if (cfg.points <= 1u) {
        return cfg.start_hz;
    }
    ratio = (double)index / (double)(cfg.points - 1u);
    return cfg.start_hz * pow(cfg.stop_hz / cfg.start_hz, ratio);
}

static double wrap_phase_deg(double d)
{
    while (d > 180.0) {
        d -= 360.0;
    }
    while (d <= -180.0) {
        d += 360.0;
    }
    return d;
}

static int64_t combine_signed64(uint32_t lo, uint32_t hi)
{
    uint64_t raw = ((uint64_t)hi << 32) | (uint64_t)lo;

    if ((raw & 0x8000000000000000ULL) != 0ULL) {
        return -1 - (int64_t)(~raw);
    }
    return (int64_t)raw;
}

static void status_flags(uint32_t s, char *out, size_t outsz)
{
    out[0] = '\0';
    if (s & FRA_STATUS_BUSY)       strncat(out, " BUSY",       outsz - strlen(out) - 1);
    if (s & FRA_STATUS_DONE)       strncat(out, " DONE",       outsz - strlen(out) - 1);
    if (s & FRA_STATUS_OVERFLOW)   strncat(out, " OVERFLOW",   outsz - strlen(out) - 1);
    if (s & FRA_STATUS_ADC_CLIP)   strncat(out, " ADC_CLIP",   outsz - strlen(out) - 1);
    if (s & FRA_STATUS_LOW_SIGNAL) strncat(out, " LOW_SIGNAL", outsz - strlen(out) - 1);
    if (s & FRA_STATUS_CONFIG_ERR) strncat(out, " CONFIG_ERR", outsz - strlen(out) - 1);
}

static int wait_for_done(const fra_dev_t *dev, double freq_hz)
{
    double timeout_us_d;
    long   timeout_us;
    long   waited_us = 0;

    timeout_us_d = (((double)cfg.settle_cycles + (double)cfg.measure_cycles + 2.0)
                    * 1000000.0) / freq_hz;
    timeout_us_d += 500000.0;
    if (timeout_us_d < 1000000.0)  timeout_us_d = 1000000.0;
    if (timeout_us_d > 60000000.0) timeout_us_d = 60000000.0;
    timeout_us = (long)timeout_us_d;

    while (waited_us < timeout_us) {
        if (fra_rd(dev, FRA_REG_STATUS) & FRA_STATUS_DONE) {
            return 1;
        }
        usleep(200);
        waited_us += 200;
    }
    return 0;
}

static int run_measurement(const fra_dev_t *dev, double freq_hz,
                           fra_result_t *r)
{
    uint32_t phase_inc = dds_phase_inc(freq_hz);
    uint32_t ctrl;
    uint32_t min_max;
    double   mag;

    if (phase_inc == 0u) {
        return 0;
    }

    fra_wr(dev, FRA_REG_PHASE_INC,      phase_inc);
    fra_wr(dev, FRA_REG_PHASE_OFFSET,   0u);
    fra_wr(dev, FRA_REG_AMPLITUDE,      cfg.amplitude & 0xFFu);
    fra_wr(dev, FRA_REG_SETTLE_CYCLES,  cfg.settle_cycles);
    fra_wr(dev, FRA_REG_MEASURE_CYCLES, cfg.measure_cycles);

    ctrl = FRA_CTRL_DDS_ENABLE | FRA_CTRL_CLEAR_DONE |
           FRA_CTRL_RESET_PHASE | FRA_CTRL_START;
    if (cfg.loopback) {
        ctrl |= FRA_CTRL_LOOPBACK_EN;
    }
    fra_wr(dev, FRA_REG_CTRL, ctrl);

    if (!wait_for_done(dev, freq_hz)) {
        return 0;
    }

    r->freq_hz      = freq_hz;
    r->i_acc        = combine_signed64(fra_rd(dev, FRA_REG_I_ACC_LO),
                                       fra_rd(dev, FRA_REG_I_ACC_HI));
    r->q_acc        = combine_signed64(fra_rd(dev, FRA_REG_Q_ACC_LO),
                                       fra_rd(dev, FRA_REG_Q_ACC_HI));
    min_max         = fra_rd(dev, FRA_REG_ADC_MIN_MAX);
    r->adc_min      = min_max & 0xFFu;
    r->adc_max      = (min_max >> 8) & 0xFFu;
    r->status       = fra_rd(dev, FRA_REG_STATUS);
    r->sample_count = fra_rd(dev, FRA_REG_SAMPLE_COUNT);

    if (r->sample_count == 0u) {
        r->mag_counts = 0.0;
        r->phase_deg  = 0.0;
        r->status    |= FRA_STATUS_CONFIG_ERR;
        return 1;
    }

    mag = hypot((double)r->i_acc, (double)r->q_acc);
    r->mag_counts = (2.0 * mag) / ((double)r->sample_count * 127.0);
    r->phase_deg  = atan2((double)r->q_acc, (double)r->i_acc) * 180.0 / M_PI;
    return 1;
}

static int result_valid_for_cal(const fra_result_t *r)
{
    const uint32_t bad = FRA_STATUS_OVERFLOW | FRA_STATUS_ADC_CLIP |
                         FRA_STATUS_LOW_SIGNAL | FRA_STATUS_CONFIG_ERR;

    return ((r->status & bad) == 0u) && (r->sample_count > 0u) &&
           isfinite(r->mag_counts) && (r->mag_counts > 0.0);
}

/* --- calibration persistence -------------------------------------------- */

static void cal_clear(fra_cal_t *c)
{
    memset(c, 0, sizeof(*c));
}

/*
 * The baseline is stored per sweep index, not per frequency, so it is only
 * meaningful for the sweep it was taken with. Normalising a 20-point 10 Hz-20
 * kHz sweep against a baseline taken over a different range would silently
 * produce wrong numbers, so the config is recorded and checked on load.
 */
static int cal_load(fra_cal_t *c)
{
    FILE *f = fopen(cal_path, "r");
    char  line[256];
    int   config_seen = 0;

    cal_clear(c);
    if (f == NULL) {
        return 0;
    }
    while (fgets(line, sizeof(line), f) != NULL) {
        unsigned idx;
        double   mag, ph;

        if (line[0] == '#') {
            double   c_start, c_stop;
            unsigned c_points, c_amp, c_settle, c_measure;
            int      c_loopback;

            if (sscanf(line,
                       "# start=%lf stop=%lf points=%u amp=%u settle=%u "
                       "measure=%u loopback=%d",
                       &c_start, &c_stop, &c_points, &c_amp, &c_settle,
                       &c_measure, &c_loopback) == 7) {
                config_seen = 1;
                if (c_points != cfg.points ||
                    fabs(c_start - cfg.start_hz) > 1e-6 ||
                    fabs(c_stop - cfg.stop_hz) > 1e-6 ||
                    c_amp != cfg.amplitude ||
                    c_settle != cfg.settle_cycles ||
                    c_measure != cfg.measure_cycles ||
                    c_loopback != cfg.loopback) {
                    fprintf(stderr,
                            "warning: %s was taken with a different setup\n"
                            "  baseline: start=%.3f stop=%.3f points=%u amp=%u "
                            "settle=%u measure=%u loopback=%d\n"
                            "  current : start=%.3f stop=%.3f points=%u amp=%u "
                            "settle=%u measure=%u loopback=%d\n"
                            "  ignoring it; re-run 'cal' for these settings.\n",
                            cal_path, c_start, c_stop, c_points, c_amp,
                            c_settle, c_measure, c_loopback,
                            cfg.start_hz, cfg.stop_hz, cfg.points,
                            cfg.amplitude, cfg.settle_cycles,
                            cfg.measure_cycles, cfg.loopback);
                    fclose(f);
                    cal_clear(c);
                    return 0;
                }
            }
            continue;
        }
        if (line[0] == 'i') {
            continue; /* header row */
        }
        if (sscanf(line, "%u,%lf,%lf", &idx, &mag, &ph) == 3 &&
            idx < FRA_MAX_POINTS) {
            c->mag_counts[idx] = mag;
            c->phase_deg[idx]  = ph;
            c->valid[idx]      = 1;
        }
    }
    fclose(f);

    if (!config_seen) {
        fprintf(stderr, "warning: %s has no config header; assuming it matches\n",
                cal_path);
    }
    return 1;
}

static int cal_save(const fra_cal_t *c)
{
    FILE    *f = fopen(cal_path, "w");
    unsigned i;

    if (f == NULL) {
        fprintf(stderr, "cannot write %s: %s\n", cal_path, strerror(errno));
        return 0;
    }
    fprintf(f, "# fra_cli calibration baseline\n");
    /* Parsed back by cal_load; keep the format in step with it. */
    fprintf(f, "# start=%.6f stop=%.6f points=%u amp=%u settle=%u measure=%u loopback=%d\n",
            cfg.start_hz, cfg.stop_hz, cfg.points, cfg.amplitude,
            cfg.settle_cycles, cfg.measure_cycles, cfg.loopback);
    fprintf(f, "idx,mag_counts,phase_deg\n");
    for (i = 0; i < cfg.points && i < FRA_MAX_POINTS; i++) {
        if (c->valid[i]) {
            fprintf(f, "%u,%.9g,%.9g\n", i, c->mag_counts[i], c->phase_deg[i]);
        }
    }
    fclose(f);
    return 1;
}

/* --- output -------------------------------------------------------------- */

static void print_csv_header(FILE *out)
{
    fprintf(out, "idx,freq_hz,mag_counts,phase_deg,norm_db,norm_phase_deg,"
                 "i_acc,q_acc,samples,adc_min,adc_max,status\n");
}

static void print_row(FILE *out, unsigned idx, const fra_result_t *r,
                      const fra_cal_t *cal)
{
    int    has_cal = 0;
    double norm_db = 0.0, norm_ph = 0.0;
    char   flags[96];

    if (cal != NULL && result_valid_for_cal(r) && idx < FRA_MAX_POINTS &&
        cal->valid[idx] && cal->mag_counts[idx] > 0.0) {
        has_cal = 1;
        norm_db = 20.0 * log10(r->mag_counts / cal->mag_counts[idx]);
        norm_ph = wrap_phase_deg(r->phase_deg - cal->phase_deg[idx]);
    }

    status_flags(r->status, flags, sizeof(flags));

    fprintf(out, "%u,%.3f,%.6f,%.3f,", idx, r->freq_hz, r->mag_counts,
            r->phase_deg);
    if (has_cal) {
        fprintf(out, "%.6f,%.3f,", norm_db, norm_ph);
    } else {
        fprintf(out, "nan,nan,");
    }
    fprintf(out, "%lld,%lld,%u,%u,%u,0x%08X%s\n",
            (long long)r->i_acc, (long long)r->q_acc, r->sample_count,
            r->adc_min, r->adc_max, r->status, flags);
}

/* --- commands ------------------------------------------------------------ */

static void cmd_id(const fra_dev_t *dev)
{
    char path[256];
    char buf[64];
    FILE *f;

    printf("endpoint     : %s\n", dev->bdf);
    printf("access via   : %s\n", fra_backend_name(dev));
    printf("BOARD_ID     : 0x%08X %s\n", dev->board_id,
           dev->board_id == FRA_BOARD_ID_EXPECT ? "(AX7015B)" : "(UNEXPECTED)");
    printf("BAR version  : 0x%08X\n", dev->bar_version);
    if (dev->has_core) {
        printf("core version : 0x%08X\n", dev->core_version);
    } else {
        printf("core version : not mapped over BAR0 (read 0x%08X)\n",
               dev->core_version);
    }

    snprintf(path, sizeof(path),
             "/sys/bus/pci/devices/%s/current_link_speed", dev->bdf);
    f = fopen(path, "r");
    if (f != NULL && fgets(buf, sizeof(buf), f) != NULL) {
        buf[strcspn(buf, "\n")] = '\0';
        printf("link speed   : %s\n", buf);
    }
    if (f != NULL) fclose(f);

    snprintf(path, sizeof(path),
             "/sys/bus/pci/devices/%s/current_link_width", dev->bdf);
    f = fopen(path, "r");
    if (f != NULL && fgets(buf, sizeof(buf), f) != NULL) {
        buf[strcspn(buf, "\n")] = '\0';
        printf("link width   : x%s\n", buf);
    }
    if (f != NULL) fclose(f);
}

static void cmd_status(const fra_dev_t *dev)
{
    uint32_t st  = fra_rd(dev, FRA_REG_STATUS);
    uint32_t mm  = fra_rd(dev, FRA_REG_ADC_MIN_MAX);
    char     flags[96];

    status_flags(st, flags, sizeof(flags));
    printf("STATUS         0x%08X%s\n", st, flags);
    printf("PHASE_INC      %u\n",  fra_rd(dev, FRA_REG_PHASE_INC));
    printf("AMPLITUDE      %u\n",  fra_rd(dev, FRA_REG_AMPLITUDE));
    printf("SETTLE_CYCLES  %u\n",  fra_rd(dev, FRA_REG_SETTLE_CYCLES));
    printf("MEASURE_CYCLES %u\n",  fra_rd(dev, FRA_REG_MEASURE_CYCLES));
    printf("SAMPLE_COUNT   %u\n",  fra_rd(dev, FRA_REG_SAMPLE_COUNT));
    printf("ADC min/max    %u/%u\n", mm & 0xFFu, (mm >> 8) & 0xFFu);
    printf("LAST_SAMPLE    %u\n",  fra_rd(dev, FRA_REG_LAST_SAMPLE) & 0xFFu);
    printf("config: start=%.3fHz stop=%.3fHz points=%u amp=%u settle=%u measure=%u loopback=%d\n",
           cfg.start_hz, cfg.stop_hz, cfg.points, cfg.amplitude,
           cfg.settle_cycles, cfg.measure_cycles, cfg.loopback);
}

static int cmd_single(const fra_dev_t *dev, double hz)
{
    fra_result_t r;

    memset(&r, 0, sizeof(r));
    if (!run_measurement(dev, hz, &r)) {
        fprintf(stderr, "measurement at %.3f Hz failed "
                        "(frequency out of range, or core never asserted DONE)\n", hz);
        return 1;
    }
    print_csv_header(stdout);
    print_row(stdout, 0, &r, NULL);
    return 0;
}

static int cmd_sweep(const fra_dev_t *dev, const char *csv_path)
{
    fra_cal_t cal;
    FILE     *out = stdout;
    unsigned  i;
    int       rc = 0;

    cal_load(&cal);

    if (csv_path != NULL) {
        out = fopen(csv_path, "w");
        if (out == NULL) {
            fprintf(stderr, "cannot write %s: %s\n", csv_path, strerror(errno));
            return 1;
        }
    }

    print_csv_header(out);
    for (i = 0; i < cfg.points && i < FRA_MAX_POINTS; i++) {
        double       hz = sweep_freq(i);
        fra_result_t r;

        memset(&r, 0, sizeof(r));
        if (!run_measurement(dev, hz, &r)) {
            fprintf(out, "%u,%.3f,nan,nan,nan,nan,0,0,0,0,0,ERROR\n", i, hz);
            rc = 1;
            continue;
        }
        print_row(out, i, &r, &cal);
    }

    if (out != stdout) {
        fclose(out);
        printf("wrote %s (%u points)\n", csv_path, cfg.points);
    }
    return rc;
}

static int cmd_cal(const fra_dev_t *dev)
{
    fra_cal_t cal;
    unsigned  i;
    unsigned  good = 0;

    cal_clear(&cal);
    for (i = 0; i < cfg.points && i < FRA_MAX_POINTS; i++) {
        double       hz = sweep_freq(i);
        fra_result_t r;

        memset(&r, 0, sizeof(r));
        if (!run_measurement(dev, hz, &r)) {
            fprintf(stderr, "cal point %u (%.3f Hz): measurement failed\n", i, hz);
            continue;
        }
        if (!result_valid_for_cal(&r)) {
            char flags[96];
            status_flags(r.status, flags, sizeof(flags));
            fprintf(stderr, "cal point %u (%.3f Hz): rejected%s\n", i, hz,
                    flags[0] ? flags : " (zero magnitude)");
            continue;
        }
        cal.mag_counts[i] = r.mag_counts;
        cal.phase_deg[i]  = r.phase_deg;
        cal.valid[i]      = 1;
        good++;
    }

    if (good == 0) {
        fprintf(stderr, "calibration failed: no valid points.\n"
                        "With no AD/DA module fitted, use --loopback.\n");
        return 1;
    }
    if (!cal_save(&cal)) {
        return 1;
    }
    printf("calibrated %u/%u points -> %s\n", good, cfg.points, cal_path);
    return 0;
}

/*
 * selftest exercises the whole host->PCIe->AXI->fra_core->accumulator path
 * using the gateware loopback, so it needs no analog front end fitted.
 */
static int cmd_selftest(const fra_dev_t *dev)
{
    static const double test_hz[] = { 100.0, 1000.0, 10000.0, 20000.0 };
    unsigned i;
    int      fails = 0;
    int      saved_loopback = cfg.loopback;
    double   exp_mag;
    double   exp_phase;

    cfg.loopback = 1;

    printf("PCIe FRA self-test (gateware loopback, no analog front end needed)\n");
    printf("amplitude %u -> expected magnitude %.4f counts\n\n",
           cfg.amplitude, 127.0 * (double)cfg.amplitude / 255.0);
    printf("  %-10s %-12s %-12s %-12s %-8s %s\n",
           "freq_hz", "mag_counts", "expected", "phase_deg", "samples", "status");

    for (i = 0; i < sizeof(test_hz) / sizeof(test_hz[0]); i++) {
        fra_result_t r;
        char         flags[96];
        int          ok;

        memset(&r, 0, sizeof(r));
        if (!run_measurement(dev, test_hz[i], &r)) {
            printf("  %-10.1f MEASUREMENT FAILED\n", test_hz[i]);
            fails++;
            continue;
        }
        status_flags(r.status, flags, sizeof(flags));

        /*
         * In loopback the ADC path sees the DAC word directly. mag_counts is a
         * peak ADC deviation in counts, so it lands at 127*amp/255 (~63.7 at
         * the default amplitude of 128), not at unity. Phase is one sample tick
         * of delay: -360*f/25e6 degrees. Measured on hardware at 1 kHz:
         * 63.685 counts and -0.0129 deg, against 63.749 and -0.0144 predicted.
         */
        exp_mag   = 127.0 * (double)cfg.amplitude / 255.0;
        exp_phase = -360.0 * r.freq_hz / FRA_DDS_CLK_HZ;

        ok = result_valid_for_cal(&r) &&
             fabs(r.mag_counts - exp_mag) <= 0.05 * exp_mag &&
             fabs(wrap_phase_deg(r.phase_deg) - exp_phase) <= 1.0;

        printf("  %-10.1f %-12.4f %-12.4f %-12.4f %-8u %s%s\n",
               r.freq_hz, r.mag_counts, exp_mag, r.phase_deg, r.sample_count,
               ok ? "PASS" : "FAIL", flags);
        if (!ok) {
            fails++;
        }
    }

    cfg.loopback = saved_loopback;
    printf("\n%s\n", fails == 0 ? "SELFTEST PASS" : "SELFTEST FAIL");
    return fails == 0 ? 0 : 1;
}

static void usage(const char *prog)
{
    fprintf(stderr,
        "usage: %s [options] <command> [args]\n"
        "\n"
        "commands:\n"
        "  id                    identity, versions and PCIe link state\n"
        "  status                fra_core register dump\n"
        "  single <hz>           one measurement, CSV row on stdout\n"
        "  sweep                 full sweep, CSV on stdout\n"
        "  cal                   store a baseline sweep for normalisation\n"
        "  selftest              loopback self-test of the whole path\n"
        "  bar                   raw BAR0 hexdump (first 64 bytes of each window)\n"
        "\n"
        "options:\n"
        "  --start HZ            sweep start (default %.1f)\n"
        "  --stop HZ             sweep stop (default %.1f)\n"
        "  --points N            1..%u (default %u)\n"
        "  --amp N               DDS amplitude 0..255 (default %u)\n"
        "  --settle N            settle cycles (default %u)\n"
        "  --measure N           measure cycles (default %u)\n"
        "  --loopback            enable gateware DAC->ADC loopback\n"
        "  --cal-file PATH       calibration file (default %s)\n"
        "  --csv PATH            write sweep CSV to PATH\n"
        "  --bdf BDF             target endpoint, e.g. 0000:08:00.0\n",
        prog, cfg.start_hz, cfg.stop_hz, FRA_MAX_POINTS, cfg.points,
        cfg.amplitude, cfg.settle_cycles, cfg.measure_cycles, CAL_PATH_DEFAULT);
}

static void cmd_bar(const fra_dev_t *dev)
{
    unsigned w, i;

    for (w = 0; w < 2; w++) {
        uint32_t base = w == 0 ? FRA_BAR_REGS_BASE : FRA_CORE_BASE;

        printf("BAR0+0x%04X (%s):\n", base,
               w == 0 ? "pcie_bar_regs" : "fra_core");
        for (i = 0; i < 64; i += 16) {
            printf("  %04X: %08X %08X %08X %08X\n", base + i,
                   fra_rd(dev, base + i +  0), fra_rd(dev, base + i +  4),
                   fra_rd(dev, base + i +  8), fra_rd(dev, base + i + 12));
        }
    }
}

int main(int argc, char **argv)
{
    fra_dev_t   dev;
    char        err[512] = { 0 };
    const char *bdf = NULL;
    const char *csv = NULL;
    const char *cmd = NULL;
    const char *arg1 = NULL;
    int         i;
    int         rc = 0;

    for (i = 1; i < argc; i++) {
        const char *a = argv[i];

        if (strcmp(a, "--start") == 0 && i + 1 < argc) {
            cfg.start_hz = atof(argv[++i]);
        } else if (strcmp(a, "--stop") == 0 && i + 1 < argc) {
            cfg.stop_hz = atof(argv[++i]);
        } else if (strcmp(a, "--points") == 0 && i + 1 < argc) {
            cfg.points = (unsigned)strtoul(argv[++i], NULL, 0);
        } else if (strcmp(a, "--amp") == 0 && i + 1 < argc) {
            cfg.amplitude = (unsigned)strtoul(argv[++i], NULL, 0);
        } else if (strcmp(a, "--settle") == 0 && i + 1 < argc) {
            cfg.settle_cycles = (unsigned)strtoul(argv[++i], NULL, 0);
        } else if (strcmp(a, "--measure") == 0 && i + 1 < argc) {
            cfg.measure_cycles = (unsigned)strtoul(argv[++i], NULL, 0);
        } else if (strcmp(a, "--loopback") == 0) {
            cfg.loopback = 1;
        } else if (strcmp(a, "--cal-file") == 0 && i + 1 < argc) {
            cal_path = argv[++i];
        } else if (strcmp(a, "--csv") == 0 && i + 1 < argc) {
            csv = argv[++i];
        } else if (strcmp(a, "--bdf") == 0 && i + 1 < argc) {
            bdf = argv[++i];
        } else if (strcmp(a, "-h") == 0 || strcmp(a, "--help") == 0) {
            usage(argv[0]);
            return 0;
        } else if (a[0] == '-') {
            fprintf(stderr, "unknown option: %s\n", a);
            usage(argv[0]);
            return 2;
        } else if (cmd == NULL) {
            cmd = a;
        } else if (arg1 == NULL) {
            arg1 = a;
        }
    }

    if (cmd == NULL) {
        usage(argv[0]);
        return 2;
    }
    if (cfg.points < 1u || cfg.points > FRA_MAX_POINTS) {
        fprintf(stderr, "--points must be 1..%u\n", FRA_MAX_POINTS);
        return 2;
    }
    if (cfg.amplitude > 255u) {
        fprintf(stderr, "--amp must be 0..255\n");
        return 2;
    }
    if (cfg.measure_cycles == 0u) {
        fprintf(stderr, "--measure must be nonzero\n");
        return 2;
    }

    if (fra_open(&dev, bdf, err, sizeof(err)) != 0) {
        fprintf(stderr, "fra_cli: %s\n", err);
        return 1;
    }

    if (strcmp(cmd, "id") == 0) {
        cmd_id(&dev);
    } else if (strcmp(cmd, "bar") == 0) {
        cmd_bar(&dev);
    } else if (!dev.has_core) {
        fprintf(stderr,
                "fra_cli: '%s' needs fra_core over BAR0, but this gateware only\n"
                "  maps pcie_bar_regs (BAR0+0x1000 reads 0x%08X).\n"
                "  Rebuild and reflash the gateware, then retry.\n"
                "  'fra_cli id' and 'fra_cli bar' still work.\n",
                cmd, dev.core_version);
        rc = 1;
    } else if (strcmp(cmd, "status") == 0) {
        cmd_status(&dev);
    } else if (strcmp(cmd, "single") == 0) {
        if (arg1 == NULL) {
            fprintf(stderr, "single needs a frequency in Hz\n");
            rc = 2;
        } else {
            rc = cmd_single(&dev, atof(arg1));
        }
    } else if (strcmp(cmd, "sweep") == 0) {
        rc = cmd_sweep(&dev, csv);
    } else if (strcmp(cmd, "cal") == 0) {
        rc = cmd_cal(&dev);
    } else if (strcmp(cmd, "selftest") == 0) {
        rc = cmd_selftest(&dev);
    } else {
        fprintf(stderr, "unknown command: %s\n", cmd);
        usage(argv[0]);
        rc = 2;
    }

    fra_close(&dev);
    return rc;
}
