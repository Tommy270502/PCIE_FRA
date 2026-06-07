# Run the self-checking pcie_bar_regs AXI4-Lite testbench (behavioral).
#
# Validates the BAR0 register file logic with no PCIe/hardware involved.
# Run from repo root:
#   vivado -mode batch -source hardware/fra_zynq7015_pcie/scripts/run_pcie_bar_regs_sim.tcl

set script_dir   [file dirname [file normalize [info script]]]
set project_dir  [file normalize [file join $script_dir ".."]]
set project_file [file join $project_dir "fra_zynq7015_pcie.xpr"]
set tb_file      [file join $project_dir "fra_zynq7015_pcie.srcs/sim_1/new/tb_pcie_bar_regs.vhd"]

if {[llength [get_projects -quiet]] == 0} {
    open_project $project_file
}

if {[llength [get_files -quiet $tb_file]] == 0} {
    add_files -fileset sim_1 -norecurse $tb_file
}
# Testbench uses to_hstring -> needs VHDL-2008.
set_property file_type {VHDL 2008} [get_files $tb_file]

set_property top tb_pcie_bar_regs [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
set_property source_set sources_1 [get_filesets sim_1]
update_compile_order -fileset sim_1

launch_simulation -simset sim_1 -mode behavioral
run 20 us
close_sim

puts "pcie_bar_regs behavioral simulation completed."
