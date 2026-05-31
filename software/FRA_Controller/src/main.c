#include "xparameters.h"
#include "xil_types.h"
#include "xil_io.h"
#include "xil_printf.h"
#include "sleep.h"

#include <ctype.h>
#include <errno.h>
#include <math.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

#if defined(XPAR_FRA_CORE_0_BASEADDR)
#define FRA_BASEADDR ((UINTPTR)XPAR_FRA_CORE_0_BASEADDR)
#elif defined(XPAR_FRA_CORE_BASEADDR)
#define FRA_BASEADDR ((UINTPTR)XPAR_FRA_CORE_BASEADDR)
#else
#define FRA_BASEADDR ((UINTPTR)0x43C00000u)
#endif

#define DDS_CLK_HZ              25000000.0
#define DDS_PHASE_SCALE         4294967296.0
#define MAX_SWEEP_POINTS        64u
#define LINE_BUF_SIZE           96u

#define REG_VERSION             0x00u
#define REG_CONTROL             0x04u
#define REG_STATUS              0x08u
#define REG_PHASE_INC           0x0Cu
#define REG_PHASE_OFFSET        0x10u
#define REG_AMPLITUDE           0x14u
#define REG_SETTLE_CYCLES       0x18u
#define REG_MEASURE_CYCLES      0x1Cu
#define REG_SAMPLE_COUNT        0x20u
#define REG_I_ACC_LO            0x24u
#define REG_I_ACC_HI            0x28u
#define REG_Q_ACC_LO            0x2Cu
#define REG_Q_ACC_HI            0x30u
#define REG_ADC_MIN_MAX         0x34u
#define REG_LAST_SAMPLE         0x38u

#define CTRL_DDS_ENABLE         0x00000001u
#define CTRL_START              0x00000002u
#define CTRL_CLEAR_DONE         0x00000004u
#define CTRL_RESET_PHASE        0x00000008u

#define STATUS_BUSY             0x00000001u
#define STATUS_DONE             0x00000002u
#define STATUS_OVERFLOW         0x00000004u
#define STATUS_ADC_CLIP         0x00000008u
#define STATUS_LOW_SIGNAL       0x00000010u
#define STATUS_CONFIG_ERR       0x00000020u

typedef struct {
    double start_hz;
    double stop_hz;
    u32 points;
    u32 amplitude;
    u32 settle_cycles;
    u32 measure_cycles;
} FraConfig;

typedef struct {
    double freq_hz;
    double mag_counts;
    double phase_deg;
    int64_t i_acc;
    int64_t q_acc;
    u32 sample_count;
    u32 adc_min;
    u32 adc_max;
    u32 status;
} FraResult;

typedef struct {
    double mag_counts[MAX_SWEEP_POINTS];
    double phase_deg[MAX_SWEEP_POINTS];
    u32 valid[MAX_SWEEP_POINTS];
} FraCalibration;

static FraConfig Config = {
    10.0,
    20000.0,
    20u,
    128u,
    2u,
    4u
};

static FraCalibration Calibration;

static u32 RegRead(u32 offset)
{
    return Xil_In32(FRA_BASEADDR + offset);
}

static void RegWrite(u32 offset, u32 value)
{
    Xil_Out32(FRA_BASEADDR + offset, value);
}

static u32 DdsPhaseIncFromFreq(double freq_hz)
{
    if (!isfinite(freq_hz) || (freq_hz <= 0.0) || (freq_hz >= (DDS_CLK_HZ / 2.0))) {
        return 0u;
    }

    return (u32)((freq_hz * DDS_PHASE_SCALE) / DDS_CLK_HZ + 0.5);
}

static int StrEq(const char *a, const char *b)
{
    while ((*a != '\0') && (*b != '\0')) {
        if (tolower((unsigned char)*a) != tolower((unsigned char)*b)) {
            return 0;
        }
        a++;
        b++;
    }

    return (*a == '\0') && (*b == '\0');
}

static int ParseDouble(const char *text, double *value)
{
    char *end = NULL;
    double parsed;

    if (text == NULL) {
        return 0;
    }

    parsed = strtod(text, &end);
    if ((end == text) || (*end != '\0')) {
        return 0;
    }

    *value = parsed;
    return 1;
}

static int ParseU32(const char *text, u32 *value)
{
    char *end = NULL;
    unsigned long parsed;

    if ((text == NULL) || (*text == '\0') || (*text == '-')) {
        return 0;
    }

    errno = 0;
    parsed = strtoul(text, &end, 0);
    if ((end == text) || (*end != '\0') || (errno == ERANGE) || (parsed > UINT32_MAX)) {
        return 0;
    }

    *value = (u32)parsed;
    return 1;
}

static void PrintU64(uint64_t value)
{
    char buf[21];
    int i = 0;

    if (value == 0u) {
        xil_printf("0");
        return;
    }

    while (value > 0u) {
        buf[i++] = (char)('0' + (value % 10u));
        value /= 10u;
    }

    while (i > 0) {
        xil_printf("%c", buf[--i]);
    }
}

static void PrintI64(int64_t value)
{
    uint64_t magnitude;

    if (value < 0) {
        xil_printf("-");
        magnitude = (uint64_t)(-(value + 1)) + 1u;
    } else {
        magnitude = (uint64_t)value;
    }

    PrintU64(magnitude);
}

static int64_t RoundMilli(double value)
{
    if (value >= 0.0) {
        return (int64_t)(value * 1000.0 + 0.5);
    }

    return (int64_t)(value * 1000.0 - 0.5);
}

static void PrintFixedMilli(int64_t milli)
{
    uint64_t magnitude;

    if (milli < 0) {
        xil_printf("-");
        magnitude = (uint64_t)(-(milli + 1)) + 1u;
    } else {
        magnitude = (uint64_t)milli;
    }

    PrintU64(magnitude / 1000u);
    xil_printf(".%03lu", (unsigned long)(magnitude % 1000u));
}

static void PrintDouble3(double value)
{
    if (!isfinite(value) ||
        (value > ((double)INT64_MAX / 1000.0)) ||
        (value < ((double)INT64_MIN / 1000.0))) {
        xil_printf("nan");
        return;
    }

    PrintFixedMilli(RoundMilli(value));
}

static void ClearCalibration(void)
{
    u32 i;

    for (i = 0u; i < MAX_SWEEP_POINTS; i++) {
        Calibration.mag_counts[i] = 0.0;
        Calibration.phase_deg[i] = 0.0;
        Calibration.valid[i] = 0u;
    }
}

static double SweepFreq(u32 index)
{
    double ratio;

    if (Config.points <= 1u) {
        return Config.start_hz;
    }

    ratio = (double)index / (double)(Config.points - 1u);
    return Config.start_hz * pow(Config.stop_hz / Config.start_hz, ratio);
}

static double WrapPhaseDeg(double phase_deg)
{
    while (phase_deg > 180.0) {
        phase_deg -= 360.0;
    }

    while (phase_deg <= -180.0) {
        phase_deg += 360.0;
    }

    return phase_deg;
}

static void PrintStatusFlags(u32 status)
{
    if (status & STATUS_BUSY) {
        xil_printf(" BUSY");
    }
    if (status & STATUS_DONE) {
        xil_printf(" DONE");
    }
    if (status & STATUS_OVERFLOW) {
        xil_printf(" OVERFLOW");
    }
    if (status & STATUS_ADC_CLIP) {
        xil_printf(" ADC_CLIP");
    }
    if (status & STATUS_LOW_SIGNAL) {
        xil_printf(" LOW_SIGNAL");
    }
    if (status & STATUS_CONFIG_ERR) {
        xil_printf(" CONFIG_ERR");
    }
}

static void PrintConfig(void)
{
    xil_printf("config: start=");
    PrintDouble3(Config.start_hz);
    xil_printf("Hz stop=");
    PrintDouble3(Config.stop_hz);
    xil_printf("Hz points=%lu amp=%lu settle=%lu measure=%lu\r\n",
               (unsigned long)Config.points,
               (unsigned long)Config.amplitude,
               (unsigned long)Config.settle_cycles,
               (unsigned long)Config.measure_cycles);
}

static void PrintCoreStatus(void)
{
    u32 status = RegRead(REG_STATUS);
    u32 adc_min_max = RegRead(REG_ADC_MIN_MAX);

    xil_printf("base=0x%08lx version=0x%08lx status=0x%08lx",
               (unsigned long)FRA_BASEADDR,
               (unsigned long)RegRead(REG_VERSION),
               (unsigned long)status);
    PrintStatusFlags(status);
    xil_printf("\r\n");

    xil_printf("phase_inc=%lu amplitude=%lu samples=%lu adc_min=%lu adc_max=%lu last=%lu\r\n",
               (unsigned long)RegRead(REG_PHASE_INC),
               (unsigned long)(RegRead(REG_AMPLITUDE) & 0xFFu),
               (unsigned long)RegRead(REG_SAMPLE_COUNT),
               (unsigned long)(adc_min_max & 0xFFu),
               (unsigned long)((adc_min_max >> 8) & 0xFFu),
               (unsigned long)(RegRead(REG_LAST_SAMPLE) & 0xFFu));
    PrintConfig();
}

static int WaitForDone(double freq_hz)
{
    double timeout_us_d;
    u32 timeout_us;
    u32 waited_us = 0u;
    u32 status;

    timeout_us_d = (((double)Config.settle_cycles + (double)Config.measure_cycles + 2.0) * 1000000.0) / freq_hz;
    timeout_us_d += 500000.0;

    if (timeout_us_d < 1000000.0) {
        timeout_us_d = 1000000.0;
    }
    if (timeout_us_d > 60000000.0) {
        timeout_us_d = 60000000.0;
    }

    timeout_us = (u32)timeout_us_d;

    while (waited_us < timeout_us) {
        status = RegRead(REG_STATUS);
        if ((status & STATUS_DONE) != 0u) {
            return 1;
        }

        usleep(1000u);
        waited_us += 1000u;
    }

    return 0;
}

static int64_t CombineSigned64(u32 lo, u32 hi)
{
    uint64_t raw = ((uint64_t)hi << 32) | (uint64_t)lo;

    if ((raw & 0x8000000000000000ULL) != 0ULL) {
        return -1 - (int64_t)(~raw);
    }

    return (int64_t)raw;
}

static int RunMeasurement(double freq_hz, FraResult *result)
{
    u32 phase_inc;
    u32 adc_min_max;
    u32 i_lo;
    u32 i_hi;
    u32 q_lo;
    u32 q_hi;
    double mag;

    phase_inc = DdsPhaseIncFromFreq(freq_hz);
    if (phase_inc == 0u) {
        return 0;
    }

    RegWrite(REG_PHASE_INC, phase_inc);
    RegWrite(REG_PHASE_OFFSET, 0u);
    RegWrite(REG_AMPLITUDE, Config.amplitude & 0xFFu);
    RegWrite(REG_SETTLE_CYCLES, Config.settle_cycles);
    RegWrite(REG_MEASURE_CYCLES, Config.measure_cycles);
    RegWrite(REG_CONTROL, CTRL_DDS_ENABLE | CTRL_CLEAR_DONE | CTRL_RESET_PHASE | CTRL_START);

    if (!WaitForDone(freq_hz)) {
        return 0;
    }

    i_lo = RegRead(REG_I_ACC_LO);
    i_hi = RegRead(REG_I_ACC_HI);
    q_lo = RegRead(REG_Q_ACC_LO);
    q_hi = RegRead(REG_Q_ACC_HI);
    adc_min_max = RegRead(REG_ADC_MIN_MAX);

    result->freq_hz = freq_hz;
    result->status = RegRead(REG_STATUS);
    result->sample_count = RegRead(REG_SAMPLE_COUNT);
    result->adc_min = adc_min_max & 0xFFu;
    result->adc_max = (adc_min_max >> 8) & 0xFFu;
    result->i_acc = CombineSigned64(i_lo, i_hi);
    result->q_acc = CombineSigned64(q_lo, q_hi);

    if (result->sample_count == 0u) {
        result->mag_counts = 0.0;
        result->phase_deg = 0.0;
        result->status |= STATUS_CONFIG_ERR;
        return 1;
    }

    mag = hypot((double)result->i_acc, (double)result->q_acc);
    result->mag_counts = (2.0 * mag) / ((double)result->sample_count * 127.0);
    result->phase_deg = atan2((double)result->q_acc, (double)result->i_acc) * 180.0 / M_PI;
    return 1;
}

static int ResultIsValidForCalibration(const FraResult *result)
{
    const u32 invalid_flags = STATUS_OVERFLOW | STATUS_ADC_CLIP | STATUS_LOW_SIGNAL | STATUS_CONFIG_ERR;

    return ((result->status & invalid_flags) == 0u) &&
           (result->sample_count > 0u) &&
           isfinite(result->mag_counts) &&
           (result->mag_counts > 0.0);
}

static void PrintCsvHeader(void)
{
    xil_printf("idx,freq_hz,mag_counts,phase_deg,norm_db,norm_phase_deg,i_acc,q_acc,samples,adc_min,adc_max,status\r\n");
}

static void PrintResultRow(u32 index, const FraResult *result, int use_calibration)
{
    int has_cal = 0;
    double norm_db = 0.0;
    double norm_phase = 0.0;

    if (use_calibration &&
        ResultIsValidForCalibration(result) &&
        (index < MAX_SWEEP_POINTS) &&
        (Calibration.valid[index] != 0u) &&
        (Calibration.mag_counts[index] > 0.0)) {
        has_cal = 1;
        norm_db = 20.0 * log10(result->mag_counts / Calibration.mag_counts[index]);
        norm_phase = WrapPhaseDeg(result->phase_deg - Calibration.phase_deg[index]);
    }

    xil_printf("%lu,", (unsigned long)index);
    PrintDouble3(result->freq_hz);
    xil_printf(",");
    PrintDouble3(result->mag_counts);
    xil_printf(",");
    PrintDouble3(result->phase_deg);
    xil_printf(",");
    if (has_cal) {
        PrintDouble3(norm_db);
    } else {
        xil_printf("nan");
    }
    xil_printf(",");
    if (has_cal) {
        PrintDouble3(norm_phase);
    } else {
        xil_printf("nan");
    }
    xil_printf(",");
    PrintI64(result->i_acc);
    xil_printf(",");
    PrintI64(result->q_acc);
    xil_printf(",%lu,%lu,%lu,0x%08lx",
               (unsigned long)result->sample_count,
               (unsigned long)result->adc_min,
               (unsigned long)result->adc_max,
               (unsigned long)result->status);
    PrintStatusFlags(result->status);
    xil_printf("\r\n");
}

static void PrintErrorRow(u32 index, double freq_hz)
{
    xil_printf("%lu,", (unsigned long)index);
    PrintDouble3(freq_hz);
    xil_printf(",nan,nan,nan,nan,0,0,0,0,0,ERROR\r\n");
}

static void CmdHelp(void)
{
    xil_printf("commands:\r\n");
    xil_printf("  help\r\n");
    xil_printf("  id\r\n");
    xil_printf("  status\r\n");
    xil_printf("  set start <hz>\r\n");
    xil_printf("  set stop <hz>\r\n");
    xil_printf("  set points <1..64>\r\n");
    xil_printf("  set amp <0..255>\r\n");
    xil_printf("  set settle <cycles>\r\n");
    xil_printf("  set measure <cycles>\r\n");
    xil_printf("  single <hz>\r\n");
    xil_printf("  sweep\r\n");
    xil_printf("  cal\r\n");
}

static void CmdSingle(const char *arg)
{
    double freq_hz;
    FraResult result;

    if (!ParseDouble(arg, &freq_hz) || (DdsPhaseIncFromFreq(freq_hz) == 0u)) {
        xil_printf("usage: single <hz>, where hz resolves below 12500000\r\n");
        return;
    }

    PrintCsvHeader();
    if (RunMeasurement(freq_hz, &result)) {
        PrintResultRow(0u, &result, 0);
    } else {
        xil_printf("ERROR: measurement timeout or invalid frequency\r\n");
    }
}

static void CmdSweep(void)
{
    u32 i;
    FraResult result;
    double freq_hz;

    PrintCsvHeader();
    for (i = 0u; i < Config.points; i++) {
        freq_hz = SweepFreq(i);
        if (RunMeasurement(freq_hz, &result)) {
            PrintResultRow(i, &result, 1);
        } else {
            PrintErrorRow(i, freq_hz);
        }
    }
}

static void CmdCal(void)
{
    u32 i;
    FraResult result;
    double freq_hz;

    ClearCalibration();
    xil_printf("calibrating loopback baseline\r\n");
    PrintCsvHeader();

    for (i = 0u; i < Config.points; i++) {
        freq_hz = SweepFreq(i);
        if (RunMeasurement(freq_hz, &result)) {
            if (ResultIsValidForCalibration(&result)) {
                Calibration.mag_counts[i] = result.mag_counts;
                Calibration.phase_deg[i] = result.phase_deg;
                Calibration.valid[i] = 1u;
            }
            PrintResultRow(i, &result, 0);
        } else {
            PrintErrorRow(i, freq_hz);
        }
    }

    xil_printf("calibration complete\r\n");
}

static void CmdSet(char *key, char *value)
{
    double parsed_double;
    u32 parsed_u32;

    if ((key == NULL) || (value == NULL)) {
        xil_printf("usage: set <start|stop|points|amp|settle|measure> <value>\r\n");
        return;
    }

    if (StrEq(key, "start")) {
        if (!ParseDouble(value, &parsed_double) || (DdsPhaseIncFromFreq(parsed_double) == 0u)) {
            xil_printf("invalid start frequency\r\n");
            return;
        }
        Config.start_hz = parsed_double;
    } else if (StrEq(key, "stop")) {
        if (!ParseDouble(value, &parsed_double) || (DdsPhaseIncFromFreq(parsed_double) == 0u)) {
            xil_printf("invalid stop frequency\r\n");
            return;
        }
        Config.stop_hz = parsed_double;
    } else if (StrEq(key, "points")) {
        if (!ParseU32(value, &parsed_u32) || (parsed_u32 < 1u) || (parsed_u32 > MAX_SWEEP_POINTS)) {
            xil_printf("points must be 1..%lu\r\n", (unsigned long)MAX_SWEEP_POINTS);
            return;
        }
        Config.points = parsed_u32;
    } else if (StrEq(key, "amp")) {
        if (!ParseU32(value, &parsed_u32) || (parsed_u32 > 255u)) {
            xil_printf("amplitude must be 0..255\r\n");
            return;
        }
        Config.amplitude = parsed_u32;
    } else if (StrEq(key, "settle")) {
        if (!ParseU32(value, &parsed_u32)) {
            xil_printf("invalid settle cycle count\r\n");
            return;
        }
        Config.settle_cycles = parsed_u32;
    } else if (StrEq(key, "measure")) {
        if (!ParseU32(value, &parsed_u32) || (parsed_u32 == 0u)) {
            xil_printf("measure cycles must be > 0\r\n");
            return;
        }
        Config.measure_cycles = parsed_u32;
    } else {
        xil_printf("unknown setting: %s\r\n", key);
        return;
    }

    ClearCalibration();
    PrintConfig();
    xil_printf("calibration cleared\r\n");
}

static int ReadLine(char *buf, u32 max_len)
{
    u32 len = 0u;
    char c;

    while (1) {
        c = inbyte();

        if ((c == '\r') || (c == '\n')) {
            xil_printf("\r\n");
            buf[len] = '\0';
            return (int)len;
        }

        if ((c == '\b') || (c == 0x7Fu)) {
            if (len > 0u) {
                len--;
                xil_printf("\b \b");
            }
            continue;
        }

        if (isprint((unsigned char)c) && (len < (max_len - 1u))) {
            buf[len++] = c;
            xil_printf("%c", c);
        }
    }
}

static void Dispatch(char *line)
{
    char *cmd;
    char *arg1;
    char *arg2;

    cmd = strtok(line, " \t");
    if (cmd == NULL) {
        return;
    }

    arg1 = strtok(NULL, " \t");
    arg2 = strtok(NULL, " \t");

    if (StrEq(cmd, "help")) {
        CmdHelp();
    } else if (StrEq(cmd, "id")) {
        xil_printf("PCIE_FRA functional FRA firmware, core version 0x%08lx, base 0x%08lx\r\n",
                   (unsigned long)RegRead(REG_VERSION),
                   (unsigned long)FRA_BASEADDR);
    } else if (StrEq(cmd, "status")) {
        PrintCoreStatus();
    } else if (StrEq(cmd, "set")) {
        CmdSet(arg1, arg2);
    } else if (StrEq(cmd, "single")) {
        CmdSingle(arg1);
    } else if (StrEq(cmd, "sweep")) {
        CmdSweep();
    } else if (StrEq(cmd, "cal")) {
        CmdCal();
    } else {
        xil_printf("unknown command: %s\r\n", cmd);
    }
}

int main(void)
{
    char line[LINE_BUF_SIZE];

    ClearCalibration();
    RegWrite(REG_CONTROL, CTRL_CLEAR_DONE | CTRL_RESET_PHASE);

    xil_printf("\r\n=== PCIE_FRA functional FRA ===\r\n");
    xil_printf("base=0x%08lx version=0x%08lx\r\n",
               (unsigned long)FRA_BASEADDR,
               (unsigned long)RegRead(REG_VERSION));
    PrintConfig();
    CmdHelp();

    while (1) {
        xil_printf("fra> ");
        ReadLine(line, LINE_BUF_SIZE);
        Dispatch(line);
    }
}
