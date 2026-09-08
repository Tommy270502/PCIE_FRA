#!/bin/sh
# Re-enumerate the PCIe FRA endpoint after the FPGA has been reprogrammed.
#
#   sudo software/host/scripts/fra-pcie-rescan.sh
#
# Reconfiguring the FPGA drops the PCIe link, so the host's view of the device
# goes stale. Removing it and rescanning the bus makes the kernel retrain and
# re-assign BAR0. If this does not bring the device back, the root port did not
# retrain and the host must be rebooted (with the board already configured from
# QSPI, which is the normal boot path).
set -eu

VENDOR=10ee
DEVICE=7021

if [ "$(id -u)" -ne 0 ]; then
    echo "error: must run as root (use sudo)" >&2
    exit 1
fi

for dev in /sys/bus/pci/devices/*; do
    [ -r "$dev/vendor" ] || continue
    v=$(cat "$dev/vendor" 2>/dev/null || echo)
    d=$(cat "$dev/device" 2>/dev/null || echo)
    if [ "$v" = "0x$VENDOR" ] && [ "$d" = "0x$DEVICE" ]; then
        echo "Removing $(basename "$dev")"
        echo 1 > "$dev/remove"
    fi
done

sleep 1
echo "Rescanning PCI bus"
echo 1 > /sys/bus/pci/rescan
sleep 2

GROUP=${FRA_GROUP:-plugdev}

found=0
for dev in /sys/bus/pci/devices/*; do
    [ -r "$dev/vendor" ] || continue
    v=$(cat "$dev/vendor" 2>/dev/null || echo)
    d=$(cat "$dev/device" 2>/dev/null || echo)
    if [ "$v" = "0x$VENDOR" ] && [ "$d" = "0x$DEVICE" ]; then
        found=1
        bdf=$(basename "$dev")
        echo "Endpoint back at $bdf: $(cat "$dev/current_link_speed") x$(cat "$dev/current_link_width")"
        echo 1 > "$dev/enable" 2>/dev/null || true

        # remove/rescan destroys and recreates the device object, so the
        # driver_override set by fra-pcie-setup.sh is gone. Re-bind here rather
        # than making the user run setup again.
        modprobe vfio-pci 2>/dev/null || true
        if [ ! -L "$dev/driver" ]; then
            echo "vfio-pci" > "$dev/driver_override" 2>/dev/null || true
            echo "$bdf" > /sys/bus/pci/drivers_probe 2>/dev/null || true
        fi
        drv=$([ -L "$dev/driver" ] && basename "$(readlink -f "$dev/driver")" || echo none)
        echo "  driver: $drv"

        if [ -L "$dev/iommu_group" ]; then
            grp=$(basename "$(readlink -f "$dev/iommu_group")")
            if [ -e "/dev/vfio/$grp" ]; then
                chgrp "$GROUP" "/dev/vfio/$grp" 2>/dev/null || true
                chmod 0660 "/dev/vfio/$grp" 2>/dev/null || true
                echo "  /dev/vfio/$grp: $(stat -c '%A %U:%G' "/dev/vfio/$grp")"
            fi
        fi

        udevadm trigger --action=change --sysname-match="$bdf" 2>/dev/null || true
        [ -e "$dev/resource0" ] && { chgrp "$GROUP" "$dev/resource0" 2>/dev/null || true; \
                                     chmod 0660 "$dev/resource0" 2>/dev/null || true; }
    fi
done

if [ "$found" -eq 0 ]; then
    echo "error: endpoint did not come back. The root port did not retrain." >&2
    echo "Reboot the host; the board configures from QSPI before host POST." >&2
    exit 1
fi
