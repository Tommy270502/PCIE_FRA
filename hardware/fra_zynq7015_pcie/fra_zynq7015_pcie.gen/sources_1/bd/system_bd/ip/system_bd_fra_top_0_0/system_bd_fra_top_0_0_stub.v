// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Mar 19 18:43:52 2026
// Host        : DESKTOP-QGTME97 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Thomas/Documents/git/PCIE_FRA/hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.gen/sources_1/bd/system_bd/ip/system_bd_fra_top_0_0/system_bd_fra_top_0_0_stub.v
// Design      : system_bd_fra_top_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z015clg485-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "system_bd_fra_top_0_0,fra_top,{}" *) (* CORE_GENERATION_INFO = "system_bd_fra_top_0_0,fra_top,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fra_top,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "fra_top,Vivado 2025.1" *) 
module system_bd_fra_top_0_0(reset_n, clk, adc_in, sample_out, adc_clk_out, 
  dac_out, dac_clk_out, phase_inc, phase_ofst, amplitude, enable)
/* synthesis syn_black_box black_box_pad_pin="reset_n,adc_in[7:0],sample_out[7:0],dac_out[7:0],phase_inc[31:0],phase_ofst[31:0],amplitude[7:0],enable" */
/* synthesis syn_force_seq_prim="clk" */
/* synthesis syn_force_seq_prim="adc_clk_out" */
/* synthesis syn_force_seq_prim="dac_clk_out" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset_n RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  input [7:0]adc_in;
  output [7:0]sample_out;
  output adc_clk_out /* synthesis syn_isclock = 1 */;
  output [7:0]dac_out;
  output dac_clk_out /* synthesis syn_isclock = 1 */;
  input [31:0]phase_inc;
  input [31:0]phase_ofst;
  input [7:0]amplitude;
  input enable;
endmodule
