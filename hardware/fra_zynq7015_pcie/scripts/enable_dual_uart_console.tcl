# Enable both AX7015B USB-UART paths:
#   UART0: SoM CP2102GM on PS_MIO14/15
#   UART1: carrier CP2102GM on PS_MIO12/13
#
# This only changes PS7 MIO/peripheral configuration. It does not alter fra_core
# or the PCIe endpoint.

set script_dir   [file dirname [file normalize [info script]]]
set project_dir  [file normalize [file join $script_dir ".."]]
set project_file [file join $project_dir "fra_zynq7015_pcie.xpr"]
set bd_file      [file join $project_dir "fra_zynq7015_pcie.srcs" "sources_1" "bd" "system_bd" "system_bd.bd"]

open_project $project_file
open_bd_design $bd_file

set ps7 [get_bd_cells processing_system7_0]
set_property -dict [list \
    CONFIG.PCW_EN_UART0 {1} \
    CONFIG.PCW_UART0_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_UART0_UART0_IO {MIO 14 .. 15} \
    CONFIG.PCW_MIO_14_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_14_PULLUP {enabled} \
    CONFIG.PCW_MIO_14_SLEW {slow} \
    CONFIG.PCW_MIO_15_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_15_PULLUP {enabled} \
    CONFIG.PCW_MIO_15_SLEW {slow} \
] $ps7

validate_bd_design
save_bd_design
generate_target all [get_files $bd_file]

puts "FRA_DUAL_UART_RESULT = PASS"
