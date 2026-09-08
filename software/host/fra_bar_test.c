/*
 * fra_bar_test.c -- BAR0 bring-up smoke test for the AX7015B PCIe endpoint.
 *
 * Checks the identity registers, exercises both scratch registers with walking
 * patterns, and reports whether the gateware also exposes fra_core over BAR0.
 *
 *   ./fra_bar_test [BDF]      # BDF optional, e.g. 0000:08:00.0
 */
#include "fra_pcie.h"

#include <stdio.h>
#include <string.h>

static int check32(const char *name, uint32_t got, uint32_t want)
{
    int ok = (got == want);
    printf("  %-12s = 0x%08X (expect 0x%08X) %s\n", name, got, want,
           ok ? "OK" : "MISMATCH");
    return ok ? 0 : 1;
}

static int scratch_test(fra_dev_t *dev, const char *name, uint32_t off)
{
    static const uint32_t patterns[] = {
        0xDEADBEEFu, 0x00000000u, 0xFFFFFFFFu, 0xA5A5A5A5u, 0x5A5A5A5Au,
        0x01234567u, 0x89ABCDEFu
    };
    int fails = 0;
    size_t i;

    for (i = 0; i < sizeof(patterns) / sizeof(patterns[0]); i++) {
        uint32_t rb;

        fra_wr(dev, off, patterns[i]);
        rb = fra_rd(dev, off);
        if (rb != patterns[i]) {
            printf("  %-12s wrote 0x%08X read 0x%08X MISMATCH\n", name,
                   patterns[i], rb);
            fails++;
        }
    }
    if (fails == 0) {
        printf("  %-12s %zu patterns write/read-back OK\n", name,
               sizeof(patterns) / sizeof(patterns[0]));
    }
    fra_wr(dev, off, 0u);
    return fails;
}

/* Byte-lane strobes must be honoured independently. */
static int wstrb_test(fra_dev_t *dev, uint32_t off)
{
    volatile uint8_t *p = (volatile uint8_t *)dev->bar + off;
    uint32_t rb;
    int fails = 0;

    fra_wr(dev, off, 0x00000000u);
    p[0] = 0x11;
    p[1] = 0x22;
    p[2] = 0x33;
    p[3] = 0x44;
    rb = fra_rd(dev, off);
    if (rb != 0x44332211u) {
        printf("  byte-strobe  assembled 0x%08X (expect 0x44332211) MISMATCH\n", rb);
        fails++;
    } else {
        printf("  byte-strobe  per-lane writes assemble to 0x%08X OK\n", rb);
    }
    fra_wr(dev, off, 0u);
    return fails;
}

int main(int argc, char **argv)
{
    fra_dev_t dev;
    char err[512] = { 0 };
    int fails = 0;

    if (fra_open(&dev, argc > 1 ? argv[1] : NULL, err, sizeof(err)) != 0) {
        fprintf(stderr, "fra_bar_test: %s\n", err);
        return 1;
    }

    printf("PCIe FRA endpoint at %s, BAR0 mapped (%u bytes) via %s\n\n",
           dev.bdf, FRA_BAR0_SIZE, fra_backend_name(&dev));

    printf("pcie_bar_regs window (BAR0+0x0000):\n");
    fails += check32("BOARD_ID", dev.board_id, FRA_BOARD_ID_EXPECT);
    printf("  %-12s = 0x%08X\n", "VERSION", dev.bar_version);
    fails += scratch_test(&dev, "SCRATCH", FRA_REG_SCRATCH);
    fails += scratch_test(&dev, "SCRATCH2", FRA_REG_SCRATCH2);
    fails += wstrb_test(&dev, FRA_REG_SCRATCH);

    printf("\nfra_core window (BAR0+0x1000):\n");
    if (dev.has_core) {
        printf("  %-12s = 0x%08X\n", "VERSION", dev.core_version);
        printf("  %-12s = 0x%08X\n", "STATUS",
               fra_rd(&dev, FRA_REG_STATUS));
        /* PHASE_INC is plain RW; a read-back proves the write path too. */
        fra_wr(&dev, FRA_REG_PHASE_INC, 0x12345678u);
        {
            uint32_t rb = fra_rd(&dev, FRA_REG_PHASE_INC);
            if (rb != 0x12345678u) {
                printf("  %-12s wrote 0x12345678 read 0x%08X MISMATCH\n",
                       "PHASE_INC", rb);
                fails++;
            } else {
                printf("  %-12s write/read-back OK\n", "PHASE_INC");
            }
        }
        fra_wr(&dev, FRA_REG_PHASE_INC, 0u);
    } else {
        printf("  not present (read 0x%08X)\n", dev.core_version);
        printf("  This gateware routes BAR0 to pcie_bar_regs only.\n");
        printf("  Rebuild with scripts/add_pcie_endpoint.tcl to expose fra_core.\n");
    }

    fra_close(&dev);

    printf("\n%s\n", fails == 0 ? "PASS" : "FAIL");
    return fails == 0 ? 0 : 1;
}
