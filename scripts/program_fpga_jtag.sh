#!/bin/sh
# Load a bitstream into the FPGA over JTAG (volatile -- lost at power-off).
#
#   scripts/program_fpga_jtag.sh [path/to.bit]
#
# Use this to try gateware before committing it to QSPI.
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
REPO=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BIT=${1:-$REPO/hardware/fra_zynq7015_pcie/export/system_bd_wrapper_pcie.bit}

[ -f "$BIT" ] || { echo "missing bitstream: $BIT" >&2; exit 1; }
[ -x "$VIVADO" ] || { echo "error: vivado not found at $VIVADO" >&2; exit 1; }

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

echo
echo "Bitstream loaded. The PCIe link has just gone down; refresh the host view:"
echo "  sudo $REPO/software/host/scripts/fra-pcie-rescan.sh"
