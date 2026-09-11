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

REPO=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
BOOTBIN=${BOOTBIN:-$REPO/software/BOOT.BIN}
FSBL=$REPO/software/PCIE_FRA/zynq_fsbl/build/fsbl.elf
URL=${JTAG_URL:-tcp:localhost:3121}

for f in "$BOOTBIN" "$FSBL"; do
    [ -f "$f" ] || { echo "missing: $f" >&2; exit 1; }
done
[ -x "$PROG" ] || { echo "error: program_flash not found at $PROG" >&2; exit 1; }

# program_flash needs a running hw_server; Vivado/xsdb each start their own and
# take it down again on exit, so start one here if nothing is listening.
HW_SERVER=${HW_SERVER:-$(dirname "$PROG")/../../Vivado/bin/hw_server}
[ -x "$HW_SERVER" ] || HW_SERVER=$HOME/Xilinx/2026.1/Vivado/bin/hw_server
STARTED_HW_SERVER=0
if ! "$PROG" -jtagtargets -url "$URL" 2>&1 | grep -q 'jsn-'; then
    if [ -x "$HW_SERVER" ]; then
        echo "Starting hw_server"
        "$HW_SERVER" -d >/dev/null 2>&1 || nohup "$HW_SERVER" >/dev/null 2>&1 &
        STARTED_HW_SERVER=1
        i=0
        while [ $i -lt 20 ]; do
            "$PROG" -jtagtargets -url "$URL" 2>&1 | grep -q 'jsn-' && break
            i=$((i + 1))
            sleep 1
        done
    fi
fi
# Only tear down an hw_server this script started; one that was already running
# belongs to whoever started it. pkill returning non-zero just means it is
# already gone, which is not an error worth failing the trap over.
cleanup() {
    if [ "$STARTED_HW_SERVER" -eq 1 ]; then
        pkill -f 'hw_server' 2>/dev/null || true
    fi
}
trap cleanup EXIT

# Discover the cable rather than hard-coding a serial number. The chain lists
# both the ARM DAP and the FPGA:
#   2  jsn-JTAG-HS1-210512180081-4ba00477-0  (name arm_dap  idcode 4ba00477)
#   3  jsn-JTAG-HS1-210512180081-0373b093-0  (name xc7z015  idcode 0373b093)
# program_flash must target the FPGA, so match on the device name, not position.
TARGET=${JTAG_TARGET:-}
if [ -z "$TARGET" ]; then
    TARGET=$("$PROG" -jtagtargets -url "$URL" 2>&1 \
             | grep 'name xc7z' \
             | tr ' \t' '\n' | grep -m1 '^jsn-')
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
echo
echo "Validate with a real power cycle, not a soft reset. Writing"
echo "SLCR.PSS_RST_CTRL after program_flash leaves devcfg dirty: the PS resets"
echo "but the BootROM does not reconfigure the PL (DEVCFG_STATUS PCFG_INIT stays"
echo "0), and the debug port ends up wedged with an APB AP transaction error"
echo "that only a power-on reset clears."
echo
echo "The board is slot-powered, so: shut the host down fully (not a warm"
echo "reboot), then power on. That reconfigures the FPGA from flash before the"
echo "host POSTs, which is what makes the endpoint enumerable."
