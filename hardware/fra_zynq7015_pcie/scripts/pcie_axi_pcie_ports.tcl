# Dump exact BD pin / interface-pin names of axi_pcie (endpoint, x1, gen1,
# shared logic in core) so add_pcie_endpoint.tcl wires correctly first pass.
# Run: vivado -mode batch -source hardware/fra_zynq7015_pcie/scripts/pcie_axi_pcie_ports.tcl

set part xc7z015clg485-2
create_project -in_memory -part $part portprobe
create_bd_design tmpbd
set cell [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_pcie:2.9 axi_pcie_0]
set_property -dict [list \
    CONFIG.NO_OF_LANES {X1} \
    CONFIG.MAX_LINK_SPEED {2.5_GT/s} \
    CONFIG.INCLUDE_RC {PCI_Express_Endpoint_device} \
    CONFIG.PCIE_BLK_LOCN {X0Y0} \
    CONFIG.REF_CLK_FREQ {100_MHz} \
    CONFIG.shared_logic_in_core {true} \
    CONFIG.BAR0_SCALE {Kilobytes} \
    CONFIG.BAR0_SIZE {8} \
    CONFIG.DEVICE_ID {0x7021} \
] $cell

puts "\n#### INTERFACE PINS ####"
foreach ip [get_bd_intf_pins -of_objects $cell] {
    puts "  [get_property MODE $ip]  [get_property VLNV $ip]  $ip"
}
puts "\n#### SCALAR/BUS PINS ####"
foreach p [get_bd_pins -of_objects $cell] {
    puts "  [get_property DIR $p]  $p  (L=[get_property LEFT $p] R=[get_property RIGHT $p])"
}
puts "\n#### DONE ####"
