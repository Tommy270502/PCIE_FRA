# Read/exercise fra_core directly over JTAG (APU AXI), independent of UART.
# Proves fra_core responds on AXI at 0x43C0_0000 in the PCIe-integrated bitstream.
# Assumes the board is already programmed + PS initialised (program_fra_pcie_jtag.tcl).

set BASE 0x43C00000
set xsa  "C:/Users/Thomas/Documents/git/PCIE_FRA/hardware/fra_zynq7015_pcie/export/fra_pcie_zynq7015.xsa"
proc rd {a} { return [lindex [mrd -value $a] 0] }

connect
targets -set -nocase -filter {name =~ "*Cortex-A9*#0*"}
# Halt the APU so the JTAG debugger is the sole AXI master, and register the
# PL address map (0x43C0_0000 fra_core) so debugger memory access is allowed.
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
