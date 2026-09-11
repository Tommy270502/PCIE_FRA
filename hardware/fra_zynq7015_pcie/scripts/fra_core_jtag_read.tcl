# Read and exercise fra_core directly over JTAG (APU AXI), independent of both
# the UART console and PCIe. Proves fra_core answers on AXI at 0x43C0_0000 in
# whatever bitstream is currently loaded.
#
# Run with xsdb -- Vitis 2026.1 removed xsct:
#   xsdb hardware/fra_zynq7015_pcie/scripts/fra_core_jtag_read.tcl
#
# Assumes the board is programmed and the PS is initialised; load a bitstream
# first with scripts/program_fpga_jtag.sh if it is not.
#
# This is the fallback path. When the endpoint enumerates, "fra_cli status" over
# PCIe or "status" on the board console answer the same question far faster.

set BASE 0x43C00000

# The XSA gives the debugger the PL address map, without which memory access to
# 0x43C0_0000 is refused. It is a build artifact, so resolve it relative to this
# script rather than hardcoding a path; FRA_XSA overrides.
set script_dir [file dirname [file normalize [info script]]]
if {[info exists ::env(FRA_XSA)]} {
    set xsa $::env(FRA_XSA)
} else {
    set xsa [file normalize [file join $script_dir .. export fra_pcie_zynq7015.xsa]]
}
if {![file exists $xsa]} {
    puts stderr "error: XSA not found at $xsa"
    puts stderr "       build it with run_pcie_impl_signoff.tcl, or set FRA_XSA"
    exit 1
}

proc rd {a} { return [lindex [mrd -value $a] 0] }

connect
targets -set -nocase -filter {name =~ "*Cortex-A9*#0*"}
# Halt the APU so the JTAG debugger is the sole AXI master.
stop
loadhw -hw $xsa -mem-ranges [list {0x40000000 0xBFFFFFFF}]

puts [format "FRA_AXI VERSION = 0x%08x" [rd [expr {$BASE + 0x00}]]]
puts [format "FRA_AXI CONTROL = 0x%08x" [rd [expr {$BASE + 0x04}]]]
puts [format "FRA_AXI STATUS  = 0x%08x" [rd [expr {$BASE + 0x08}]]]

# Configure a measurement: ~1 MHz tone (phase_inc = round(1e6*2^32/25e6)).
mwr [expr {$BASE + 0x0C}] 0x0A3D70A3 ;# PHASE_INC  (~1 MHz)
mwr [expr {$BASE + 0x10}] 0x00000000 ;# PHASE_OFFSET
mwr [expr {$BASE + 0x14}] 0x000000FF ;# AMPLITUDE
mwr [expr {$BASE + 0x18}] 64         ;# SETTLE_CYCLES
mwr [expr {$BASE + 0x1C}] 1024       ;# MEASURE_CYCLES (nonzero, else CONFIG_ERR)

# Start: DDS_ENABLE(0) | START(1) | RESET_PHASE_ON_START(3) = 0b1011
mwr [expr {$BASE + 0x04}] 0x0000000B
after 50

set st [rd [expr {$BASE + 0x08}]]
puts [format "FRA_AXI STATUS after start = 0x%08x" $st]

# Poll for DONE (bit1), up to ~1 s
for {set i 0} {$i < 100} {incr i} {
    set st [rd [expr {$BASE + 0x08}]]
    if {($st & 0x2) != 0} break
    after 10
}
puts [format "FRA_AXI STATUS final = 0x%08x (DONE=%d BUSY=%d)" $st [expr {($st>>1)&1}] [expr {$st&1}]]
puts [format "FRA_AXI SAMPLE_COUNT = %d" [rd [expr {$BASE + 0x20}]]]
puts [format "FRA_AXI I_ACC = 0x%08x_%08x" [rd [expr {$BASE+0x28}]] [rd [expr {$BASE+0x24}]]]
puts [format "FRA_AXI Q_ACC = 0x%08x_%08x" [rd [expr {$BASE+0x30}]] [rd [expr {$BASE+0x2C}]]]
puts [format "FRA_AXI ADC_MIN_MAX = 0x%08x" [rd [expr {$BASE + 0x34}]]]
puts [format "FRA_AXI LAST_SAMPLE = 0x%08x" [rd [expr {$BASE + 0x38}]]]
puts "FRA_AXI_DONE"
disconnect
exit
