# =============================================================================
# add_pcie_endpoint.tcl
#
# Inserts a PCIe x1 Gen1 endpoint (axi_pcie) into the existing system_bd and
# splits its 8 KB BAR0 across two AXI4-Lite slaves:
#
#   BAR0 + 0x0000  pcie_bar_regs  identity / scratch, in the PCIe clock domain
#   BAR0 + 0x1000  fra_core       the measurement core, shared with the PS
#
# Topology:
#
#   PS M_AXI_GP0 (50 MHz) -----> axi_smc.S00 --+
#                                              +--> axi_smc.M00 -> fra_core
#   pcie_smc.M01 (50 MHz) -----> axi_smc.S01 --+
#
#   axi_pcie.M_AXI (62.5 MHz) -> pcie_smc.S00
#        pcie_smc.M00 (62.5 MHz) -> pcie_bar_regs
#        pcie_smc.M01 (50 MHz)   -> axi_smc.S01   (pcie_smc does the CDC)
#
# pcie_bar_regs deliberately stays in the PCIe clock/reset domain so the host
# can always read the identity registers even if the PS is held in reset. Host
# access to fra_core does depend on the PS being up, which is unavoidable --
# fra_core is clocked by FCLK_CLK0.
#
# The PS-side path to fra_core (M_AXI_GP0 -> axi_smc -> 0x43C0_0000) keeps its
# address and behaviour, so the UART firmware is unaffected.
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

# --- IP upgrade -------------------------------------------------------------
# A newer Vivado locks IP that was customised by an older one, and a locked
# block rejects set_property. Upgrade in place before touching anything; this
# is a no-op when the catalog already matches.
set locked [get_bd_cells -quiet -filter {IS_LOCKED}]
if {[llength $locked] > 0} {
    puts "Upgrading [llength $locked] locked BD cell(s): $locked"
    upgrade_bd_cells $locked
}
set stale_ips [get_ips -quiet -filter {UPGRADE_VERSIONS != ""}]
if {[llength $stale_ips] > 0} {
    puts "Upgrading [llength $stale_ips] project IP(s)"
    upgrade_ip $stale_ips
}

# --- idempotency: tear down any prior PCIe additions ------------------------
foreach inet {pcie_*} {
    foreach n [get_bd_intf_nets -quiet $inet] { delete_bd_objs -quiet $n }
}
foreach cell {pcie_smc proc_sys_reset_pcie pcie_bar_regs_0 pcie_refclk_buf axi_pcie_0} {
    set c [get_bd_cells -quiet $cell]
    if {[llength $c] > 0} { delete_bd_objs -quiet $c }
}
# Deleting pcie_smc takes its net to axi_smc/S01_AXI with it; shrink axi_smc
# back to a single slave port so a re-run starts from the known-good topology.
set_property CONFIG.NUM_SI {1} [get_bd_cells axi_smc]
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

# Two masters: pcie_bar_regs in the PCIe clock domain, and a crossing into the
# PS clock domain for fra_core. NUM_CLKS 2 makes pcie_smc do the CDC.
set smc [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 pcie_smc]
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {2} CONFIG.NUM_CLKS {2}] $smc

# Widen the existing PS-side SmartConnect to accept the PCIe master as well.
set_property CONFIG.NUM_SI {2} [get_bd_cells axi_smc]

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
# aclk1 is the far side of the crossing: the PS fabric clock that fra_core and
# axi_smc run on.
connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins pcie_smc/aclk1]
connect_bd_net [get_bd_pins axi_pcie_0/mmcm_lock]    [get_bd_pins proc_sys_reset_pcie/dcm_locked]
connect_bd_net [get_bd_pins proc_sys_reset_pcie/peripheral_aresetn] [get_bd_pins pcie_smc/aresetn]
connect_bd_net [get_bd_pins proc_sys_reset_pcie/peripheral_aresetn] [get_bd_pins pcie_bar_regs_0/S_AXI_ARESETN]

# --- data path: BAR0 (M_AXI) -> SmartConnect -> register file + fra_core ----
connect_bd_intf_net [get_bd_intf_pins axi_pcie_0/M_AXI]  [get_bd_intf_pins pcie_smc/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins pcie_smc/M00_AXI]  [get_bd_intf_pins pcie_bar_regs_0/S_AXI]
connect_bd_intf_net [get_bd_intf_pins pcie_smc/M01_AXI]  [get_bd_intf_pins axi_smc/S01_AXI]

# --- addressing -------------------------------------------------------------
# In the PCIe master's space the two slaves must land inside the 8 KB BAR0
# window: pcie_bar_regs at +0x0000 and fra_core at +0x1000, 4 KB each. The PS
# space keeps fra_core at 0x43C0_0000 exactly as before.
assign_bd_address

set pcie_space [get_bd_addr_spaces axi_pcie_0/M_AXI]
foreach seg [get_bd_addr_segs -quiet -of_objects $pcie_space] {
    if {[string match "*pcie_bar_regs_0*" $seg]} {
        set_property range  4K         $seg
        set_property offset 0x00000000 $seg
    } elseif {[string match "*fra_core_0*" $seg]} {
        set_property range  4K         $seg
        set_property offset 0x00001000 $seg
    }
}

# The PS must not gain a path it did not have before; fra_core stays put.
foreach seg [get_bd_addr_segs -quiet -of_objects \
                 [get_bd_addr_spaces processing_system7_0/Data]] {
    if {[string match "*fra_core_0*" $seg]} {
        set_property offset 0x43C00000 $seg
    }
}

puts "\n#### ADDRESS MAP ####"
foreach space {axi_pcie_0/M_AXI processing_system7_0/Data} {
    puts "  space $space:"
    foreach seg [get_bd_addr_segs -quiet -of_objects [get_bd_addr_spaces $space]] {
        puts [format "    %-46s offset %s range %s" \
                  [get_property NAME $seg] \
                  [get_property offset $seg] [get_property range $seg]]
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
