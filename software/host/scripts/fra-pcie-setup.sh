#!/bin/sh
# One-time host setup for unprivileged access to the PCIe FRA endpoint's BAR0.
#
#   sudo software/host/scripts/fra-pcie-setup.sh            # bind to vfio-pci
#   sudo software/host/scripts/fra-pcie-setup.sh --unbind   # release it again
#
# Why VFIO: when Secure Boot is on, the kernel runs in lockdown mode and
# mmap() of /sys/bus/pci/.../resource0 fails with EPERM for every process,
# including root. VFIO is the supported, IOMMU-protected route for userspace
# device access and is unaffected. On machines with lockdown off, the sysfs
# route still works and the tools fall back to it automatically.
#
# Idempotent.
set -eu

VENDOR=10ee
DEVICE=7021
GROUP=${FRA_GROUP:-plugdev}
UNBIND=0

[ "${1:-}" = "--unbind" ] && UNBIND=1

RULE_SRC=$(CDPATH= cd -- "$(dirname -- "$0")/../udev" && pwd)/99-fra-pcie.rules
RULE_DST=/etc/udev/rules.d/99-fra-pcie.rules

if [ "$(id -u)" -ne 0 ]; then
    echo "error: must run as root (use sudo)" >&2
    exit 1
fi

find_bdf() {
    for dev in /sys/bus/pci/devices/*; do
        [ -r "$dev/vendor" ] || continue
        v=$(cat "$dev/vendor" 2>/dev/null || echo)
        d=$(cat "$dev/device" 2>/dev/null || echo)
        if [ "$v" = "0x$VENDOR" ] && [ "$d" = "0x$DEVICE" ]; then
            basename "$dev"
            return 0
        fi
    done
    return 1
}

BDF=$(find_bdf || true)
if [ -z "$BDF" ]; then
    echo "error: no $VENDOR:$DEVICE endpoint present." >&2
    echo "Is the board powered and configured? Check: lspci -d $VENDOR:$DEVICE" >&2
    exit 2
fi
DEVPATH=/sys/bus/pci/devices/$BDF
echo "Endpoint: $BDF"

current_driver() {
    if [ -L "$DEVPATH/driver" ]; then
        basename "$(readlink -f "$DEVPATH/driver")"
    fi
}

if [ "$UNBIND" -eq 1 ]; then
    drv=$(current_driver || true)
    if [ -n "$drv" ]; then
        echo "Unbinding from $drv"
        echo "$BDF" > "/sys/bus/pci/drivers/$drv/unbind"
    fi
    echo "" > "$DEVPATH/driver_override" 2>/dev/null || true
    echo "Released. Re-probe with: echo $BDF > /sys/bus/pci/drivers_probe"
    exit 0
fi

if ! getent group "$GROUP" >/dev/null 2>&1; then
    echo "error: group '$GROUP' does not exist; set FRA_GROUP=<group>" >&2
    exit 1
fi

echo "Installing $RULE_DST (group: $GROUP)"
sed "s/GROUP=\"plugdev\"/GROUP=\"$GROUP\"/g; s/chgrp plugdev/chgrp $GROUP/g" \
    "$RULE_SRC" > "$RULE_DST"
chmod 0644 "$RULE_DST"
udevadm control --reload-rules

# --- bind to vfio-pci -----------------------------------------------------
if ! modprobe vfio-pci; then
    echo "error: cannot load vfio-pci" >&2
    exit 1
fi

drv=$(current_driver || true)
if [ "$drv" = "vfio-pci" ]; then
    echo "Already bound to vfio-pci"
else
    if [ -n "$drv" ]; then
        echo "Unbinding from $drv"
        echo "$BDF" > "/sys/bus/pci/drivers/$drv/unbind"
    fi
    echo "Binding $BDF to vfio-pci"
    echo "vfio-pci" > "$DEVPATH/driver_override"
    echo "$BDF" > /sys/bus/pci/drivers_probe
fi

drv=$(current_driver || true)
if [ "$drv" != "vfio-pci" ]; then
    echo "warning: bind failed (driver is '${drv:-none}')." >&2
    echo "Falling back to sysfs BAR access, which needs kernel lockdown off." >&2
else
    grp=$(basename "$(readlink -f "$DEVPATH/iommu_group")")
    echo "Bound to vfio-pci, IOMMU group $grp"
    udevadm trigger --subsystem-match=vfio 2>/dev/null || true
    # udev may not have re-run on the already-created node; set it directly.
    if [ -e "/dev/vfio/$grp" ]; then
        chgrp "$GROUP" "/dev/vfio/$grp"
        chmod 0660 "/dev/vfio/$grp"
        echo "  /dev/vfio/$grp : $(stat -c '%A %U:%G' "/dev/vfio/$grp")"
    fi
    chmod 0666 /dev/vfio/vfio 2>/dev/null || true
fi

# --- sysfs fallback permissions ------------------------------------------
echo 1 > "$DEVPATH/enable" 2>/dev/null || true
if [ -e "$DEVPATH/resource0" ]; then
    chgrp "$GROUP" "$DEVPATH/resource0" 2>/dev/null || true
    chmod 0660 "$DEVPATH/resource0" 2>/dev/null || true
fi

echo
echo "link      : $(cat "$DEVPATH/current_link_speed" 2>/dev/null) x$(cat "$DEVPATH/current_link_width" 2>/dev/null)"
echo "lockdown  : $(cat /sys/kernel/security/lockdown 2>/dev/null || echo 'n/a')"
echo
echo "Done. Members of '$GROUP' can now run software/host/fra_bar_test and fra_cli."
if [ -n "${SUDO_USER:-}" ] && ! id -nG "$SUDO_USER" | tr ' ' '\n' | grep -qx "$GROUP"; then
    echo "NOTE: user '$SUDO_USER' is not in '$GROUP'. Add with:"
    echo "  sudo usermod -aG $GROUP $SUDO_USER   (then log out and back in)"
fi
