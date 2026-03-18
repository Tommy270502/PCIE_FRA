# AX7015B (ALINX) Zynq-7015 (XC7Z015-2CLG485) - Example Vivado XDC
# Notes:
# - Bank13 and Bank35 VCCIO are 3.3V; Bank34 VCCIO is 2.5V (per board power table).
# - User LEDs on this board are active-low (drive '0' to turn ON).
# Source: AX7015B User Manual. fileciteturn2file8 fileciteturn2file0 fileciteturn3file0 fileciteturn2file7 fileciteturn2file4

###############################################################################
# PL system clock (SoM board)
###############################################################################
set_property -dict { PACKAGE_PIN Y14 IOSTANDARD LVCMOS33 } [get_ports { pl_gclk }]
create_clock -name pl_gclk -period 8.000 [get_ports { pl_gclk }] ; # 125 MHz

###############################################################################
# User LEDs (SoM + Expansion board)
###############################################################################
# SoM PL LED (User LED2 on core board)
set_property -dict { PACKAGE_PIN T16 IOSTANDARD LVCMOS33 } [get_ports { pl_led_som }]

# Expansion board PL LEDs (LED1..LED4)
set_property -dict { PACKAGE_PIN A5 IOSTANDARD LVCMOS33 } [get_ports { pl_led1 }]
set_property -dict { PACKAGE_PIN A7 IOSTANDARD LVCMOS33 } [get_ports { pl_led2 }]
set_property -dict { PACKAGE_PIN A6 IOSTANDARD LVCMOS33 } [get_ports { pl_led3 }]
set_property -dict { PACKAGE_PIN B8 IOSTANDARD LVCMOS33 } [get_ports { pl_led4 }]

###############################################################################
# User button (Expansion board)
###############################################################################
# Active-low when pressed
set_property -dict { PACKAGE_PIN AB12 IOSTANDARD LVCMOS33 PULLUP true } [get_ports { pl_key_n }]

###############################################################################
# Gigabit Ethernet PHY on PL side (JL2121, RGMII) - Bank35
###############################################################################
set_property -dict { PACKAGE_PIN D1 IOSTANDARD LVCMOS33 } [get_ports { phy2_txck }]
set_property -dict { PACKAGE_PIN F2 IOSTANDARD LVCMOS33 } [get_ports { phy2_txd[0] }]
set_property -dict { PACKAGE_PIN F1 IOSTANDARD LVCMOS33 } [get_ports { phy2_txd[1] }]
set_property -dict { PACKAGE_PIN E2 IOSTANDARD LVCMOS33 } [get_ports { phy2_txd[2] }]
set_property -dict { PACKAGE_PIN D2 IOSTANDARD LVCMOS33 } [get_ports { phy2_txd[3] }]
set_property -dict { PACKAGE_PIN C1 IOSTANDARD LVCMOS33 } [get_ports { phy2_txctl }]

set_property -dict { PACKAGE_PIN B4 IOSTANDARD LVCMOS33 } [get_ports { phy2_rxck }]
set_property -dict { PACKAGE_PIN A2 IOSTANDARD LVCMOS33 } [get_ports { phy2_rxd[0] }]
set_property -dict { PACKAGE_PIN A1 IOSTANDARD LVCMOS33 } [get_ports { phy2_rxd[1] }]
set_property -dict { PACKAGE_PIN B2 IOSTANDARD LVCMOS33 } [get_ports { phy2_rxd[2] }]
set_property -dict { PACKAGE_PIN B1 IOSTANDARD LVCMOS33 } [get_ports { phy2_rxd[3] }]
set_property -dict { PACKAGE_PIN B3 IOSTANDARD LVCMOS33 } [get_ports { phy2_rxctl }]

# MDIO management + PHY reset
set_property -dict { PACKAGE_PIN C8 IOSTANDARD LVCMOS33 } [get_ports { phy2_mdc }]
set_property -dict { PACKAGE_PIN B8 IOSTANDARD LVCMOS33 PULLUP true } [get_ports { phy2_mdio }]
set_property -dict { PACKAGE_PIN B7 IOSTANDARD LVCMOS33 } [get_ports { phy2_reset_n }]

###############################################################################
# HDMI output (SIL9134 encoder) - Bank35 video + Bank34 audio/control
###############################################################################
# Video timing
set_property -dict { PACKAGE_PIN H1 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_clk }]
set_property -dict { PACKAGE_PIN E4 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_hs }]
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_vs }]
set_property -dict { PACKAGE_PIN G2 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_de }]

# Video data [23:0]
set_property -dict { PACKAGE_PIN G3 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[0] }]
set_property -dict { PACKAGE_PIN H3 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[1] }]
set_property -dict { PACKAGE_PIN H4 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[2] }]
set_property -dict { PACKAGE_PIN G7 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[3] }]
set_property -dict { PACKAGE_PIN G8 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[4] }]
set_property -dict { PACKAGE_PIN G1 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[5] }]
set_property -dict { PACKAGE_PIN H5 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[6] }]
set_property -dict { PACKAGE_PIN H6 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[7] }]
set_property -dict { PACKAGE_PIN G4 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[8] }]
set_property -dict { PACKAGE_PIN F4 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[9] }]
set_property -dict { PACKAGE_PIN F5 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[10] }]
set_property -dict { PACKAGE_PIN E5 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[11] }]
set_property -dict { PACKAGE_PIN G6 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[12] }]
set_property -dict { PACKAGE_PIN F6 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[13] }]
set_property -dict { PACKAGE_PIN E7 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[14] }]
set_property -dict { PACKAGE_PIN F7 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[15] }]
set_property -dict { PACKAGE_PIN D3 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[16] }]
set_property -dict { PACKAGE_PIN C3 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[17] }]
set_property -dict { PACKAGE_PIN C4 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[18] }]
set_property -dict { PACKAGE_PIN D5 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[19] }]
set_property -dict { PACKAGE_PIN C5 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[20] }]
set_property -dict { PACKAGE_PIN C6 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[21] }]
set_property -dict { PACKAGE_PIN E8 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[22] }]
set_property -dict { PACKAGE_PIN D8 IOSTANDARD LVCMOS33 } [get_ports { hdmi9134_d[23] }]

# Audio / control (Bank34, 2.5V)
set_property -dict { PACKAGE_PIN J6 IOSTANDARD LVCMOS25 } [get_ports { hdmi9134_sck }]
set_property -dict { PACKAGE_PIN N3 IOSTANDARD LVCMOS25 } [get_ports { hdmi9134_spdif }]
set_property -dict { PACKAGE_PIN N4 IOSTANDARD LVCMOS25 } [get_ports { hdmi9134_mclk }]
set_property -dict { PACKAGE_PIN J7 IOSTANDARD LVCMOS25 } [get_ports { hdmi9134_ws }]
set_property -dict { PACKAGE_PIN N5 IOSTANDARD LVCMOS25 } [get_ports { hdmi9134_sd0 }]
set_property -dict { PACKAGE_PIN N6 IOSTANDARD LVCMOS25 } [get_ports { hdmi9134_sd1 }]
set_property -dict { PACKAGE_PIN T1 IOSTANDARD LVCMOS25 } [get_ports { hdmi9134_sd2 }]
set_property -dict { PACKAGE_PIN T2 IOSTANDARD LVCMOS25 } [get_ports { hdmi9134_sd3 }]
set_property -dict { PACKAGE_PIN L4 IOSTANDARD LVCMOS25 } [get_ports { hdmi9134_reset_n }]
set_property -dict { PACKAGE_PIN L5 IOSTANDARD LVCMOS25 } [get_ports { hdmi9134_int }]

###############################################################################
# HDMI input (SIL9013 decoder) - Bank13 video + Bank34 control
###############################################################################
# Reset (Bank34, 2.5V)
set_property -dict { PACKAGE_PIN P1 IOSTANDARD LVCMOS25 } [get_ports { hdmi9013_reset_n }]

# Pixel clock and syncs (Bank13, 3.3V)
set_property -dict { PACKAGE_PIN AA16 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_clk }]
set_property -dict { PACKAGE_PIN U19 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_hs }]
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_vs }]
set_property -dict { PACKAGE_PIN V19 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_de }]

# Video data [23:0] (Bank13, 3.3V)
set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[0] }]
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[1] }]
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[2] }]
set_property -dict { PACKAGE_PIN AA17 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[3] }]
set_property -dict { PACKAGE_PIN Y19 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[4] }]
set_property -dict { PACKAGE_PIN Y18 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[5] }]
set_property -dict { PACKAGE_PIN AA15 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[6] }]
set_property -dict { PACKAGE_PIN AA14 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[7] }]
set_property -dict { PACKAGE_PIN AB16 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[8] }]
set_property -dict { PACKAGE_PIN AB17 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[9] }]
set_property -dict { PACKAGE_PIN AB19 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[10] }]
set_property -dict { PACKAGE_PIN AB18 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[11] }]
set_property -dict { PACKAGE_PIN Y15 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[12] }]
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[13] }]
set_property -dict { PACKAGE_PIN V14 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[14] }]
set_property -dict { PACKAGE_PIN V13 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[15] }]
set_property -dict { PACKAGE_PIN AB11 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[16] }]
set_property -dict { PACKAGE_PIN AA11 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[17] }]
set_property -dict { PACKAGE_PIN V11 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[18] }]
set_property -dict { PACKAGE_PIN W11 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[19] }]
set_property -dict { PACKAGE_PIN W12 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[20] }]
set_property -dict { PACKAGE_PIN W13 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[21] }]
set_property -dict { PACKAGE_PIN U12 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[22] }]
set_property -dict { PACKAGE_PIN U11 IOSTANDARD LVCMOS33 } [get_ports { hdmi9013_d[23] }]

###############################################################################
# Shared HDMI I2C (Bank34, 2.5V) - used by SIL9134 and SIL9013
###############################################################################
set_property -dict { PACKAGE_PIN J8 IOSTANDARD LVCMOS25 PULLUP true } [get_ports { hdmi_scl }]
set_property -dict { PACKAGE_PIN K8 IOSTANDARD LVCMOS25 PULLUP true } [get_ports { hdmi_sda }]

###############################################################################
# 40-pin Expansion Header J12 (34 user IOs, 3.3V)
###############################################################################
# Rename these ports to match your top-level. Suggested naming: j12_io[0..33]
set_property -dict { PACKAGE_PIN M1  IOSTANDARD LVCMOS33 } [get_ports { j12_io[0]  }]
set_property -dict { PACKAGE_PIN M2  IOSTANDARD LVCMOS33 } [get_ports { j12_io[1]  }]
set_property -dict { PACKAGE_PIN Y13 IOSTANDARD LVCMOS33 } [get_ports { j12_io[2]  }]
set_property -dict { PACKAGE_PIN Y12 IOSTANDARD LVCMOS33 } [get_ports { j12_io[3]  }]
set_property -dict { PACKAGE_PIN P2  IOSTANDARD LVCMOS33 } [get_ports { j12_io[4]  }]
set_property -dict { PACKAGE_PIN P3  IOSTANDARD LVCMOS33 } [get_ports { j12_io[5]  }]
set_property -dict { PACKAGE_PIN R7  IOSTANDARD LVCMOS33 } [get_ports { j12_io[6]  }]
set_property -dict { PACKAGE_PIN P7  IOSTANDARD LVCMOS33 } [get_ports { j12_io[7]  }]
set_property -dict { PACKAGE_PIN P8  IOSTANDARD LVCMOS33 } [get_ports { j12_io[8]  }]
set_property -dict { PACKAGE_PIN N8  IOSTANDARD LVCMOS33 } [get_ports { j12_io[9]  }]
set_property -dict { PACKAGE_PIN R2  IOSTANDARD LVCMOS33 } [get_ports { j12_io[10] }]
set_property -dict { PACKAGE_PIN R3  IOSTANDARD LVCMOS33 } [get_ports { j12_io[11] }]
set_property -dict { PACKAGE_PIN R4  IOSTANDARD LVCMOS33 } [get_ports { j12_io[12] }]
set_property -dict { PACKAGE_PIN R5  IOSTANDARD LVCMOS33 } [get_ports { j12_io[13] }]
set_property -dict { PACKAGE_PIN M7  IOSTANDARD LVCMOS33 } [get_ports { j12_io[14] }]
set_property -dict { PACKAGE_PIN M8  IOSTANDARD LVCMOS33 } [get_ports { j12_io[15] }]
set_property -dict { PACKAGE_PIN M3  IOSTANDARD LVCMOS33 } [get_ports { j12_io[16] }]
set_property -dict { PACKAGE_PIN M4  IOSTANDARD LVCMOS33 } [get_ports { j12_io[17] }]
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33 } [get_ports { j12_io[18] }]
set_property -dict { PACKAGE_PIN U13 IOSTANDARD LVCMOS33 } [get_ports { j12_io[19] }]
set_property -dict { PACKAGE_PIN AB14 IOSTANDARD LVCMOS33 } [get_ports { j12_io[20] }]
set_property -dict { PACKAGE_PIN AB13 IOSTANDARD LVCMOS33 } [get_ports { j12_io[21] }]
set_property -dict { PACKAGE_PIN W15 IOSTANDARD LVCMOS33 } [get_ports { j12_io[22] }]
set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS33 } [get_ports { j12_io[23] }]
set_property -dict { PACKAGE_PIN Y17 IOSTANDARD LVCMOS33 } [get_ports { j12_io[24] }]
set_property -dict { PACKAGE_PIN W17 IOSTANDARD LVCMOS33 } [get_ports { j12_io[25] }]
set_property -dict { PACKAGE_PIN W18 IOSTANDARD LVCMOS33 } [get_ports { j12_io[26] }]
set_property -dict { PACKAGE_PIN V18 IOSTANDARD LVCMOS33 } [get_ports { j12_io[27] }]
set_property -dict { PACKAGE_PIN AB22 IOSTANDARD LVCMOS33 } [get_ports { j12_io[28] }]
set_property -dict { PACKAGE_PIN AB21 IOSTANDARD LVCMOS33 } [get_ports { j12_io[29] }]
set_property -dict { PACKAGE_PIN AA20 IOSTANDARD LVCMOS33 } [get_ports { j12_io[30] }]
set_property -dict { PACKAGE_PIN AA19 IOSTANDARD LVCMOS33 } [get_ports { j12_io[31] }]
set_property -dict { PACKAGE_PIN T17 IOSTANDARD LVCMOS33 } [get_ports { j12_io[32] }]
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports { j12_io[33] }]
