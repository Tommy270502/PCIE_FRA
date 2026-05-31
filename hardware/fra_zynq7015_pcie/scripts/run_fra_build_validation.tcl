# Run synthesis, implementation, sign-off reports, bitstream generation, and
# XSA export for the UART-controlled FRA design.
#
# Run from the repo root:
#   vivado -mode batch -source hardware/fra_zynq7015_pcie/scripts/run_fra_build_validation.tcl

set script_dir [file dirname [file normalize [info script]]]
set project_dir [file normalize [file join $script_dir ".."]]
set project_file [file join $project_dir "fra_zynq7015_pcie.xpr"]
set artifact_dir [file join $project_dir "export"]
set report_dir [file join $artifact_dir "reports"]
set xsa_file [file join $artifact_dir "fra_zynq7015_pcie.xsa"]
set bit_file [file join $artifact_dir "system_bd_wrapper.bit"]

file mkdir $report_dir
file delete -force $bit_file $xsa_file

source [file join $script_dir "rebuild_functional_fra_bd.tcl"]

reset_run synth_1
launch_runs synth_1 -jobs 8
wait_on_run synth_1
if {[get_property STATUS [get_runs synth_1]] ne "synth_design Complete!"} {
    error "Synthesis failed: [get_property STATUS [get_runs synth_1]]"
}

launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
if {[get_property STATUS [get_runs impl_1]] ne "write_bitstream Complete!"} {
    error "Implementation or bitstream generation failed: [get_property STATUS [get_runs impl_1]]"
}

open_run impl_1

report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose \
    -max_paths 20 -file [file join $report_dir "timing_summary.rpt"]
report_drc -file [file join $report_dir "drc.rpt"]
report_methodology -file [file join $report_dir "methodology.rpt"]
report_utilization -file [file join $report_dir "utilization.rpt"]
report_clock_utilization -file [file join $report_dir "clock_utilization.rpt"]

set setup_violations [get_timing_paths -quiet -delay_type max -slack_lesser_than 0 -max_paths 1]
set hold_violations [get_timing_paths -quiet -delay_type min -slack_lesser_than 0 -max_paths 1]
set adc_clocks [get_clocks -quiet adc_sample_clk]
set dac_clocks [get_clocks -quiet dac_sample_clk]

set critical_drc_count 0
foreach violation [get_drc_violations -quiet] {
    set severity [get_property SEVERITY $violation]
    if {($severity eq "Error") || ($severity eq "Critical Warning")} {
        incr critical_drc_count
    }
}

set critical_methodology_count 0
foreach violation [get_methodology_violations -quiet] {
    set severity [get_property SEVERITY $violation]
    if {($severity eq "Error") || ($severity eq "Critical Warning")} {
        incr critical_methodology_count
    }
}

puts "FRA_BUILD_RESULT setup_violations=[llength $setup_violations]"
puts "FRA_BUILD_RESULT hold_violations=[llength $hold_violations]"
puts "FRA_BUILD_RESULT adc_sample_clocks=[llength $adc_clocks]"
puts "FRA_BUILD_RESULT dac_sample_clocks=[llength $dac_clocks]"
puts "FRA_BUILD_RESULT critical_drc_count=$critical_drc_count"
puts "FRA_BUILD_RESULT critical_methodology_count=$critical_methodology_count"

if {[llength $setup_violations] > 0} {
    error "Implementation has setup timing violations"
}
if {[llength $hold_violations] > 0} {
    error "Implementation has hold timing violations"
}
if {([llength $adc_clocks] != 1) || ([llength $dac_clocks] != 1)} {
    error "Expected constrained ADC and DAC sample clocks"
}
if {$critical_drc_count > 0} {
    error "Implementation has DRC errors or critical warnings"
}
if {$critical_methodology_count > 0} {
    error "Implementation has methodology errors or critical warnings"
}

set run_bit_files [glob -nocomplain -directory [get_property DIRECTORY [get_runs impl_1]] *.bit]
if {[llength $run_bit_files] != 1} {
    error "Expected one generated bitstream, found [llength $run_bit_files]"
}
file copy -force [lindex $run_bit_files 0] $bit_file
write_hw_platform -fixed -include_bit -force -file $xsa_file

puts "FRA_BUILD_RESULT bitstream=$bit_file"
puts "FRA_BUILD_RESULT xsa=$xsa_file"
puts "FRA build validation completed successfully."
