#!/bin/sh
# End-to-end check of the PCIE_FRA system. Run after a power cycle to confirm
# the board booted from QSPI and the whole path works.
#
#   scripts/verify_system.sh
#
# Needs no root: the udev rule installed by fra-pcie-setup.sh binds vfio-pci and
# grants group access on every enumeration.
set -eu

REPO=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
HOST=$REPO/software/host
UART=${FRA_UART:-/dev/ttyUSB1}
BDF_GLOB=/sys/bus/pci/devices/*

pass=0
fail=0
ok()   { echo "  PASS  $1"; pass=$((pass + 1)); }
bad()  { echo "  FAIL  $1"; fail=$((fail + 1)); }

echo "== 1. PCIe enumeration =="
DEV=
for d in $BDF_GLOB; do
    [ -r "$d/vendor" ] || continue
    [ "$(cat "$d/vendor")" = "0x10ee" ] && [ "$(cat "$d/device")" = "0x7021" ] && DEV=$d
done
if [ -n "$DEV" ]; then
    ok "endpoint present at $(basename "$DEV")"
    speed=$(cat "$DEV/current_link_speed" 2>/dev/null)
    width=$(cat "$DEV/current_link_width" 2>/dev/null)
    case "$speed x$width" in
        "2.5 GT/s PCIe x1") ok "link $speed x$width" ;;
        *)                  bad "link is '$speed x$width', expected 2.5 GT/s PCIe x1" ;;
    esac
    drv=$([ -L "$DEV/driver" ] && basename "$(readlink -f "$DEV/driver")" || echo none)
    [ "$drv" = "vfio-pci" ] && ok "bound to vfio-pci" \
                            || bad "driver is '$drv' (run scripts/fra-pcie-setup.sh)"
else
    bad "no 10ee:7021 endpoint -- did the board configure from QSPI before host POST?"
fi

echo "== 2. Host tools build =="
if make -C "$HOST" >/dev/null 2>&1; then ok "software/host builds"; else bad "build failed"; fi

echo "== 3. BAR0 access =="
if "$HOST/fra_bar_test" >/tmp/fra_bar_test.$$ 2>&1; then
    ok "fra_bar_test"
    grep -E 'VERSION|BOARD_ID' /tmp/fra_bar_test.$$ | sed 's/^/        /'
else
    bad "fra_bar_test -- see output:"
    sed 's/^/        /' /tmp/fra_bar_test.$$
fi
rm -f /tmp/fra_bar_test.$$

echo "== 4. Host loopback self-test over PCIe =="
if "$HOST/fra_cli" selftest >/tmp/fra_selftest.$$ 2>&1; then
    ok "fra_cli selftest"
    grep -E '^  [0-9]' /tmp/fra_selftest.$$ | sed 's/^/      /'
else
    bad "fra_cli selftest -- see output:"
    sed 's/^/        /' /tmp/fra_selftest.$$
fi
rm -f /tmp/fra_selftest.$$

echo "== 5. Board UART console =="
if [ -c "$UART" ] && command -v python3 >/dev/null 2>&1 && \
   python3 -c 'import serial' >/dev/null 2>&1; then
    out=$(python3 - "$UART" <<'PY' 2>/dev/null || true
import serial, sys, time
s = serial.Serial(sys.argv[1], 115200, timeout=0.5)
time.sleep(0.2); s.reset_input_buffer()
s.write(b"id\r\n"); s.flush(); time.sleep(0.6)
sys.stdout.write(s.read(4096).decode("utf-8", "replace"))
s.close()
PY
)
    case "$out" in
        *0x00010100*) ok "firmware alive, core version 0x00010100" ;;
        *"core version"*) bad "firmware alive but unexpected core version: $(echo "$out" | tr -d '\r' | grep 'core version')" ;;
        *) bad "no response on $UART -- board may not have booted from QSPI" ;;
    esac
else
    echo "  SKIP  $UART not available or pyserial missing"
fi

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ] || exit 1
