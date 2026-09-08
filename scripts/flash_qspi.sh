#!/bin/sh
# Write BOOT.BIN to the AX7015B's QSPI flash over JTAG.
#
#   scripts/flash_qspi.sh
#
# The board's boot mode strap is already QSPI (SLCR.BOOT_MODE @ 0xF800025C
# reads 0x1), so the flashed image is what runs at the next power-on -- and it
# is what configures the FPGA before the host POSTs, which is why the PCIe
# endpoint is enumerable at all.
#
# WARNING: this rewrites the boot flash. If the write is interrupted the board
# will not boot until it is reflashed over JTAG (JTAG boot mode still works as
# a recovery path).
set -eu

VITIS=${VITIS:-$HOME/Xilinx/2026.1/Vitis}
PROG=$VITIS/bin/program_flash

REPO=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BOOTBIN=${BOOTBIN:-$REPO/software/BOOT.BIN}
FSBL=$REPO/software/PCIE_FRA/zynq_fsbl/build/fsbl.elf
URL=${JTAG_URL:-tcp:localhost:3121}

for f in "$BOOTBIN" "$FSBL"; do
    [ -f "$f" ] || { echo "missing: $f" >&2; exit 1; }
done
[ -x "$PROG" ] || { echo "error: program_flash not found at $PROG" >&2; exit 1; }

# Discover the cable rather than hard-coding a serial number.
TARGET=${JTAG_TARGET:-}
if [ -z "$TARGET" ]; then
    TARGET=$("$PROG" -jtagtargets -url "$URL" 2>/dev/null \
             | awk '/jsn-/ {for(i=1;i<=NF;i++) if($i ~ /^jsn-/) {print $i; exit}}')
fi
if [ -z "$TARGET" ]; then
    echo "error: no JTAG target found. Is the cable connected and hw_server reachable at $URL?" >&2
    echo "List targets with: $PROG -jtagtargets -url $URL" >&2
    exit 1
fi

echo "Flashing $BOOTBIN"
echo "  target : $TARGET"
echo "  url    : $URL"
echo

"$PROG" -f "$BOOTBIN" -fsbl "$FSBL" -flash_type qspi-x4-single \
        -blank_check -verify -target_name "$TARGET" -url "$URL"

echo
echo "QSPI programmed and verified."
echo "Power-cycle the board AND reboot the host: the PCIe endpoint must be"
echo "configured before the host enumerates the bus."
