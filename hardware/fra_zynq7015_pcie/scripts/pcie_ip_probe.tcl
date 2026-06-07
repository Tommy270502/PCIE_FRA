# U2 authoritative check: can the 7-series PCIe IPs actually be instantiated for
# xc7z015clg485-2 (i.e. not grayed out)? Try create_ip and report pass/fail.
# Run: vivado -mode batch -source hardware/fra_zynq7015_pcie/scripts/pcie_ip_probe.tcl

set part xc7z015clg485-2
create_project -in_memory -part $part ipprobe

foreach spec {
    {xilinx.com:ip:axi_pcie:2.9   axi_pcie_probe}
    {xilinx.com:ip:pcie_7x:3.3    pcie_7x_probe}
    {xilinx.com:ip:xdma:4.2       xdma_probe}
} {
    set vlnv [lindex $spec 0]
    set name [lindex $spec 1]
    if {[catch {create_ip -vlnv $vlnv -module_name $name} err]} {
        puts "IP_AVAILABLE $vlnv : NO  ($err)"
    } else {
        puts "IP_AVAILABLE $vlnv : YES"
    }
}

puts "\n#### DONE ####"
