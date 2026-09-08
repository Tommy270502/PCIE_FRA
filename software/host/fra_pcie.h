/*
 * fra_pcie.h -- Host-side access library for the AX7015B PCIe FRA endpoint.
 *
 * The endpoint exposes a single 8 KB BAR0 that is split into two AXI4-Lite
 * slaves:
 *
 *   BAR0 + 0x0000 .. 0x0FFF   pcie_bar_regs  (identity / scratch / mailbox)
 *   BAR0 + 0x1000 .. 0x1FFF   fra_core       (measurement core)
 *
 * Gateware that predates the fra_core-over-BAR0 routing only implements the
 * first window; fra_open() reports that case instead of failing, so the same
 * binaries work against both revisions.
 */
#ifndef FRA_PCIE_H
#define FRA_PCIE_H

#include <stdint.h>
#include <stddef.h>

#define FRA_PCI_VENDOR_ID 0x10EEu
#define FRA_PCI_DEVICE_ID 0x7021u

#define FRA_BAR0_SIZE 0x2000u

/* --- window 0: pcie_bar_regs -------------------------------------------- */
#define FRA_BAR_REGS_BASE 0x0000u

#define FRA_REG_BOARD_ID  (FRA_BAR_REGS_BASE + 0x00u) /* RO 0xA7015B00 */
#define FRA_REG_BAR_VER   (FRA_BAR_REGS_BASE + 0x04u) /* RO 0x000100xx */
#define FRA_REG_SCRATCH   (FRA_BAR_REGS_BASE + 0x08u) /* RW             */
#define FRA_REG_CONTROL   (FRA_BAR_REGS_BASE + 0x0Cu) /* RW             */
#define FRA_REG_SCRATCH2  (FRA_BAR_REGS_BASE + 0x10u) /* RW             */

#define FRA_BOARD_ID_EXPECT 0xA7015B00u

/* --- window 1: fra_core -------------------------------------------------- */
#define FRA_CORE_BASE 0x1000u

#define FRA_REG_VERSION        (FRA_CORE_BASE + 0x00u)
#define FRA_REG_CTRL           (FRA_CORE_BASE + 0x04u)
#define FRA_REG_STATUS         (FRA_CORE_BASE + 0x08u)
#define FRA_REG_PHASE_INC      (FRA_CORE_BASE + 0x0Cu)
#define FRA_REG_PHASE_OFFSET   (FRA_CORE_BASE + 0x10u)
#define FRA_REG_AMPLITUDE      (FRA_CORE_BASE + 0x14u)
#define FRA_REG_SETTLE_CYCLES  (FRA_CORE_BASE + 0x18u)
#define FRA_REG_MEASURE_CYCLES (FRA_CORE_BASE + 0x1Cu)
#define FRA_REG_SAMPLE_COUNT   (FRA_CORE_BASE + 0x20u)
#define FRA_REG_I_ACC_LO       (FRA_CORE_BASE + 0x24u)
#define FRA_REG_I_ACC_HI       (FRA_CORE_BASE + 0x28u)
#define FRA_REG_Q_ACC_LO       (FRA_CORE_BASE + 0x2Cu)
#define FRA_REG_Q_ACC_HI       (FRA_CORE_BASE + 0x30u)
#define FRA_REG_ADC_MIN_MAX    (FRA_CORE_BASE + 0x34u)
#define FRA_REG_LAST_SAMPLE    (FRA_CORE_BASE + 0x38u)

/* CONTROL bits (must track fra_core.vhd) */
#define FRA_CTRL_DDS_ENABLE   0x00000001u
#define FRA_CTRL_START        0x00000002u
#define FRA_CTRL_CLEAR_DONE   0x00000004u
#define FRA_CTRL_RESET_PHASE  0x00000008u
#define FRA_CTRL_LOOPBACK_EN  0x00000010u

/* STATUS bits */
#define FRA_STATUS_BUSY       0x00000001u
#define FRA_STATUS_DONE       0x00000002u
#define FRA_STATUS_OVERFLOW   0x00000004u
#define FRA_STATUS_ADC_CLIP   0x00000008u
#define FRA_STATUS_LOW_SIGNAL 0x00000010u
#define FRA_STATUS_CONFIG_ERR 0x00000020u

#define FRA_DDS_CLK_HZ      25000000.0
#define FRA_DDS_PHASE_SCALE 4294967296.0
#define FRA_MAX_POINTS      64u

typedef enum {
    FRA_BACKEND_NONE = 0,
    FRA_BACKEND_VFIO,   /* /dev/vfio -- works under Secure Boot / kernel lockdown */
    FRA_BACKEND_SYSFS   /* mmap of resource0 -- blocked when lockdown != none    */
} fra_backend_t;

typedef struct {
    fra_backend_t  backend;
    int            fd;          /* sysfs resource0, or the VFIO device fd */
    int            container_fd;
    int            group_fd;
    int            group_id;
    volatile void *bar;
    char           bdf[16];
    /* Set when the fra_core window answers with a plausible version word. */
    int            has_core;
    uint32_t       board_id;
    uint32_t       bar_version;
    uint32_t       core_version;
} fra_dev_t;

/*
 * Discover the endpoint (or use bdf when non-NULL), ensure memory decode is
 * enabled, and map BAR0. Returns 0 on success; on failure returns negative and
 * writes a human-readable explanation into err (never NULL-terminated short).
 */
int  fra_open(fra_dev_t *dev, const char *bdf, char *err, size_t errsz);
void fra_close(fra_dev_t *dev);

/* "vfio-pci" or "sysfs resource0" -- which route BAR0 was mapped through. */
const char *fra_backend_name(const fra_dev_t *dev);

uint32_t fra_rd(const fra_dev_t *dev, uint32_t off);
void     fra_wr(const fra_dev_t *dev, uint32_t off, uint32_t val);

/* Locate the first matching endpoint; writes "0000:08:00.0" style BDF. */
int fra_find_bdf(char *out, size_t outsz);

#endif /* FRA_PCIE_H */
