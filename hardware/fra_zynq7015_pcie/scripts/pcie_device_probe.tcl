# Device-DB probe for U1/U3/U4.
# link_design -part loads the full device database (sites + package pins).
# Run: vivado -mode batch -source hardware/fra_zynq7015_pcie/scripts/pcie_device_probe.tcl

set part xc7z015clg485-2
link_design -part $part -name probe
puts "DEVICE_PART = [get_property PART [current_design]]"

puts "\n#### DB sanity ####"
puts "SLICE_COUNT = [llength [get_sites -quiet -filter {SITE_TYPE =~ SLICE*}]]"

puts "\n#### Site types matching PCIE / GT ####"
set all_types [get_sites -quiet]
if {[llength $all_types] > 0} {
    foreach st [lsort -unique [get_property SITE_TYPE $all_types]] {
        if {[string match -nocase *pcie* $st] || [string match -nocase *gt* $st] || [string match -nocase *pci* $st]} {
            puts "   SITE_TYPE = $st  (count=[llength [get_sites -quiet -filter "SITE_TYPE == $st"]])"
        }
    }
}

puts "\n#### U1 -- hard PCIe block sites ####"
set pcie_sites [get_sites -quiet -filter {SITE_TYPE =~ *PCIE* || SITE_TYPE =~ *PCI_E*}]
puts "U1_PCIE_SITE_COUNT = [llength $pcie_sites]"
foreach s $pcie_sites { puts "  SITE=$s TYPE=[get_property SITE_TYPE $s]" }

puts "\n#### U4 -- GTPE2_CHANNEL sites + package pins ####"
set gtch [lsort [get_sites -quiet -filter {SITE_TYPE =~ GTPE2_CHANNEL*}]]
puts "GTPE2_CHANNEL_COUNT = [llength $gtch]"
foreach s $gtch { puts "  $s -> [get_package_pins -quiet -of_objects $s]" }

puts "\n#### GTPE2_COMMON (MGTREFCLK) sites ####"
foreach s [lsort [get_sites -quiet -filter {SITE_TYPE =~ GTPE2_COMMON*}]] {
    puts "  $s -> [get_package_pins -quiet -of_objects $s]"
}

puts "\n#### U4 reverse map: known PCIe pins -> site ####"
foreach pin {W4 Y4 W8 Y8 AA3 AB3 AA7 AB7 U9 V9} {
    set pkpin [get_package_pins -quiet $pin]
    if {[llength $pkpin] == 0} { puts "  PIN $pin : NOT FOUND"; continue }
    puts "  PIN $pin : sites=[get_sites -quiet -of_objects $pkpin] func=[get_property PIN_FUNC -quiet $pkpin]"
}

puts "\n#### U3 -- Bank 34 package pins ####"
set b34 [get_package_pins -quiet -filter {BANK == 34}]
puts "BANK34_PIN_COUNT = [llength $b34]"
foreach p [lsort $b34] {
    puts "  PIN=$p FUNC=[get_property PIN_FUNC -quiet $p] PAIR=[get_property DIFF_PAIR_PIN -quiet $p]"
}

puts "\n#### DONE ####"
