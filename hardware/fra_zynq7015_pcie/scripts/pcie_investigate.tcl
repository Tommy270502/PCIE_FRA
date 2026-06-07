# PCIe bring-up investigation: answer U1-U4 with exact device/IP data.
# Run: vivado -mode batch -source hardware/fra_zynq7015_pcie/scripts/pcie_investigate.tcl
#
# This script does NOT modify the project. It opens it read-only-ish to use the
# IP catalog, and uses link_design on the bare part to query device sites/pins.

set part xc7z015clg485-2

set script_dir [file dirname [file normalize [info script]]]
set project_dir [file normalize [file join $script_dir ".."]]
set project_file [file join $project_dir "fra_zynq7015_pcie.xpr"]

puts "############################################################"
puts "## OPEN PROJECT FOR IP CATALOG"
puts "############################################################"
if {[llength [get_projects -quiet]] == 0} {
    open_project $project_file
}
puts "PROJECT_PART = [get_property PART [current_project]]"

puts "\n############################################################"
puts "## U2 -- PCIe / XDMA IP available in catalog for this part"
puts "############################################################"
foreach ipdef [lsort [get_ipdefs -quiet -filter {NAME =~ *pcie* || NAME =~ *xdma* || NAME =~ *pci_express*}]] {
    set name [get_property NAME $ipdef]
    set vlnv [get_property VLNV $ipdef]
    set excl [get_property EXCLUDED_PARTS -quiet $ipdef]
    set upg  [get_property UPGRADE_VERSIONS -quiet $ipdef]
    puts "IPDEF VLNV=$vlnv NAME=$name"
}
puts "U2_IPDEF_COUNT = [llength [get_ipdefs -quiet -filter {NAME =~ *pcie* || NAME =~ *xdma* || NAME =~ *pci_express*}]]"

puts "\n############################################################"
puts "## Load bare device for site/pin queries (link_design -part)"
puts "############################################################"
# Use a fresh in-memory design on the bare part so device DB is available.
link_design -quiet -name pcie_probe -part $part
puts "LINKED_PART = [get_property PART [current_design]]"

puts "\n############################################################"
puts "## U1 -- Does this device have a hard PCIe block?"
puts "############################################################"
set pcie_sites [get_sites -quiet -filter {SITE_TYPE =~ *PCIE*}]
puts "U1_PCIE_SITES = $pcie_sites"
puts "U1_PCIE_SITE_COUNT = [llength $pcie_sites]"
foreach s $pcie_sites {
    puts "  SITE=$s SITE_TYPE=[get_property SITE_TYPE $s]"
    foreach b [get_bels -quiet -of_objects $s] {
        puts "    BEL=$b TYPE=[get_property TYPE $b]"
    }
}
# Also check site types directly
puts "U1_PCIE_SITE_TYPES = [lsort -unique [get_property SITE_TYPE [get_sites -quiet -filter {SITE_TYPE =~ *PCIE*}]]]"

puts "\n############################################################"
puts "## U4 -- GTP channel sites and their package pins"
puts "############################################################"
set gt_sites [get_sites -quiet -filter {SITE_TYPE =~ GTPE2_CHANNEL*}]
puts "GTP_CHANNEL_SITES = $gt_sites"
foreach s $gt_sites {
    set pp [get_package_pins -quiet -of_objects $s]
    puts "  $s -> package_pins: $pp"
}

puts "\n## Reverse map: known PCIe package pins -> site"
foreach pin {W4 Y4 W8 Y8 AA3 AB3 AA7 AB7 U9 V9} {
    set pkpin [get_package_pins -quiet $pin]
    if {[llength $pkpin] == 0} {
        puts "  PIN $pin : NOT FOUND"
        continue
    }
    set sites [get_sites -quiet -of_objects $pkpin]
    set bonded [get_property IS_BONDED -quiet $pkpin]
    puts "  PIN $pin : sites=[get_sites -quiet -of_objects $pkpin] bonded=$bonded"
}

puts "\n## GTP common (refclk / MGTREFCLK) sites"
set gtp_common [get_sites -quiet -filter {SITE_TYPE =~ GTPE2_COMMON*}]
puts "GTPE2_COMMON_SITES = $gtp_common"
foreach s $gtp_common {
    puts "  $s -> package_pins: [get_package_pins -quiet -of_objects $s]"
}

puts "\n############################################################"
puts "## U3 -- Bank 34 package pins (locate PERST / B34_L4_N)"
puts "############################################################"
set b34 [get_package_pins -quiet -filter {BANK == 34}]
puts "BANK34_PIN_COUNT = [llength $b34]"
foreach p [lsort $b34] {
    set min_dly [get_property MIN_DELAY -quiet $p]
    set io [get_property PIN_FUNC -quiet $p]
    puts "  PIN=$p  PIN_FUNC=$io"
}

puts "\n############################################################"
puts "## DONE -- investigation complete"
puts "############################################################"
