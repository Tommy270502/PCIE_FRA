-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Thu Mar 19 13:14:26 2026
-- Host        : ThinkpadT14s running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/thomas/Documents/git/PCIE_FRA/hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.gen/sources_1/bd/system_bd/ip/system_bd_fra_top_0_0/system_bd_fra_top_0_0_stub.vhdl
-- Design      : system_bd_fra_top_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z015clg485-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_bd_fra_top_0_0 is
  Port ( 
    reset_n : in STD_LOGIC;
    clk : in STD_LOGIC;
    adc_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    adc_clk_out : out STD_LOGIC;
    dac_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dac_clk_out : out STD_LOGIC;
    phase_inc : in STD_LOGIC_VECTOR ( 31 downto 0 );
    phase_ofst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    amplitude : in STD_LOGIC_VECTOR ( 7 downto 0 );
    enable : in STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_bd_fra_top_0_0 : entity is "system_bd_fra_top_0_0,fra_top,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of system_bd_fra_top_0_0 : entity is "system_bd_fra_top_0_0,fra_top,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fra_top,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_bd_fra_top_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_bd_fra_top_0_0 : entity is "module_ref";
end system_bd_fra_top_0_0;

architecture stub of system_bd_fra_top_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "reset_n,clk,adc_in[7:0],adc_clk_out,dac_out[7:0],dac_clk_out,phase_inc[31:0],phase_ofst[31:0],amplitude[7:0],enable";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of reset_n : signal is "xilinx.com:signal:reset:1.0 reset_n RST";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of reset_n : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of reset_n : signal is "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "fra_top,Vivado 2025.1";
begin
end;
