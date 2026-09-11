#!/bin/sh
# Print the tty of the AX7015B's USB-UART console, or exit 1 if not found.
#
#   scripts/find_fra_uart.sh
#   FRA_UART=/dev/ttyUSB3 scripts/find_fra_uart.sh   # explicit override wins
#
# ttyUSB numbering is assignment order, not identity: plugging in another board
# renumbers everything. Match on the USB VID:PID of the board's CP2102N bridge
# instead. The Digilent JTAG cable (0403:6014) also appears as a ttyUSB and must
# not be confused with it.
set -eu

VID=${FRA_UART_VID:-10c4}   # Silicon Labs
PID=${FRA_UART_PID:-ea60}   # CP210x / CP2102N

if [ -n "${FRA_UART:-}" ]; then
    [ -c "$FRA_UART" ] || { echo "FRA_UART=$FRA_UART is not a character device" >&2; exit 1; }
    echo "$FRA_UART"
    exit 0
fi

matches=
for dev in /dev/ttyUSB* /dev/ttyACM*; do
    [ -c "$dev" ] || continue
    props=$(udevadm info -q property -n "$dev" 2>/dev/null) || continue
    v=$(printf '%s\n' "$props" | sed -n 's/^ID_VENDOR_ID=//p')
    p=$(printf '%s\n' "$props" | sed -n 's/^ID_MODEL_ID=//p')
    [ "$v" = "$VID" ] && [ "$p" = "$PID" ] && matches="$matches $dev"
done

# Deliberate word splitting: $matches is the space-separated device list built
# above, and turning it into positional parameters is how the count is taken.
# shellcheck disable=SC2086
set -- $matches
case $# in
    0) echo "no $VID:$PID USB-UART found. Connected serial devices:" >&2
       for dev in /dev/ttyUSB* /dev/ttyACM*; do
           [ -c "$dev" ] || continue
           printf '  %-14s %s\n' "$dev" \
               "$(udevadm info -q property -n "$dev" 2>/dev/null \
                  | sed -n 's/^ID_VENDOR_ID=/vid /p;s/^ID_MODEL_ID=/pid /p' | tr '\n' ' ')" >&2
       done
       exit 1 ;;
    1) echo "$1" ;;
    *) # More than one CP210x: ask each which one answers as the FRA console.
       for dev in "$@"; do
           if python3 - "$dev" 2>/dev/null | grep -q 'fra>'; then echo "$dev"; exit 0; fi <<'PY'
import serial, sys, time
try:
    s = serial.Serial(sys.argv[1], 115200, timeout=0.4)
except Exception:
    sys.exit(1)
time.sleep(0.2); s.reset_input_buffer()
s.write(b"\r\n"); s.flush(); time.sleep(0.4)
sys.stdout.write(s.read(512).decode("utf-8", "replace"))
s.close()
PY
       done
       echo "several $VID:$PID devices found but none answered as the FRA console:$matches" >&2
       exit 1 ;;
esac
