## =============================================================================
## pcie_pins.xdc  --  PCIe x1 endpoint physical constraints (AX7015B / xc7z015clg485-2)
##
## Stage 0 of the PCIe bring-up. Additive to constraints.xdc; does not touch the
## ADC/DAC/fra_core pins. Port names here MUST match the external ports created by
## scripts/add_pcie_endpoint.tcl.
##
## Device facts confirmed from the Vivado device DB (link_design -part), 2026-06-07:
##   - Hard block PCIE_2_1 present at site PCIE_X0Y0  (=> Path A, Xilinx 7-series IP)
##   - GT quad is 112 (NOT 115 as the brief assumed); single GTPE2_COMMON_X0Y0
##   - PCIe lane 0 (W4/Y4/W8/Y8) -> GTPE2_CHANNEL_X0Y1
##   - PCIe lane 1 (AA3/AB3/AA7/AB7) -> GTPE2_CHANNEL_X0Y0
##   - MGTREFCLK0 on U9/V9 -> GTPE2_COMMON_X0Y0
##
## Stage 1 brings up Gen1 x1 on lane 0 only. Placing the single serial pair on the
## board's lane-0 pins (W4/Y4 TX, W8/Y8 RX) implicitly selects GTPE2_CHANNEL_X0Y1,
## so the lane0/lane1 channel-order reversal (a concern at x2) does not apply at x1.
## =============================================================================

## ---------------------------------------------------------------------------
## 100 MHz PCIe reference clock (MGTREFCLK0, quad 112).  IBUFDS_GTE2 is inside
## the axi_pcie core (shared_logic_in_core=true), so the diff pair feeds it
## directly.  No IOSTANDARD on dedicated MGT refclk pins.
## ---------------------------------------------------------------------------
set_property PACKAGE_PIN U9 [get_ports pcie_refclk_p]
set_property PACKAGE_PIN V9 [get_ports pcie_refclk_n]
create_clock -period 10.000 -name pcie_refclk [get_ports pcie_refclk_p]

## ---------------------------------------------------------------------------
## Serial lane 0 -> GTPE2_CHANNEL_X0Y1.  Locating the package pins selects the
## GT channel; no IOSTANDARD on dedicated MGT pins.
##   TX0_P=W4 (MGTPTXP1_112)  TX0_N=Y4 (MGTPTXN1_112)
##   RX0_P=W8 (MGTPRXP1_112)  RX0_N=Y8 (MGTPRXN1_112)
## ---------------------------------------------------------------------------
set_property PACKAGE_PIN W4 [get_ports {pcie_txp[0]}]
set_property PACKAGE_PIN Y4 [get_ports {pcie_txn[0]}]
set_property PACKAGE_PIN W8 [get_ports {pcie_rxp[0]}]
set_property PACKAGE_PIN Y8 [get_ports {pcie_rxn[0]}]

## ---------------------------------------------------------------------------
## PERST# -- active-low PCIe fundamental reset from the host connector.
## Package pin M6 = IO_L4N_T0_34 (schematic net B34_L4_N, N-side of bank-34 pair L4).
##
## IOSTANDARD = LVCMOS33 (NOT LVCMOS25 as the bring-up brief assumed):
##   * Bank 34 VCCO is fixed at 3.3 V by the existing DAC pins (constraints.xdc
##     constrains P2/P3/R7/P7/P8/N8/R2 in bank 34 as LVCMOS33). A 7-series bank
##     has one VCCO, so LVCMOS25 here would be a DRC bank-VCCO conflict.
##   * PCIe PERST# is 3.3 V signaling per the PCIe CEM spec, so LVCMOS33 is correct.
## PULLUP keeps the input defined if the host de-asserts / the line floats.
## ---------------------------------------------------------------------------
set_property PACKAGE_PIN M6 [get_ports pcie_perst_n]
set_property IOSTANDARD LVCMOS33 [get_ports pcie_perst_n]
set_property PULLUP true [get_ports pcie_perst_n]

## PERST# is asynchronous to all internal clocks; the axi_pcie core resynchronises it.
set_false_path -from [get_ports pcie_perst_n]
