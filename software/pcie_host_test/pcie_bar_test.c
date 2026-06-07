/*
 * pcie_bar_test.c -- Stage-2 PCIe BAR0 bring-up smoke test (Linux host).
 *
 * Opens BAR0 of the AX7015B PCIe endpoint, reads the identity/version
 * registers, then writes and reads back the scratch register. Prints PASS/FAIL.
 *
 * No external libraries beyond libc. Must run as root (BAR mmap needs it).
 *
 * Build:   cc -O2 -Wall -Wextra -o pcie_bar_test pcie_bar_test.c
 * Find BDF: lspci -d 10ee:7021        # vendor 10EE (Xilinx), device 7021
 * Run:     sudo ./pcie_bar_test 0000:01:00.0
 *
 * BAR0 register map (see docs/PCIE_BAR0_REGISTER_MAP.md):
 *   0x00 BOARD_ID RO 0xA7015B00
 *   0x04 VERSION  RO 0x00010000
 *   0x08 SCRATCH  RW
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/stat.h>

#define BAR0_MAP_SIZE   0x1000u      /* 4 KB window is plenty for these regs   */

#define REG_BOARD_ID    0x00u
#define REG_VERSION     0x04u
#define REG_SCRATCH     0x08u

#define EXPECT_BOARD_ID 0xA7015B00u
#define EXPECT_VERSION  0x00010000u

static inline uint32_t rd32(volatile uint8_t *bar, uint32_t off)
{
    return *(volatile uint32_t *)(bar + off);
}

static inline void wr32(volatile uint8_t *bar, uint32_t off, uint32_t val)
{
    *(volatile uint32_t *)(bar + off) = val;
}

int main(int argc, char **argv)
{
    if (argc != 2) {
        fprintf(stderr, "usage: %s <BDF>   e.g. %s 0000:01:00.0\n", argv[0], argv[0]);
        return 2;
    }

    char path[256];
    snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/resource0", argv[1]);

    int fd = open(path, O_RDWR | O_SYNC);
    if (fd < 0) {
        fprintf(stderr, "open(%s): ", path);
        perror(NULL);
        return 1;
    }

    volatile uint8_t *bar = mmap(NULL, BAR0_MAP_SIZE, PROT_READ | PROT_WRITE,
                                 MAP_SHARED, fd, 0);
    if (bar == MAP_FAILED) {
        perror("mmap");
        close(fd);
        return 1;
    }

    int fails = 0;

    uint32_t board_id = rd32(bar, REG_BOARD_ID);
    uint32_t version  = rd32(bar, REG_VERSION);
    printf("BOARD_ID = 0x%08X (expect 0x%08X) %s\n",
           board_id, EXPECT_BOARD_ID,
           board_id == EXPECT_BOARD_ID ? "OK" : "MISMATCH");
    fails += (board_id != EXPECT_BOARD_ID);

    printf("VERSION  = 0x%08X (expect 0x%08X) %s\n",
           version, EXPECT_VERSION,
           version == EXPECT_VERSION ? "OK" : "MISMATCH");
    fails += (version != EXPECT_VERSION);

    /* Scratch write/read-back over a few patterns */
    const uint32_t patterns[] = { 0xDEADBEEFu, 0x00000000u, 0xFFFFFFFFu, 0xA5A5A5A5u };
    for (size_t i = 0; i < sizeof(patterns) / sizeof(patterns[0]); i++) {
        wr32(bar, REG_SCRATCH, patterns[i]);
        uint32_t rb = rd32(bar, REG_SCRATCH);
        printf("SCRATCH  wrote 0x%08X read 0x%08X %s\n",
               patterns[i], rb, rb == patterns[i] ? "OK" : "MISMATCH");
        fails += (rb != patterns[i]);
    }

    munmap((void *)bar, BAR0_MAP_SIZE);
    close(fd);

    printf("\n%s\n", fails == 0 ? "PASS" : "FAIL");
    return fails == 0 ? 0 : 1;
}
