# Introspect axi_pcie:2.9 config params + ports for xc7z015clg485-2 so the BD
# Tcl can be written with correct CONFIG.* keys.
# Run: vivado -mode batch -source hardware/fra_zynq7015_pcie/scripts/pcie_axi_pcie_config.tcl

set part xc7z015clg485-2
create_project -in_memory -part $part axicfg
create_ip -vlnv xilinx.com:ip:axi_pcie:2.9 -module_name axi_pcie_0

set ip [get_ips axi_pcie_0]

puts "\n#### axi_pcie CONFIG.* properties (name = current value) ####"
foreach prop [lsort [list_property $ip CONFIG.*]] {
    puts "  $prop = [get_property $prop $ip]"
}

puts "\n#### Selected param legal values ####"
foreach p {CONFIG.NO_OF_LANES CONFIG.MAX_LINK_SPEED CONFIG.DEVICE_ID CONFIG.VENDOR_ID \
           CONFIG.BAR0_SCALE CONFIG.BAR0_SIZE CONFIG.S_AXI_DATA_WIDTH CONFIG.AXIBAR_NUM \
           CONFIG.REF_CLK_FREQ CONFIG.PCIE_BLK_LOCN CONFIG.NUM_MSI_REQ} {
    catch {puts "  $p :: legal = [list_property_value $p $ip]"} e
}

puts "\n#### DONE ####"
