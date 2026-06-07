# =============================================================================
# add_pcie_endpoint.tcl
#
# Additively inserts a PCIe x1 Gen1 endpoint (axi_pcie) into the existing
# system_bd, behind which a small AXI4-Lite scratch/ID block (pcie_bar_regs)
# answers BAR0 accesses. The existing fra_core peripheral (PS M_AXI_GP0 ->
# axi_smc -> 0x43C0_0000) is left completely untouched.
#
# Kept as a SEPARATE script (not folded into rebuild_functional_fra_bd.tcl) so
# the known-good fra_core rebuild flow stays pristine; run it AFTER that flow.
#
# Run:
#   vivado -mode batch -source hardware/fra_zynq7015_pcie/scripts/add_pcie_endpoint.tcl
#
# The script is idempotent: re-running deletes the prior PCIe cells/ports first.
# system_bd.bd and the .xpr are git-tracked, so a bad run is recoverable with
#   git checkout -- hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.srcs/sources_1/bd
# =============================================================================

set script_dir   [file dirname [file normalize [info script]]]
set project_dir  [file normalize [file join $script_dir ".."]]
set project_file [file join $project_dir "fra_zynq7015_pcie.xpr"]
set bd_file      [file join $project_dir "fra_zynq7015_pcie.srcs/sources_1/bd/system_bd/system_bd.bd"]
set src_dir      [file join $project_dir "fra_zynq7015_pcie.srcs/sources_1/new"]
set pcie_xdc     [file join $project_dir "fra_zynq7015_pcie.srcs/constrs_1/new/pcie_pins.xdc"]
set regs_vhd     [file join $src_dir "pcie_bar_regs.vhd"]

if {[llength [get_projects -quiet]] == 0} {
    open_project $project_file
}

# --- sources: register-file VHDL --------------------------------------------
if {[llength [get_files -quiet $regs_vhd]] == 0} {
    add_files -fileset sources_1 -norecurse $regs_vhd
}
# --- constraints: PCIe pins (synthesis + implementation) --------------------
if {[llength [get_files -quiet $pcie_xdc]] == 0} {
    add_files -fileset constrs_1 -norecurse $pcie_xdc
}
update_compile_order -fileset sources_1

open_bd_design $bd_file
current_bd_design [get_bd_designs system_bd]

# --- idempotency: tear down any prior PCIe additions ------------------------
foreach inet {pcie_*} {
    foreach n [get_bd_intf_nets -quiet $inet] { delete_bd_objs -quiet $n }
}
foreach cell {pcie_smc proc_sys_reset_pcie pcie_bar_regs_0 pcie_refclk_buf axi_pcie_0} {
    set c [get_bd_cells -quiet $cell]
    if {[llength $c] > 0} { delete_bd_objs -quiet $c }
}
foreach prt {pcie_refclk_p pcie_refclk_n pcie_perst_n pcie_txp pcie_txn pcie_rxp pcie_rxn REFCLK_0} {
    set p [get_bd_ports -quiet $prt]
    if {[llength $p] > 0} { delete_bd_objs -quiet $p }
}

# --- cells ------------------------------------------------------------------
set pcie [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_pcie:2.9 axi_pcie_0]
set_property -dict [list \
    CONFIG.NO_OF_LANES {X1} \
    CONFIG.MAX_LINK_SPEED {2.5_GT/s} \
    CONFIG.INCLUDE_RC {PCI_Express_Endpoint_device} \
    CONFIG.PCIE_BLK_LOCN {X0Y0} \
    CONFIG.REF_CLK_FREQ {100_MHz} \
    CONFIG.shared_logic_in_core {true} \
    CONFIG.BAR0_ENABLED {true} \
    CONFIG.BAR0_SCALE {Kilobytes} \
    CONFIG.BAR0_SIZE {8} \
    CONFIG.BAR_64BIT {false} \
    CONFIG.VENDOR_ID {0x10EE} \
    CONFIG.DEVICE_ID {0x7021} \
    CONFIG.PCIEBAR2AXIBAR_0 {0x00000000} \
] $pcie

set regs [create_bd_cell -type module -reference pcie_bar_regs pcie_bar_regs_0]

set smc [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 pcie_smc]
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {1}] $smc

set rst [create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_pcie]

# --- external serial + PERST ports ------------------------------------------
create_bd_port -dir O -from 0 -to 0 pcie_txp
create_bd_port -dir O -from 0 -to 0 pcie_txn
create_bd_port -dir I -from 0 -to 0 pcie_rxp
create_bd_port -dir I -from 0 -to 0 pcie_rxn
connect_bd_net [get_bd_pins axi_pcie_0/pci_exp_txp] [get_bd_ports pcie_txp]
connect_bd_net [get_bd_pins axi_pcie_0/pci_exp_txn] [get_bd_ports pcie_txn]
connect_bd_net [get_bd_pins axi_pcie_0/pci_exp_rxp] [get_bd_ports pcie_rxp]
connect_bd_net [get_bd_pins axi_pcie_0/pci_exp_rxn] [get_bd_ports pcie_rxn]

create_bd_port -dir I pcie_perst_n
connect_bd_net [get_bd_ports pcie_perst_n] [get_bd_pins axi_pcie_0/axi_aresetn]
connect_bd_net [get_bd_ports pcie_perst_n] [get_bd_pins proc_sys_reset_pcie/ext_reset_in]

# --- reference clock: diff pads -> IBUFDS_GTE2 -> IP single-ended REFCLK -----
# The 7-series PCIe core keeps the GT refclk diff buffer outside the core, so
# REFCLK is a single-ended input; we drive it from a util_ds_buf (IBUFDS_GTE2).
set refbuf [create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf pcie_refclk_buf]
set_property -dict [list CONFIG.C_BUF_TYPE {IBUFDSGTE} CONFIG.C_SIZE {1}] $refbuf
create_bd_port -dir I pcie_refclk_p
create_bd_port -dir I pcie_refclk_n
connect_bd_net [get_bd_ports pcie_refclk_p] [get_bd_pins pcie_refclk_buf/IBUF_DS_P]
connect_bd_net [get_bd_ports pcie_refclk_n] [get_bd_pins pcie_refclk_buf/IBUF_DS_N]
connect_bd_net [get_bd_pins pcie_refclk_buf/IBUF_OUT] [get_bd_pins axi_pcie_0/REFCLK]

# --- clocking / reset -------------------------------------------------------
connect_bd_net [get_bd_pins axi_pcie_0/axi_aclk_out] [get_bd_pins proc_sys_reset_pcie/slowest_sync_clk]
connect_bd_net [get_bd_pins axi_pcie_0/axi_aclk_out] [get_bd_pins pcie_smc/aclk]
connect_bd_net [get_bd_pins axi_pcie_0/axi_aclk_out] [get_bd_pins pcie_bar_regs_0/S_AXI_ACLK]
connect_bd_net [get_bd_pins axi_pcie_0/mmcm_lock]    [get_bd_pins proc_sys_reset_pcie/dcm_locked]
connect_bd_net [get_bd_pins proc_sys_reset_pcie/peripheral_aresetn] [get_bd_pins pcie_smc/aresetn]
connect_bd_net [get_bd_pins proc_sys_reset_pcie/peripheral_aresetn] [get_bd_pins pcie_bar_regs_0/S_AXI_ARESETN]

# --- data path: BAR0 (M_AXI) -> SmartConnect -> register file ---------------
connect_bd_intf_net [get_bd_intf_pins axi_pcie_0/M_AXI]  [get_bd_intf_pins pcie_smc/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins pcie_smc/M00_AXI]  [get_bd_intf_pins pcie_bar_regs_0/S_AXI]

# --- addressing: pcie_bar_regs at AXI offset 0 in the M_AXI space -----------
assign_bd_address
foreach seg [get_bd_addr_segs -quiet -of_objects [get_bd_addr_spaces -quiet axi_pcie_0/M_AXI]] {
    if {[string match "*pcie_bar_regs_0*" $seg]} {
        set_property offset 0x00000000 $seg
    }
}

validate_bd_design
save_bd_design

puts "\n#### FINAL EXTERNAL PORTS ####"
foreach p [lsort [get_bd_ports -quiet *]] {
    puts "  [get_property DIR $p] $p"
}

make_wrapper -files [get_files $bd_file] -top -import -force
update_compile_order -fileset sources_1

puts "\nFRA_PCIE_ADD_DONE"
