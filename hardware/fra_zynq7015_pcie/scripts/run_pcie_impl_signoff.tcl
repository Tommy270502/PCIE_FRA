# PCIe-integrated implementation signoff.
#
# Runs impl -> bitstream -> XSA on the CURRENT project state (fra_core + the
# additive PCIe endpoint already in system_bd). Unlike run_fra_build_validation.tcl
# this does NOT rebuild the block design, so the PCIe additions from
# add_pcie_endpoint.tcl are preserved.
#
# Signoff gates: setup/hold timing clean, adc/dac/pcie_refclk clocks constrained,
# no DRC or methodology Errors/Critical Warnings. BIT/XSA only written on a clean
# pass (same discipline as the FRA signoff flow).
#
# Run from repo root:
#   vivado -mode batch -source hardware/fra_zynq7015_pcie/scripts/run_pcie_impl_signoff.tcl

set script_dir   [file dirname [file normalize [info script]]]
set project_dir  [file normalize [file join $script_dir ".."]]
set project_file [file join $project_dir "fra_zynq7015_pcie.xpr"]
set artifact_dir [file join $project_dir "export"]
set report_dir   [file join $artifact_dir "reports"]
set xsa_file     [file join $artifact_dir "fra_pcie_zynq7015.xsa"]
set bit_file     [file join $artifact_dir "system_bd_wrapper_pcie.bit"]

file mkdir $report_dir

open_project $project_file
update_compile_order -fileset sources_1

# Synthesis: reuse if current, else (re)run.
if {[get_property STATUS [get_runs synth_1]] ne "synth_design Complete!" || \
    [get_property PROGRESS [get_runs synth_1]] ne "100%"} {
    reset_run synth_1
    launch_runs synth_1 -jobs 8
    wait_on_run synth_1
    if {[get_property STATUS [get_runs synth_1]] ne "synth_design Complete!"} {
        error "Synthesis failed: [get_property STATUS [get_runs synth_1]]"
    }
}

launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
if {[get_property STATUS [get_runs impl_1]] ne "write_bitstream Complete!"} {
    error "Implementation or bitstream generation failed: [get_property STATUS [get_runs impl_1]]"
}

open_run impl_1

report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose \
    -max_paths 20 -file [file join $report_dir "pcie_timing_summary.rpt"]
report_drc          -file [file join $report_dir "pcie_impl_drc.rpt"]
report_methodology  -file [file join $report_dir "pcie_methodology.rpt"]
report_utilization  -file [file join $report_dir "pcie_utilization.rpt"]
report_clock_utilization -file [file join $report_dir "pcie_clock_utilization.rpt"]

set setup_violations [get_timing_paths -quiet -delay_type max -slack_lesser_than 0 -max_paths 1]
set hold_violations  [get_timing_paths -quiet -delay_type min -slack_lesser_than 0 -max_paths 1]
set adc_clocks    [get_clocks -quiet adc_sample_clk]
set dac_clocks    [get_clocks -quiet dac_sample_clk]
set pcie_refclks  [get_clocks -quiet pcie_refclk]

set critical_drc_count 0
foreach violation [get_drc_violations -quiet] {
    set severity [get_property SEVERITY $violation]
    if {($severity eq "Error") || ($severity eq "Critical Warning")} { incr critical_drc_count }
}
set critical_methodology_count 0
foreach violation [get_methodology_violations -quiet] {
    set severity [get_property SEVERITY $violation]
    if {($severity eq "Error") || ($severity eq "Critical Warning")} { incr critical_methodology_count }
}

puts "FRA_PCIE_IMPL setup_violations=[llength $setup_violations]"
puts "FRA_PCIE_IMPL hold_violations=[llength $hold_violations]"
puts "FRA_PCIE_IMPL adc_sample_clocks=[llength $adc_clocks]"
puts "FRA_PCIE_IMPL dac_sample_clocks=[llength $dac_clocks]"
puts "FRA_PCIE_IMPL pcie_refclks=[llength $pcie_refclks]"
puts "FRA_PCIE_IMPL critical_drc_count=$critical_drc_count"
puts "FRA_PCIE_IMPL critical_methodology_count=$critical_methodology_count"

# Report worst setup/hold slack for visibility even on a pass.
set wns [get_property SLACK [lindex [get_timing_paths -quiet -delay_type max -max_paths 1] 0]]
set whs [get_property SLACK [lindex [get_timing_paths -quiet -delay_type min -max_paths 1] 0]]
puts "FRA_PCIE_IMPL wns=$wns whs=$whs"

set fail 0
if {[llength $setup_violations] > 0} { puts "FRA_PCIE_IMPL FAIL: setup timing violations"; set fail 1 }
if {[llength $hold_violations]  > 0} { puts "FRA_PCIE_IMPL FAIL: hold timing violations";  set fail 1 }
if {([llength $adc_clocks] != 1) || ([llength $dac_clocks] != 1)} {
    puts "FRA_PCIE_IMPL FAIL: missing adc/dac sample clocks"; set fail 1
}
if {[llength $pcie_refclks] != 1} { puts "FRA_PCIE_IMPL WARN: pcie_refclk not constrained"; }
if {$critical_drc_count > 0}         { puts "FRA_PCIE_IMPL FAIL: DRC errors/critical warnings"; set fail 1 }
if {$critical_methodology_count > 0} { puts "FRA_PCIE_IMPL FAIL: methodology errors/critical warnings"; set fail 1 }

if {$fail} {
    puts "FRA_PCIE_IMPL_RESULT = FAIL"
    error "PCIe implementation signoff failed; BIT/XSA not written."
}

set run_bit_files [glob -nocomplain -directory [get_property DIRECTORY [get_runs impl_1]] *.bit]
if {[llength $run_bit_files] != 1} {
    error "Expected one generated bitstream, found [llength $run_bit_files]"
}
file copy -force [lindex $run_bit_files 0] $bit_file
write_hw_platform -fixed -include_bit -force -file $xsa_file

puts "FRA_PCIE_IMPL bitstream=$bit_file"
puts "FRA_PCIE_IMPL xsa=$xsa_file"
puts "FRA_PCIE_IMPL_RESULT = PASS"
