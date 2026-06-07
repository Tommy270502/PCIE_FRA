# Stage-0 PCIe DRC validation: synthesize the integrated design and run DRC.
# No implementation / bitstream. Confirms pin LOCs, GT placement, bank voltages,
# and that the PCIe addition synthesizes alongside fra_core.
#
# Run: vivado -mode batch -source hardware/fra_zynq7015_pcie/scripts/run_pcie_stage0_drc.tcl

set script_dir   [file dirname [file normalize [info script]]]
set project_dir  [file normalize [file join $script_dir ".."]]
set project_file [file join $project_dir "fra_zynq7015_pcie.xpr"]
set rpt_dir      [file join $project_dir "export/reports"]
file mkdir $rpt_dir

open_project $project_file
update_compile_order -fileset sources_1

puts "FRA_PCIE_DRC: top = [get_property top [current_fileset]]"

reset_run synth_1
launch_runs synth_1 -jobs 8
wait_on_run synth_1

set st [get_property STATUS [get_runs synth_1]]
set prog [get_property PROGRESS [get_runs synth_1]]
puts "FRA_PCIE_DRC_SYNTH_STATUS = $st  PROGRESS = $prog"
if {$prog ne "100%"} {
    puts "FRA_PCIE_DRC_RESULT = SYNTH_FAILED"
    exit 1
}

open_run synth_1 -name synth_1

set drc_rpt [file join $rpt_dir "pcie_stage0_drc.rpt"]
report_drc -file $drc_rpt
puts "FRA_PCIE_DRC: wrote $drc_rpt"

# Summarise: count Errors / Critical Warnings in the DRC report
set errs 0
set crit 0
set fh [open $drc_rpt r]
foreach line [split [read $fh] "\n"] {
    if {[regexp {^Severity:\s*Error} $line]} { incr errs }
    if {[regexp {^Severity:\s*Critical Warning} $line]} { incr crit }
}
close $fh
puts "FRA_PCIE_DRC_ERRORS = $errs"
puts "FRA_PCIE_DRC_CRIT_WARNINGS = $crit"
if {$errs == 0} {
    puts "FRA_PCIE_DRC_RESULT = PASS"
} else {
    puts "FRA_PCIE_DRC_RESULT = FAIL"
}
