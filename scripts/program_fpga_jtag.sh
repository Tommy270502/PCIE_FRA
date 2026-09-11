#!/bin/sh
# Load a bitstream, and optionally the firmware, over JTAG (volatile -- lost at
# power-off). This is the development loop: it avoids touching QSPI entirely.
#
#   scripts/program_fpga_jtag.sh                    # bitstream only
#   scripts/program_fpga_jtag.sh --app              # bitstream + FRA_Controller
#   scripts/program_fpga_jtag.sh --app path/to.elf  # bitstream + a specific ELF
#   scripts/program_fpga_jtag.sh path/to.bit [--app ...]
#
# The PS keeps running whatever it booted from QSPI unless --app is given, so
# without it fra_core is reset but the old firmware stays resident.
#
# WARNING: reconfiguring the FPGA drops the PCIe link while the host is
# running. The host's view of the endpoint goes stale and must be refreshed:
#
#   sudo software/host/scripts/fra-pcie-rescan.sh
#
# If the root port does not retrain, the host needs a reboot. Do not run this
# while anything is actively using the endpoint.
set -eu

VIVADO=${VIVADO:-$HOME/Xilinx/2026.1/Vivado/bin/vivado}
VITIS=${VITIS:-$HOME/Xilinx/2026.1/Vitis}
XSDB=$VITIS/bin/xsdb
REPO=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)

BIT=
APP=
WANT_APP=0
while [ $# -gt 0 ]; do
    case $1 in
        --app)
            WANT_APP=1
            case ${2:-} in
                ""|--*) shift ;;
                *) APP=$2; shift 2 ;;
            esac
            ;;
        *) BIT=$1; shift ;;
    esac
done
[ -n "$BIT" ] || BIT=$REPO/hardware/fra_zynq7015_pcie/export/system_bd_wrapper_pcie.bit
[ -n "$APP" ] || APP=$REPO/software/FRA_Controller/FRA_Controller.elf

[ -f "$BIT" ] || { echo "missing bitstream: $BIT" >&2; exit 1; }
[ -x "$VIVADO" ] || { echo "error: vivado not found at $VIVADO" >&2; exit 1; }
if [ "$WANT_APP" -eq 1 ]; then
    [ -f "$APP" ] || { echo "missing application ELF: $APP" >&2; exit 1; }
    [ -x "$XSDB" ] || { echo "error: xsdb not found at $XSDB" >&2; exit 1; }
fi

TCL=$(mktemp /tmp/fra_prog_XXXXXX.tcl)
trap 'rm -f "$TCL"' EXIT

cat > "$TCL" <<EOF
open_hw_manager
connect_hw_server -allow_non_jtag
if {[llength [get_hw_targets]] == 0} { error "no JTAG target found" }
current_hw_target [lindex [get_hw_targets] 0]
open_hw_target
set dev [lindex [get_hw_devices xc7z*] 0]
if {\$dev eq ""} { error "no xc7z device in the JTAG chain" }
current_hw_device \$dev
refresh_hw_device -update_hw_probes false \$dev
set_property PROGRAM.FILE {$BIT} \$dev
program_hw_devices \$dev
refresh_hw_device \$dev
puts "DONE_status = [get_property REGISTER.BOOT_STATUS.BIT00_0_STATUS_VALID \$dev]"
close_hw_target
puts "FRA_JTAG_PROGRAM_OK"
EOF

"$VIVADO" -mode batch -nolog -nojournal -notrace -source "$TCL"

if [ "$WANT_APP" -eq 1 ]; then
    echo
    echo "Loading $APP"
    ATCL=$(mktemp /tmp/fra_app_XXXXXX.tcl)
    # rst -processor before dow matters: without it the new image starts with
    # the previous app's caches and MMU still enabled and traps in the vector
    # table at the image base.
    cat > "$ATCL" <<EOF
connect
targets -set -filter {name =~ "*Cortex-A9*#0*"}
stop
rst -processor
after 500
dow $APP
con
after 1000
stop
puts "PC = [lindex [rrd pc] end]"
con
EOF
    "$XSDB" "$ATCL" 2>&1 | grep -E '^PC =|rror' || true
    rm -f "$ATCL"
fi

echo
echo "Loaded. The PCIe link has just gone down; if the endpoint does not come"
echo "back on its own, refresh the host view with:"
echo "  sudo $REPO/software/host/scripts/fra-pcie-rescan.sh"
