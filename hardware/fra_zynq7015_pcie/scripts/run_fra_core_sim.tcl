# Run the self-checking FRA core behavioral testbench.
#
# Run from the repo root:
#   vivado -mode batch -source hardware/fra_zynq7015_pcie/scripts/run_fra_core_sim.tcl

set script_dir [file dirname [file normalize [info script]]]
set project_dir [file normalize [file join $script_dir ".."]]
set project_file [file join $project_dir "fra_zynq7015_pcie.xpr"]

if {[llength [get_projects -quiet]] == 0} {
    open_project $project_file
}

set_property top tb_fra_core [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
set_property source_set sources_1 [get_filesets sim_1]
update_compile_order -fileset sim_1

launch_simulation -simset sim_1 -mode behavioral
run 100 us
close_sim

puts "FRA core behavioral simulation completed."
