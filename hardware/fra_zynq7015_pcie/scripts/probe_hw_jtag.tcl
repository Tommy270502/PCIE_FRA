# Quick JTAG chain probe: confirm the board enumerates over the FTDI JTAG cable.
# Does NOT program anything. Run:
#   vivado -mode batch -source hardware/fra_zynq7015_pcie/scripts/probe_hw_jtag.tcl

open_hw_manager
connect_hw_server -allow_non_jtag
set targets [get_hw_targets -quiet]
puts "FRA_HW_TARGETS = [llength $targets] : $targets"
if {[llength $targets] == 0} {
    puts "FRA_HW_RESULT = NO_TARGET"
    disconnect_hw_server
    exit 0
}
current_hw_target [lindex $targets 0]
open_hw_target
foreach dev [get_hw_devices -quiet] {
    puts "FRA_HW_DEVICE = $dev  IDCODE=[get_property -quiet IDCODE $dev]  PART=[get_property -quiet PART $dev]"
}
puts "FRA_HW_RESULT = OK"
close_hw_target
disconnect_hw_server
