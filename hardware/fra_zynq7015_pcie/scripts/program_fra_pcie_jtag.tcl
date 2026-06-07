# Program the PCIe-integrated bitstream and boot the bare-metal FRA CLI over JTAG.
# Bare-metal Zynq-7000 sequence: reset, program PL, ps7_init/post_config, download
# the FRA_Controller ELF, run. Leaves the app free-running on the PS.
# FRA_Controller mirrors its CLI on UART0/UART1; COM9 is validated at 115200 8N1.
#
# Run: xsct hardware/fra_zynq7015_pcie/scripts/program_fra_pcie_jtag.tcl

set repo  "C:/Users/Thomas/Documents/git/PCIE_FRA"
set bit   "$repo/hardware/fra_zynq7015_pcie/export/system_bd_wrapper_pcie.bit"
set ps7   "$repo/software/PCIE_FRA/hw/sdt/ps7_init.tcl"
set elf   "$repo/software/FRA_Controller/build/FRA_Controller.elf"

foreach f [list $bit $ps7 $elf] {
    if {![file exists $f]} { puts "FRA_JTAG_RESULT = FAIL (missing $f)"; exit 1 }
}

connect
puts "FRA_JTAG: targets ="
targets

# Select APU core 0
targets -set -nocase -filter {name =~ "*Cortex-A9*#0*"}
rst -system
after 2000

# 1) Program the PL
puts "FRA_JTAG: programming PL with [file tail $bit]"
fpga -file $bit

# 2) Initialise the PS (clocks/DDR) using the exported ps7_init
source $ps7
targets -set -nocase -filter {name =~ "*Cortex-A9*#0*"}
ps7_init
ps7_post_config

# 3) Download and run the FRA CLI
puts "FRA_JTAG: downloading [file tail $elf]"
dow $elf
con
after 1500

puts "FRA_JTAG_RESULT = OK"
disconnect
exit
