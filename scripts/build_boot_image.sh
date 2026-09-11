#!/bin/sh
# Pack FSBL + bitstream + FRA application into BOOT.BIN for QSPI boot.
#
#   scripts/build_boot_image.sh [--out PATH]
#
# The .bif is generated here rather than checked in: bootgen needs absolute
# paths in it, so a checked-in copy would only ever be right on one machine.
#
# Inputs (all must already be built):
#   hardware/fra_zynq7015_pcie/export/system_bd_wrapper_pcie.bit
#       <- vivado -mode batch -source .../run_pcie_impl_signoff.tcl
#   software/PCIE_FRA/zynq_fsbl/build/fsbl.elf
#   software/FRA_Controller/FRA_Controller.elf
#       <- make -C software/FRA_Controller
set -eu

VITIS=${VITIS:-$HOME/Xilinx/2026.1/Vitis}
BOOTGEN=$VITIS/bin/bootgen

REPO=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
BIT=$REPO/hardware/fra_zynq7015_pcie/export/system_bd_wrapper_pcie.bit
FSBL=$REPO/software/PCIE_FRA/zynq_fsbl/build/fsbl.elf
APP=$REPO/software/FRA_Controller/FRA_Controller.elf
OUT=$REPO/software/BOOT.BIN
BIF=$REPO/software/boot.bif

while [ $# -gt 0 ]; do
    case $1 in
        --out) OUT=$2; shift 2 ;;
        *) echo "unknown argument: $1" >&2; exit 2 ;;
    esac
done

missing=0
for f in "$BIT" "$FSBL" "$APP"; do
    if [ ! -f "$f" ]; then
        echo "missing input: $f" >&2
        missing=1
    fi
done
[ "$missing" -eq 0 ] || exit 1

if [ ! -x "$BOOTGEN" ]; then
    echo "error: bootgen not found at $BOOTGEN (set VITIS=<path>)" >&2
    exit 1
fi

cat > "$BIF" <<EOF
the_ROM_image:
{
  [bootloader]$FSBL
  $BIT
  $APP
}
EOF

"$BOOTGEN" -image "$BIF" -arch zynq -o "$OUT" -w on

echo
echo "BOOT.BIN : $OUT ($(stat -c %s "$OUT") bytes)"
echo "  fsbl   : $FSBL"
echo "  bit    : $BIT"
echo "  app    : $APP"
