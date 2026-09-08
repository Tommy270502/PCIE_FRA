/*
 * fra_pcie.c -- BAR0 discovery and mapping for the AX7015B PCIe FRA endpoint.
 */
#define _GNU_SOURCE
#include "fra_pcie.h"

#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <linux/vfio.h>
#include <unistd.h>

#define SYSFS_PCI_DEVICES "/sys/bus/pci/devices"

/* "/sys/bus/pci/devices" + "/" + BDF, then + "/" + a short attribute name. */
#define DIR_BUF  64
#define PATH_BUF 128

static int read_sysfs_hex(const char *dir, const char *attr, unsigned *out)
{
    char path[PATH_BUF];
    char buf[64];
    int fd;
    ssize_t n;

    snprintf(path, sizeof(path), "%s/%s", dir, attr);
    fd = open(path, O_RDONLY);
    if (fd < 0) {
        return -1;
    }
    n = read(fd, buf, sizeof(buf) - 1);
    close(fd);
    if (n <= 0) {
        return -1;
    }
    buf[n] = '\0';
    return (sscanf(buf, "%x", out) == 1) ? 0 : -1;
}

int fra_find_bdf(char *out, size_t outsz)
{
    DIR *d = opendir(SYSFS_PCI_DEVICES);
    struct dirent *e;
    int found = -1;

    if (d == NULL) {
        return -1;
    }

    while ((e = readdir(d)) != NULL) {
        char dir[DIR_BUF];
        unsigned vendor = 0;
        unsigned device = 0;

        if (e->d_name[0] == '.' || strlen(e->d_name) >= 24) {
            continue; /* not a "0000:08:00.0" style BDF */
        }
        snprintf(dir, sizeof(dir), "%s/%.23s", SYSFS_PCI_DEVICES, e->d_name);
        if (read_sysfs_hex(dir, "vendor", &vendor) != 0) {
            continue;
        }
        if (read_sysfs_hex(dir, "device", &device) != 0) {
            continue;
        }
        if (vendor == FRA_PCI_VENDOR_ID && device == FRA_PCI_DEVICE_ID) {
            snprintf(out, outsz, "%s", e->d_name);
            found = 0;
            break;
        }
    }

    closedir(d);
    return found;
}

/*
 * With no kernel driver bound the device is left with memory decode off, so
 * BAR reads would return all-ones. Writing "1" to the sysfs enable attribute
 * runs pci_enable_device() and sets the Memory Space Enable bit.
 */
static int ensure_memory_decode(const char *dir, char *err, size_t errsz)
{
    char path[PATH_BUF];
    char cur = 0;
    int fd;

    snprintf(path, sizeof(path), "%s/enable", dir);

    fd = open(path, O_RDONLY);
    if (fd >= 0) {
        if (read(fd, &cur, 1) == 1 && cur != '0') {
            close(fd);
            return 0; /* already enabled */
        }
        close(fd);
    }

    fd = open(path, O_WRONLY);
    if (fd < 0) {
        snprintf(err, errsz,
                 "cannot open %s (%s).\n"
                 "  Run the one-time setup: sudo software/host/scripts/fra-pcie-setup.sh",
                 path, strerror(errno));
        return -1;
    }
    if (write(fd, "1", 1) != 1) {
        snprintf(err, errsz, "write to %s failed (%s)", path, strerror(errno));
        close(fd);
        return -1;
    }
    close(fd);
    return 0;
}


/* --- VFIO backend -------------------------------------------------------- */

/* /sys/bus/pci/devices/<bdf>/iommu_group is a symlink ending in the group id. */
static int vfio_group_id(const char *dir)
{
    char link[PATH_BUF];
    char target[256];
    ssize_t n;
    const char *base;

    snprintf(link, sizeof(link), "%s/iommu_group", dir);
    n = readlink(link, target, sizeof(target) - 1);
    if (n <= 0) {
        return -1;
    }
    target[n] = '\0';
    base = strrchr(target, '/');
    return (base != NULL) ? atoi(base + 1) : -1;
}

/*
 * vfio-pci leaves PCI_COMMAND as it found it, and with no driver previously
 * bound the kernel has memory decode switched off. Set it through the config
 * space region so BAR reads actually complete.
 */
static int vfio_enable_memory(int device_fd, char *err, size_t errsz)
{
    struct vfio_region_info reg;
    uint16_t command = 0;

    memset(&reg, 0, sizeof(reg));
    reg.argsz = sizeof(reg);
    reg.index = VFIO_PCI_CONFIG_REGION_INDEX;
    if (ioctl(device_fd, VFIO_DEVICE_GET_REGION_INFO, &reg) != 0) {
        snprintf(err, errsz, "VFIO_DEVICE_GET_REGION_INFO(config): %s",
                 strerror(errno));
        return -1;
    }

    if (pread(device_fd, &command, sizeof(command),
              (off_t)reg.offset + 0x04) != (ssize_t)sizeof(command)) {
        snprintf(err, errsz, "read PCI_COMMAND: %s", strerror(errno));
        return -1;
    }

    /* bit 1 = Memory Space Enable, bit 2 = Bus Master Enable (for later DMA) */
    command |= 0x0006u;

    if (pwrite(device_fd, &command, sizeof(command),
               (off_t)reg.offset + 0x04) != (ssize_t)sizeof(command)) {
        snprintf(err, errsz, "write PCI_COMMAND: %s", strerror(errno));
        return -1;
    }
    return 0;
}

static int fra_open_vfio(fra_dev_t *dev, const char *dir, char *err,
                         size_t errsz)
{
    struct vfio_group_status gstatus;
    struct vfio_region_info  reg;
    char grouppath[64];
    int  ret;

    dev->group_id = vfio_group_id(dir);
    if (dev->group_id < 0) {
        snprintf(err, errsz, "no iommu_group for %s (is the IOMMU enabled?)",
                 dev->bdf);
        return -1;
    }

    dev->container_fd = open("/dev/vfio/vfio", O_RDWR);
    if (dev->container_fd < 0) {
        snprintf(err, errsz, "open(/dev/vfio/vfio): %s", strerror(errno));
        return -1;
    }

    snprintf(grouppath, sizeof(grouppath), "/dev/vfio/%d", dev->group_id);
    dev->group_fd = open(grouppath, O_RDWR);
    if (dev->group_fd < 0) {
        snprintf(err, errsz,
                 "open(%s): %s -- the endpoint is not bound to vfio-pci yet",
                 grouppath, strerror(errno));
        return -1;
    }

    memset(&gstatus, 0, sizeof(gstatus));
    gstatus.argsz = sizeof(gstatus);
    if (ioctl(dev->group_fd, VFIO_GROUP_GET_STATUS, &gstatus) != 0) {
        snprintf(err, errsz, "VFIO_GROUP_GET_STATUS: %s", strerror(errno));
        return -1;
    }
    if ((gstatus.flags & VFIO_GROUP_FLAGS_VIABLE) == 0) {
        snprintf(err, errsz,
                 "IOMMU group %d is not viable -- another device in the group is\n"
                 "  still bound to a host driver. Check:\n"
                 "    ls /sys/kernel/iommu_groups/%d/devices/",
                 dev->group_id, dev->group_id);
        return -1;
    }

    if (ioctl(dev->group_fd, VFIO_GROUP_SET_CONTAINER, &dev->container_fd) != 0) {
        snprintf(err, errsz, "VFIO_GROUP_SET_CONTAINER: %s", strerror(errno));
        return -1;
    }
    if (ioctl(dev->container_fd, VFIO_SET_IOMMU, VFIO_TYPE1_IOMMU) != 0) {
        snprintf(err, errsz, "VFIO_SET_IOMMU(TYPE1): %s", strerror(errno));
        return -1;
    }

    ret = ioctl(dev->group_fd, VFIO_GROUP_GET_DEVICE_FD, dev->bdf);
    if (ret < 0) {
        snprintf(err, errsz, "VFIO_GROUP_GET_DEVICE_FD(%s): %s", dev->bdf,
                 strerror(errno));
        return -1;
    }
    dev->fd = ret;

    if (vfio_enable_memory(dev->fd, err, errsz) != 0) {
        return -1;
    }

    memset(&reg, 0, sizeof(reg));
    reg.argsz = sizeof(reg);
    reg.index = VFIO_PCI_BAR0_REGION_INDEX;
    if (ioctl(dev->fd, VFIO_DEVICE_GET_REGION_INFO, &reg) != 0) {
        snprintf(err, errsz, "VFIO_DEVICE_GET_REGION_INFO(BAR0): %s",
                 strerror(errno));
        return -1;
    }
    if (reg.size < FRA_BAR0_SIZE) {
        snprintf(err, errsz, "BAR0 is %llu bytes, expected at least %u",
                 (unsigned long long)reg.size, FRA_BAR0_SIZE);
        return -1;
    }
    if ((reg.flags & VFIO_REGION_INFO_FLAG_MMAP) == 0) {
        snprintf(err, errsz, "BAR0 is not mmap-able through VFIO");
        return -1;
    }

    dev->bar = mmap(NULL, FRA_BAR0_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED,
                    dev->fd, (off_t)reg.offset);
    if (dev->bar == MAP_FAILED) {
        dev->bar = NULL;
        snprintf(err, errsz, "mmap(BAR0 via VFIO): %s", strerror(errno));
        return -1;
    }

    dev->backend = FRA_BACKEND_VFIO;
    return 0;
}

/* --- sysfs backend ------------------------------------------------------- */

static int fra_open_sysfs(fra_dev_t *dev, const char *dir, char *err,
                          size_t errsz)
{
    char path[PATH_BUF];

    if (ensure_memory_decode(dir, err, errsz) != 0) {
        return -1;
    }

    snprintf(path, sizeof(path), "%s/resource0", dir);
    dev->fd = open(path, O_RDWR | O_SYNC);
    if (dev->fd < 0) {
        snprintf(err, errsz, "open(%s): %s", path, strerror(errno));
        return -1;
    }

    dev->bar = mmap(NULL, FRA_BAR0_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED,
                    dev->fd, 0);
    if (dev->bar == MAP_FAILED) {
        dev->bar = NULL;
        snprintf(err, errsz, "mmap(%s): %s", path, strerror(errno));
        return -1;
    }

    dev->backend = FRA_BACKEND_SYSFS;
    return 0;
}

static int lockdown_active(void)
{
    FILE *f = fopen("/sys/kernel/security/lockdown", "r");
    char  buf[128];
    int   active = 0;

    if (f == NULL) {
        return 0;
    }
    if (fgets(buf, sizeof(buf), f) != NULL) {
        /* The active mode is the one in [brackets]. */
        active = (strstr(buf, "[none]") == NULL);
    }
    fclose(f);
    return active;
}

int fra_open(fra_dev_t *dev, const char *bdf, char *err, size_t errsz)
{
    char dir[DIR_BUF];
    char vfio_err[512] = { 0 };
    char sysfs_err[512] = { 0 };

    memset(dev, 0, sizeof(*dev));
    dev->fd = -1;
    dev->container_fd = -1;
    dev->group_fd = -1;
    dev->group_id = -1;

    if (bdf != NULL && bdf[0] != '\0') {
        snprintf(dev->bdf, sizeof(dev->bdf), "%s", bdf);
    } else if (fra_find_bdf(dev->bdf, sizeof(dev->bdf)) != 0) {
        snprintf(err, errsz,
                 "no PCI device %04x:%04x found.\n"
                 "  Is the board powered and configured? Check: lspci -d %04x:%04x",
                 FRA_PCI_VENDOR_ID, FRA_PCI_DEVICE_ID,
                 FRA_PCI_VENDOR_ID, FRA_PCI_DEVICE_ID);
        return -1;
    }

    snprintf(dir, sizeof(dir), "%s/%.15s", SYSFS_PCI_DEVICES, dev->bdf);

    /*
     * VFIO first: it is the only route that works when Secure Boot has put the
     * kernel into lockdown, and it is IOMMU-protected. Fall back to the plain
     * sysfs BAR mmap on machines where vfio-pci is not bound.
     */
    if (fra_open_vfio(dev, dir, vfio_err, sizeof(vfio_err)) != 0) {
        fra_close(dev);
        dev->fd = -1;
        dev->container_fd = -1;
        dev->group_fd = -1;

        if (fra_open_sysfs(dev, dir, sysfs_err, sizeof(sysfs_err)) != 0) {
            fra_close(dev);
            snprintf(err, errsz,
                     "could not map BAR0 for %s.\n"
                     "  vfio  : %s\n"
                     "  sysfs : %s\n"
                     "%s"
                     "  Run the one-time setup:\n"
                     "    sudo software/host/scripts/fra-pcie-setup.sh",
                     dev->bdf, vfio_err, sysfs_err,
                     lockdown_active()
                         ? "  Kernel lockdown is active (Secure Boot), so the sysfs BAR mmap\n"
                           "  cannot work for any process. VFIO is the supported route.\n"
                         : "");
            return -1;
        }
    }

    dev->board_id     = fra_rd(dev, FRA_REG_BOARD_ID);
    dev->bar_version  = fra_rd(dev, FRA_REG_BAR_VER);
    dev->core_version = fra_rd(dev, FRA_REG_VERSION);

    /*
     * All-ones means the TLP was not completed (link down, decode off, or no
     * slave at that offset); zero means the address decodes but nothing drives
     * it. Either way the fra_core window is unusable.
     */
    dev->has_core = (dev->core_version != 0xFFFFFFFFu) &&
                    (dev->core_version != 0x00000000u);

    if (dev->board_id == 0xFFFFFFFFu) {
        snprintf(err, errsz,
                 "BAR0 reads back all-ones -- the endpoint is not answering.\n"
                 "  Link state: cat %s/current_link_speed %s/current_link_width\n"
                 "  If the FPGA was just reprogrammed, re-enumerate with:\n"
                 "    sudo software/host/scripts/fra-pcie-rescan.sh",
                 dir, dir);
        fra_close(dev);
        return -1;
    }

    return 0;
}

const char *fra_backend_name(const fra_dev_t *dev)
{
    switch (dev->backend) {
    case FRA_BACKEND_VFIO:  return "vfio-pci";
    case FRA_BACKEND_SYSFS: return "sysfs resource0";
    default:                return "none";
    }
}

void fra_close(fra_dev_t *dev)
{
    if (dev->bar != NULL) {
        munmap((void *)dev->bar, FRA_BAR0_SIZE);
        dev->bar = NULL;
    }
    if (dev->fd >= 0) {
        close(dev->fd);
        dev->fd = -1;
    }
    if (dev->group_fd >= 0) {
        close(dev->group_fd);
        dev->group_fd = -1;
    }
    if (dev->container_fd >= 0) {
        close(dev->container_fd);
        dev->container_fd = -1;
    }
    dev->backend = FRA_BACKEND_NONE;
}

uint32_t fra_rd(const fra_dev_t *dev, uint32_t off)
{
    return *(volatile uint32_t *)((volatile uint8_t *)dev->bar + off);
}

void fra_wr(const fra_dev_t *dev, uint32_t off, uint32_t val)
{
    *(volatile uint32_t *)((volatile uint8_t *)dev->bar + off) = val;
}
