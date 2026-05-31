# Rebuild the PL side of system_bd for the functional FRA core.
#
# Run from Vivado 2025.1:
#   vivado -mode batch -source hardware/fra_zynq7015_pcie/scripts/rebuild_functional_fra_bd.tcl
#
# The script preserves the existing Zynq PS and reset configuration, removes the
# GPIO-based FRA prototype cells, and connects fra_core as a single AXI4-Lite
# peripheral at 0x43C00000.

set script_dir [file dirname [file normalize [info script]]]
set project_dir [file normalize [file join $script_dir ".."]]
set project_file [file join $project_dir "fra_zynq7015_pcie.xpr"]
set bd_file [file join $project_dir "fra_zynq7015_pcie.srcs/sources_1/bd/system_bd/system_bd.bd"]
set src_dir [file join $project_dir "fra_zynq7015_pcie.srcs/sources_1/new"]
set external_timing_xdc [file join $project_dir "fra_zynq7015_pcie.srcs/constrs_1/new/fra_external_timing.xdc"]

if {[llength [get_projects -quiet]] == 0} {
    open_project $project_file
}

if {[llength [get_files -quiet $external_timing_xdc]] == 0} {
    add_files -fileset constrs_1 -norecurse $external_timing_xdc
}
set external_timing_file [get_files -quiet $external_timing_xdc]
set_property USED_IN_SYNTHESIS false $external_timing_file
set_property USED_IN_IMPLEMENTATION true $external_timing_file

foreach src [list \
    [file join $src_dir "sineLUT.vhd"] \
    [file join $src_dir "fra_core.vhd"] \
] {
    if {[llength [get_files -quiet $src]] == 0} {
        add_files -fileset sources_1 -norecurse $src
    }
}
update_compile_order -fileset sources_1

open_bd_design $bd_file
current_bd_design [get_bd_designs system_bd]

set old_cells [list]
foreach cell_name {phase_reg amp_enable_reg adc_reg fra_top_0 fra_core_0 axi_smc} {
    set cell [get_bd_cells -quiet $cell_name]
    if {[llength $cell] > 0} {
        lappend old_cells $cell
    }
}
if {[llength $old_cells] > 0} {
    delete_bd_objs $old_cells
}

foreach pattern {axi_gpio_* fra_top_0_*} {
    foreach net [get_bd_nets -quiet $pattern] {
        delete_bd_objs $net
    }
}

foreach pattern {axi_smc_*} {
    foreach intf_net [get_bd_intf_nets -quiet $pattern] {
        delete_bd_objs $intf_net
    }
}

set fra_core [get_bd_cells -quiet fra_core_0]
if {[llength $fra_core] == 0} {
    set fra_core [create_bd_cell -type module -reference fra_core fra_core_0]
}

set axi_smc [get_bd_cells -quiet axi_smc]
if {[llength $axi_smc] == 0} {
    set axi_smc [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc]
}
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {1}] $axi_smc

foreach port_spec {
    {adc_in_0 I 7 0}
    {dac_out_0 O 7 0}
    {adc_clk_out_0 O -1 -1}
    {dac_clk_out_0 O -1 -1}
} {
    set name [lindex $port_spec 0]
    set dir  [lindex $port_spec 1]
    set from [lindex $port_spec 2]
    set to   [lindex $port_spec 3]

    if {[llength [get_bd_ports -quiet $name]] == 0} {
        if {$from >= 0} {
            create_bd_port -dir $dir -from $from -to $to $name
        } else {
            create_bd_port -dir $dir $name
        }
    }
}

connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins axi_smc/aclk]
connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins fra_core_0/s_axi_aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_smc/aresetn]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins fra_core_0/s_axi_aresetn]

connect_bd_intf_net [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins axi_smc/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_smc/M00_AXI] [get_bd_intf_pins fra_core_0/S_AXI]

connect_bd_net [get_bd_ports adc_in_0] [get_bd_pins fra_core_0/adc_in]
connect_bd_net [get_bd_ports dac_out_0] [get_bd_pins fra_core_0/dac_out]
connect_bd_net [get_bd_ports adc_clk_out_0] [get_bd_pins fra_core_0/adc_clk_out]
connect_bd_net [get_bd_ports dac_clk_out_0] [get_bd_pins fra_core_0/dac_clk_out]

assign_bd_address

set core_segments [get_bd_addr_segs -of_objects [get_bd_addr_spaces processing_system7_0/Data]]
foreach seg $core_segments {
    if {[string match "*fra_core_0*" $seg]} {
        set_property offset 0x43C00000 $seg
        set_property range 64K $seg
    }
}

validate_bd_design
save_bd_design
make_wrapper -files [get_files $bd_file] -top -import -force
update_compile_order -fileset sources_1

puts "Functional FRA block design rebuilt. Re-run synthesis, implementation, bitstream generation, and XSA export."
