// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Thu Mar 19 14:47:35 2026
// Host        : ThinkpadT14s running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/thomas/Documents/git/PCIE_FRA/hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.gen/sources_1/bd/system_bd/ip/system_bd_fra_top_0_0/system_bd_fra_top_0_0_sim_netlist.v
// Design      : system_bd_fra_top_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z015clg485-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_bd_fra_top_0_0,fra_top,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "fra_top,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module system_bd_fra_top_0_0
   (reset_n,
    clk,
    adc_in,
    sample_out,
    adc_clk_out,
    dac_out,
    dac_clk_out,
    phase_inc,
    phase_ofst,
    amplitude,
    enable);
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset_n RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  input [7:0]adc_in;
  output [7:0]sample_out;
  output adc_clk_out;
  output [7:0]dac_out;
  output dac_clk_out;
  input [31:0]phase_inc;
  input [31:0]phase_ofst;
  input [7:0]amplitude;
  input enable;

  wire adc_clk_out;
  wire [7:0]adc_in;
  wire [7:0]amplitude;
  wire clk;
  wire [7:0]dac_out;
  wire enable;
  wire [31:0]phase_inc;
  wire [31:0]phase_ofst;
  wire reset_n;
  wire [7:0]sample_out;

  assign dac_clk_out = adc_clk_out;
  system_bd_fra_top_0_0_fra_top inst
       (.adc_in(adc_in),
        .amplitude(amplitude),
        .clk(clk),
        .dac_clk_out(adc_clk_out),
        .dac_out(dac_out),
        .enable(enable),
        .phase_inc(phase_inc),
        .phase_ofst(phase_ofst),
        .reset_n(reset_n),
        .sample_out(sample_out));
endmodule

(* ORIG_REF_NAME = "adc_if" *) 
module system_bd_fra_top_0_0_adc_if
   (sample_out,
    SR,
    adc_in,
    dac_clk_out);
  output [7:0]sample_out;
  input [0:0]SR;
  input [7:0]adc_in;
  input dac_clk_out;

  wire [0:0]SR;
  wire [7:0]adc_in;
  wire dac_clk_out;
  wire [7:0]sample_out;

  FDRE \sample_data_reg[0] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(adc_in[0]),
        .Q(sample_out[0]),
        .R(SR));
  FDRE \sample_data_reg[1] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(adc_in[1]),
        .Q(sample_out[1]),
        .R(SR));
  FDRE \sample_data_reg[2] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(adc_in[2]),
        .Q(sample_out[2]),
        .R(SR));
  FDRE \sample_data_reg[3] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(adc_in[3]),
        .Q(sample_out[3]),
        .R(SR));
  FDRE \sample_data_reg[4] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(adc_in[4]),
        .Q(sample_out[4]),
        .R(SR));
  FDRE \sample_data_reg[5] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(adc_in[5]),
        .Q(sample_out[5]),
        .R(SR));
  FDRE \sample_data_reg[6] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(adc_in[6]),
        .Q(sample_out[6]),
        .R(SR));
  FDRE \sample_data_reg[7] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(adc_in[7]),
        .Q(sample_out[7]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "clk_div_2" *) 
module system_bd_fra_top_0_0_clk_div_2
   (dac_clk_out,
    clk);
  output dac_clk_out;
  input clk;

  wire clk;
  wire dac_clk_out;
  wire p_0_in;

  LUT1 #(
    .INIT(2'h1)) 
    clk_div_i_1
       (.I0(dac_clk_out),
        .O(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    clk_div_reg
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(dac_clk_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "dac_if" *) 
module system_bd_fra_top_0_0_dac_if
   (dac_out,
    SR,
    Q,
    dac_clk_out);
  output [7:0]dac_out;
  input [0:0]SR;
  input [7:0]Q;
  input dac_clk_out;

  wire [7:0]Q;
  wire [0:0]SR;
  wire dac_clk_out;
  wire [7:0]dac_out;

  FDSE \dac_data_reg[0] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(Q[0]),
        .Q(dac_out[0]),
        .S(SR));
  FDSE \dac_data_reg[1] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(Q[1]),
        .Q(dac_out[1]),
        .S(SR));
  FDSE \dac_data_reg[2] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(Q[2]),
        .Q(dac_out[2]),
        .S(SR));
  FDSE \dac_data_reg[3] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(Q[3]),
        .Q(dac_out[3]),
        .S(SR));
  FDSE \dac_data_reg[4] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(Q[4]),
        .Q(dac_out[4]),
        .S(SR));
  FDSE \dac_data_reg[5] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(Q[5]),
        .Q(dac_out[5]),
        .S(SR));
  FDSE \dac_data_reg[6] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(Q[6]),
        .Q(dac_out[6]),
        .S(SR));
  FDRE \dac_data_reg[7] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(Q[7]),
        .Q(dac_out[7]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "dds" *) 
module system_bd_fra_top_0_0_dds
   (SS,
    Q,
    dac_clk_out,
    enable,
    amplitude,
    reset_n,
    phase_inc,
    phase_ofst);
  output [0:0]SS;
  output [7:0]Q;
  input dac_clk_out;
  input enable;
  input [7:0]amplitude;
  input reset_n;
  input [31:0]phase_inc;
  input [31:0]phase_ofst;

  wire [7:0]Q;
  wire [0:0]SS;
  wire \_inferred__1/i__carry__0_n_0 ;
  wire \_inferred__1/i__carry__0_n_1 ;
  wire \_inferred__1/i__carry__0_n_2 ;
  wire \_inferred__1/i__carry__0_n_3 ;
  wire \_inferred__1/i__carry__1_n_0 ;
  wire \_inferred__1/i__carry__1_n_1 ;
  wire \_inferred__1/i__carry__1_n_2 ;
  wire \_inferred__1/i__carry__1_n_3 ;
  wire \_inferred__1/i__carry__2_n_0 ;
  wire \_inferred__1/i__carry__2_n_1 ;
  wire \_inferred__1/i__carry__2_n_2 ;
  wire \_inferred__1/i__carry__2_n_3 ;
  wire \_inferred__1/i__carry_n_0 ;
  wire \_inferred__1/i__carry_n_1 ;
  wire \_inferred__1/i__carry_n_2 ;
  wire \_inferred__1/i__carry_n_3 ;
  wire \_inferred__2/i__carry__0_n_0 ;
  wire \_inferred__2/i__carry__0_n_1 ;
  wire \_inferred__2/i__carry__0_n_2 ;
  wire \_inferred__2/i__carry__0_n_3 ;
  wire \_inferred__2/i__carry__1_n_0 ;
  wire \_inferred__2/i__carry__1_n_1 ;
  wire \_inferred__2/i__carry__1_n_2 ;
  wire \_inferred__2/i__carry__1_n_3 ;
  wire \_inferred__2/i__carry__2_n_0 ;
  wire \_inferred__2/i__carry__2_n_1 ;
  wire \_inferred__2/i__carry__2_n_2 ;
  wire \_inferred__2/i__carry__2_n_3 ;
  wire \_inferred__2/i__carry_n_0 ;
  wire \_inferred__2/i__carry_n_1 ;
  wire \_inferred__2/i__carry_n_2 ;
  wire \_inferred__2/i__carry_n_3 ;
  wire [7:0]amplitude;
  wire dac_clk_out;
  wire dac_data1;
  wire \dac_data1_inferred__0/i__carry__0_n_0 ;
  wire \dac_data1_inferred__0/i__carry__0_n_1 ;
  wire \dac_data1_inferred__0/i__carry__0_n_2 ;
  wire \dac_data1_inferred__0/i__carry__0_n_3 ;
  wire \dac_data1_inferred__0/i__carry__1_n_2 ;
  wire \dac_data1_inferred__0/i__carry__1_n_3 ;
  wire \dac_data1_inferred__0/i__carry_n_0 ;
  wire \dac_data1_inferred__0/i__carry_n_1 ;
  wire \dac_data1_inferred__0/i__carry_n_2 ;
  wire \dac_data1_inferred__0/i__carry_n_3 ;
  wire dac_data2_carry__0_n_0;
  wire dac_data2_carry__0_n_1;
  wire dac_data2_carry__0_n_2;
  wire dac_data2_carry__0_n_3;
  wire dac_data2_carry__0_n_4;
  wire dac_data2_carry__0_n_5;
  wire dac_data2_carry__0_n_6;
  wire dac_data2_carry__0_n_7;
  wire dac_data2_carry__1_n_0;
  wire dac_data2_carry__1_n_1;
  wire dac_data2_carry__1_n_2;
  wire dac_data2_carry__1_n_3;
  wire dac_data2_carry__1_n_4;
  wire dac_data2_carry__1_n_5;
  wire dac_data2_carry__1_n_6;
  wire dac_data2_carry__1_n_7;
  wire dac_data2_carry__2_n_0;
  wire dac_data2_carry__2_n_1;
  wire dac_data2_carry__2_n_2;
  wire dac_data2_carry__2_n_3;
  wire dac_data2_carry__2_n_4;
  wire dac_data2_carry__2_n_5;
  wire dac_data2_carry__2_n_6;
  wire dac_data2_carry__2_n_7;
  wire dac_data2_carry__3_n_0;
  wire dac_data2_carry__3_n_1;
  wire dac_data2_carry__3_n_2;
  wire dac_data2_carry__3_n_3;
  wire dac_data2_carry__3_n_4;
  wire dac_data2_carry__3_n_5;
  wire dac_data2_carry__3_n_6;
  wire dac_data2_carry__3_n_7;
  wire dac_data2_carry__4_n_0;
  wire dac_data2_carry__4_n_1;
  wire dac_data2_carry__4_n_2;
  wire dac_data2_carry__4_n_3;
  wire dac_data2_carry__4_n_4;
  wire dac_data2_carry__4_n_5;
  wire dac_data2_carry__4_n_6;
  wire dac_data2_carry__4_n_7;
  wire dac_data2_carry__5_n_3;
  wire dac_data2_carry__5_n_6;
  wire dac_data2_carry__5_n_7;
  wire dac_data2_carry_n_0;
  wire dac_data2_carry_n_1;
  wire dac_data2_carry_n_2;
  wire dac_data2_carry_n_3;
  wire dac_data2_carry_n_4;
  wire dac_data2_carry_n_5;
  wire dac_data2_carry_n_6;
  wire dac_data2_carry_n_7;
  wire [24:6]dac_data3;
  wire [16:1]dac_data4;
  wire dac_data4__114_carry__0_i_1_n_0;
  wire dac_data4__114_carry__0_i_2_n_0;
  wire dac_data4__114_carry__0_i_3_n_0;
  wire dac_data4__114_carry__0_i_4_n_0;
  wire dac_data4__114_carry__0_n_0;
  wire dac_data4__114_carry__0_n_1;
  wire dac_data4__114_carry__0_n_2;
  wire dac_data4__114_carry__0_n_3;
  wire dac_data4__114_carry__0_n_4;
  wire dac_data4__114_carry__0_n_5;
  wire dac_data4__114_carry__0_n_6;
  wire dac_data4__114_carry__0_n_7;
  wire dac_data4__114_carry__1_i_2_n_0;
  wire dac_data4__114_carry__1_i_3_n_0;
  wire dac_data4__114_carry__1_i_4_n_0;
  wire dac_data4__114_carry__1_n_0;
  wire dac_data4__114_carry__1_n_1;
  wire dac_data4__114_carry__1_n_2;
  wire dac_data4__114_carry__1_n_3;
  wire dac_data4__114_carry__1_n_4;
  wire dac_data4__114_carry__1_n_5;
  wire dac_data4__114_carry__1_n_6;
  wire dac_data4__114_carry__1_n_7;
  wire dac_data4__114_carry__2_n_0;
  wire dac_data4__114_carry__2_n_1;
  wire dac_data4__114_carry__2_n_2;
  wire dac_data4__114_carry__2_n_3;
  wire dac_data4__114_carry__2_n_4;
  wire dac_data4__114_carry__2_n_5;
  wire dac_data4__114_carry__2_n_6;
  wire dac_data4__114_carry__2_n_7;
  wire dac_data4__114_carry__3_n_0;
  wire dac_data4__114_carry__3_n_2;
  wire dac_data4__114_carry__3_n_3;
  wire dac_data4__114_carry__3_n_5;
  wire dac_data4__114_carry__3_n_6;
  wire dac_data4__114_carry__3_n_7;
  wire dac_data4__114_carry_i_1_n_0;
  wire dac_data4__114_carry_i_2_n_0;
  wire dac_data4__114_carry_i_3_n_0;
  wire dac_data4__114_carry_n_0;
  wire dac_data4__114_carry_n_1;
  wire dac_data4__114_carry_n_2;
  wire dac_data4__114_carry_n_3;
  wire dac_data4__114_carry_n_4;
  wire dac_data4__114_carry_n_5;
  wire dac_data4__114_carry_n_6;
  wire dac_data4__171_carry__0_i_10_n_0;
  wire dac_data4__171_carry__0_i_1_n_0;
  wire dac_data4__171_carry__0_i_2_n_0;
  wire dac_data4__171_carry__0_i_3_n_0;
  wire dac_data4__171_carry__0_i_4_n_0;
  wire dac_data4__171_carry__0_i_5_n_0;
  wire dac_data4__171_carry__0_i_6_n_0;
  wire dac_data4__171_carry__0_i_7_n_0;
  wire dac_data4__171_carry__0_i_8_n_0;
  wire dac_data4__171_carry__0_i_9_n_0;
  wire dac_data4__171_carry__0_n_0;
  wire dac_data4__171_carry__0_n_1;
  wire dac_data4__171_carry__0_n_2;
  wire dac_data4__171_carry__0_n_3;
  wire dac_data4__171_carry__0_n_4;
  wire dac_data4__171_carry__0_n_5;
  wire dac_data4__171_carry__0_n_6;
  wire dac_data4__171_carry__0_n_7;
  wire dac_data4__171_carry__1_i_10_n_0;
  wire dac_data4__171_carry__1_i_11_n_0;
  wire dac_data4__171_carry__1_i_12_n_0;
  wire dac_data4__171_carry__1_i_1_n_0;
  wire dac_data4__171_carry__1_i_2_n_0;
  wire dac_data4__171_carry__1_i_3_n_0;
  wire dac_data4__171_carry__1_i_4_n_0;
  wire dac_data4__171_carry__1_i_5_n_0;
  wire dac_data4__171_carry__1_i_6_n_0;
  wire dac_data4__171_carry__1_i_7_n_0;
  wire dac_data4__171_carry__1_i_8_n_0;
  wire dac_data4__171_carry__1_i_9_n_0;
  wire dac_data4__171_carry__1_n_0;
  wire dac_data4__171_carry__1_n_1;
  wire dac_data4__171_carry__1_n_2;
  wire dac_data4__171_carry__1_n_3;
  wire dac_data4__171_carry__1_n_4;
  wire dac_data4__171_carry__1_n_5;
  wire dac_data4__171_carry__1_n_6;
  wire dac_data4__171_carry__1_n_7;
  wire dac_data4__171_carry__2_i_11_n_0;
  wire dac_data4__171_carry__2_i_3_n_0;
  wire dac_data4__171_carry__2_i_4_n_0;
  wire dac_data4__171_carry__2_i_8_n_0;
  wire dac_data4__171_carry__2_n_0;
  wire dac_data4__171_carry__2_n_1;
  wire dac_data4__171_carry__2_n_2;
  wire dac_data4__171_carry__2_n_3;
  wire dac_data4__171_carry__2_n_4;
  wire dac_data4__171_carry__2_n_5;
  wire dac_data4__171_carry__2_n_6;
  wire dac_data4__171_carry__2_n_7;
  wire dac_data4__171_carry__3_n_0;
  wire dac_data4__171_carry__3_n_1;
  wire dac_data4__171_carry__3_n_2;
  wire dac_data4__171_carry__3_n_3;
  wire dac_data4__171_carry__3_n_4;
  wire dac_data4__171_carry__3_n_5;
  wire dac_data4__171_carry__3_n_6;
  wire dac_data4__171_carry__3_n_7;
  wire dac_data4__171_carry__4_n_0;
  wire dac_data4__171_carry__4_n_1;
  wire dac_data4__171_carry__4_n_2;
  wire dac_data4__171_carry__4_n_3;
  wire dac_data4__171_carry__4_n_4;
  wire dac_data4__171_carry__4_n_5;
  wire dac_data4__171_carry__4_n_6;
  wire dac_data4__171_carry__4_n_7;
  wire dac_data4__171_carry__5_n_1;
  wire dac_data4__171_carry__5_n_2;
  wire dac_data4__171_carry__5_n_3;
  wire dac_data4__171_carry__5_n_4;
  wire dac_data4__171_carry__5_n_5;
  wire dac_data4__171_carry__5_n_6;
  wire dac_data4__171_carry__5_n_7;
  wire dac_data4__171_carry_i_1_n_0;
  wire dac_data4__171_carry_i_2_n_0;
  wire dac_data4__171_carry_i_3_n_0;
  wire dac_data4__171_carry_i_4_n_0;
  wire dac_data4__171_carry_i_5_n_0;
  wire dac_data4__171_carry_n_0;
  wire dac_data4__171_carry_n_1;
  wire dac_data4__171_carry_n_2;
  wire dac_data4__171_carry_n_3;
  wire dac_data4__171_carry_n_4;
  wire dac_data4__171_carry_n_5;
  wire dac_data4__171_carry_n_6;
  wire dac_data4__171_carry_n_7;
  wire dac_data4__254_carry__0_i_10_n_0;
  wire dac_data4__254_carry__0_i_11_n_0;
  wire dac_data4__254_carry__0_i_5_n_0;
  wire dac_data4__254_carry__0_i_6_n_0;
  wire dac_data4__254_carry__0_i_7_n_0;
  wire dac_data4__254_carry__0_i_8_n_0;
  wire dac_data4__254_carry__0_i_9_n_0;
  wire dac_data4__254_carry__0_n_0;
  wire dac_data4__254_carry__0_n_1;
  wire dac_data4__254_carry__0_n_2;
  wire dac_data4__254_carry__0_n_3;
  wire dac_data4__254_carry__1_i_5_n_0;
  wire dac_data4__254_carry__1_i_6_n_0;
  wire dac_data4__254_carry__1_i_7_n_0;
  wire dac_data4__254_carry__1_i_8_n_0;
  wire dac_data4__254_carry__1_n_0;
  wire dac_data4__254_carry__1_n_1;
  wire dac_data4__254_carry__1_n_2;
  wire dac_data4__254_carry__1_n_3;
  wire dac_data4__254_carry__2_i_8_n_0;
  wire dac_data4__254_carry__2_n_0;
  wire dac_data4__254_carry__2_n_1;
  wire dac_data4__254_carry__2_n_2;
  wire dac_data4__254_carry__2_n_3;
  wire dac_data4__254_carry__3_n_0;
  wire dac_data4__254_carry__3_n_1;
  wire dac_data4__254_carry__3_n_2;
  wire dac_data4__254_carry__3_n_3;
  wire dac_data4__254_carry__4_n_0;
  wire dac_data4__254_carry__4_n_1;
  wire dac_data4__254_carry__4_n_2;
  wire dac_data4__254_carry__4_n_3;
  wire dac_data4__254_carry__5_n_0;
  wire dac_data4__254_carry__5_n_1;
  wire dac_data4__254_carry__5_n_2;
  wire dac_data4__254_carry__5_n_3;
  wire dac_data4__254_carry__6_n_1;
  wire dac_data4__254_carry__6_n_2;
  wire dac_data4__254_carry__6_n_3;
  wire dac_data4__254_carry_i_3_n_0;
  wire dac_data4__254_carry_i_4_n_0;
  wire dac_data4__254_carry_i_5_n_0;
  wire dac_data4__254_carry_i_6_n_0;
  wire dac_data4__254_carry_i_7_n_0;
  wire dac_data4__254_carry_i_8_n_0;
  wire dac_data4__254_carry_i_9_n_0;
  wire dac_data4__254_carry_n_0;
  wire dac_data4__254_carry_n_1;
  wire dac_data4__254_carry_n_2;
  wire dac_data4__254_carry_n_3;
  wire dac_data4__315_carry__0_n_0;
  wire dac_data4__315_carry__0_n_1;
  wire dac_data4__315_carry__0_n_2;
  wire dac_data4__315_carry__0_n_3;
  wire dac_data4__315_carry__0_n_4;
  wire dac_data4__315_carry__0_n_5;
  wire dac_data4__315_carry__0_n_6;
  wire dac_data4__315_carry__0_n_7;
  wire dac_data4__315_carry__1_n_0;
  wire dac_data4__315_carry__1_n_1;
  wire dac_data4__315_carry__1_n_2;
  wire dac_data4__315_carry__1_n_3;
  wire dac_data4__315_carry__1_n_4;
  wire dac_data4__315_carry__1_n_5;
  wire dac_data4__315_carry__1_n_6;
  wire dac_data4__315_carry__1_n_7;
  wire dac_data4__315_carry__2_n_0;
  wire dac_data4__315_carry__2_n_1;
  wire dac_data4__315_carry__2_n_2;
  wire dac_data4__315_carry__2_n_3;
  wire dac_data4__315_carry__2_n_4;
  wire dac_data4__315_carry__2_n_5;
  wire dac_data4__315_carry__2_n_6;
  wire dac_data4__315_carry__2_n_7;
  wire dac_data4__315_carry_i_1_n_0;
  wire dac_data4__315_carry_n_0;
  wire dac_data4__315_carry_n_1;
  wire dac_data4__315_carry_n_2;
  wire dac_data4__315_carry_n_3;
  wire dac_data4__315_carry_n_4;
  wire dac_data4__315_carry_n_5;
  wire dac_data4__315_carry_n_6;
  wire dac_data4__315_carry_n_7;
  wire dac_data4__72_carry__0_i_1_n_0;
  wire dac_data4__72_carry__0_i_2_n_0;
  wire dac_data4__72_carry__0_i_3_n_0;
  wire dac_data4__72_carry__0_i_4_n_0;
  wire dac_data4__72_carry__0_n_0;
  wire dac_data4__72_carry__0_n_1;
  wire dac_data4__72_carry__0_n_2;
  wire dac_data4__72_carry__0_n_3;
  wire dac_data4__72_carry__0_n_4;
  wire dac_data4__72_carry__0_n_5;
  wire dac_data4__72_carry__0_n_6;
  wire dac_data4__72_carry__0_n_7;
  wire dac_data4__72_carry__1_i_2_n_0;
  wire dac_data4__72_carry__1_i_3_n_0;
  wire dac_data4__72_carry__1_i_4_n_0;
  wire dac_data4__72_carry__1_n_0;
  wire dac_data4__72_carry__1_n_1;
  wire dac_data4__72_carry__1_n_2;
  wire dac_data4__72_carry__1_n_3;
  wire dac_data4__72_carry__1_n_4;
  wire dac_data4__72_carry__1_n_5;
  wire dac_data4__72_carry__1_n_6;
  wire dac_data4__72_carry__1_n_7;
  wire dac_data4__72_carry__2_n_0;
  wire dac_data4__72_carry__2_n_1;
  wire dac_data4__72_carry__2_n_2;
  wire dac_data4__72_carry__2_n_3;
  wire dac_data4__72_carry__2_n_4;
  wire dac_data4__72_carry__2_n_5;
  wire dac_data4__72_carry__2_n_6;
  wire dac_data4__72_carry__2_n_7;
  wire dac_data4__72_carry__3_n_0;
  wire dac_data4__72_carry__3_n_2;
  wire dac_data4__72_carry__3_n_3;
  wire dac_data4__72_carry__3_n_5;
  wire dac_data4__72_carry__3_n_6;
  wire dac_data4__72_carry__3_n_7;
  wire dac_data4__72_carry_i_1_n_0;
  wire dac_data4__72_carry_i_2_n_0;
  wire dac_data4__72_carry_i_3_n_0;
  wire dac_data4__72_carry_n_0;
  wire dac_data4__72_carry_n_1;
  wire dac_data4__72_carry_n_2;
  wire dac_data4__72_carry_n_3;
  wire dac_data4__72_carry_n_4;
  wire dac_data4__72_carry_n_5;
  wire dac_data4__72_carry_n_6;
  wire dac_data4__72_carry_n_7;
  wire dac_data4__8_carry__0_i_3_n_0;
  wire dac_data4__8_carry__0_i_4_n_0;
  wire dac_data4__8_carry__0_i_7_n_0;
  wire dac_data4__8_carry__0_i_8_n_0;
  wire dac_data4__8_carry__0_n_0;
  wire dac_data4__8_carry__0_n_1;
  wire dac_data4__8_carry__0_n_2;
  wire dac_data4__8_carry__0_n_3;
  wire dac_data4__8_carry__1_i_10_n_0;
  wire dac_data4__8_carry__1_i_11_n_0;
  wire dac_data4__8_carry__1_i_12_n_0;
  wire dac_data4__8_carry__1_i_13_n_0;
  wire dac_data4__8_carry__1_i_5_n_0;
  wire dac_data4__8_carry__1_i_6_n_0;
  wire dac_data4__8_carry__1_n_0;
  wire dac_data4__8_carry__1_n_1;
  wire dac_data4__8_carry__1_n_2;
  wire dac_data4__8_carry__1_n_3;
  wire dac_data4__8_carry__2_i_11_n_0;
  wire dac_data4__8_carry__2_i_13_n_0;
  wire dac_data4__8_carry__2_i_14_n_0;
  wire dac_data4__8_carry__2_i_15_n_0;
  wire dac_data4__8_carry__2_i_16_n_0;
  wire dac_data4__8_carry__2_i_7_n_0;
  wire dac_data4__8_carry__2_i_8_n_0;
  wire dac_data4__8_carry__2_n_0;
  wire dac_data4__8_carry__2_n_1;
  wire dac_data4__8_carry__2_n_2;
  wire dac_data4__8_carry__2_n_3;
  wire dac_data4__8_carry__3_i_10_n_0;
  wire dac_data4__8_carry__3_n_0;
  wire dac_data4__8_carry__3_n_1;
  wire dac_data4__8_carry__3_n_2;
  wire dac_data4__8_carry__3_n_3;
  wire dac_data4__8_carry__3_n_4;
  wire dac_data4__8_carry__3_n_5;
  wire dac_data4__8_carry__3_n_6;
  wire dac_data4__8_carry__4_n_0;
  wire dac_data4__8_carry__4_n_1;
  wire dac_data4__8_carry__4_n_2;
  wire dac_data4__8_carry__4_n_3;
  wire dac_data4__8_carry__4_n_4;
  wire dac_data4__8_carry__4_n_5;
  wire dac_data4__8_carry__4_n_6;
  wire dac_data4__8_carry__4_n_7;
  wire dac_data4__8_carry__5_n_0;
  wire dac_data4__8_carry__5_n_1;
  wire dac_data4__8_carry__5_n_2;
  wire dac_data4__8_carry__5_n_3;
  wire dac_data4__8_carry__5_n_4;
  wire dac_data4__8_carry__5_n_5;
  wire dac_data4__8_carry__5_n_6;
  wire dac_data4__8_carry__5_n_7;
  wire dac_data4__8_carry__6_n_0;
  wire dac_data4__8_carry__6_n_1;
  wire dac_data4__8_carry__6_n_2;
  wire dac_data4__8_carry__6_n_3;
  wire dac_data4__8_carry__6_n_4;
  wire dac_data4__8_carry__6_n_5;
  wire dac_data4__8_carry__6_n_6;
  wire dac_data4__8_carry__6_n_7;
  wire dac_data4__8_carry_i_1_n_0;
  wire dac_data4__8_carry_i_2_n_0;
  wire dac_data4__8_carry_i_3_n_0;
  wire dac_data4__8_carry_i_4_n_0;
  wire dac_data4__8_carry_i_5_n_0;
  wire dac_data4__8_carry_i_7_n_0;
  wire dac_data4__8_carry_n_0;
  wire dac_data4__8_carry_n_1;
  wire dac_data4__8_carry_n_2;
  wire dac_data4__8_carry_n_3;
  wire [16:1]dac_data6;
  wire dac_data6__0_carry__0_n_0;
  wire dac_data6__0_carry__0_n_1;
  wire dac_data6__0_carry__0_n_2;
  wire dac_data6__0_carry__0_n_3;
  wire dac_data6__0_carry__0_n_4;
  wire dac_data6__0_carry__0_n_5;
  wire dac_data6__0_carry__0_n_6;
  wire dac_data6__0_carry__0_n_7;
  wire dac_data6__0_carry__1_n_1;
  wire dac_data6__0_carry__1_n_3;
  wire dac_data6__0_carry__1_n_6;
  wire dac_data6__0_carry__1_n_7;
  wire dac_data6__0_carry_n_0;
  wire dac_data6__0_carry_n_1;
  wire dac_data6__0_carry_n_2;
  wire dac_data6__0_carry_n_3;
  wire dac_data6__0_carry_n_4;
  wire dac_data6__0_carry_n_5;
  wire dac_data6__0_carry_n_6;
  wire dac_data6__0_carry_n_7;
  wire dac_data6__30_carry__0_n_0;
  wire dac_data6__30_carry__0_n_1;
  wire dac_data6__30_carry__0_n_2;
  wire dac_data6__30_carry__0_n_3;
  wire dac_data6__30_carry__0_n_4;
  wire dac_data6__30_carry__0_n_5;
  wire dac_data6__30_carry__0_n_6;
  wire dac_data6__30_carry__0_n_7;
  wire dac_data6__30_carry__1_n_1;
  wire dac_data6__30_carry__1_n_3;
  wire dac_data6__30_carry__1_n_6;
  wire dac_data6__30_carry__1_n_7;
  wire dac_data6__30_carry_n_0;
  wire dac_data6__30_carry_n_1;
  wire dac_data6__30_carry_n_2;
  wire dac_data6__30_carry_n_3;
  wire dac_data6__30_carry_n_4;
  wire dac_data6__30_carry_n_5;
  wire dac_data6__30_carry_n_6;
  wire dac_data6__30_carry_n_7;
  wire dac_data6__59_carry__0_n_0;
  wire dac_data6__59_carry__0_n_1;
  wire dac_data6__59_carry__0_n_2;
  wire dac_data6__59_carry__0_n_3;
  wire dac_data6__59_carry__0_n_4;
  wire dac_data6__59_carry__0_n_5;
  wire dac_data6__59_carry__0_n_6;
  wire dac_data6__59_carry__0_n_7;
  wire dac_data6__59_carry__1_n_2;
  wire dac_data6__59_carry__1_n_3;
  wire dac_data6__59_carry__1_n_5;
  wire dac_data6__59_carry__1_n_6;
  wire dac_data6__59_carry__1_n_7;
  wire dac_data6__59_carry_n_0;
  wire dac_data6__59_carry_n_1;
  wire dac_data6__59_carry_n_2;
  wire dac_data6__59_carry_n_3;
  wire dac_data6__59_carry_n_4;
  wire dac_data6__59_carry_n_5;
  wire dac_data6__59_carry_n_6;
  wire dac_data6__59_carry_n_7;
  wire dac_data6__90_carry__0_i_4_n_0;
  wire dac_data6__90_carry__0_i_8_n_0;
  wire dac_data6__90_carry__0_n_0;
  wire dac_data6__90_carry__0_n_1;
  wire dac_data6__90_carry__0_n_2;
  wire dac_data6__90_carry__0_n_3;
  wire dac_data6__90_carry__0_n_4;
  wire dac_data6__90_carry__0_n_5;
  wire dac_data6__90_carry__0_n_6;
  wire dac_data6__90_carry__0_n_7;
  wire dac_data6__90_carry__1_n_0;
  wire dac_data6__90_carry__1_n_1;
  wire dac_data6__90_carry__1_n_2;
  wire dac_data6__90_carry__1_n_3;
  wire dac_data6__90_carry__1_n_4;
  wire dac_data6__90_carry__1_n_5;
  wire dac_data6__90_carry__1_n_6;
  wire dac_data6__90_carry__1_n_7;
  wire dac_data6__90_carry__2_n_3;
  wire dac_data6__90_carry__2_n_6;
  wire dac_data6__90_carry__2_n_7;
  wire dac_data6__90_carry_i_1_n_0;
  wire dac_data6__90_carry_i_2_n_0;
  wire dac_data6__90_carry_i_3_n_0;
  wire dac_data6__90_carry_i_4_n_0;
  wire dac_data6__90_carry_i_5_n_0;
  wire dac_data6__90_carry_i_6_n_0;
  wire dac_data6__90_carry_i_7_n_0;
  wire dac_data6__90_carry_n_0;
  wire dac_data6__90_carry_n_1;
  wire dac_data6__90_carry_n_2;
  wire dac_data6__90_carry_n_3;
  wire dac_data6__90_carry_n_4;
  wire dac_data6__90_carry_n_5;
  wire dac_data6__90_carry_n_6;
  wire dac_data6__90_carry_n_7;
  wire enable;
  wire i__carry__0_i_1__0_n_0;
  wire i__carry__0_i_2__0_n_0;
  wire i__carry__0_i_3__0_n_0;
  wire i__carry__0_i_4__0_n_0;
  wire i__carry__0_i_5_n_0;
  wire i__carry__0_i_6_n_0;
  wire i__carry__0_i_7_n_0;
  wire i__carry__0_i_8_n_0;
  wire i__carry__1_i_2__0_n_0;
  wire i__carry__1_i_3__0_n_0;
  wire i__carry__1_i_5_n_0;
  wire i__carry__1_i_6_n_0;
  wire i__carry_i_1__1_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_4__0_n_0;
  wire i__carry_i_5__0_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8_n_0;
  wire i__carry_i_9_n_0;
  wire [16:0]p_0_out;
  wire [7:0]p_1_in;
  wire \phase_acc[0]_i_2_n_0 ;
  wire \phase_acc[0]_i_3_n_0 ;
  wire \phase_acc[0]_i_4_n_0 ;
  wire \phase_acc[0]_i_5_n_0 ;
  wire \phase_acc[12]_i_2_n_0 ;
  wire \phase_acc[12]_i_3_n_0 ;
  wire \phase_acc[12]_i_4_n_0 ;
  wire \phase_acc[12]_i_5_n_0 ;
  wire \phase_acc[16]_i_2_n_0 ;
  wire \phase_acc[16]_i_3_n_0 ;
  wire \phase_acc[16]_i_4_n_0 ;
  wire \phase_acc[16]_i_5_n_0 ;
  wire \phase_acc[20]_i_2_n_0 ;
  wire \phase_acc[20]_i_3_n_0 ;
  wire \phase_acc[20]_i_4_n_0 ;
  wire \phase_acc[20]_i_5_n_0 ;
  wire \phase_acc[24]_i_2_n_0 ;
  wire \phase_acc[24]_i_3_n_0 ;
  wire \phase_acc[24]_i_4_n_0 ;
  wire \phase_acc[24]_i_5_n_0 ;
  wire \phase_acc[28]_i_2_n_0 ;
  wire \phase_acc[28]_i_3_n_0 ;
  wire \phase_acc[28]_i_4_n_0 ;
  wire \phase_acc[28]_i_5_n_0 ;
  wire \phase_acc[4]_i_2_n_0 ;
  wire \phase_acc[4]_i_3_n_0 ;
  wire \phase_acc[4]_i_4_n_0 ;
  wire \phase_acc[4]_i_5_n_0 ;
  wire \phase_acc[8]_i_2_n_0 ;
  wire \phase_acc[8]_i_3_n_0 ;
  wire \phase_acc[8]_i_4_n_0 ;
  wire \phase_acc[8]_i_5_n_0 ;
  wire [31:0]phase_acc_reg;
  wire \phase_acc_reg[0]_i_1_n_0 ;
  wire \phase_acc_reg[0]_i_1_n_1 ;
  wire \phase_acc_reg[0]_i_1_n_2 ;
  wire \phase_acc_reg[0]_i_1_n_3 ;
  wire \phase_acc_reg[0]_i_1_n_4 ;
  wire \phase_acc_reg[0]_i_1_n_5 ;
  wire \phase_acc_reg[0]_i_1_n_6 ;
  wire \phase_acc_reg[0]_i_1_n_7 ;
  wire \phase_acc_reg[12]_i_1_n_0 ;
  wire \phase_acc_reg[12]_i_1_n_1 ;
  wire \phase_acc_reg[12]_i_1_n_2 ;
  wire \phase_acc_reg[12]_i_1_n_3 ;
  wire \phase_acc_reg[12]_i_1_n_4 ;
  wire \phase_acc_reg[12]_i_1_n_5 ;
  wire \phase_acc_reg[12]_i_1_n_6 ;
  wire \phase_acc_reg[12]_i_1_n_7 ;
  wire \phase_acc_reg[16]_i_1_n_0 ;
  wire \phase_acc_reg[16]_i_1_n_1 ;
  wire \phase_acc_reg[16]_i_1_n_2 ;
  wire \phase_acc_reg[16]_i_1_n_3 ;
  wire \phase_acc_reg[16]_i_1_n_4 ;
  wire \phase_acc_reg[16]_i_1_n_5 ;
  wire \phase_acc_reg[16]_i_1_n_6 ;
  wire \phase_acc_reg[16]_i_1_n_7 ;
  wire \phase_acc_reg[20]_i_1_n_0 ;
  wire \phase_acc_reg[20]_i_1_n_1 ;
  wire \phase_acc_reg[20]_i_1_n_2 ;
  wire \phase_acc_reg[20]_i_1_n_3 ;
  wire \phase_acc_reg[20]_i_1_n_4 ;
  wire \phase_acc_reg[20]_i_1_n_5 ;
  wire \phase_acc_reg[20]_i_1_n_6 ;
  wire \phase_acc_reg[20]_i_1_n_7 ;
  wire \phase_acc_reg[24]_i_1_n_0 ;
  wire \phase_acc_reg[24]_i_1_n_1 ;
  wire \phase_acc_reg[24]_i_1_n_2 ;
  wire \phase_acc_reg[24]_i_1_n_3 ;
  wire \phase_acc_reg[24]_i_1_n_4 ;
  wire \phase_acc_reg[24]_i_1_n_5 ;
  wire \phase_acc_reg[24]_i_1_n_6 ;
  wire \phase_acc_reg[24]_i_1_n_7 ;
  wire \phase_acc_reg[28]_i_1_n_1 ;
  wire \phase_acc_reg[28]_i_1_n_2 ;
  wire \phase_acc_reg[28]_i_1_n_3 ;
  wire \phase_acc_reg[28]_i_1_n_4 ;
  wire \phase_acc_reg[28]_i_1_n_5 ;
  wire \phase_acc_reg[28]_i_1_n_6 ;
  wire \phase_acc_reg[28]_i_1_n_7 ;
  wire \phase_acc_reg[4]_i_1_n_0 ;
  wire \phase_acc_reg[4]_i_1_n_1 ;
  wire \phase_acc_reg[4]_i_1_n_2 ;
  wire \phase_acc_reg[4]_i_1_n_3 ;
  wire \phase_acc_reg[4]_i_1_n_4 ;
  wire \phase_acc_reg[4]_i_1_n_5 ;
  wire \phase_acc_reg[4]_i_1_n_6 ;
  wire \phase_acc_reg[4]_i_1_n_7 ;
  wire \phase_acc_reg[8]_i_1_n_0 ;
  wire \phase_acc_reg[8]_i_1_n_1 ;
  wire \phase_acc_reg[8]_i_1_n_2 ;
  wire \phase_acc_reg[8]_i_1_n_3 ;
  wire \phase_acc_reg[8]_i_1_n_4 ;
  wire \phase_acc_reg[8]_i_1_n_5 ;
  wire \phase_acc_reg[8]_i_1_n_6 ;
  wire \phase_acc_reg[8]_i_1_n_7 ;
  wire [31:0]phase_inc;
  wire [31:0]phase_ofst;
  wire phase_sum_carry__0_i_1_n_0;
  wire phase_sum_carry__0_i_2_n_0;
  wire phase_sum_carry__0_i_3_n_0;
  wire phase_sum_carry__0_i_4_n_0;
  wire phase_sum_carry__0_n_0;
  wire phase_sum_carry__0_n_1;
  wire phase_sum_carry__0_n_2;
  wire phase_sum_carry__0_n_3;
  wire phase_sum_carry__1_i_1_n_0;
  wire phase_sum_carry__1_i_2_n_0;
  wire phase_sum_carry__1_i_3_n_0;
  wire phase_sum_carry__1_i_4_n_0;
  wire phase_sum_carry__1_n_0;
  wire phase_sum_carry__1_n_1;
  wire phase_sum_carry__1_n_2;
  wire phase_sum_carry__1_n_3;
  wire phase_sum_carry__2_i_1_n_0;
  wire phase_sum_carry__2_i_2_n_0;
  wire phase_sum_carry__2_i_3_n_0;
  wire phase_sum_carry__2_i_4_n_0;
  wire phase_sum_carry__2_n_0;
  wire phase_sum_carry__2_n_1;
  wire phase_sum_carry__2_n_2;
  wire phase_sum_carry__2_n_3;
  wire phase_sum_carry__3_i_1_n_0;
  wire phase_sum_carry__3_i_2_n_0;
  wire phase_sum_carry__3_i_3_n_0;
  wire phase_sum_carry__3_i_4_n_0;
  wire phase_sum_carry__3_n_0;
  wire phase_sum_carry__3_n_1;
  wire phase_sum_carry__3_n_2;
  wire phase_sum_carry__3_n_3;
  wire phase_sum_carry__4_i_1_n_0;
  wire phase_sum_carry__4_i_2_n_0;
  wire phase_sum_carry__4_i_3_n_0;
  wire phase_sum_carry__4_i_4_n_0;
  wire phase_sum_carry__4_n_0;
  wire phase_sum_carry__4_n_1;
  wire phase_sum_carry__4_n_2;
  wire phase_sum_carry__4_n_3;
  wire phase_sum_carry__5_i_1_n_0;
  wire phase_sum_carry__5_i_2_n_0;
  wire phase_sum_carry__5_i_3_n_0;
  wire phase_sum_carry__5_i_4_n_0;
  wire phase_sum_carry__5_n_0;
  wire phase_sum_carry__5_n_1;
  wire phase_sum_carry__5_n_2;
  wire phase_sum_carry__5_n_3;
  wire phase_sum_carry__6_n_1;
  wire phase_sum_carry__6_n_2;
  wire phase_sum_carry__6_n_3;
  wire phase_sum_carry_i_1_n_0;
  wire phase_sum_carry_i_2_n_0;
  wire phase_sum_carry_i_3_n_0;
  wire phase_sum_carry_i_4_n_0;
  wire phase_sum_carry_n_0;
  wire phase_sum_carry_n_1;
  wire phase_sum_carry_n_2;
  wire phase_sum_carry_n_3;
  wire reset_n;
  wire [7:0]sel;
  wire sine_rom_inst_n_0;
  wire sine_rom_inst_n_1;
  wire sine_rom_inst_n_10;
  wire sine_rom_inst_n_100;
  wire sine_rom_inst_n_101;
  wire sine_rom_inst_n_102;
  wire sine_rom_inst_n_103;
  wire sine_rom_inst_n_104;
  wire sine_rom_inst_n_105;
  wire sine_rom_inst_n_106;
  wire sine_rom_inst_n_107;
  wire sine_rom_inst_n_108;
  wire sine_rom_inst_n_109;
  wire sine_rom_inst_n_11;
  wire sine_rom_inst_n_110;
  wire sine_rom_inst_n_111;
  wire sine_rom_inst_n_112;
  wire sine_rom_inst_n_113;
  wire sine_rom_inst_n_12;
  wire sine_rom_inst_n_122;
  wire sine_rom_inst_n_123;
  wire sine_rom_inst_n_124;
  wire sine_rom_inst_n_125;
  wire sine_rom_inst_n_126;
  wire sine_rom_inst_n_127;
  wire sine_rom_inst_n_128;
  wire sine_rom_inst_n_129;
  wire sine_rom_inst_n_13;
  wire sine_rom_inst_n_130;
  wire sine_rom_inst_n_131;
  wire sine_rom_inst_n_132;
  wire sine_rom_inst_n_133;
  wire sine_rom_inst_n_134;
  wire sine_rom_inst_n_14;
  wire sine_rom_inst_n_149;
  wire sine_rom_inst_n_15;
  wire sine_rom_inst_n_150;
  wire sine_rom_inst_n_151;
  wire sine_rom_inst_n_152;
  wire sine_rom_inst_n_153;
  wire sine_rom_inst_n_154;
  wire sine_rom_inst_n_155;
  wire sine_rom_inst_n_156;
  wire sine_rom_inst_n_157;
  wire sine_rom_inst_n_158;
  wire sine_rom_inst_n_159;
  wire sine_rom_inst_n_16;
  wire sine_rom_inst_n_160;
  wire sine_rom_inst_n_161;
  wire sine_rom_inst_n_162;
  wire sine_rom_inst_n_163;
  wire sine_rom_inst_n_164;
  wire sine_rom_inst_n_165;
  wire sine_rom_inst_n_166;
  wire sine_rom_inst_n_167;
  wire sine_rom_inst_n_168;
  wire sine_rom_inst_n_169;
  wire sine_rom_inst_n_17;
  wire sine_rom_inst_n_170;
  wire sine_rom_inst_n_171;
  wire sine_rom_inst_n_172;
  wire sine_rom_inst_n_173;
  wire sine_rom_inst_n_174;
  wire sine_rom_inst_n_175;
  wire sine_rom_inst_n_176;
  wire sine_rom_inst_n_177;
  wire sine_rom_inst_n_178;
  wire sine_rom_inst_n_179;
  wire sine_rom_inst_n_18;
  wire sine_rom_inst_n_180;
  wire sine_rom_inst_n_181;
  wire sine_rom_inst_n_184;
  wire sine_rom_inst_n_185;
  wire sine_rom_inst_n_186;
  wire sine_rom_inst_n_187;
  wire sine_rom_inst_n_188;
  wire sine_rom_inst_n_189;
  wire sine_rom_inst_n_19;
  wire sine_rom_inst_n_190;
  wire sine_rom_inst_n_191;
  wire sine_rom_inst_n_192;
  wire sine_rom_inst_n_193;
  wire sine_rom_inst_n_194;
  wire sine_rom_inst_n_195;
  wire sine_rom_inst_n_196;
  wire sine_rom_inst_n_197;
  wire sine_rom_inst_n_198;
  wire sine_rom_inst_n_199;
  wire sine_rom_inst_n_2;
  wire sine_rom_inst_n_20;
  wire sine_rom_inst_n_200;
  wire sine_rom_inst_n_201;
  wire sine_rom_inst_n_202;
  wire sine_rom_inst_n_203;
  wire sine_rom_inst_n_204;
  wire sine_rom_inst_n_205;
  wire sine_rom_inst_n_206;
  wire sine_rom_inst_n_207;
  wire sine_rom_inst_n_208;
  wire sine_rom_inst_n_209;
  wire sine_rom_inst_n_21;
  wire sine_rom_inst_n_210;
  wire sine_rom_inst_n_211;
  wire sine_rom_inst_n_212;
  wire sine_rom_inst_n_213;
  wire sine_rom_inst_n_214;
  wire sine_rom_inst_n_215;
  wire sine_rom_inst_n_216;
  wire sine_rom_inst_n_217;
  wire sine_rom_inst_n_218;
  wire sine_rom_inst_n_219;
  wire sine_rom_inst_n_22;
  wire sine_rom_inst_n_220;
  wire sine_rom_inst_n_221;
  wire sine_rom_inst_n_222;
  wire sine_rom_inst_n_223;
  wire sine_rom_inst_n_224;
  wire sine_rom_inst_n_225;
  wire sine_rom_inst_n_226;
  wire sine_rom_inst_n_227;
  wire sine_rom_inst_n_228;
  wire sine_rom_inst_n_229;
  wire sine_rom_inst_n_23;
  wire sine_rom_inst_n_230;
  wire sine_rom_inst_n_231;
  wire sine_rom_inst_n_232;
  wire sine_rom_inst_n_233;
  wire sine_rom_inst_n_234;
  wire sine_rom_inst_n_235;
  wire sine_rom_inst_n_236;
  wire sine_rom_inst_n_237;
  wire sine_rom_inst_n_238;
  wire sine_rom_inst_n_239;
  wire sine_rom_inst_n_24;
  wire sine_rom_inst_n_240;
  wire sine_rom_inst_n_241;
  wire sine_rom_inst_n_242;
  wire sine_rom_inst_n_243;
  wire sine_rom_inst_n_244;
  wire sine_rom_inst_n_245;
  wire sine_rom_inst_n_246;
  wire sine_rom_inst_n_247;
  wire sine_rom_inst_n_248;
  wire sine_rom_inst_n_249;
  wire sine_rom_inst_n_25;
  wire sine_rom_inst_n_250;
  wire sine_rom_inst_n_251;
  wire sine_rom_inst_n_252;
  wire sine_rom_inst_n_253;
  wire sine_rom_inst_n_254;
  wire sine_rom_inst_n_255;
  wire sine_rom_inst_n_256;
  wire sine_rom_inst_n_257;
  wire sine_rom_inst_n_258;
  wire sine_rom_inst_n_259;
  wire sine_rom_inst_n_26;
  wire sine_rom_inst_n_260;
  wire sine_rom_inst_n_261;
  wire sine_rom_inst_n_262;
  wire sine_rom_inst_n_263;
  wire sine_rom_inst_n_264;
  wire sine_rom_inst_n_265;
  wire sine_rom_inst_n_266;
  wire sine_rom_inst_n_267;
  wire sine_rom_inst_n_268;
  wire sine_rom_inst_n_269;
  wire sine_rom_inst_n_27;
  wire sine_rom_inst_n_270;
  wire sine_rom_inst_n_271;
  wire sine_rom_inst_n_272;
  wire sine_rom_inst_n_273;
  wire sine_rom_inst_n_28;
  wire sine_rom_inst_n_29;
  wire sine_rom_inst_n_3;
  wire sine_rom_inst_n_30;
  wire sine_rom_inst_n_31;
  wire sine_rom_inst_n_32;
  wire sine_rom_inst_n_33;
  wire sine_rom_inst_n_34;
  wire sine_rom_inst_n_35;
  wire sine_rom_inst_n_36;
  wire sine_rom_inst_n_37;
  wire sine_rom_inst_n_38;
  wire sine_rom_inst_n_39;
  wire sine_rom_inst_n_4;
  wire sine_rom_inst_n_40;
  wire sine_rom_inst_n_41;
  wire sine_rom_inst_n_42;
  wire sine_rom_inst_n_43;
  wire sine_rom_inst_n_44;
  wire sine_rom_inst_n_45;
  wire sine_rom_inst_n_46;
  wire sine_rom_inst_n_47;
  wire sine_rom_inst_n_48;
  wire sine_rom_inst_n_49;
  wire sine_rom_inst_n_5;
  wire sine_rom_inst_n_50;
  wire sine_rom_inst_n_51;
  wire sine_rom_inst_n_52;
  wire sine_rom_inst_n_53;
  wire sine_rom_inst_n_54;
  wire sine_rom_inst_n_55;
  wire sine_rom_inst_n_56;
  wire sine_rom_inst_n_57;
  wire sine_rom_inst_n_58;
  wire sine_rom_inst_n_59;
  wire sine_rom_inst_n_6;
  wire sine_rom_inst_n_60;
  wire sine_rom_inst_n_61;
  wire sine_rom_inst_n_62;
  wire sine_rom_inst_n_63;
  wire sine_rom_inst_n_64;
  wire sine_rom_inst_n_65;
  wire sine_rom_inst_n_66;
  wire sine_rom_inst_n_67;
  wire sine_rom_inst_n_68;
  wire sine_rom_inst_n_69;
  wire sine_rom_inst_n_7;
  wire sine_rom_inst_n_70;
  wire sine_rom_inst_n_71;
  wire sine_rom_inst_n_72;
  wire sine_rom_inst_n_73;
  wire sine_rom_inst_n_74;
  wire sine_rom_inst_n_75;
  wire sine_rom_inst_n_76;
  wire sine_rom_inst_n_77;
  wire sine_rom_inst_n_78;
  wire sine_rom_inst_n_79;
  wire sine_rom_inst_n_8;
  wire sine_rom_inst_n_80;
  wire sine_rom_inst_n_81;
  wire sine_rom_inst_n_82;
  wire sine_rom_inst_n_83;
  wire sine_rom_inst_n_84;
  wire sine_rom_inst_n_85;
  wire sine_rom_inst_n_86;
  wire sine_rom_inst_n_87;
  wire sine_rom_inst_n_88;
  wire sine_rom_inst_n_89;
  wire sine_rom_inst_n_9;
  wire sine_rom_inst_n_90;
  wire sine_rom_inst_n_91;
  wire sine_rom_inst_n_92;
  wire sine_rom_inst_n_93;
  wire sine_rom_inst_n_94;
  wire sine_rom_inst_n_95;
  wire sine_rom_inst_n_96;
  wire sine_rom_inst_n_97;
  wire sine_rom_inst_n_98;
  wire sine_rom_inst_n_99;
  wire [3:0]\NLW_dac_data1_inferred__0/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW_dac_data1_inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [3:3]\NLW_dac_data1_inferred__0/i__carry__1_CO_UNCONNECTED ;
  wire [3:0]\NLW_dac_data1_inferred__0/i__carry__1_O_UNCONNECTED ;
  wire [3:1]NLW_dac_data2_carry__5_CO_UNCONNECTED;
  wire [3:2]NLW_dac_data2_carry__5_O_UNCONNECTED;
  wire [0:0]NLW_dac_data4__114_carry_O_UNCONNECTED;
  wire [2:2]NLW_dac_data4__114_carry__3_CO_UNCONNECTED;
  wire [3:3]NLW_dac_data4__114_carry__3_O_UNCONNECTED;
  wire [3:3]NLW_dac_data4__171_carry__5_CO_UNCONNECTED;
  wire [3:0]NLW_dac_data4__254_carry_O_UNCONNECTED;
  wire [3:0]NLW_dac_data4__254_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_dac_data4__254_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_dac_data4__254_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_dac_data4__254_carry__3_O_UNCONNECTED;
  wire [3:0]NLW_dac_data4__254_carry__4_O_UNCONNECTED;
  wire [3:0]NLW_dac_data4__254_carry__5_O_UNCONNECTED;
  wire [3:3]NLW_dac_data4__254_carry__6_CO_UNCONNECTED;
  wire [3:0]NLW_dac_data4__254_carry__6_O_UNCONNECTED;
  wire [2:2]NLW_dac_data4__72_carry__3_CO_UNCONNECTED;
  wire [3:3]NLW_dac_data4__72_carry__3_O_UNCONNECTED;
  wire [3:0]NLW_dac_data4__8_carry_O_UNCONNECTED;
  wire [3:0]NLW_dac_data4__8_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_dac_data4__8_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_dac_data4__8_carry__2_O_UNCONNECTED;
  wire [0:0]NLW_dac_data4__8_carry__3_O_UNCONNECTED;
  wire [3:1]NLW_dac_data6__0_carry__1_CO_UNCONNECTED;
  wire [3:2]NLW_dac_data6__0_carry__1_O_UNCONNECTED;
  wire [3:1]NLW_dac_data6__30_carry__1_CO_UNCONNECTED;
  wire [3:2]NLW_dac_data6__30_carry__1_O_UNCONNECTED;
  wire [3:2]NLW_dac_data6__59_carry__1_CO_UNCONNECTED;
  wire [3:3]NLW_dac_data6__59_carry__1_O_UNCONNECTED;
  wire [3:1]NLW_dac_data6__90_carry__2_CO_UNCONNECTED;
  wire [3:2]NLW_dac_data6__90_carry__2_O_UNCONNECTED;
  wire [3:3]\NLW_phase_acc_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_phase_sum_carry_O_UNCONNECTED;
  wire [3:0]NLW_phase_sum_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_phase_sum_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_phase_sum_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_phase_sum_carry__3_O_UNCONNECTED;
  wire [3:0]NLW_phase_sum_carry__4_O_UNCONNECTED;
  wire [3:3]NLW_phase_sum_carry__6_CO_UNCONNECTED;

  CARRY4 \_inferred__1/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__1/i__carry_n_0 ,\_inferred__1/i__carry_n_1 ,\_inferred__1/i__carry_n_2 ,\_inferred__1/i__carry_n_3 }),
        .CYINIT(p_0_out[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(dac_data6[4:1]),
        .S(p_0_out[4:1]));
  CARRY4 \_inferred__1/i__carry__0 
       (.CI(\_inferred__1/i__carry_n_0 ),
        .CO({\_inferred__1/i__carry__0_n_0 ,\_inferred__1/i__carry__0_n_1 ,\_inferred__1/i__carry__0_n_2 ,\_inferred__1/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(dac_data6[8:5]),
        .S(p_0_out[8:5]));
  CARRY4 \_inferred__1/i__carry__1 
       (.CI(\_inferred__1/i__carry__0_n_0 ),
        .CO({\_inferred__1/i__carry__1_n_0 ,\_inferred__1/i__carry__1_n_1 ,\_inferred__1/i__carry__1_n_2 ,\_inferred__1/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(dac_data6[12:9]),
        .S(p_0_out[12:9]));
  CARRY4 \_inferred__1/i__carry__2 
       (.CI(\_inferred__1/i__carry__1_n_0 ),
        .CO({\_inferred__1/i__carry__2_n_0 ,\_inferred__1/i__carry__2_n_1 ,\_inferred__1/i__carry__2_n_2 ,\_inferred__1/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b0,1'b0,1'b0}),
        .O(dac_data6[16:13]),
        .S(p_0_out[16:13]));
  CARRY4 \_inferred__2/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__2/i__carry_n_0 ,\_inferred__2/i__carry_n_1 ,\_inferred__2/i__carry_n_2 ,\_inferred__2/i__carry_n_3 }),
        .CYINIT(sine_rom_inst_n_122),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(dac_data4[4:1]),
        .S({sine_rom_inst_n_123,sine_rom_inst_n_124,sine_rom_inst_n_125,sine_rom_inst_n_126}));
  CARRY4 \_inferred__2/i__carry__0 
       (.CI(\_inferred__2/i__carry_n_0 ),
        .CO({\_inferred__2/i__carry__0_n_0 ,\_inferred__2/i__carry__0_n_1 ,\_inferred__2/i__carry__0_n_2 ,\_inferred__2/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(dac_data4[8:5]),
        .S({sine_rom_inst_n_127,sine_rom_inst_n_128,sine_rom_inst_n_129,sine_rom_inst_n_130}));
  CARRY4 \_inferred__2/i__carry__1 
       (.CI(\_inferred__2/i__carry__0_n_0 ),
        .CO({\_inferred__2/i__carry__1_n_0 ,\_inferred__2/i__carry__1_n_1 ,\_inferred__2/i__carry__1_n_2 ,\_inferred__2/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(dac_data4[12:9]),
        .S({sine_rom_inst_n_149,sine_rom_inst_n_150,sine_rom_inst_n_151,sine_rom_inst_n_152}));
  CARRY4 \_inferred__2/i__carry__2 
       (.CI(\_inferred__2/i__carry__1_n_0 ),
        .CO({\_inferred__2/i__carry__2_n_0 ,\_inferred__2/i__carry__2_n_1 ,\_inferred__2/i__carry__2_n_2 ,\_inferred__2/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(dac_data4[16:13]),
        .S({sine_rom_inst_n_131,sine_rom_inst_n_132,sine_rom_inst_n_133,sine_rom_inst_n_134}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \dac_data1_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\dac_data1_inferred__0/i__carry_n_0 ,\dac_data1_inferred__0/i__carry_n_1 ,\dac_data1_inferred__0/i__carry_n_2 ,\dac_data1_inferred__0/i__carry_n_3 }),
        .CYINIT(i__carry_i_1__1_n_0),
        .DI({i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4__0_n_0,i__carry_i_5__0_n_0}),
        .O(\NLW_dac_data1_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8_n_0,i__carry_i_9_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \dac_data1_inferred__0/i__carry__0 
       (.CI(\dac_data1_inferred__0/i__carry_n_0 ),
        .CO({\dac_data1_inferred__0/i__carry__0_n_0 ,\dac_data1_inferred__0/i__carry__0_n_1 ,\dac_data1_inferred__0/i__carry__0_n_2 ,\dac_data1_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__0_i_1__0_n_0,i__carry__0_i_2__0_n_0,i__carry__0_i_3__0_n_0,i__carry__0_i_4__0_n_0}),
        .O(\NLW_dac_data1_inferred__0/i__carry__0_O_UNCONNECTED [3:0]),
        .S({i__carry__0_i_5_n_0,i__carry__0_i_6_n_0,i__carry__0_i_7_n_0,i__carry__0_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \dac_data1_inferred__0/i__carry__1 
       (.CI(\dac_data1_inferred__0/i__carry__0_n_0 ),
        .CO({\NLW_dac_data1_inferred__0/i__carry__1_CO_UNCONNECTED [3],dac_data1,\dac_data1_inferred__0/i__carry__1_n_2 ,\dac_data1_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,sine_rom_inst_n_180,i__carry__1_i_2__0_n_0,i__carry__1_i_3__0_n_0}),
        .O(\NLW_dac_data1_inferred__0/i__carry__1_O_UNCONNECTED [3:0]),
        .S({1'b0,sine_rom_inst_n_181,i__carry__1_i_5_n_0,i__carry__1_i_6_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data2_carry
       (.CI(1'b0),
        .CO({dac_data2_carry_n_0,dac_data2_carry_n_1,dac_data2_carry_n_2,dac_data2_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,dac_data3[7],1'b0}),
        .O({dac_data2_carry_n_4,dac_data2_carry_n_5,dac_data2_carry_n_6,dac_data2_carry_n_7}),
        .S({dac_data3[9:8],sine_rom_inst_n_153,dac_data3[6]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data2_carry__0
       (.CI(dac_data2_carry_n_0),
        .CO({dac_data2_carry__0_n_0,dac_data2_carry__0_n_1,dac_data2_carry__0_n_2,dac_data2_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({dac_data2_carry__0_n_4,dac_data2_carry__0_n_5,dac_data2_carry__0_n_6,dac_data2_carry__0_n_7}),
        .S(dac_data3[13:10]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data2_carry__1
       (.CI(dac_data2_carry__0_n_0),
        .CO({dac_data2_carry__1_n_0,dac_data2_carry__1_n_1,dac_data2_carry__1_n_2,dac_data2_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({dac_data2_carry__1_n_4,dac_data2_carry__1_n_5,dac_data2_carry__1_n_6,dac_data2_carry__1_n_7}),
        .S({sine_rom_inst_n_202,dac_data3[16:14]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data2_carry__2
       (.CI(dac_data2_carry__1_n_0),
        .CO({dac_data2_carry__2_n_0,dac_data2_carry__2_n_1,dac_data2_carry__2_n_2,dac_data2_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({dac_data2_carry__2_n_4,dac_data2_carry__2_n_5,dac_data2_carry__2_n_6,dac_data2_carry__2_n_7}),
        .S({sine_rom_inst_n_203,sine_rom_inst_n_204,sine_rom_inst_n_205,sine_rom_inst_n_206}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data2_carry__3
       (.CI(dac_data2_carry__2_n_0),
        .CO({dac_data2_carry__3_n_0,dac_data2_carry__3_n_1,dac_data2_carry__3_n_2,dac_data2_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({dac_data2_carry__3_n_4,dac_data2_carry__3_n_5,dac_data2_carry__3_n_6,dac_data2_carry__3_n_7}),
        .S({sine_rom_inst_n_207,sine_rom_inst_n_208,dac_data3[23],dac_data3[17]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data2_carry__4
       (.CI(dac_data2_carry__3_n_0),
        .CO({dac_data2_carry__4_n_0,dac_data2_carry__4_n_1,dac_data2_carry__4_n_2,dac_data2_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({dac_data2_carry__4_n_4,dac_data2_carry__4_n_5,dac_data2_carry__4_n_6,dac_data2_carry__4_n_7}),
        .S({sine_rom_inst_n_209,sine_rom_inst_n_210,sine_rom_inst_n_211,sine_rom_inst_n_212}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data2_carry__5
       (.CI(dac_data2_carry__4_n_0),
        .CO({NLW_dac_data2_carry__5_CO_UNCONNECTED[3:1],dac_data2_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_dac_data2_carry__5_O_UNCONNECTED[3:2],dac_data2_carry__5_n_6,dac_data2_carry__5_n_7}),
        .S({1'b0,1'b0,dac_data3[24],sine_rom_inst_n_213}));
  CARRY4 dac_data4__114_carry
       (.CI(1'b0),
        .CO({dac_data4__114_carry_n_0,dac_data4__114_carry_n_1,dac_data4__114_carry_n_2,dac_data4__114_carry_n_3}),
        .CYINIT(1'b0),
        .DI({dac_data4__8_carry__3_n_6,1'b0,1'b0,1'b1}),
        .O({dac_data4__114_carry_n_4,dac_data4__114_carry_n_5,dac_data4__114_carry_n_6,NLW_dac_data4__114_carry_O_UNCONNECTED[0]}),
        .S({dac_data4__114_carry_i_1_n_0,dac_data4__114_carry_i_2_n_0,dac_data4__114_carry_i_3_n_0,dac_data4__8_carry__3_n_6}));
  CARRY4 dac_data4__114_carry__0
       (.CI(dac_data4__114_carry_n_0),
        .CO({dac_data4__114_carry__0_n_0,dac_data4__114_carry__0_n_1,dac_data4__114_carry__0_n_2,dac_data4__114_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({dac_data4__8_carry__4_n_6,dac_data4__8_carry__4_n_7,dac_data4__8_carry__3_n_4,dac_data4__8_carry__3_n_5}),
        .O({dac_data4__114_carry__0_n_4,dac_data4__114_carry__0_n_5,dac_data4__114_carry__0_n_6,dac_data4__114_carry__0_n_7}),
        .S({dac_data4__114_carry__0_i_1_n_0,dac_data4__114_carry__0_i_2_n_0,dac_data4__114_carry__0_i_3_n_0,dac_data4__114_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__114_carry__0_i_1
       (.I0(dac_data4__8_carry__4_n_6),
        .I1(dac_data4__8_carry__5_n_7),
        .O(dac_data4__114_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__114_carry__0_i_2
       (.I0(dac_data4__8_carry__4_n_7),
        .I1(dac_data4__8_carry__4_n_4),
        .O(dac_data4__114_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__114_carry__0_i_3
       (.I0(dac_data4__8_carry__3_n_4),
        .I1(dac_data4__8_carry__4_n_5),
        .O(dac_data4__114_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__114_carry__0_i_4
       (.I0(dac_data4__8_carry__3_n_5),
        .I1(dac_data4__8_carry__4_n_6),
        .O(dac_data4__114_carry__0_i_4_n_0));
  CARRY4 dac_data4__114_carry__1
       (.CI(dac_data4__114_carry__0_n_0),
        .CO({dac_data4__114_carry__1_n_0,dac_data4__114_carry__1_n_1,dac_data4__114_carry__1_n_2,dac_data4__114_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({dac_data4__8_carry__5_n_6,dac_data4__8_carry__5_n_7,dac_data4__8_carry__4_n_4,dac_data4__8_carry__4_n_5}),
        .O({dac_data4__114_carry__1_n_4,dac_data4__114_carry__1_n_5,dac_data4__114_carry__1_n_6,dac_data4__114_carry__1_n_7}),
        .S({sine_rom_inst_n_17,dac_data4__114_carry__1_i_2_n_0,dac_data4__114_carry__1_i_3_n_0,dac_data4__114_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__114_carry__1_i_2
       (.I0(dac_data4__8_carry__5_n_7),
        .I1(dac_data4__8_carry__5_n_4),
        .O(dac_data4__114_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__114_carry__1_i_3
       (.I0(dac_data4__8_carry__4_n_4),
        .I1(dac_data4__8_carry__5_n_5),
        .O(dac_data4__114_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__114_carry__1_i_4
       (.I0(dac_data4__8_carry__4_n_5),
        .I1(dac_data4__8_carry__5_n_6),
        .O(dac_data4__114_carry__1_i_4_n_0));
  CARRY4 dac_data4__114_carry__2
       (.CI(dac_data4__114_carry__1_n_0),
        .CO({dac_data4__114_carry__2_n_0,dac_data4__114_carry__2_n_1,dac_data4__114_carry__2_n_2,dac_data4__114_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({dac_data4__8_carry__6_n_6,dac_data4__8_carry__6_n_7,dac_data4__8_carry__5_n_4,dac_data4__8_carry__5_n_5}),
        .O({dac_data4__114_carry__2_n_4,dac_data4__114_carry__2_n_5,dac_data4__114_carry__2_n_6,dac_data4__114_carry__2_n_7}),
        .S({sine_rom_inst_n_18,sine_rom_inst_n_19,sine_rom_inst_n_20,sine_rom_inst_n_21}));
  CARRY4 dac_data4__114_carry__3
       (.CI(dac_data4__114_carry__2_n_0),
        .CO({dac_data4__114_carry__3_n_0,NLW_dac_data4__114_carry__3_CO_UNCONNECTED[2],dac_data4__114_carry__3_n_2,dac_data4__114_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,sine_rom_inst_n_22,dac_data4__8_carry__6_n_4,dac_data4__8_carry__6_n_5}),
        .O({NLW_dac_data4__114_carry__3_O_UNCONNECTED[3],dac_data4__114_carry__3_n_5,dac_data4__114_carry__3_n_6,dac_data4__114_carry__3_n_7}),
        .S({1'b1,sine_rom_inst_n_170,sine_rom_inst_n_171,sine_rom_inst_n_172}));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__114_carry_i_1
       (.I0(dac_data4__8_carry__3_n_6),
        .I1(dac_data4__8_carry__4_n_7),
        .O(dac_data4__114_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dac_data4__114_carry_i_2
       (.I0(dac_data4__8_carry__3_n_4),
        .O(dac_data4__114_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dac_data4__114_carry_i_3
       (.I0(dac_data4__8_carry__3_n_5),
        .O(dac_data4__114_carry_i_3_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__171_carry
       (.CI(1'b0),
        .CO({dac_data4__171_carry_n_0,dac_data4__171_carry_n_1,dac_data4__171_carry_n_2,dac_data4__171_carry_n_3}),
        .CYINIT(1'b0),
        .DI({dac_data4__171_carry_i_1_n_0,dac_data4__72_carry__0_n_6,dac_data4__72_carry__0_n_7,dac_data4__72_carry_n_4}),
        .O({dac_data4__171_carry_n_4,dac_data4__171_carry_n_5,dac_data4__171_carry_n_6,dac_data4__171_carry_n_7}),
        .S({dac_data4__171_carry_i_2_n_0,dac_data4__171_carry_i_3_n_0,dac_data4__171_carry_i_4_n_0,dac_data4__171_carry_i_5_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__171_carry__0
       (.CI(dac_data4__171_carry_n_0),
        .CO({dac_data4__171_carry__0_n_0,dac_data4__171_carry__0_n_1,dac_data4__171_carry__0_n_2,dac_data4__171_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({dac_data4__171_carry__0_i_1_n_0,dac_data4__171_carry__0_i_2_n_0,dac_data4__171_carry__0_i_3_n_0,dac_data4__171_carry__0_i_4_n_0}),
        .O({dac_data4__171_carry__0_n_4,dac_data4__171_carry__0_n_5,dac_data4__171_carry__0_n_6,dac_data4__171_carry__0_n_7}),
        .S({dac_data4__171_carry__0_i_5_n_0,dac_data4__171_carry__0_i_6_n_0,dac_data4__171_carry__0_i_7_n_0,dac_data4__171_carry__0_i_8_n_0}));
  LUT5 #(
    .INIT(32'hFF8E8E00)) 
    dac_data4__171_carry__0_i_1
       (.I0(dac_data4__72_carry__1_n_7),
        .I1(dac_data4__114_carry__0_n_6),
        .I2(dac_data4__8_carry__3_n_4),
        .I3(dac_data4__8_carry__3_n_5),
        .I4(dac_data4__171_carry__0_i_9_n_0),
        .O(dac_data4__171_carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    dac_data4__171_carry__0_i_10
       (.I0(dac_data4__8_carry__4_n_6),
        .I1(dac_data4__114_carry__0_n_4),
        .I2(dac_data4__72_carry__1_n_5),
        .O(dac_data4__171_carry__0_i_10_n_0));
  LUT5 #(
    .INIT(32'h8E71718E)) 
    dac_data4__171_carry__0_i_2
       (.I0(dac_data4__72_carry__1_n_7),
        .I1(dac_data4__114_carry__0_n_6),
        .I2(dac_data4__8_carry__3_n_4),
        .I3(dac_data4__8_carry__3_n_5),
        .I4(dac_data4__171_carry__0_i_9_n_0),
        .O(dac_data4__171_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h9669)) 
    dac_data4__171_carry__0_i_3
       (.I0(dac_data4__72_carry__1_n_7),
        .I1(dac_data4__114_carry__0_n_6),
        .I2(dac_data4__8_carry__3_n_4),
        .I3(dac_data4__8_carry__3_n_6),
        .O(dac_data4__171_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    dac_data4__171_carry__0_i_4
       (.I0(dac_data4__72_carry__0_n_5),
        .I1(dac_data4__114_carry_n_4),
        .O(dac_data4__171_carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'h6969966996699696)) 
    dac_data4__171_carry__0_i_5
       (.I0(dac_data4__171_carry__0_i_1_n_0),
        .I1(dac_data4__171_carry__0_i_10_n_0),
        .I2(dac_data4__8_carry__3_n_4),
        .I3(dac_data4__8_carry__4_n_7),
        .I4(dac_data4__114_carry__0_n_5),
        .I5(dac_data4__72_carry__1_n_6),
        .O(dac_data4__171_carry__0_i_5_n_0));
  LUT6 #(
    .INIT(64'h9699996999696966)) 
    dac_data4__171_carry__0_i_6
       (.I0(dac_data4__171_carry__0_i_9_n_0),
        .I1(dac_data4__8_carry__3_n_5),
        .I2(dac_data4__8_carry__3_n_4),
        .I3(dac_data4__114_carry__0_n_6),
        .I4(dac_data4__72_carry__1_n_7),
        .I5(dac_data4__8_carry__3_n_6),
        .O(dac_data4__171_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h6A56)) 
    dac_data4__171_carry__0_i_7
       (.I0(dac_data4__171_carry__0_i_3_n_0),
        .I1(dac_data4__72_carry__0_n_4),
        .I2(dac_data4__114_carry__0_n_7),
        .I3(dac_data4__8_carry__3_n_5),
        .O(dac_data4__171_carry__0_i_7_n_0));
  LUT5 #(
    .INIT(32'hE11E1EE1)) 
    dac_data4__171_carry__0_i_8
       (.I0(dac_data4__114_carry_n_4),
        .I1(dac_data4__72_carry__0_n_5),
        .I2(dac_data4__72_carry__0_n_4),
        .I3(dac_data4__114_carry__0_n_7),
        .I4(dac_data4__8_carry__3_n_5),
        .O(dac_data4__171_carry__0_i_8_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    dac_data4__171_carry__0_i_9
       (.I0(dac_data4__8_carry__4_n_7),
        .I1(dac_data4__114_carry__0_n_5),
        .I2(dac_data4__72_carry__1_n_6),
        .O(dac_data4__171_carry__0_i_9_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__171_carry__1
       (.CI(dac_data4__171_carry__0_n_0),
        .CO({dac_data4__171_carry__1_n_0,dac_data4__171_carry__1_n_1,dac_data4__171_carry__1_n_2,dac_data4__171_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({dac_data4__171_carry__1_i_1_n_0,dac_data4__171_carry__1_i_2_n_0,dac_data4__171_carry__1_i_3_n_0,dac_data4__171_carry__1_i_4_n_0}),
        .O({dac_data4__171_carry__1_n_4,dac_data4__171_carry__1_n_5,dac_data4__171_carry__1_n_6,dac_data4__171_carry__1_n_7}),
        .S({dac_data4__171_carry__1_i_5_n_0,dac_data4__171_carry__1_i_6_n_0,dac_data4__171_carry__1_i_7_n_0,dac_data4__171_carry__1_i_8_n_0}));
  LUT5 #(
    .INIT(32'hFF8E8E00)) 
    dac_data4__171_carry__1_i_1
       (.I0(dac_data4__72_carry__2_n_7),
        .I1(dac_data4__114_carry__1_n_6),
        .I2(dac_data4__8_carry__4_n_4),
        .I3(dac_data4__8_carry__4_n_5),
        .I4(dac_data4__171_carry__1_i_9_n_0),
        .O(dac_data4__171_carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    dac_data4__171_carry__1_i_10
       (.I0(dac_data4__8_carry__4_n_4),
        .I1(dac_data4__114_carry__1_n_6),
        .I2(dac_data4__72_carry__2_n_7),
        .O(dac_data4__171_carry__1_i_10_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    dac_data4__171_carry__1_i_11
       (.I0(dac_data4__8_carry__4_n_5),
        .I1(dac_data4__114_carry__1_n_7),
        .I2(dac_data4__72_carry__1_n_4),
        .O(dac_data4__171_carry__1_i_11_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    dac_data4__171_carry__1_i_12
       (.I0(dac_data4__8_carry__5_n_6),
        .I1(dac_data4__114_carry__1_n_4),
        .I2(dac_data4__72_carry__2_n_5),
        .O(dac_data4__171_carry__1_i_12_n_0));
  LUT5 #(
    .INIT(32'hFF8E8E00)) 
    dac_data4__171_carry__1_i_2
       (.I0(dac_data4__72_carry__1_n_4),
        .I1(dac_data4__114_carry__1_n_7),
        .I2(dac_data4__8_carry__4_n_5),
        .I3(dac_data4__8_carry__4_n_6),
        .I4(dac_data4__171_carry__1_i_10_n_0),
        .O(dac_data4__171_carry__1_i_2_n_0));
  LUT5 #(
    .INIT(32'hFF8E8E00)) 
    dac_data4__171_carry__1_i_3
       (.I0(dac_data4__72_carry__1_n_5),
        .I1(dac_data4__114_carry__0_n_4),
        .I2(dac_data4__8_carry__4_n_6),
        .I3(dac_data4__8_carry__4_n_7),
        .I4(dac_data4__171_carry__1_i_11_n_0),
        .O(dac_data4__171_carry__1_i_3_n_0));
  LUT5 #(
    .INIT(32'hFF8E8E00)) 
    dac_data4__171_carry__1_i_4
       (.I0(dac_data4__72_carry__1_n_6),
        .I1(dac_data4__114_carry__0_n_5),
        .I2(dac_data4__8_carry__4_n_7),
        .I3(dac_data4__8_carry__3_n_4),
        .I4(dac_data4__171_carry__0_i_10_n_0),
        .O(dac_data4__171_carry__1_i_4_n_0));
  LUT6 #(
    .INIT(64'h6969966996699696)) 
    dac_data4__171_carry__1_i_5
       (.I0(dac_data4__171_carry__1_i_1_n_0),
        .I1(dac_data4__171_carry__1_i_12_n_0),
        .I2(dac_data4__8_carry__4_n_4),
        .I3(dac_data4__8_carry__5_n_7),
        .I4(dac_data4__114_carry__1_n_5),
        .I5(dac_data4__72_carry__2_n_6),
        .O(dac_data4__171_carry__1_i_5_n_0));
  LUT6 #(
    .INIT(64'h6969966996699696)) 
    dac_data4__171_carry__1_i_6
       (.I0(dac_data4__171_carry__1_i_2_n_0),
        .I1(dac_data4__171_carry__1_i_9_n_0),
        .I2(dac_data4__8_carry__4_n_5),
        .I3(dac_data4__8_carry__4_n_4),
        .I4(dac_data4__114_carry__1_n_6),
        .I5(dac_data4__72_carry__2_n_7),
        .O(dac_data4__171_carry__1_i_6_n_0));
  LUT6 #(
    .INIT(64'h6969966996699696)) 
    dac_data4__171_carry__1_i_7
       (.I0(dac_data4__171_carry__1_i_3_n_0),
        .I1(dac_data4__171_carry__1_i_10_n_0),
        .I2(dac_data4__8_carry__4_n_6),
        .I3(dac_data4__8_carry__4_n_5),
        .I4(dac_data4__114_carry__1_n_7),
        .I5(dac_data4__72_carry__1_n_4),
        .O(dac_data4__171_carry__1_i_7_n_0));
  LUT6 #(
    .INIT(64'h6969966996699696)) 
    dac_data4__171_carry__1_i_8
       (.I0(dac_data4__171_carry__1_i_4_n_0),
        .I1(dac_data4__171_carry__1_i_11_n_0),
        .I2(dac_data4__8_carry__4_n_7),
        .I3(dac_data4__8_carry__4_n_6),
        .I4(dac_data4__114_carry__0_n_4),
        .I5(dac_data4__72_carry__1_n_5),
        .O(dac_data4__171_carry__1_i_8_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    dac_data4__171_carry__1_i_9
       (.I0(dac_data4__8_carry__5_n_7),
        .I1(dac_data4__114_carry__1_n_5),
        .I2(dac_data4__72_carry__2_n_6),
        .O(dac_data4__171_carry__1_i_9_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__171_carry__2
       (.CI(dac_data4__171_carry__1_n_0),
        .CO({dac_data4__171_carry__2_n_0,dac_data4__171_carry__2_n_1,dac_data4__171_carry__2_n_2,dac_data4__171_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_164,sine_rom_inst_n_165,dac_data4__171_carry__2_i_3_n_0,dac_data4__171_carry__2_i_4_n_0}),
        .O({dac_data4__171_carry__2_n_4,dac_data4__171_carry__2_n_5,dac_data4__171_carry__2_n_6,dac_data4__171_carry__2_n_7}),
        .S({sine_rom_inst_n_243,sine_rom_inst_n_244,sine_rom_inst_n_245,dac_data4__171_carry__2_i_8_n_0}));
  LUT3 #(
    .INIT(8'h69)) 
    dac_data4__171_carry__2_i_11
       (.I0(dac_data4__8_carry__5_n_5),
        .I1(dac_data4__114_carry__2_n_7),
        .I2(dac_data4__72_carry__2_n_4),
        .O(dac_data4__171_carry__2_i_11_n_0));
  LUT5 #(
    .INIT(32'hFF8E8E00)) 
    dac_data4__171_carry__2_i_3
       (.I0(dac_data4__72_carry__2_n_5),
        .I1(dac_data4__114_carry__1_n_4),
        .I2(dac_data4__8_carry__5_n_6),
        .I3(dac_data4__8_carry__5_n_7),
        .I4(dac_data4__171_carry__2_i_11_n_0),
        .O(dac_data4__171_carry__2_i_3_n_0));
  LUT5 #(
    .INIT(32'hFF8E8E00)) 
    dac_data4__171_carry__2_i_4
       (.I0(dac_data4__72_carry__2_n_6),
        .I1(dac_data4__114_carry__1_n_5),
        .I2(dac_data4__8_carry__5_n_7),
        .I3(dac_data4__8_carry__4_n_4),
        .I4(dac_data4__171_carry__1_i_12_n_0),
        .O(dac_data4__171_carry__2_i_4_n_0));
  LUT6 #(
    .INIT(64'h6969966996699696)) 
    dac_data4__171_carry__2_i_8
       (.I0(dac_data4__171_carry__2_i_4_n_0),
        .I1(dac_data4__171_carry__2_i_11_n_0),
        .I2(dac_data4__8_carry__5_n_7),
        .I3(dac_data4__8_carry__5_n_6),
        .I4(dac_data4__114_carry__1_n_4),
        .I5(dac_data4__72_carry__2_n_5),
        .O(dac_data4__171_carry__2_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__171_carry__3
       (.CI(dac_data4__171_carry__2_n_0),
        .CO({dac_data4__171_carry__3_n_0,dac_data4__171_carry__3_n_1,dac_data4__171_carry__3_n_2,dac_data4__171_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_166,sine_rom_inst_n_167,sine_rom_inst_n_168,sine_rom_inst_n_169}),
        .O({dac_data4__171_carry__3_n_4,dac_data4__171_carry__3_n_5,dac_data4__171_carry__3_n_6,dac_data4__171_carry__3_n_7}),
        .S({sine_rom_inst_n_246,sine_rom_inst_n_247,sine_rom_inst_n_248,sine_rom_inst_n_249}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__171_carry__4
       (.CI(dac_data4__171_carry__3_n_0),
        .CO({dac_data4__171_carry__4_n_0,dac_data4__171_carry__4_n_1,dac_data4__171_carry__4_n_2,dac_data4__171_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_173,sine_rom_inst_n_174,sine_rom_inst_n_175,sine_rom_inst_n_176}),
        .O({dac_data4__171_carry__4_n_4,dac_data4__171_carry__4_n_5,dac_data4__171_carry__4_n_6,dac_data4__171_carry__4_n_7}),
        .S({sine_rom_inst_n_250,sine_rom_inst_n_251,sine_rom_inst_n_252,sine_rom_inst_n_253}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__171_carry__5
       (.CI(dac_data4__171_carry__4_n_0),
        .CO({NLW_dac_data4__171_carry__5_CO_UNCONNECTED[3],dac_data4__171_carry__5_n_1,dac_data4__171_carry__5_n_2,dac_data4__171_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,sine_rom_inst_n_177,sine_rom_inst_n_178,sine_rom_inst_n_179}),
        .O({dac_data4__171_carry__5_n_4,dac_data4__171_carry__5_n_5,dac_data4__171_carry__5_n_6,dac_data4__171_carry__5_n_7}),
        .S({sine_rom_inst_n_95,sine_rom_inst_n_96,sine_rom_inst_n_97,sine_rom_inst_n_98}));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__171_carry_i_1
       (.I0(dac_data4__72_carry__0_n_5),
        .I1(dac_data4__114_carry_n_4),
        .O(dac_data4__171_carry_i_1_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    dac_data4__171_carry_i_2
       (.I0(dac_data4__114_carry_n_4),
        .I1(dac_data4__72_carry__0_n_5),
        .I2(dac_data4__8_carry__3_n_6),
        .O(dac_data4__171_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    dac_data4__171_carry_i_3
       (.I0(dac_data4__72_carry__0_n_6),
        .I1(dac_data4__114_carry_n_5),
        .O(dac_data4__171_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    dac_data4__171_carry_i_4
       (.I0(dac_data4__72_carry__0_n_7),
        .I1(dac_data4__114_carry_n_6),
        .O(dac_data4__171_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    dac_data4__171_carry_i_5
       (.I0(dac_data4__72_carry_n_4),
        .I1(dac_data4__8_carry__3_n_6),
        .O(dac_data4__171_carry_i_5_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__254_carry
       (.CI(1'b0),
        .CO({dac_data4__254_carry_n_0,dac_data4__254_carry_n_1,dac_data4__254_carry_n_2,dac_data4__254_carry_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_162,sine_rom_inst_n_163,dac_data4__254_carry_i_3_n_0,1'b0}),
        .O(NLW_dac_data4__254_carry_O_UNCONNECTED[3:0]),
        .S({dac_data4__254_carry_i_4_n_0,dac_data4__254_carry_i_5_n_0,dac_data4__254_carry_i_6_n_0,dac_data4__254_carry_i_7_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__254_carry__0
       (.CI(dac_data4__254_carry_n_0),
        .CO({dac_data4__254_carry__0_n_0,dac_data4__254_carry__0_n_1,dac_data4__254_carry__0_n_2,dac_data4__254_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_158,sine_rom_inst_n_159,sine_rom_inst_n_160,sine_rom_inst_n_161}),
        .O(NLW_dac_data4__254_carry__0_O_UNCONNECTED[3:0]),
        .S({dac_data4__254_carry__0_i_5_n_0,dac_data4__254_carry__0_i_6_n_0,dac_data4__254_carry__0_i_7_n_0,dac_data4__254_carry__0_i_8_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__254_carry__0_i_10
       (.I0(dac_data6[5]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry_n_5),
        .O(dac_data4__254_carry__0_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__254_carry__0_i_11
       (.I0(dac_data6[4]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry_n_6),
        .O(dac_data4__254_carry__0_i_11_n_0));
  LUT6 #(
    .INIT(64'hFF4700B800B8FF47)) 
    dac_data4__254_carry__0_i_5
       (.I0(dac_data6[6]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry_n_4),
        .I3(dac_data4__171_carry_n_4),
        .I4(dac_data4__171_carry__0_n_7),
        .I5(dac_data4__8_carry__3_i_10_n_0),
        .O(dac_data4__254_carry__0_i_5_n_0));
  LUT6 #(
    .INIT(64'hFF4700B800B8FF47)) 
    dac_data4__254_carry__0_i_6
       (.I0(dac_data6[5]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry_n_5),
        .I3(dac_data4__171_carry_n_5),
        .I4(dac_data4__171_carry_n_4),
        .I5(dac_data4__254_carry__0_i_9_n_0),
        .O(dac_data4__254_carry__0_i_6_n_0));
  LUT6 #(
    .INIT(64'hFF4700B800B8FF47)) 
    dac_data4__254_carry__0_i_7
       (.I0(dac_data6[4]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry_n_6),
        .I3(dac_data4__171_carry_n_6),
        .I4(dac_data4__171_carry_n_5),
        .I5(dac_data4__254_carry__0_i_10_n_0),
        .O(dac_data4__254_carry__0_i_7_n_0));
  LUT6 #(
    .INIT(64'hFF4700B800B8FF47)) 
    dac_data4__254_carry__0_i_8
       (.I0(dac_data6[3]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry_n_7),
        .I3(dac_data4__171_carry_n_7),
        .I4(dac_data4__171_carry_n_6),
        .I5(dac_data4__254_carry__0_i_11_n_0),
        .O(dac_data4__254_carry__0_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__254_carry__0_i_9
       (.I0(dac_data6[6]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry_n_4),
        .O(dac_data4__254_carry__0_i_9_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__254_carry__1
       (.CI(dac_data4__254_carry__0_n_0),
        .CO({dac_data4__254_carry__1_n_0,dac_data4__254_carry__1_n_1,dac_data4__254_carry__1_n_2,dac_data4__254_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_79,sine_rom_inst_n_80,sine_rom_inst_n_81,sine_rom_inst_n_82}),
        .O(NLW_dac_data4__254_carry__1_O_UNCONNECTED[3:0]),
        .S({dac_data4__254_carry__1_i_5_n_0,dac_data4__254_carry__1_i_6_n_0,dac_data4__254_carry__1_i_7_n_0,dac_data4__254_carry__1_i_8_n_0}));
  LUT6 #(
    .INIT(64'hB8FF47004700B8FF)) 
    dac_data4__254_carry__1_i_5
       (.I0(dac_data6[10]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__0_n_4),
        .I3(dac_data4__171_carry__0_n_4),
        .I4(dac_data4__171_carry__1_n_7),
        .I5(dac_data4__8_carry__2_i_13_n_0),
        .O(dac_data4__254_carry__1_i_5_n_0));
  LUT6 #(
    .INIT(64'hB8FF47004700B8FF)) 
    dac_data4__254_carry__1_i_6
       (.I0(dac_data6[9]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__0_n_5),
        .I3(dac_data4__171_carry__0_n_5),
        .I4(dac_data4__171_carry__0_n_4),
        .I5(dac_data4__8_carry__2_i_15_n_0),
        .O(dac_data4__254_carry__1_i_6_n_0));
  LUT6 #(
    .INIT(64'hB44BB4B4B44B4B4B)) 
    dac_data4__254_carry__1_i_7
       (.I0(dac_data4__8_carry__1_i_13_n_0),
        .I1(dac_data4__171_carry__0_n_6),
        .I2(dac_data4__171_carry__0_n_5),
        .I3(dac_data6[9]),
        .I4(dac_data6__90_carry__2_n_6),
        .I5(dac_data6__90_carry__0_n_5),
        .O(dac_data4__254_carry__1_i_7_n_0));
  LUT6 #(
    .INIT(64'h00B8FF47FF4700B8)) 
    dac_data4__254_carry__1_i_8
       (.I0(dac_data6[7]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__0_n_7),
        .I3(dac_data4__171_carry__0_n_7),
        .I4(dac_data4__171_carry__0_n_6),
        .I5(dac_data4__8_carry__1_i_13_n_0),
        .O(dac_data4__254_carry__1_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__254_carry__2
       (.CI(dac_data4__254_carry__1_n_0),
        .CO({dac_data4__254_carry__2_n_0,dac_data4__254_carry__2_n_1,dac_data4__254_carry__2_n_2,dac_data4__254_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_154,sine_rom_inst_n_155,sine_rom_inst_n_156,sine_rom_inst_n_157}),
        .O(NLW_dac_data4__254_carry__2_O_UNCONNECTED[3:0]),
        .S({sine_rom_inst_n_254,sine_rom_inst_n_255,sine_rom_inst_n_256,dac_data4__254_carry__2_i_8_n_0}));
  LUT6 #(
    .INIT(64'hB8FF47004700B8FF)) 
    dac_data4__254_carry__2_i_8
       (.I0(dac_data6[11]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__1_n_7),
        .I3(dac_data4__171_carry__1_n_7),
        .I4(dac_data4__171_carry__1_n_6),
        .I5(dac_data4__8_carry__2_i_11_n_0),
        .O(dac_data4__254_carry__2_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__254_carry__3
       (.CI(dac_data4__254_carry__2_n_0),
        .CO({dac_data4__254_carry__3_n_0,dac_data4__254_carry__3_n_1,dac_data4__254_carry__3_n_2,dac_data4__254_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_99,sine_rom_inst_n_100,sine_rom_inst_n_101,sine_rom_inst_n_102}),
        .O(NLW_dac_data4__254_carry__3_O_UNCONNECTED[3:0]),
        .S({sine_rom_inst_n_257,sine_rom_inst_n_258,sine_rom_inst_n_259,sine_rom_inst_n_260}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__254_carry__4
       (.CI(dac_data4__254_carry__3_n_0),
        .CO({dac_data4__254_carry__4_n_0,dac_data4__254_carry__4_n_1,dac_data4__254_carry__4_n_2,dac_data4__254_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_103,sine_rom_inst_n_104,sine_rom_inst_n_105,sine_rom_inst_n_106}),
        .O(NLW_dac_data4__254_carry__4_O_UNCONNECTED[3:0]),
        .S({sine_rom_inst_n_261,sine_rom_inst_n_262,sine_rom_inst_n_263,sine_rom_inst_n_264}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__254_carry__5
       (.CI(dac_data4__254_carry__4_n_0),
        .CO({dac_data4__254_carry__5_n_0,dac_data4__254_carry__5_n_1,dac_data4__254_carry__5_n_2,dac_data4__254_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_107,sine_rom_inst_n_108,sine_rom_inst_n_109,sine_rom_inst_n_110}),
        .O(NLW_dac_data4__254_carry__5_O_UNCONNECTED[3:0]),
        .S({sine_rom_inst_n_265,sine_rom_inst_n_266,sine_rom_inst_n_267,sine_rom_inst_n_268}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data4__254_carry__6
       (.CI(dac_data4__254_carry__5_n_0),
        .CO({NLW_dac_data4__254_carry__6_CO_UNCONNECTED[3],dac_data4__254_carry__6_n_1,dac_data4__254_carry__6_n_2,dac_data4__254_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,sine_rom_inst_n_111,sine_rom_inst_n_112,sine_rom_inst_n_113}),
        .O(NLW_dac_data4__254_carry__6_O_UNCONNECTED[3:0]),
        .S({1'b0,sine_rom_inst_n_269,sine_rom_inst_n_270,sine_rom_inst_n_271}));
  LUT2 #(
    .INIT(4'hB)) 
    dac_data4__254_carry_i_3
       (.I0(dac_data4__72_carry_n_7),
        .I1(dac_data6__0_carry_n_7),
        .O(dac_data4__254_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'hFF4700B800B8FF47)) 
    dac_data4__254_carry_i_4
       (.I0(dac_data6[2]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__0_carry_n_5),
        .I3(dac_data4__72_carry_n_5),
        .I4(dac_data4__171_carry_n_7),
        .I5(dac_data4__254_carry_i_8_n_0),
        .O(dac_data4__254_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'hFF4700B800B8FF47)) 
    dac_data4__254_carry_i_5
       (.I0(dac_data6[1]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__0_carry_n_6),
        .I3(dac_data4__72_carry_n_6),
        .I4(dac_data4__72_carry_n_5),
        .I5(dac_data4__254_carry_i_9_n_0),
        .O(dac_data4__254_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'hD22DD2D2D22D2D2D)) 
    dac_data4__254_carry_i_6
       (.I0(dac_data6__0_carry_n_7),
        .I1(dac_data4__72_carry_n_7),
        .I2(dac_data4__72_carry_n_6),
        .I3(dac_data6[1]),
        .I4(dac_data6__90_carry__2_n_6),
        .I5(dac_data6__0_carry_n_6),
        .O(dac_data4__254_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    dac_data4__254_carry_i_7
       (.I0(dac_data6__0_carry_n_7),
        .I1(dac_data4__72_carry_n_7),
        .O(dac_data4__254_carry_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__254_carry_i_8
       (.I0(dac_data6[3]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry_n_7),
        .O(dac_data4__254_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__254_carry_i_9
       (.I0(dac_data6[2]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__0_carry_n_5),
        .O(dac_data4__254_carry_i_9_n_0));
  CARRY4 dac_data4__315_carry
       (.CI(1'b0),
        .CO({dac_data4__315_carry_n_0,dac_data4__315_carry_n_1,dac_data4__315_carry_n_2,dac_data4__315_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({dac_data4__315_carry_n_4,dac_data4__315_carry_n_5,dac_data4__315_carry_n_6,dac_data4__315_carry_n_7}),
        .S({dac_data4__8_carry__4_n_7,dac_data4__8_carry__3_n_4,dac_data4__8_carry__3_n_5,dac_data4__315_carry_i_1_n_0}));
  CARRY4 dac_data4__315_carry__0
       (.CI(dac_data4__315_carry_n_0),
        .CO({dac_data4__315_carry__0_n_0,dac_data4__315_carry__0_n_1,dac_data4__315_carry__0_n_2,dac_data4__315_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({dac_data4__315_carry__0_n_4,dac_data4__315_carry__0_n_5,dac_data4__315_carry__0_n_6,dac_data4__315_carry__0_n_7}),
        .S({dac_data4__8_carry__5_n_7,dac_data4__8_carry__4_n_4,dac_data4__8_carry__4_n_5,dac_data4__8_carry__4_n_6}));
  CARRY4 dac_data4__315_carry__1
       (.CI(dac_data4__315_carry__0_n_0),
        .CO({dac_data4__315_carry__1_n_0,dac_data4__315_carry__1_n_1,dac_data4__315_carry__1_n_2,dac_data4__315_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({dac_data4__315_carry__1_n_4,dac_data4__315_carry__1_n_5,dac_data4__315_carry__1_n_6,dac_data4__315_carry__1_n_7}),
        .S({dac_data4__8_carry__6_n_7,dac_data4__8_carry__5_n_4,dac_data4__8_carry__5_n_5,dac_data4__8_carry__5_n_6}));
  CARRY4 dac_data4__315_carry__2
       (.CI(dac_data4__315_carry__1_n_0),
        .CO({dac_data4__315_carry__2_n_0,dac_data4__315_carry__2_n_1,dac_data4__315_carry__2_n_2,dac_data4__315_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({dac_data4__315_carry__2_n_4,dac_data4__315_carry__2_n_5,dac_data4__315_carry__2_n_6,dac_data4__315_carry__2_n_7}),
        .S({sine_rom_inst_n_22,dac_data4__8_carry__6_n_4,dac_data4__8_carry__6_n_5,dac_data4__8_carry__6_n_6}));
  LUT1 #(
    .INIT(2'h1)) 
    dac_data4__315_carry_i_1
       (.I0(dac_data4__8_carry__3_n_6),
        .O(dac_data4__315_carry_i_1_n_0));
  CARRY4 dac_data4__72_carry
       (.CI(1'b0),
        .CO({dac_data4__72_carry_n_0,dac_data4__72_carry_n_1,dac_data4__72_carry_n_2,dac_data4__72_carry_n_3}),
        .CYINIT(1'b0),
        .DI({dac_data4__8_carry__3_n_6,1'b0,1'b0,1'b1}),
        .O({dac_data4__72_carry_n_4,dac_data4__72_carry_n_5,dac_data4__72_carry_n_6,dac_data4__72_carry_n_7}),
        .S({dac_data4__72_carry_i_1_n_0,dac_data4__72_carry_i_2_n_0,dac_data4__72_carry_i_3_n_0,dac_data4__8_carry__3_n_6}));
  CARRY4 dac_data4__72_carry__0
       (.CI(dac_data4__72_carry_n_0),
        .CO({dac_data4__72_carry__0_n_0,dac_data4__72_carry__0_n_1,dac_data4__72_carry__0_n_2,dac_data4__72_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({dac_data4__8_carry__4_n_6,dac_data4__8_carry__4_n_7,dac_data4__8_carry__3_n_4,dac_data4__8_carry__3_n_5}),
        .O({dac_data4__72_carry__0_n_4,dac_data4__72_carry__0_n_5,dac_data4__72_carry__0_n_6,dac_data4__72_carry__0_n_7}),
        .S({dac_data4__72_carry__0_i_1_n_0,dac_data4__72_carry__0_i_2_n_0,dac_data4__72_carry__0_i_3_n_0,dac_data4__72_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__72_carry__0_i_1
       (.I0(dac_data4__8_carry__4_n_6),
        .I1(dac_data4__8_carry__5_n_7),
        .O(dac_data4__72_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__72_carry__0_i_2
       (.I0(dac_data4__8_carry__4_n_7),
        .I1(dac_data4__8_carry__4_n_4),
        .O(dac_data4__72_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__72_carry__0_i_3
       (.I0(dac_data4__8_carry__3_n_4),
        .I1(dac_data4__8_carry__4_n_5),
        .O(dac_data4__72_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__72_carry__0_i_4
       (.I0(dac_data4__8_carry__3_n_5),
        .I1(dac_data4__8_carry__4_n_6),
        .O(dac_data4__72_carry__0_i_4_n_0));
  CARRY4 dac_data4__72_carry__1
       (.CI(dac_data4__72_carry__0_n_0),
        .CO({dac_data4__72_carry__1_n_0,dac_data4__72_carry__1_n_1,dac_data4__72_carry__1_n_2,dac_data4__72_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({dac_data4__8_carry__5_n_6,dac_data4__8_carry__5_n_7,dac_data4__8_carry__4_n_4,dac_data4__8_carry__4_n_5}),
        .O({dac_data4__72_carry__1_n_4,dac_data4__72_carry__1_n_5,dac_data4__72_carry__1_n_6,dac_data4__72_carry__1_n_7}),
        .S({sine_rom_inst_n_27,dac_data4__72_carry__1_i_2_n_0,dac_data4__72_carry__1_i_3_n_0,dac_data4__72_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__72_carry__1_i_2
       (.I0(dac_data4__8_carry__5_n_7),
        .I1(dac_data4__8_carry__5_n_4),
        .O(dac_data4__72_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__72_carry__1_i_3
       (.I0(dac_data4__8_carry__4_n_4),
        .I1(dac_data4__8_carry__5_n_5),
        .O(dac_data4__72_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__72_carry__1_i_4
       (.I0(dac_data4__8_carry__4_n_5),
        .I1(dac_data4__8_carry__5_n_6),
        .O(dac_data4__72_carry__1_i_4_n_0));
  CARRY4 dac_data4__72_carry__2
       (.CI(dac_data4__72_carry__1_n_0),
        .CO({dac_data4__72_carry__2_n_0,dac_data4__72_carry__2_n_1,dac_data4__72_carry__2_n_2,dac_data4__72_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({dac_data4__8_carry__6_n_6,dac_data4__8_carry__6_n_7,dac_data4__8_carry__5_n_4,dac_data4__8_carry__5_n_5}),
        .O({dac_data4__72_carry__2_n_4,dac_data4__72_carry__2_n_5,dac_data4__72_carry__2_n_6,dac_data4__72_carry__2_n_7}),
        .S({sine_rom_inst_n_28,sine_rom_inst_n_29,sine_rom_inst_n_30,sine_rom_inst_n_31}));
  CARRY4 dac_data4__72_carry__3
       (.CI(dac_data4__72_carry__2_n_0),
        .CO({dac_data4__72_carry__3_n_0,NLW_dac_data4__72_carry__3_CO_UNCONNECTED[2],dac_data4__72_carry__3_n_2,dac_data4__72_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,sine_rom_inst_n_22,dac_data4__8_carry__6_n_4,dac_data4__8_carry__6_n_5}),
        .O({NLW_dac_data4__72_carry__3_O_UNCONNECTED[3],dac_data4__72_carry__3_n_5,dac_data4__72_carry__3_n_6,dac_data4__72_carry__3_n_7}),
        .S({1'b1,sine_rom_inst_n_199,sine_rom_inst_n_200,sine_rom_inst_n_201}));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__72_carry_i_1
       (.I0(dac_data4__8_carry__3_n_6),
        .I1(dac_data4__8_carry__4_n_7),
        .O(dac_data4__72_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dac_data4__72_carry_i_2
       (.I0(dac_data4__8_carry__3_n_4),
        .O(dac_data4__72_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dac_data4__72_carry_i_3
       (.I0(dac_data4__8_carry__3_n_5),
        .O(dac_data4__72_carry_i_3_n_0));
  CARRY4 dac_data4__8_carry
       (.CI(1'b0),
        .CO({dac_data4__8_carry_n_0,dac_data4__8_carry_n_1,dac_data4__8_carry_n_2,dac_data4__8_carry_n_3}),
        .CYINIT(1'b0),
        .DI({dac_data4__8_carry_i_1_n_0,dac_data4__8_carry_i_2_n_0,dac_data4__8_carry_i_3_n_0,1'b0}),
        .O(NLW_dac_data4__8_carry_O_UNCONNECTED[3:0]),
        .S({dac_data4__8_carry_i_4_n_0,dac_data4__8_carry_i_5_n_0,sine_rom_inst_n_240,dac_data4__8_carry_i_7_n_0}));
  CARRY4 dac_data4__8_carry__0
       (.CI(dac_data4__8_carry_n_0),
        .CO({dac_data4__8_carry__0_n_0,dac_data4__8_carry__0_n_1,dac_data4__8_carry__0_n_2,dac_data4__8_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_185,sine_rom_inst_n_186,dac_data4__8_carry__0_i_3_n_0,dac_data4__8_carry__0_i_4_n_0}),
        .O(NLW_dac_data4__8_carry__0_O_UNCONNECTED[3:0]),
        .S({sine_rom_inst_n_272,sine_rom_inst_n_273,dac_data4__8_carry__0_i_7_n_0,dac_data4__8_carry__0_i_8_n_0}));
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__0_i_3
       (.I0(dac_data6[12]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__1_n_6),
        .O(dac_data4__8_carry__0_i_3_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__0_i_4
       (.I0(dac_data6[11]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__1_n_7),
        .O(dac_data4__8_carry__0_i_4_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    dac_data4__8_carry__0_i_7
       (.I0(dac_data6__90_carry__1_n_6),
        .I1(dac_data6[12]),
        .I2(dac_data6__90_carry_n_6),
        .I3(dac_data6__90_carry__2_n_6),
        .I4(dac_data6[4]),
        .O(dac_data4__8_carry__0_i_7_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    dac_data4__8_carry__0_i_8
       (.I0(dac_data6__90_carry__1_n_7),
        .I1(dac_data6[11]),
        .I2(dac_data6__90_carry_n_7),
        .I3(dac_data6__90_carry__2_n_6),
        .I4(dac_data6[3]),
        .O(dac_data4__8_carry__0_i_8_n_0));
  CARRY4 dac_data4__8_carry__1
       (.CI(dac_data4__8_carry__0_n_0),
        .CO({dac_data4__8_carry__1_n_0,dac_data4__8_carry__1_n_1,dac_data4__8_carry__1_n_2,dac_data4__8_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_0,sine_rom_inst_n_1,sine_rom_inst_n_2,sine_rom_inst_n_3}),
        .O(NLW_dac_data4__8_carry__1_O_UNCONNECTED[3:0]),
        .S({dac_data4__8_carry__1_i_5_n_0,dac_data4__8_carry__1_i_6_n_0,sine_rom_inst_n_238,sine_rom_inst_n_239}));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__1_i_10
       (.I0(dac_data6[9]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__0_n_5),
        .O(dac_data4__8_carry__1_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    dac_data4__8_carry__1_i_11
       (.I0(dac_data6__90_carry__0_n_4),
        .I1(dac_data6[10]),
        .I2(dac_data6__0_carry_n_5),
        .I3(dac_data6__90_carry__2_n_6),
        .I4(dac_data6[2]),
        .O(dac_data4__8_carry__1_i_11_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__1_i_12
       (.I0(dac_data6[1]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__0_carry_n_6),
        .O(dac_data4__8_carry__1_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__1_i_13
       (.I0(dac_data6[8]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__0_n_6),
        .O(dac_data4__8_carry__1_i_13_n_0));
  LUT6 #(
    .INIT(64'h5FFA7777A0058888)) 
    dac_data4__8_carry__1_i_5
       (.I0(dac_data4__8_carry__1_i_10_n_0),
        .I1(dac_data6__0_carry_n_6),
        .I2(dac_data6[1]),
        .I3(sine_rom_inst_n_4),
        .I4(dac_data6__90_carry__2_n_6),
        .I5(dac_data4__8_carry__1_i_11_n_0),
        .O(dac_data4__8_carry__1_i_5_n_0));
  LUT6 #(
    .INIT(64'h9699696669666966)) 
    dac_data4__8_carry__1_i_6
       (.I0(dac_data4__8_carry__1_i_10_n_0),
        .I1(dac_data4__8_carry__1_i_12_n_0),
        .I2(sine_rom_inst_n_4),
        .I3(dac_data6__90_carry__2_n_6),
        .I4(dac_data6__0_carry_n_7),
        .I5(dac_data4__8_carry__1_i_13_n_0),
        .O(dac_data4__8_carry__1_i_6_n_0));
  CARRY4 dac_data4__8_carry__2
       (.CI(dac_data4__8_carry__1_n_0),
        .CO({dac_data4__8_carry__2_n_0,dac_data4__8_carry__2_n_1,dac_data4__8_carry__2_n_2,dac_data4__8_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_83,sine_rom_inst_n_84,sine_rom_inst_n_85,sine_rom_inst_n_86}),
        .O(NLW_dac_data4__8_carry__2_O_UNCONNECTED[3:0]),
        .S({sine_rom_inst_n_241,sine_rom_inst_n_242,dac_data4__8_carry__2_i_7_n_0,dac_data4__8_carry__2_i_8_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__2_i_11
       (.I0(dac_data6[12]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__1_n_6),
        .O(dac_data4__8_carry__2_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__2_i_13
       (.I0(dac_data6[11]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__1_n_7),
        .O(dac_data4__8_carry__2_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    dac_data4__8_carry__2_i_14
       (.I0(dac_data6__90_carry__1_n_6),
        .I1(dac_data6[12]),
        .I2(dac_data6__90_carry_n_6),
        .I3(dac_data6__90_carry__2_n_6),
        .I4(dac_data6[4]),
        .O(dac_data4__8_carry__2_i_14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__2_i_15
       (.I0(dac_data6[10]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__0_n_4),
        .O(dac_data4__8_carry__2_i_15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    dac_data4__8_carry__2_i_16
       (.I0(dac_data6__90_carry__1_n_7),
        .I1(dac_data6[11]),
        .I2(dac_data6__90_carry_n_7),
        .I3(dac_data6__90_carry__2_n_6),
        .I4(dac_data6[3]),
        .O(dac_data4__8_carry__2_i_16_n_0));
  LUT6 #(
    .INIT(64'h5FFA7777A0058888)) 
    dac_data4__8_carry__2_i_7
       (.I0(dac_data4__8_carry__2_i_13_n_0),
        .I1(dac_data6__90_carry_n_7),
        .I2(dac_data6[3]),
        .I3(sine_rom_inst_n_4),
        .I4(dac_data6__90_carry__2_n_6),
        .I5(dac_data4__8_carry__2_i_14_n_0),
        .O(dac_data4__8_carry__2_i_7_n_0));
  LUT6 #(
    .INIT(64'h5FFA7777A0058888)) 
    dac_data4__8_carry__2_i_8
       (.I0(dac_data4__8_carry__2_i_15_n_0),
        .I1(dac_data6__0_carry_n_5),
        .I2(dac_data6[2]),
        .I3(sine_rom_inst_n_4),
        .I4(dac_data6__90_carry__2_n_6),
        .I5(dac_data4__8_carry__2_i_16_n_0),
        .O(dac_data4__8_carry__2_i_8_n_0));
  CARRY4 dac_data4__8_carry__3
       (.CI(dac_data4__8_carry__2_n_0),
        .CO({dac_data4__8_carry__3_n_0,dac_data4__8_carry__3_n_1,dac_data4__8_carry__3_n_2,dac_data4__8_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_87,sine_rom_inst_n_88,sine_rom_inst_n_89,sine_rom_inst_n_90}),
        .O({dac_data4__8_carry__3_n_4,dac_data4__8_carry__3_n_5,dac_data4__8_carry__3_n_6,NLW_dac_data4__8_carry__3_O_UNCONNECTED[0]}),
        .S({sine_rom_inst_n_13,sine_rom_inst_n_14,sine_rom_inst_n_15,sine_rom_inst_n_16}));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__3_i_10
       (.I0(dac_data6[7]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__0_n_7),
        .O(dac_data4__8_carry__3_i_10_n_0));
  CARRY4 dac_data4__8_carry__4
       (.CI(dac_data4__8_carry__3_n_0),
        .CO({dac_data4__8_carry__4_n_0,dac_data4__8_carry__4_n_1,dac_data4__8_carry__4_n_2,dac_data4__8_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_187,sine_rom_inst_n_188,sine_rom_inst_n_189,sine_rom_inst_n_190}),
        .O({dac_data4__8_carry__4_n_4,dac_data4__8_carry__4_n_5,dac_data4__8_carry__4_n_6,dac_data4__8_carry__4_n_7}),
        .S({sine_rom_inst_n_9,sine_rom_inst_n_10,sine_rom_inst_n_11,sine_rom_inst_n_12}));
  CARRY4 dac_data4__8_carry__5
       (.CI(dac_data4__8_carry__4_n_0),
        .CO({dac_data4__8_carry__5_n_0,dac_data4__8_carry__5_n_1,dac_data4__8_carry__5_n_2,dac_data4__8_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_91,sine_rom_inst_n_92,sine_rom_inst_n_93,sine_rom_inst_n_94}),
        .O({dac_data4__8_carry__5_n_4,dac_data4__8_carry__5_n_5,dac_data4__8_carry__5_n_6,dac_data4__8_carry__5_n_7}),
        .S({sine_rom_inst_n_23,sine_rom_inst_n_24,sine_rom_inst_n_25,sine_rom_inst_n_26}));
  CARRY4 dac_data4__8_carry__6
       (.CI(dac_data4__8_carry__5_n_0),
        .CO({dac_data4__8_carry__6_n_0,dac_data4__8_carry__6_n_1,dac_data4__8_carry__6_n_2,dac_data4__8_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_195,sine_rom_inst_n_196,sine_rom_inst_n_197,sine_rom_inst_n_198}),
        .O({dac_data4__8_carry__6_n_4,dac_data4__8_carry__6_n_5,dac_data4__8_carry__6_n_6,dac_data4__8_carry__6_n_7}),
        .S({sine_rom_inst_n_191,sine_rom_inst_n_192,sine_rom_inst_n_193,sine_rom_inst_n_194}));
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry_i_1
       (.I0(dac_data6[10]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__0_n_4),
        .O(dac_data4__8_carry_i_1_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry_i_2
       (.I0(dac_data6[9]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__0_n_5),
        .O(dac_data4__8_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry_i_3
       (.I0(dac_data6[8]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__0_n_6),
        .O(dac_data4__8_carry_i_3_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    dac_data4__8_carry_i_4
       (.I0(dac_data6__90_carry__0_n_4),
        .I1(dac_data6[10]),
        .I2(dac_data6__0_carry_n_5),
        .I3(dac_data6__90_carry__2_n_6),
        .I4(dac_data6[2]),
        .O(dac_data4__8_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    dac_data4__8_carry_i_5
       (.I0(dac_data6__90_carry__0_n_5),
        .I1(dac_data6[9]),
        .I2(dac_data6__0_carry_n_6),
        .I3(dac_data6__90_carry__2_n_6),
        .I4(dac_data6[1]),
        .O(dac_data4__8_carry_i_5_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry_i_7
       (.I0(dac_data6[7]),
        .I1(dac_data6__90_carry__2_n_6),
        .I2(dac_data6__90_carry__0_n_7),
        .O(dac_data4__8_carry_i_7_n_0));
  CARRY4 dac_data6__0_carry
       (.CI(1'b0),
        .CO({dac_data6__0_carry_n_0,dac_data6__0_carry_n_1,dac_data6__0_carry_n_2,dac_data6__0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_40,sine_rom_inst_n_41,sine_rom_inst_n_42,1'b0}),
        .O({dac_data6__0_carry_n_4,dac_data6__0_carry_n_5,dac_data6__0_carry_n_6,dac_data6__0_carry_n_7}),
        .S({sine_rom_inst_n_45,sine_rom_inst_n_46,sine_rom_inst_n_47,sine_rom_inst_n_48}));
  CARRY4 dac_data6__0_carry__0
       (.CI(dac_data6__0_carry_n_0),
        .CO({dac_data6__0_carry__0_n_0,dac_data6__0_carry__0_n_1,dac_data6__0_carry__0_n_2,dac_data6__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_36,sine_rom_inst_n_37,sine_rom_inst_n_38,sine_rom_inst_n_39}),
        .O({dac_data6__0_carry__0_n_4,dac_data6__0_carry__0_n_5,dac_data6__0_carry__0_n_6,dac_data6__0_carry__0_n_7}),
        .S({sine_rom_inst_n_214,sine_rom_inst_n_215,sine_rom_inst_n_216,sine_rom_inst_n_217}));
  CARRY4 dac_data6__0_carry__1
       (.CI(dac_data6__0_carry__0_n_0),
        .CO({NLW_dac_data6__0_carry__1_CO_UNCONNECTED[3],dac_data6__0_carry__1_n_1,NLW_dac_data6__0_carry__1_CO_UNCONNECTED[1],dac_data6__0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,sine_rom_inst_n_43,sine_rom_inst_n_44}),
        .O({NLW_dac_data6__0_carry__1_O_UNCONNECTED[3:2],dac_data6__0_carry__1_n_6,dac_data6__0_carry__1_n_7}),
        .S({1'b0,1'b1,sine_rom_inst_n_218,sine_rom_inst_n_219}));
  CARRY4 dac_data6__30_carry
       (.CI(1'b0),
        .CO({dac_data6__30_carry_n_0,dac_data6__30_carry_n_1,dac_data6__30_carry_n_2,dac_data6__30_carry_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_53,sine_rom_inst_n_54,sine_rom_inst_n_55,1'b0}),
        .O({dac_data6__30_carry_n_4,dac_data6__30_carry_n_5,dac_data6__30_carry_n_6,dac_data6__30_carry_n_7}),
        .S({sine_rom_inst_n_58,sine_rom_inst_n_59,sine_rom_inst_n_60,sine_rom_inst_n_61}));
  CARRY4 dac_data6__30_carry__0
       (.CI(dac_data6__30_carry_n_0),
        .CO({dac_data6__30_carry__0_n_0,dac_data6__30_carry__0_n_1,dac_data6__30_carry__0_n_2,dac_data6__30_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_49,sine_rom_inst_n_50,sine_rom_inst_n_51,sine_rom_inst_n_52}),
        .O({dac_data6__30_carry__0_n_4,dac_data6__30_carry__0_n_5,dac_data6__30_carry__0_n_6,dac_data6__30_carry__0_n_7}),
        .S({sine_rom_inst_n_220,sine_rom_inst_n_221,sine_rom_inst_n_222,sine_rom_inst_n_223}));
  CARRY4 dac_data6__30_carry__1
       (.CI(dac_data6__30_carry__0_n_0),
        .CO({NLW_dac_data6__30_carry__1_CO_UNCONNECTED[3],dac_data6__30_carry__1_n_1,NLW_dac_data6__30_carry__1_CO_UNCONNECTED[1],dac_data6__30_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,sine_rom_inst_n_56,sine_rom_inst_n_57}),
        .O({NLW_dac_data6__30_carry__1_O_UNCONNECTED[3:2],dac_data6__30_carry__1_n_6,dac_data6__30_carry__1_n_7}),
        .S({1'b0,1'b1,sine_rom_inst_n_224,sine_rom_inst_n_225}));
  CARRY4 dac_data6__59_carry
       (.CI(1'b0),
        .CO({dac_data6__59_carry_n_0,dac_data6__59_carry_n_1,dac_data6__59_carry_n_2,dac_data6__59_carry_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_62,sine_rom_inst_n_63,sine_rom_inst_n_64,1'b0}),
        .O({dac_data6__59_carry_n_4,dac_data6__59_carry_n_5,dac_data6__59_carry_n_6,dac_data6__59_carry_n_7}),
        .S({sine_rom_inst_n_5,sine_rom_inst_n_6,sine_rom_inst_n_7,sine_rom_inst_n_8}));
  CARRY4 dac_data6__59_carry__0
       (.CI(dac_data6__59_carry_n_0),
        .CO({dac_data6__59_carry__0_n_0,dac_data6__59_carry__0_n_1,dac_data6__59_carry__0_n_2,dac_data6__59_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_65,sine_rom_inst_n_66,sine_rom_inst_n_67,sine_rom_inst_n_68}),
        .O({dac_data6__59_carry__0_n_4,dac_data6__59_carry__0_n_5,dac_data6__59_carry__0_n_6,dac_data6__59_carry__0_n_7}),
        .S({sine_rom_inst_n_226,sine_rom_inst_n_227,sine_rom_inst_n_228,sine_rom_inst_n_229}));
  CARRY4 dac_data6__59_carry__1
       (.CI(dac_data6__59_carry__0_n_0),
        .CO({NLW_dac_data6__59_carry__1_CO_UNCONNECTED[3:2],dac_data6__59_carry__1_n_2,dac_data6__59_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,sine_rom_inst_n_69}),
        .O({NLW_dac_data6__59_carry__1_O_UNCONNECTED[3],dac_data6__59_carry__1_n_5,dac_data6__59_carry__1_n_6,dac_data6__59_carry__1_n_7}),
        .S({1'b0,1'b1,sine_rom_inst_n_70,sine_rom_inst_n_71}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data6__90_carry
       (.CI(1'b0),
        .CO({dac_data6__90_carry_n_0,dac_data6__90_carry_n_1,dac_data6__90_carry_n_2,dac_data6__90_carry_n_3}),
        .CYINIT(1'b0),
        .DI({dac_data6__90_carry_i_1_n_0,dac_data6__90_carry_i_2_n_0,dac_data6__90_carry_i_3_n_0,1'b0}),
        .O({dac_data6__90_carry_n_4,dac_data6__90_carry_n_5,dac_data6__90_carry_n_6,dac_data6__90_carry_n_7}),
        .S({dac_data6__90_carry_i_4_n_0,dac_data6__90_carry_i_5_n_0,dac_data6__90_carry_i_6_n_0,dac_data6__90_carry_i_7_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data6__90_carry__0
       (.CI(dac_data6__90_carry_n_0),
        .CO({dac_data6__90_carry__0_n_0,dac_data6__90_carry__0_n_1,dac_data6__90_carry__0_n_2,dac_data6__90_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_72,sine_rom_inst_n_73,sine_rom_inst_n_74,dac_data6__90_carry__0_i_4_n_0}),
        .O({dac_data6__90_carry__0_n_4,dac_data6__90_carry__0_n_5,dac_data6__90_carry__0_n_6,dac_data6__90_carry__0_n_7}),
        .S({sine_rom_inst_n_230,sine_rom_inst_n_231,sine_rom_inst_n_232,dac_data6__90_carry__0_i_8_n_0}));
  LUT3 #(
    .INIT(8'h69)) 
    dac_data6__90_carry__0_i_4
       (.I0(dac_data6__59_carry_n_6),
        .I1(dac_data6__30_carry__0_n_7),
        .I2(dac_data6__0_carry__0_n_4),
        .O(dac_data6__90_carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'h9696966996696969)) 
    dac_data6__90_carry__0_i_8
       (.I0(dac_data6__0_carry__0_n_4),
        .I1(dac_data6__30_carry__0_n_7),
        .I2(dac_data6__59_carry_n_6),
        .I3(dac_data6__30_carry_n_4),
        .I4(dac_data6__59_carry_n_7),
        .I5(dac_data6__0_carry__0_n_5),
        .O(dac_data6__90_carry__0_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data6__90_carry__1
       (.CI(dac_data6__90_carry__0_n_0),
        .CO({dac_data6__90_carry__1_n_0,dac_data6__90_carry__1_n_1,dac_data6__90_carry__1_n_2,dac_data6__90_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({sine_rom_inst_n_75,sine_rom_inst_n_76,sine_rom_inst_n_77,sine_rom_inst_n_78}),
        .O({dac_data6__90_carry__1_n_4,dac_data6__90_carry__1_n_5,dac_data6__90_carry__1_n_6,dac_data6__90_carry__1_n_7}),
        .S({sine_rom_inst_n_233,sine_rom_inst_n_234,sine_rom_inst_n_235,sine_rom_inst_n_236}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 dac_data6__90_carry__2
       (.CI(dac_data6__90_carry__1_n_0),
        .CO({NLW_dac_data6__90_carry__2_CO_UNCONNECTED[3:1],dac_data6__90_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,dac_data6__59_carry__1_n_6}),
        .O({NLW_dac_data6__90_carry__2_O_UNCONNECTED[3:2],dac_data6__90_carry__2_n_6,dac_data6__90_carry__2_n_7}),
        .S({1'b0,1'b0,dac_data6__59_carry__1_n_5,sine_rom_inst_n_237}));
  LUT2 #(
    .INIT(4'h8)) 
    dac_data6__90_carry_i_1
       (.I0(dac_data6__30_carry_n_5),
        .I1(dac_data6__0_carry__0_n_6),
        .O(dac_data6__90_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    dac_data6__90_carry_i_2
       (.I0(dac_data6__30_carry_n_6),
        .I1(dac_data6__0_carry__0_n_7),
        .O(dac_data6__90_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    dac_data6__90_carry_i_3
       (.I0(dac_data6__30_carry_n_7),
        .I1(dac_data6__0_carry_n_4),
        .O(dac_data6__90_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    dac_data6__90_carry_i_4
       (.I0(dac_data6__90_carry_i_1_n_0),
        .I1(dac_data6__30_carry_n_4),
        .I2(dac_data6__59_carry_n_7),
        .I3(dac_data6__0_carry__0_n_5),
        .O(dac_data6__90_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9666)) 
    dac_data6__90_carry_i_5
       (.I0(dac_data6__30_carry_n_5),
        .I1(dac_data6__0_carry__0_n_6),
        .I2(dac_data6__0_carry__0_n_7),
        .I3(dac_data6__30_carry_n_6),
        .O(dac_data6__90_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    dac_data6__90_carry_i_6
       (.I0(dac_data6__0_carry_n_4),
        .I1(dac_data6__30_carry_n_7),
        .I2(dac_data6__30_carry_n_6),
        .I3(dac_data6__0_carry__0_n_7),
        .O(dac_data6__90_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    dac_data6__90_carry_i_7
       (.I0(dac_data6__0_carry_n_4),
        .I1(dac_data6__30_carry_n_7),
        .O(dac_data6__90_carry_i_7_n_0));
  FDRE \dac_data_reg[0] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(p_1_in[0]),
        .Q(Q[0]),
        .R(sine_rom_inst_n_184));
  FDRE \dac_data_reg[1] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(p_1_in[1]),
        .Q(Q[1]),
        .R(sine_rom_inst_n_184));
  FDRE \dac_data_reg[2] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(p_1_in[2]),
        .Q(Q[2]),
        .R(sine_rom_inst_n_184));
  FDRE \dac_data_reg[3] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(p_1_in[3]),
        .Q(Q[3]),
        .R(sine_rom_inst_n_184));
  FDRE \dac_data_reg[4] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(p_1_in[4]),
        .Q(Q[4]),
        .R(sine_rom_inst_n_184));
  FDRE \dac_data_reg[5] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(p_1_in[5]),
        .Q(Q[5]),
        .R(sine_rom_inst_n_184));
  FDRE \dac_data_reg[6] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(p_1_in[6]),
        .Q(Q[6]),
        .R(sine_rom_inst_n_184));
  FDSE \dac_data_reg[7] 
       (.C(dac_clk_out),
        .CE(1'b1),
        .D(p_1_in[7]),
        .Q(Q[7]),
        .S(SS));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_1__0
       (.I0(dac_data2_carry__3_n_5),
        .I1(dac_data2_carry__3_n_4),
        .O(i__carry__0_i_1__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1__1
       (.I0(dac_data6__90_carry__0_n_6),
        .O(p_0_out[8]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_2__0
       (.I0(dac_data2_carry__3_n_7),
        .I1(dac_data2_carry__3_n_6),
        .O(i__carry__0_i_2__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_2__1
       (.I0(dac_data6__90_carry__0_n_7),
        .O(p_0_out[7]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_3__0
       (.I0(dac_data2_carry__2_n_5),
        .I1(dac_data2_carry__2_n_4),
        .O(i__carry__0_i_3__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_3__1
       (.I0(dac_data6__90_carry_n_4),
        .O(p_0_out[6]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__0_i_4__0
       (.I0(dac_data2_carry__2_n_7),
        .I1(dac_data2_carry__2_n_6),
        .O(i__carry__0_i_4__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_4__1
       (.I0(dac_data6__90_carry_n_5),
        .O(p_0_out[5]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_5
       (.I0(dac_data2_carry__3_n_4),
        .I1(dac_data2_carry__3_n_5),
        .O(i__carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_6
       (.I0(dac_data2_carry__3_n_6),
        .I1(dac_data2_carry__3_n_7),
        .O(i__carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_7
       (.I0(dac_data2_carry__2_n_4),
        .I1(dac_data2_carry__2_n_5),
        .O(i__carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_8
       (.I0(dac_data2_carry__2_n_6),
        .I1(dac_data2_carry__2_n_7),
        .O(i__carry__0_i_8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_1__1
       (.I0(dac_data6__90_carry__1_n_6),
        .O(p_0_out[12]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__1_i_2__0
       (.I0(dac_data2_carry__4_n_5),
        .I1(dac_data2_carry__4_n_4),
        .O(i__carry__1_i_2__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_2__1
       (.I0(dac_data6__90_carry__1_n_7),
        .O(p_0_out[11]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry__1_i_3__0
       (.I0(dac_data2_carry__4_n_7),
        .I1(dac_data2_carry__4_n_6),
        .O(i__carry__1_i_3__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_3__1
       (.I0(dac_data6__90_carry__0_n_4),
        .O(p_0_out[10]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_4__1
       (.I0(dac_data6__90_carry__0_n_5),
        .O(p_0_out[9]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__1_i_5
       (.I0(dac_data2_carry__4_n_4),
        .I1(dac_data2_carry__4_n_5),
        .O(i__carry__1_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__1_i_6
       (.I0(dac_data2_carry__4_n_6),
        .I1(dac_data2_carry__4_n_7),
        .O(i__carry__1_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_3__0
       (.I0(dac_data6__90_carry__1_n_4),
        .O(p_0_out[14]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_4__0
       (.I0(dac_data6__90_carry__1_n_5),
        .O(p_0_out[13]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1__0
       (.I0(dac_data6__0_carry_n_7),
        .O(p_0_out[0]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_1__1
       (.I0(dac_data2_carry_n_4),
        .I1(dac_data2_carry_n_5),
        .O(i__carry_i_1__1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_2__0
       (.I0(dac_data2_carry__1_n_5),
        .I1(dac_data2_carry__1_n_4),
        .O(i__carry_i_2__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_2__1
       (.I0(dac_data6__90_carry_n_6),
        .O(p_0_out[4]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_3__0
       (.I0(dac_data2_carry__1_n_7),
        .I1(dac_data2_carry__1_n_6),
        .O(i__carry_i_3__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_3__1
       (.I0(dac_data6__90_carry_n_7),
        .O(p_0_out[3]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_4__0
       (.I0(dac_data2_carry__0_n_5),
        .I1(dac_data2_carry__0_n_4),
        .O(i__carry_i_4__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_4__1
       (.I0(dac_data6__0_carry_n_5),
        .O(p_0_out[2]));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_5__0
       (.I0(dac_data2_carry__0_n_7),
        .I1(dac_data2_carry__0_n_6),
        .O(i__carry_i_5__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_5__1
       (.I0(dac_data6__0_carry_n_6),
        .O(p_0_out[1]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_6
       (.I0(dac_data2_carry__1_n_4),
        .I1(dac_data2_carry__1_n_5),
        .O(i__carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_7
       (.I0(dac_data2_carry__1_n_6),
        .I1(dac_data2_carry__1_n_7),
        .O(i__carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_8
       (.I0(dac_data2_carry__0_n_4),
        .I1(dac_data2_carry__0_n_5),
        .O(i__carry_i_8_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_9
       (.I0(dac_data2_carry__0_n_6),
        .I1(dac_data2_carry__0_n_7),
        .O(i__carry_i_9_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[0]_i_2 
       (.I0(phase_inc[3]),
        .I1(phase_acc_reg[3]),
        .O(\phase_acc[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[0]_i_3 
       (.I0(phase_inc[2]),
        .I1(phase_acc_reg[2]),
        .O(\phase_acc[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[0]_i_4 
       (.I0(phase_inc[1]),
        .I1(phase_acc_reg[1]),
        .O(\phase_acc[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[0]_i_5 
       (.I0(phase_inc[0]),
        .I1(phase_acc_reg[0]),
        .O(\phase_acc[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[12]_i_2 
       (.I0(phase_inc[15]),
        .I1(phase_acc_reg[15]),
        .O(\phase_acc[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[12]_i_3 
       (.I0(phase_inc[14]),
        .I1(phase_acc_reg[14]),
        .O(\phase_acc[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[12]_i_4 
       (.I0(phase_inc[13]),
        .I1(phase_acc_reg[13]),
        .O(\phase_acc[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[12]_i_5 
       (.I0(phase_inc[12]),
        .I1(phase_acc_reg[12]),
        .O(\phase_acc[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[16]_i_2 
       (.I0(phase_inc[19]),
        .I1(phase_acc_reg[19]),
        .O(\phase_acc[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[16]_i_3 
       (.I0(phase_inc[18]),
        .I1(phase_acc_reg[18]),
        .O(\phase_acc[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[16]_i_4 
       (.I0(phase_inc[17]),
        .I1(phase_acc_reg[17]),
        .O(\phase_acc[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[16]_i_5 
       (.I0(phase_inc[16]),
        .I1(phase_acc_reg[16]),
        .O(\phase_acc[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[20]_i_2 
       (.I0(phase_inc[23]),
        .I1(phase_acc_reg[23]),
        .O(\phase_acc[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[20]_i_3 
       (.I0(phase_inc[22]),
        .I1(phase_acc_reg[22]),
        .O(\phase_acc[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[20]_i_4 
       (.I0(phase_inc[21]),
        .I1(phase_acc_reg[21]),
        .O(\phase_acc[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[20]_i_5 
       (.I0(phase_inc[20]),
        .I1(phase_acc_reg[20]),
        .O(\phase_acc[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[24]_i_2 
       (.I0(phase_inc[27]),
        .I1(phase_acc_reg[27]),
        .O(\phase_acc[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[24]_i_3 
       (.I0(phase_inc[26]),
        .I1(phase_acc_reg[26]),
        .O(\phase_acc[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[24]_i_4 
       (.I0(phase_inc[25]),
        .I1(phase_acc_reg[25]),
        .O(\phase_acc[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[24]_i_5 
       (.I0(phase_inc[24]),
        .I1(phase_acc_reg[24]),
        .O(\phase_acc[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[28]_i_2 
       (.I0(phase_inc[31]),
        .I1(phase_acc_reg[31]),
        .O(\phase_acc[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[28]_i_3 
       (.I0(phase_inc[30]),
        .I1(phase_acc_reg[30]),
        .O(\phase_acc[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[28]_i_4 
       (.I0(phase_inc[29]),
        .I1(phase_acc_reg[29]),
        .O(\phase_acc[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[28]_i_5 
       (.I0(phase_inc[28]),
        .I1(phase_acc_reg[28]),
        .O(\phase_acc[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[4]_i_2 
       (.I0(phase_inc[7]),
        .I1(phase_acc_reg[7]),
        .O(\phase_acc[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[4]_i_3 
       (.I0(phase_inc[6]),
        .I1(phase_acc_reg[6]),
        .O(\phase_acc[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[4]_i_4 
       (.I0(phase_inc[5]),
        .I1(phase_acc_reg[5]),
        .O(\phase_acc[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[4]_i_5 
       (.I0(phase_inc[4]),
        .I1(phase_acc_reg[4]),
        .O(\phase_acc[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[8]_i_2 
       (.I0(phase_inc[11]),
        .I1(phase_acc_reg[11]),
        .O(\phase_acc[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[8]_i_3 
       (.I0(phase_inc[10]),
        .I1(phase_acc_reg[10]),
        .O(\phase_acc[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[8]_i_4 
       (.I0(phase_inc[9]),
        .I1(phase_acc_reg[9]),
        .O(\phase_acc[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \phase_acc[8]_i_5 
       (.I0(phase_inc[8]),
        .I1(phase_acc_reg[8]),
        .O(\phase_acc[8]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[0] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[0]_i_1_n_7 ),
        .Q(phase_acc_reg[0]),
        .R(SS));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \phase_acc_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\phase_acc_reg[0]_i_1_n_0 ,\phase_acc_reg[0]_i_1_n_1 ,\phase_acc_reg[0]_i_1_n_2 ,\phase_acc_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(phase_inc[3:0]),
        .O({\phase_acc_reg[0]_i_1_n_4 ,\phase_acc_reg[0]_i_1_n_5 ,\phase_acc_reg[0]_i_1_n_6 ,\phase_acc_reg[0]_i_1_n_7 }),
        .S({\phase_acc[0]_i_2_n_0 ,\phase_acc[0]_i_3_n_0 ,\phase_acc[0]_i_4_n_0 ,\phase_acc[0]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[10] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[8]_i_1_n_5 ),
        .Q(phase_acc_reg[10]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[11] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[8]_i_1_n_4 ),
        .Q(phase_acc_reg[11]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[12] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[12]_i_1_n_7 ),
        .Q(phase_acc_reg[12]),
        .R(SS));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \phase_acc_reg[12]_i_1 
       (.CI(\phase_acc_reg[8]_i_1_n_0 ),
        .CO({\phase_acc_reg[12]_i_1_n_0 ,\phase_acc_reg[12]_i_1_n_1 ,\phase_acc_reg[12]_i_1_n_2 ,\phase_acc_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(phase_inc[15:12]),
        .O({\phase_acc_reg[12]_i_1_n_4 ,\phase_acc_reg[12]_i_1_n_5 ,\phase_acc_reg[12]_i_1_n_6 ,\phase_acc_reg[12]_i_1_n_7 }),
        .S({\phase_acc[12]_i_2_n_0 ,\phase_acc[12]_i_3_n_0 ,\phase_acc[12]_i_4_n_0 ,\phase_acc[12]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[13] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[12]_i_1_n_6 ),
        .Q(phase_acc_reg[13]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[14] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[12]_i_1_n_5 ),
        .Q(phase_acc_reg[14]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[15] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[12]_i_1_n_4 ),
        .Q(phase_acc_reg[15]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[16] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[16]_i_1_n_7 ),
        .Q(phase_acc_reg[16]),
        .R(SS));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \phase_acc_reg[16]_i_1 
       (.CI(\phase_acc_reg[12]_i_1_n_0 ),
        .CO({\phase_acc_reg[16]_i_1_n_0 ,\phase_acc_reg[16]_i_1_n_1 ,\phase_acc_reg[16]_i_1_n_2 ,\phase_acc_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(phase_inc[19:16]),
        .O({\phase_acc_reg[16]_i_1_n_4 ,\phase_acc_reg[16]_i_1_n_5 ,\phase_acc_reg[16]_i_1_n_6 ,\phase_acc_reg[16]_i_1_n_7 }),
        .S({\phase_acc[16]_i_2_n_0 ,\phase_acc[16]_i_3_n_0 ,\phase_acc[16]_i_4_n_0 ,\phase_acc[16]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[17] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[16]_i_1_n_6 ),
        .Q(phase_acc_reg[17]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[18] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[16]_i_1_n_5 ),
        .Q(phase_acc_reg[18]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[19] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[16]_i_1_n_4 ),
        .Q(phase_acc_reg[19]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[1] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[0]_i_1_n_6 ),
        .Q(phase_acc_reg[1]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[20] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[20]_i_1_n_7 ),
        .Q(phase_acc_reg[20]),
        .R(SS));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \phase_acc_reg[20]_i_1 
       (.CI(\phase_acc_reg[16]_i_1_n_0 ),
        .CO({\phase_acc_reg[20]_i_1_n_0 ,\phase_acc_reg[20]_i_1_n_1 ,\phase_acc_reg[20]_i_1_n_2 ,\phase_acc_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(phase_inc[23:20]),
        .O({\phase_acc_reg[20]_i_1_n_4 ,\phase_acc_reg[20]_i_1_n_5 ,\phase_acc_reg[20]_i_1_n_6 ,\phase_acc_reg[20]_i_1_n_7 }),
        .S({\phase_acc[20]_i_2_n_0 ,\phase_acc[20]_i_3_n_0 ,\phase_acc[20]_i_4_n_0 ,\phase_acc[20]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[21] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[20]_i_1_n_6 ),
        .Q(phase_acc_reg[21]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[22] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[20]_i_1_n_5 ),
        .Q(phase_acc_reg[22]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[23] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[20]_i_1_n_4 ),
        .Q(phase_acc_reg[23]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[24] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[24]_i_1_n_7 ),
        .Q(phase_acc_reg[24]),
        .R(SS));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \phase_acc_reg[24]_i_1 
       (.CI(\phase_acc_reg[20]_i_1_n_0 ),
        .CO({\phase_acc_reg[24]_i_1_n_0 ,\phase_acc_reg[24]_i_1_n_1 ,\phase_acc_reg[24]_i_1_n_2 ,\phase_acc_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(phase_inc[27:24]),
        .O({\phase_acc_reg[24]_i_1_n_4 ,\phase_acc_reg[24]_i_1_n_5 ,\phase_acc_reg[24]_i_1_n_6 ,\phase_acc_reg[24]_i_1_n_7 }),
        .S({\phase_acc[24]_i_2_n_0 ,\phase_acc[24]_i_3_n_0 ,\phase_acc[24]_i_4_n_0 ,\phase_acc[24]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[25] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[24]_i_1_n_6 ),
        .Q(phase_acc_reg[25]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[26] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[24]_i_1_n_5 ),
        .Q(phase_acc_reg[26]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[27] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[24]_i_1_n_4 ),
        .Q(phase_acc_reg[27]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[28] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[28]_i_1_n_7 ),
        .Q(phase_acc_reg[28]),
        .R(SS));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \phase_acc_reg[28]_i_1 
       (.CI(\phase_acc_reg[24]_i_1_n_0 ),
        .CO({\NLW_phase_acc_reg[28]_i_1_CO_UNCONNECTED [3],\phase_acc_reg[28]_i_1_n_1 ,\phase_acc_reg[28]_i_1_n_2 ,\phase_acc_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,phase_inc[30:28]}),
        .O({\phase_acc_reg[28]_i_1_n_4 ,\phase_acc_reg[28]_i_1_n_5 ,\phase_acc_reg[28]_i_1_n_6 ,\phase_acc_reg[28]_i_1_n_7 }),
        .S({\phase_acc[28]_i_2_n_0 ,\phase_acc[28]_i_3_n_0 ,\phase_acc[28]_i_4_n_0 ,\phase_acc[28]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[29] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[28]_i_1_n_6 ),
        .Q(phase_acc_reg[29]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[2] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[0]_i_1_n_5 ),
        .Q(phase_acc_reg[2]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[30] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[28]_i_1_n_5 ),
        .Q(phase_acc_reg[30]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[31] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[28]_i_1_n_4 ),
        .Q(phase_acc_reg[31]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[3] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[0]_i_1_n_4 ),
        .Q(phase_acc_reg[3]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[4] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[4]_i_1_n_7 ),
        .Q(phase_acc_reg[4]),
        .R(SS));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \phase_acc_reg[4]_i_1 
       (.CI(\phase_acc_reg[0]_i_1_n_0 ),
        .CO({\phase_acc_reg[4]_i_1_n_0 ,\phase_acc_reg[4]_i_1_n_1 ,\phase_acc_reg[4]_i_1_n_2 ,\phase_acc_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(phase_inc[7:4]),
        .O({\phase_acc_reg[4]_i_1_n_4 ,\phase_acc_reg[4]_i_1_n_5 ,\phase_acc_reg[4]_i_1_n_6 ,\phase_acc_reg[4]_i_1_n_7 }),
        .S({\phase_acc[4]_i_2_n_0 ,\phase_acc[4]_i_3_n_0 ,\phase_acc[4]_i_4_n_0 ,\phase_acc[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[5] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[4]_i_1_n_6 ),
        .Q(phase_acc_reg[5]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[6] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[4]_i_1_n_5 ),
        .Q(phase_acc_reg[6]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[7] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[4]_i_1_n_4 ),
        .Q(phase_acc_reg[7]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[8] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[8]_i_1_n_7 ),
        .Q(phase_acc_reg[8]),
        .R(SS));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \phase_acc_reg[8]_i_1 
       (.CI(\phase_acc_reg[4]_i_1_n_0 ),
        .CO({\phase_acc_reg[8]_i_1_n_0 ,\phase_acc_reg[8]_i_1_n_1 ,\phase_acc_reg[8]_i_1_n_2 ,\phase_acc_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(phase_inc[11:8]),
        .O({\phase_acc_reg[8]_i_1_n_4 ,\phase_acc_reg[8]_i_1_n_5 ,\phase_acc_reg[8]_i_1_n_6 ,\phase_acc_reg[8]_i_1_n_7 }),
        .S({\phase_acc[8]_i_2_n_0 ,\phase_acc[8]_i_3_n_0 ,\phase_acc[8]_i_4_n_0 ,\phase_acc[8]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \phase_acc_reg[9] 
       (.C(dac_clk_out),
        .CE(enable),
        .D(\phase_acc_reg[8]_i_1_n_6 ),
        .Q(phase_acc_reg[9]),
        .R(SS));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 phase_sum_carry
       (.CI(1'b0),
        .CO({phase_sum_carry_n_0,phase_sum_carry_n_1,phase_sum_carry_n_2,phase_sum_carry_n_3}),
        .CYINIT(1'b0),
        .DI(phase_acc_reg[3:0]),
        .O(NLW_phase_sum_carry_O_UNCONNECTED[3:0]),
        .S({phase_sum_carry_i_1_n_0,phase_sum_carry_i_2_n_0,phase_sum_carry_i_3_n_0,phase_sum_carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 phase_sum_carry__0
       (.CI(phase_sum_carry_n_0),
        .CO({phase_sum_carry__0_n_0,phase_sum_carry__0_n_1,phase_sum_carry__0_n_2,phase_sum_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(phase_acc_reg[7:4]),
        .O(NLW_phase_sum_carry__0_O_UNCONNECTED[3:0]),
        .S({phase_sum_carry__0_i_1_n_0,phase_sum_carry__0_i_2_n_0,phase_sum_carry__0_i_3_n_0,phase_sum_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__0_i_1
       (.I0(phase_acc_reg[7]),
        .I1(phase_ofst[7]),
        .O(phase_sum_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__0_i_2
       (.I0(phase_acc_reg[6]),
        .I1(phase_ofst[6]),
        .O(phase_sum_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__0_i_3
       (.I0(phase_acc_reg[5]),
        .I1(phase_ofst[5]),
        .O(phase_sum_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__0_i_4
       (.I0(phase_acc_reg[4]),
        .I1(phase_ofst[4]),
        .O(phase_sum_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 phase_sum_carry__1
       (.CI(phase_sum_carry__0_n_0),
        .CO({phase_sum_carry__1_n_0,phase_sum_carry__1_n_1,phase_sum_carry__1_n_2,phase_sum_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(phase_acc_reg[11:8]),
        .O(NLW_phase_sum_carry__1_O_UNCONNECTED[3:0]),
        .S({phase_sum_carry__1_i_1_n_0,phase_sum_carry__1_i_2_n_0,phase_sum_carry__1_i_3_n_0,phase_sum_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__1_i_1
       (.I0(phase_acc_reg[11]),
        .I1(phase_ofst[11]),
        .O(phase_sum_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__1_i_2
       (.I0(phase_acc_reg[10]),
        .I1(phase_ofst[10]),
        .O(phase_sum_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__1_i_3
       (.I0(phase_acc_reg[9]),
        .I1(phase_ofst[9]),
        .O(phase_sum_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__1_i_4
       (.I0(phase_acc_reg[8]),
        .I1(phase_ofst[8]),
        .O(phase_sum_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 phase_sum_carry__2
       (.CI(phase_sum_carry__1_n_0),
        .CO({phase_sum_carry__2_n_0,phase_sum_carry__2_n_1,phase_sum_carry__2_n_2,phase_sum_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(phase_acc_reg[15:12]),
        .O(NLW_phase_sum_carry__2_O_UNCONNECTED[3:0]),
        .S({phase_sum_carry__2_i_1_n_0,phase_sum_carry__2_i_2_n_0,phase_sum_carry__2_i_3_n_0,phase_sum_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__2_i_1
       (.I0(phase_acc_reg[15]),
        .I1(phase_ofst[15]),
        .O(phase_sum_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__2_i_2
       (.I0(phase_acc_reg[14]),
        .I1(phase_ofst[14]),
        .O(phase_sum_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__2_i_3
       (.I0(phase_acc_reg[13]),
        .I1(phase_ofst[13]),
        .O(phase_sum_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__2_i_4
       (.I0(phase_acc_reg[12]),
        .I1(phase_ofst[12]),
        .O(phase_sum_carry__2_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 phase_sum_carry__3
       (.CI(phase_sum_carry__2_n_0),
        .CO({phase_sum_carry__3_n_0,phase_sum_carry__3_n_1,phase_sum_carry__3_n_2,phase_sum_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(phase_acc_reg[19:16]),
        .O(NLW_phase_sum_carry__3_O_UNCONNECTED[3:0]),
        .S({phase_sum_carry__3_i_1_n_0,phase_sum_carry__3_i_2_n_0,phase_sum_carry__3_i_3_n_0,phase_sum_carry__3_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__3_i_1
       (.I0(phase_acc_reg[19]),
        .I1(phase_ofst[19]),
        .O(phase_sum_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__3_i_2
       (.I0(phase_acc_reg[18]),
        .I1(phase_ofst[18]),
        .O(phase_sum_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__3_i_3
       (.I0(phase_acc_reg[17]),
        .I1(phase_ofst[17]),
        .O(phase_sum_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__3_i_4
       (.I0(phase_acc_reg[16]),
        .I1(phase_ofst[16]),
        .O(phase_sum_carry__3_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 phase_sum_carry__4
       (.CI(phase_sum_carry__3_n_0),
        .CO({phase_sum_carry__4_n_0,phase_sum_carry__4_n_1,phase_sum_carry__4_n_2,phase_sum_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(phase_acc_reg[23:20]),
        .O(NLW_phase_sum_carry__4_O_UNCONNECTED[3:0]),
        .S({phase_sum_carry__4_i_1_n_0,phase_sum_carry__4_i_2_n_0,phase_sum_carry__4_i_3_n_0,phase_sum_carry__4_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__4_i_1
       (.I0(phase_acc_reg[23]),
        .I1(phase_ofst[23]),
        .O(phase_sum_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__4_i_2
       (.I0(phase_acc_reg[22]),
        .I1(phase_ofst[22]),
        .O(phase_sum_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__4_i_3
       (.I0(phase_acc_reg[21]),
        .I1(phase_ofst[21]),
        .O(phase_sum_carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__4_i_4
       (.I0(phase_acc_reg[20]),
        .I1(phase_ofst[20]),
        .O(phase_sum_carry__4_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 phase_sum_carry__5
       (.CI(phase_sum_carry__4_n_0),
        .CO({phase_sum_carry__5_n_0,phase_sum_carry__5_n_1,phase_sum_carry__5_n_2,phase_sum_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(phase_acc_reg[27:24]),
        .O(sel[3:0]),
        .S({phase_sum_carry__5_i_1_n_0,phase_sum_carry__5_i_2_n_0,phase_sum_carry__5_i_3_n_0,phase_sum_carry__5_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__5_i_1
       (.I0(phase_acc_reg[27]),
        .I1(phase_ofst[27]),
        .O(phase_sum_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__5_i_2
       (.I0(phase_acc_reg[26]),
        .I1(phase_ofst[26]),
        .O(phase_sum_carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__5_i_3
       (.I0(phase_acc_reg[25]),
        .I1(phase_ofst[25]),
        .O(phase_sum_carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__5_i_4
       (.I0(phase_acc_reg[24]),
        .I1(phase_ofst[24]),
        .O(phase_sum_carry__5_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 phase_sum_carry__6
       (.CI(phase_sum_carry__5_n_0),
        .CO({NLW_phase_sum_carry__6_CO_UNCONNECTED[3],phase_sum_carry__6_n_1,phase_sum_carry__6_n_2,phase_sum_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,phase_acc_reg[30:28]}),
        .O(sel[7:4]),
        .S({sine_rom_inst_n_32,sine_rom_inst_n_33,sine_rom_inst_n_34,sine_rom_inst_n_35}));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry_i_1
       (.I0(phase_acc_reg[3]),
        .I1(phase_ofst[3]),
        .O(phase_sum_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry_i_2
       (.I0(phase_acc_reg[2]),
        .I1(phase_ofst[2]),
        .O(phase_sum_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry_i_3
       (.I0(phase_acc_reg[1]),
        .I1(phase_ofst[1]),
        .O(phase_sum_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry_i_4
       (.I0(phase_acc_reg[0]),
        .I1(phase_ofst[0]),
        .O(phase_sum_carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \sample_data[7]_i_1 
       (.I0(reset_n),
        .O(SS));
  system_bd_fra_top_0_0_sine_lut sine_rom_inst
       (.ADDRARDADDR(sel),
        .CO(sine_rom_inst_n_4),
        .D(p_1_in),
        .DI({sine_rom_inst_n_0,sine_rom_inst_n_1,sine_rom_inst_n_2,sine_rom_inst_n_3}),
        .O({dac_data6__90_carry__2_n_6,dac_data6__90_carry__2_n_7}),
        .S({sine_rom_inst_n_5,sine_rom_inst_n_6,sine_rom_inst_n_7,sine_rom_inst_n_8}),
        .SR(sine_rom_inst_n_184),
        .\_inferred__1/i__carry ({sine_rom_inst_n_162,sine_rom_inst_n_163}),
        .\_inferred__1/i__carry__0 ({sine_rom_inst_n_158,sine_rom_inst_n_159,sine_rom_inst_n_160,sine_rom_inst_n_161}),
        .\_inferred__1/i__carry__0_0 ({sine_rom_inst_n_272,sine_rom_inst_n_273}),
        .\_inferred__1/i__carry__1 ({sine_rom_inst_n_13,sine_rom_inst_n_14,sine_rom_inst_n_15,sine_rom_inst_n_16}),
        .\_inferred__1/i__carry__1_0 ({sine_rom_inst_n_79,sine_rom_inst_n_80,sine_rom_inst_n_81,sine_rom_inst_n_82}),
        .\_inferred__1/i__carry__2 ({sine_rom_inst_n_9,sine_rom_inst_n_10,sine_rom_inst_n_11,sine_rom_inst_n_12}),
        .\_inferred__1/i__carry__2_0 ({sine_rom_inst_n_154,sine_rom_inst_n_155,sine_rom_inst_n_156,sine_rom_inst_n_157}),
        .\_inferred__1/i__carry__2_1 ({sine_rom_inst_n_238,sine_rom_inst_n_239}),
        .\_inferred__2/i__carry__0 (sine_rom_inst_n_153),
        .amplitude(amplitude),
        .\amplitude[0] ({sine_rom_inst_n_36,sine_rom_inst_n_37,sine_rom_inst_n_38,sine_rom_inst_n_39}),
        .\amplitude[0]_0 ({sine_rom_inst_n_40,sine_rom_inst_n_41,sine_rom_inst_n_42}),
        .\amplitude[1] ({sine_rom_inst_n_43,sine_rom_inst_n_44}),
        .\amplitude[1]_0 ({sine_rom_inst_n_214,sine_rom_inst_n_215,sine_rom_inst_n_216,sine_rom_inst_n_217}),
        .\amplitude[3] ({sine_rom_inst_n_49,sine_rom_inst_n_50,sine_rom_inst_n_51,sine_rom_inst_n_52}),
        .\amplitude[3]_0 ({sine_rom_inst_n_53,sine_rom_inst_n_54,sine_rom_inst_n_55}),
        .\amplitude[4] ({sine_rom_inst_n_56,sine_rom_inst_n_57}),
        .\amplitude[4]_0 ({sine_rom_inst_n_220,sine_rom_inst_n_221,sine_rom_inst_n_222,sine_rom_inst_n_223}),
        .\amplitude[6] ({sine_rom_inst_n_62,sine_rom_inst_n_63,sine_rom_inst_n_64}),
        .\amplitude[6]_0 ({sine_rom_inst_n_65,sine_rom_inst_n_66,sine_rom_inst_n_67,sine_rom_inst_n_68}),
        .\amplitude[6]_1 (sine_rom_inst_n_69),
        .dac_clk_out(dac_clk_out),
        .dac_data2_carry({dac_data4__8_carry__4_n_4,dac_data4__8_carry__4_n_5,dac_data4__8_carry__4_n_6,dac_data4__8_carry__4_n_7}),
        .dac_data2_carry_0({dac_data4__315_carry__0_n_4,dac_data4__315_carry__0_n_5,dac_data4__315_carry__0_n_6,dac_data4__315_carry__0_n_7}),
        .dac_data2_carry__0({dac_data4__315_carry__1_n_4,dac_data4__315_carry__1_n_5,dac_data4__315_carry__1_n_6,dac_data4__315_carry__1_n_7}),
        .dac_data2_carry__1(dac_data4),
        .dac_data2_carry__1_0({dac_data4__315_carry__2_n_4,dac_data4__315_carry__2_n_5,dac_data4__315_carry__2_n_6,dac_data4__315_carry__2_n_7}),
        .dac_data2_carry__1_i_5_0(sine_rom_inst_n_202),
        .dac_data2_carry__1_i_5_1({sine_rom_inst_n_203,sine_rom_inst_n_204,sine_rom_inst_n_205,sine_rom_inst_n_206}),
        .dac_data2_carry__3_i_5_0({sine_rom_inst_n_207,sine_rom_inst_n_208}),
        .dac_data2_carry__3_i_5_1({sine_rom_inst_n_209,sine_rom_inst_n_210,sine_rom_inst_n_211,sine_rom_inst_n_212}),
        .dac_data2_carry__3_i_5_2(sine_rom_inst_n_213),
        .dac_data2_carry__3_i_5_3(\_inferred__2/i__carry__2_n_0 ),
        .dac_data2_carry__5(sine_rom_inst_n_180),
        .dac_data2_carry__5_0(sine_rom_inst_n_181),
        .dac_data3({dac_data3[24:23],dac_data3[17:6]}),
        .dac_data4__114_carry__3({sine_rom_inst_n_166,sine_rom_inst_n_167,sine_rom_inst_n_168,sine_rom_inst_n_169}),
        .dac_data4__114_carry__3_0({sine_rom_inst_n_246,sine_rom_inst_n_247,sine_rom_inst_n_248,sine_rom_inst_n_249}),
        .dac_data4__114_carry__3_1({sine_rom_inst_n_250,sine_rom_inst_n_251,sine_rom_inst_n_252,sine_rom_inst_n_253}),
        .dac_data4__171_carry__2({sine_rom_inst_n_99,sine_rom_inst_n_100,sine_rom_inst_n_101,sine_rom_inst_n_102}),
        .dac_data4__171_carry__2_0(dac_data4__72_carry__2_n_4),
        .dac_data4__171_carry__2_1(dac_data4__171_carry__2_i_3_n_0),
        .dac_data4__171_carry__2_i_9_0({sine_rom_inst_n_164,sine_rom_inst_n_165}),
        .dac_data4__171_carry__3({sine_rom_inst_n_103,sine_rom_inst_n_104,sine_rom_inst_n_105,sine_rom_inst_n_106}),
        .dac_data4__171_carry__3_0({sine_rom_inst_n_257,sine_rom_inst_n_258,sine_rom_inst_n_259,sine_rom_inst_n_260}),
        .dac_data4__171_carry__3_1({dac_data4__114_carry__2_n_4,dac_data4__114_carry__2_n_5,dac_data4__114_carry__2_n_6,dac_data4__114_carry__2_n_7}),
        .dac_data4__171_carry__3_2({dac_data4__72_carry__3_n_5,dac_data4__72_carry__3_n_6,dac_data4__72_carry__3_n_7}),
        .dac_data4__171_carry__4({sine_rom_inst_n_107,sine_rom_inst_n_108,sine_rom_inst_n_109,sine_rom_inst_n_110}),
        .dac_data4__171_carry__4_0({sine_rom_inst_n_261,sine_rom_inst_n_262,sine_rom_inst_n_263,sine_rom_inst_n_264}),
        .dac_data4__171_carry__4_1(dac_data4__72_carry__3_n_0),
        .dac_data4__171_carry__4_2({dac_data4__114_carry__3_n_5,dac_data4__114_carry__3_n_6,dac_data4__114_carry__3_n_7}),
        .dac_data4__171_carry__4_i_10_0({sine_rom_inst_n_177,sine_rom_inst_n_178,sine_rom_inst_n_179}),
        .dac_data4__171_carry__4_i_9_0({sine_rom_inst_n_173,sine_rom_inst_n_174,sine_rom_inst_n_175,sine_rom_inst_n_176}),
        .dac_data4__171_carry__5({sine_rom_inst_n_111,sine_rom_inst_n_112,sine_rom_inst_n_113}),
        .dac_data4__171_carry__5_0({sine_rom_inst_n_265,sine_rom_inst_n_266,sine_rom_inst_n_267,sine_rom_inst_n_268}),
        .dac_data4__171_carry__5_1({sine_rom_inst_n_269,sine_rom_inst_n_270,sine_rom_inst_n_271}),
        .dac_data4__171_carry__5_2(dac_data4__114_carry__3_n_0),
        .dac_data4__254_carry({dac_data6__0_carry_n_5,dac_data6__0_carry_n_6,dac_data6__0_carry_n_7}),
        .dac_data4__254_carry_0({dac_data4__72_carry_n_5,dac_data4__72_carry_n_6}),
        .dac_data4__254_carry__0({dac_data4__171_carry_n_4,dac_data4__171_carry_n_5,dac_data4__171_carry_n_6,dac_data4__171_carry_n_7}),
        .dac_data4__254_carry__1({dac_data6__90_carry__0_n_4,dac_data6__90_carry__0_n_5,dac_data6__90_carry__0_n_6,dac_data6__90_carry__0_n_7}),
        .dac_data4__254_carry__1_0({dac_data4__171_carry__0_n_4,dac_data4__171_carry__0_n_5,dac_data4__171_carry__0_n_6,dac_data4__171_carry__0_n_7}),
        .dac_data4__254_carry__2({dac_data4__171_carry__1_n_4,dac_data4__171_carry__1_n_5,dac_data4__171_carry__1_n_6,dac_data4__171_carry__1_n_7}),
        .dac_data4__254_carry__3({dac_data4__171_carry__2_n_4,dac_data4__171_carry__2_n_5,dac_data4__171_carry__2_n_6,dac_data4__171_carry__2_n_7}),
        .dac_data4__254_carry__4({dac_data4__171_carry__3_n_4,dac_data4__171_carry__3_n_5,dac_data4__171_carry__3_n_6,dac_data4__171_carry__3_n_7}),
        .dac_data4__254_carry__5({dac_data4__171_carry__4_n_4,dac_data4__171_carry__4_n_5,dac_data4__171_carry__4_n_6,dac_data4__171_carry__4_n_7}),
        .dac_data4__72_carry__2({dac_data4__8_carry__5_n_4,dac_data4__8_carry__5_n_5,dac_data4__8_carry__5_n_6,dac_data4__8_carry__5_n_7}),
        .dac_data4__72_carry__3({sine_rom_inst_n_243,sine_rom_inst_n_244,sine_rom_inst_n_245}),
        .dac_data4__72_carry__3_0({dac_data4__8_carry__6_n_4,dac_data4__8_carry__6_n_5,dac_data4__8_carry__6_n_6,dac_data4__8_carry__6_n_7}),
        .dac_data4__72_carry__3_1(dac_data4__8_carry__6_n_0),
        .dac_data4__72_carry__3_i_1_0({sine_rom_inst_n_18,sine_rom_inst_n_19,sine_rom_inst_n_20,sine_rom_inst_n_21}),
        .dac_data4__72_carry__3_i_1_1({sine_rom_inst_n_28,sine_rom_inst_n_29,sine_rom_inst_n_30,sine_rom_inst_n_31}),
        .dac_data4__72_carry__3_i_1_2({sine_rom_inst_n_170,sine_rom_inst_n_171,sine_rom_inst_n_172}),
        .dac_data4__72_carry__3_i_1_3({sine_rom_inst_n_199,sine_rom_inst_n_200,sine_rom_inst_n_201}),
        .dac_data4__8_carry__0({dac_data6__90_carry__1_n_4,dac_data6__90_carry__1_n_5,dac_data6__90_carry__1_n_6,dac_data6__90_carry__1_n_7}),
        .dac_data4__8_carry__0_0({dac_data6__90_carry_n_4,dac_data6__90_carry_n_5,dac_data6__90_carry_n_6,dac_data6__90_carry_n_7}),
        .dac_data4__8_carry__1_i_6(\_inferred__1/i__carry__2_n_0 ),
        .dac_data4__8_carry__1_i_9_0({sine_rom_inst_n_23,sine_rom_inst_n_24,sine_rom_inst_n_25,sine_rom_inst_n_26}),
        .dac_data4__8_carry__1_i_9_1({sine_rom_inst_n_87,sine_rom_inst_n_88,sine_rom_inst_n_89,sine_rom_inst_n_90}),
        .dac_data4__8_carry__1_i_9_2({sine_rom_inst_n_91,sine_rom_inst_n_92,sine_rom_inst_n_93,sine_rom_inst_n_94}),
        .dac_data4__8_carry__1_i_9_3({sine_rom_inst_n_187,sine_rom_inst_n_188,sine_rom_inst_n_189,sine_rom_inst_n_190}),
        .dac_data4__8_carry__1_i_9_4({sine_rom_inst_n_191,sine_rom_inst_n_192,sine_rom_inst_n_193,sine_rom_inst_n_194}),
        .dac_data4__8_carry__1_i_9_5({sine_rom_inst_n_195,sine_rom_inst_n_196,sine_rom_inst_n_197,sine_rom_inst_n_198}),
        .dac_data4__8_carry__2(dac_data4__8_carry__2_i_11_n_0),
        .dac_data4__8_carry__2_i_10_0({sine_rom_inst_n_241,sine_rom_inst_n_242}),
        .dac_data4__8_carry__3(sine_rom_inst_n_122),
        .dac_data4__8_carry__3_0(dac_data4__8_carry__3_i_10_n_0),
        .dac_data4__8_carry__3_1(dac_data4__8_carry__1_i_13_n_0),
        .dac_data4__8_carry__3_i_9_0({sine_rom_inst_n_254,sine_rom_inst_n_255,sine_rom_inst_n_256}),
        .dac_data4__8_carry__4({sine_rom_inst_n_123,sine_rom_inst_n_124,sine_rom_inst_n_125,sine_rom_inst_n_126}),
        .dac_data4__8_carry__5({sine_rom_inst_n_127,sine_rom_inst_n_128,sine_rom_inst_n_129,sine_rom_inst_n_130}),
        .dac_data4__8_carry__6(sine_rom_inst_n_17),
        .dac_data4__8_carry__6_0(sine_rom_inst_n_22),
        .dac_data4__8_carry__6_1(sine_rom_inst_n_27),
        .dac_data4__8_carry__6_2({sine_rom_inst_n_149,sine_rom_inst_n_150,sine_rom_inst_n_151,sine_rom_inst_n_152}),
        .dac_data6(dac_data6),
        .dac_data6__0_carry(sine_rom_inst_n_240),
        .dac_data6__30_carry__0({sine_rom_inst_n_72,sine_rom_inst_n_73,sine_rom_inst_n_74}),
        .dac_data6__30_carry__0_0({sine_rom_inst_n_230,sine_rom_inst_n_231,sine_rom_inst_n_232}),
        .dac_data6__30_carry__1({sine_rom_inst_n_233,sine_rom_inst_n_234,sine_rom_inst_n_235,sine_rom_inst_n_236}),
        .dac_data6__59_carry__0({sine_rom_inst_n_75,sine_rom_inst_n_76,sine_rom_inst_n_77,sine_rom_inst_n_78}),
        .dac_data6__59_carry__1(sine_rom_inst_n_237),
        .dac_data6__90_carry__0(dac_data6__0_carry__0_n_4),
        .dac_data6__90_carry__1({sine_rom_inst_n_83,sine_rom_inst_n_84,sine_rom_inst_n_85,sine_rom_inst_n_86}),
        .dac_data6__90_carry__1_0({sine_rom_inst_n_185,sine_rom_inst_n_186}),
        .dac_data6__90_carry__1_1({dac_data6__59_carry_n_4,dac_data6__59_carry_n_5,dac_data6__59_carry_n_6}),
        .dac_data6__90_carry__1_2({dac_data6__30_carry__0_n_4,dac_data6__30_carry__0_n_5,dac_data6__30_carry__0_n_6,dac_data6__30_carry__0_n_7}),
        .dac_data6__90_carry__1_3({dac_data6__0_carry__1_n_6,dac_data6__0_carry__1_n_7}),
        .dac_data6__90_carry__1_4({dac_data6__59_carry__0_n_4,dac_data6__59_carry__0_n_5,dac_data6__59_carry__0_n_6,dac_data6__59_carry__0_n_7}),
        .dac_data6__90_carry__1_5(dac_data6__0_carry__1_n_1),
        .dac_data6__90_carry__1_6({dac_data6__30_carry__1_n_6,dac_data6__30_carry__1_n_7}),
        .dac_data6__90_carry__1_7(dac_data6__30_carry__1_n_1),
        .dac_data6__90_carry__2({sine_rom_inst_n_95,sine_rom_inst_n_96,sine_rom_inst_n_97,sine_rom_inst_n_98}),
        .dac_data6__90_carry__2_0(p_0_out[16:15]),
        .dac_data6__90_carry__2_1({dac_data6__59_carry__1_n_6,dac_data6__59_carry__1_n_7}),
        .\dac_data_reg[0] (dac_data1),
        .\dac_data_reg[1] ({dac_data4__171_carry__5_n_4,dac_data4__171_carry__5_n_5,dac_data4__171_carry__5_n_6,dac_data4__171_carry__5_n_7}),
        .\dac_data_reg[1]_0 (dac_data4__254_carry__6_n_1),
        .\dac_data_reg[2] ({dac_data4__8_carry__3_n_4,dac_data4__8_carry__3_n_5,dac_data4__8_carry__3_n_6}),
        .\dac_data_reg[3] ({dac_data4__315_carry_n_4,dac_data4__315_carry_n_5,dac_data4__315_carry_n_6,dac_data4__315_carry_n_7}),
        .\dac_data_reg[7] ({dac_data2_carry__5_n_6,dac_data2_carry__5_n_7}),
        .\dac_data_reg[7]_0 ({dac_data2_carry_n_6,dac_data2_carry_n_7}),
        .data_reg_0({sine_rom_inst_n_45,sine_rom_inst_n_46,sine_rom_inst_n_47,sine_rom_inst_n_48}),
        .data_reg_1({sine_rom_inst_n_58,sine_rom_inst_n_59,sine_rom_inst_n_60,sine_rom_inst_n_61}),
        .data_reg_2({sine_rom_inst_n_70,sine_rom_inst_n_71}),
        .data_reg_3({sine_rom_inst_n_218,sine_rom_inst_n_219}),
        .data_reg_4({sine_rom_inst_n_224,sine_rom_inst_n_225}),
        .data_reg_5({sine_rom_inst_n_226,sine_rom_inst_n_227,sine_rom_inst_n_228,sine_rom_inst_n_229}),
        .enable(enable),
        .i__carry__2_i_1_0(dac_data4__315_carry__2_n_0),
        .i__carry__2_i_5_0({sine_rom_inst_n_131,sine_rom_inst_n_132,sine_rom_inst_n_133,sine_rom_inst_n_134}),
        .phase_acc_reg(phase_acc_reg[31:28]),
        .\phase_acc_reg[31] ({sine_rom_inst_n_32,sine_rom_inst_n_33,sine_rom_inst_n_34,sine_rom_inst_n_35}),
        .phase_ofst(phase_ofst[31:28]),
        .reset_n(reset_n));
endmodule

(* ORIG_REF_NAME = "fra_top" *) 
module system_bd_fra_top_0_0_fra_top
   (dac_clk_out,
    sample_out,
    dac_out,
    amplitude,
    clk,
    adc_in,
    enable,
    reset_n,
    phase_inc,
    phase_ofst);
  output dac_clk_out;
  output [7:0]sample_out;
  output [7:0]dac_out;
  input [7:0]amplitude;
  input clk;
  input [7:0]adc_in;
  input enable;
  input reset_n;
  input [31:0]phase_inc;
  input [31:0]phase_ofst;

  wire [7:0]adc_in;
  wire [7:0]amplitude;
  wire clk;
  wire dac_clk_out;
  wire [7:0]dac_data_reg;
  wire [7:0]dac_out;
  wire enable;
  wire [31:0]phase_inc;
  wire [31:0]phase_ofst;
  wire reset_n;
  wire [7:0]sample_out;
  wire u_dds_n_0;

  system_bd_fra_top_0_0_adc_if u_adc_if
       (.SR(u_dds_n_0),
        .adc_in(adc_in),
        .dac_clk_out(dac_clk_out),
        .sample_out(sample_out));
  system_bd_fra_top_0_0_clk_div_2 u_clk_div_2
       (.clk(clk),
        .dac_clk_out(dac_clk_out));
  system_bd_fra_top_0_0_dac_if u_dac_if
       (.Q(dac_data_reg),
        .SR(u_dds_n_0),
        .dac_clk_out(dac_clk_out),
        .dac_out(dac_out));
  system_bd_fra_top_0_0_dds u_dds
       (.Q(dac_data_reg),
        .SS(u_dds_n_0),
        .amplitude(amplitude),
        .dac_clk_out(dac_clk_out),
        .enable(enable),
        .phase_inc(phase_inc),
        .phase_ofst(phase_ofst),
        .reset_n(reset_n));
endmodule

(* ORIG_REF_NAME = "sine_lut" *) 
module system_bd_fra_top_0_0_sine_lut
   (DI,
    CO,
    S,
    \_inferred__1/i__carry__2 ,
    \_inferred__1/i__carry__1 ,
    dac_data4__8_carry__6,
    dac_data4__72_carry__3_i_1_0,
    dac_data4__8_carry__6_0,
    dac_data4__8_carry__1_i_9_0,
    dac_data4__8_carry__6_1,
    dac_data4__72_carry__3_i_1_1,
    \phase_acc_reg[31] ,
    \amplitude[0] ,
    \amplitude[0]_0 ,
    \amplitude[1] ,
    data_reg_0,
    \amplitude[3] ,
    \amplitude[3]_0 ,
    \amplitude[4] ,
    data_reg_1,
    \amplitude[6] ,
    \amplitude[6]_0 ,
    \amplitude[6]_1 ,
    data_reg_2,
    dac_data6__30_carry__0,
    dac_data6__59_carry__0,
    \_inferred__1/i__carry__1_0 ,
    dac_data6__90_carry__1,
    dac_data4__8_carry__1_i_9_1,
    dac_data4__8_carry__1_i_9_2,
    dac_data6__90_carry__2,
    dac_data4__171_carry__2,
    dac_data4__171_carry__3,
    dac_data4__171_carry__4,
    dac_data4__171_carry__5,
    D,
    dac_data4__8_carry__3,
    dac_data4__8_carry__4,
    dac_data4__8_carry__5,
    i__carry__2_i_5_0,
    dac_data3,
    dac_data4__8_carry__6_2,
    \_inferred__2/i__carry__0 ,
    \_inferred__1/i__carry__2_0 ,
    \_inferred__1/i__carry__0 ,
    \_inferred__1/i__carry ,
    dac_data4__171_carry__2_i_9_0,
    dac_data4__114_carry__3,
    dac_data4__72_carry__3_i_1_2,
    dac_data4__171_carry__4_i_9_0,
    dac_data4__171_carry__4_i_10_0,
    dac_data2_carry__5,
    dac_data2_carry__5_0,
    dac_data6__90_carry__2_0,
    SR,
    dac_data6__90_carry__1_0,
    dac_data4__8_carry__1_i_9_3,
    dac_data4__8_carry__1_i_9_4,
    dac_data4__8_carry__1_i_9_5,
    dac_data4__72_carry__3_i_1_3,
    dac_data2_carry__1_i_5_0,
    dac_data2_carry__1_i_5_1,
    dac_data2_carry__3_i_5_0,
    dac_data2_carry__3_i_5_1,
    dac_data2_carry__3_i_5_2,
    \amplitude[1]_0 ,
    data_reg_3,
    \amplitude[4]_0 ,
    data_reg_4,
    data_reg_5,
    dac_data6__30_carry__0_0,
    dac_data6__30_carry__1,
    dac_data6__59_carry__1,
    \_inferred__1/i__carry__2_1 ,
    dac_data6__0_carry,
    dac_data4__8_carry__2_i_10_0,
    dac_data4__72_carry__3,
    dac_data4__114_carry__3_0,
    dac_data4__114_carry__3_1,
    dac_data4__8_carry__3_i_9_0,
    dac_data4__171_carry__3_0,
    dac_data4__171_carry__4_0,
    dac_data4__171_carry__5_0,
    dac_data4__171_carry__5_1,
    \_inferred__1/i__carry__0_0 ,
    dac_clk_out,
    ADDRARDADDR,
    dac_data6,
    O,
    dac_data4__254_carry,
    dac_data4__254_carry__1,
    amplitude,
    dac_data4__8_carry__0,
    dac_data4__72_carry__2,
    dac_data4__72_carry__3_0,
    phase_acc_reg,
    phase_ofst,
    dac_data6__90_carry__1_1,
    dac_data6__90_carry__1_2,
    dac_data6__90_carry__1_3,
    dac_data6__90_carry__1_4,
    dac_data6__90_carry__1_5,
    dac_data6__90_carry__1_6,
    dac_data6__90_carry__1_7,
    dac_data4__254_carry__1_0,
    dac_data4__8_carry__0_0,
    dac_data4__254_carry__3,
    dac_data4__254_carry__4,
    dac_data4__254_carry__5,
    \dac_data_reg[1] ,
    \dac_data_reg[0] ,
    \dac_data_reg[2] ,
    \dac_data_reg[3] ,
    enable,
    \dac_data_reg[1]_0 ,
    dac_data2_carry__1,
    dac_data2_carry,
    dac_data2_carry_0,
    dac_data2_carry__0,
    dac_data2_carry__1_0,
    dac_data4__254_carry__2,
    dac_data4__254_carry__0,
    dac_data4__254_carry_0,
    dac_data4__171_carry__2_0,
    dac_data4__171_carry__3_1,
    dac_data4__171_carry__3_2,
    dac_data4__171_carry__4_1,
    dac_data4__171_carry__4_2,
    dac_data4__171_carry__5_2,
    \dac_data_reg[7] ,
    \dac_data_reg[7]_0 ,
    reset_n,
    dac_data4__8_carry__1_i_6,
    dac_data4__72_carry__3_1,
    i__carry__2_i_1_0,
    dac_data2_carry__3_i_5_3,
    dac_data6__90_carry__0,
    dac_data6__90_carry__2_1,
    dac_data4__8_carry__2,
    dac_data4__8_carry__3_0,
    dac_data4__8_carry__3_1,
    dac_data4__171_carry__2_1);
  output [3:0]DI;
  output [0:0]CO;
  output [3:0]S;
  output [3:0]\_inferred__1/i__carry__2 ;
  output [3:0]\_inferred__1/i__carry__1 ;
  output [0:0]dac_data4__8_carry__6;
  output [3:0]dac_data4__72_carry__3_i_1_0;
  output [0:0]dac_data4__8_carry__6_0;
  output [3:0]dac_data4__8_carry__1_i_9_0;
  output [0:0]dac_data4__8_carry__6_1;
  output [3:0]dac_data4__72_carry__3_i_1_1;
  output [3:0]\phase_acc_reg[31] ;
  output [3:0]\amplitude[0] ;
  output [2:0]\amplitude[0]_0 ;
  output [1:0]\amplitude[1] ;
  output [3:0]data_reg_0;
  output [3:0]\amplitude[3] ;
  output [2:0]\amplitude[3]_0 ;
  output [1:0]\amplitude[4] ;
  output [3:0]data_reg_1;
  output [2:0]\amplitude[6] ;
  output [3:0]\amplitude[6]_0 ;
  output [0:0]\amplitude[6]_1 ;
  output [1:0]data_reg_2;
  output [2:0]dac_data6__30_carry__0;
  output [3:0]dac_data6__59_carry__0;
  output [3:0]\_inferred__1/i__carry__1_0 ;
  output [3:0]dac_data6__90_carry__1;
  output [3:0]dac_data4__8_carry__1_i_9_1;
  output [3:0]dac_data4__8_carry__1_i_9_2;
  output [3:0]dac_data6__90_carry__2;
  output [3:0]dac_data4__171_carry__2;
  output [3:0]dac_data4__171_carry__3;
  output [3:0]dac_data4__171_carry__4;
  output [2:0]dac_data4__171_carry__5;
  output [7:0]D;
  output dac_data4__8_carry__3;
  output [3:0]dac_data4__8_carry__4;
  output [3:0]dac_data4__8_carry__5;
  output [3:0]i__carry__2_i_5_0;
  output [13:0]dac_data3;
  output [3:0]dac_data4__8_carry__6_2;
  output [0:0]\_inferred__2/i__carry__0 ;
  output [3:0]\_inferred__1/i__carry__2_0 ;
  output [3:0]\_inferred__1/i__carry__0 ;
  output [1:0]\_inferred__1/i__carry ;
  output [1:0]dac_data4__171_carry__2_i_9_0;
  output [3:0]dac_data4__114_carry__3;
  output [2:0]dac_data4__72_carry__3_i_1_2;
  output [3:0]dac_data4__171_carry__4_i_9_0;
  output [2:0]dac_data4__171_carry__4_i_10_0;
  output [0:0]dac_data2_carry__5;
  output [0:0]dac_data2_carry__5_0;
  output [1:0]dac_data6__90_carry__2_0;
  output [0:0]SR;
  output [1:0]dac_data6__90_carry__1_0;
  output [3:0]dac_data4__8_carry__1_i_9_3;
  output [3:0]dac_data4__8_carry__1_i_9_4;
  output [3:0]dac_data4__8_carry__1_i_9_5;
  output [2:0]dac_data4__72_carry__3_i_1_3;
  output [0:0]dac_data2_carry__1_i_5_0;
  output [3:0]dac_data2_carry__1_i_5_1;
  output [1:0]dac_data2_carry__3_i_5_0;
  output [3:0]dac_data2_carry__3_i_5_1;
  output [0:0]dac_data2_carry__3_i_5_2;
  output [3:0]\amplitude[1]_0 ;
  output [1:0]data_reg_3;
  output [3:0]\amplitude[4]_0 ;
  output [1:0]data_reg_4;
  output [3:0]data_reg_5;
  output [2:0]dac_data6__30_carry__0_0;
  output [3:0]dac_data6__30_carry__1;
  output [0:0]dac_data6__59_carry__1;
  output [1:0]\_inferred__1/i__carry__2_1 ;
  output [0:0]dac_data6__0_carry;
  output [1:0]dac_data4__8_carry__2_i_10_0;
  output [2:0]dac_data4__72_carry__3;
  output [3:0]dac_data4__114_carry__3_0;
  output [3:0]dac_data4__114_carry__3_1;
  output [2:0]dac_data4__8_carry__3_i_9_0;
  output [3:0]dac_data4__171_carry__3_0;
  output [3:0]dac_data4__171_carry__4_0;
  output [3:0]dac_data4__171_carry__5_0;
  output [2:0]dac_data4__171_carry__5_1;
  output [1:0]\_inferred__1/i__carry__0_0 ;
  input dac_clk_out;
  input [7:0]ADDRARDADDR;
  input [15:0]dac_data6;
  input [1:0]O;
  input [2:0]dac_data4__254_carry;
  input [3:0]dac_data4__254_carry__1;
  input [7:0]amplitude;
  input [3:0]dac_data4__8_carry__0;
  input [3:0]dac_data4__72_carry__2;
  input [3:0]dac_data4__72_carry__3_0;
  input [3:0]phase_acc_reg;
  input [3:0]phase_ofst;
  input [2:0]dac_data6__90_carry__1_1;
  input [3:0]dac_data6__90_carry__1_2;
  input [1:0]dac_data6__90_carry__1_3;
  input [3:0]dac_data6__90_carry__1_4;
  input [0:0]dac_data6__90_carry__1_5;
  input [1:0]dac_data6__90_carry__1_6;
  input [0:0]dac_data6__90_carry__1_7;
  input [3:0]dac_data4__254_carry__1_0;
  input [3:0]dac_data4__8_carry__0_0;
  input [3:0]dac_data4__254_carry__3;
  input [3:0]dac_data4__254_carry__4;
  input [3:0]dac_data4__254_carry__5;
  input [3:0]\dac_data_reg[1] ;
  input [0:0]\dac_data_reg[0] ;
  input [2:0]\dac_data_reg[2] ;
  input [3:0]\dac_data_reg[3] ;
  input enable;
  input [0:0]\dac_data_reg[1]_0 ;
  input [15:0]dac_data2_carry__1;
  input [3:0]dac_data2_carry;
  input [3:0]dac_data2_carry_0;
  input [3:0]dac_data2_carry__0;
  input [3:0]dac_data2_carry__1_0;
  input [3:0]dac_data4__254_carry__2;
  input [3:0]dac_data4__254_carry__0;
  input [1:0]dac_data4__254_carry_0;
  input [0:0]dac_data4__171_carry__2_0;
  input [3:0]dac_data4__171_carry__3_1;
  input [2:0]dac_data4__171_carry__3_2;
  input [0:0]dac_data4__171_carry__4_1;
  input [2:0]dac_data4__171_carry__4_2;
  input [0:0]dac_data4__171_carry__5_2;
  input [1:0]\dac_data_reg[7] ;
  input [1:0]\dac_data_reg[7]_0 ;
  input reset_n;
  input [0:0]dac_data4__8_carry__1_i_6;
  input [0:0]dac_data4__72_carry__3_1;
  input [0:0]i__carry__2_i_1_0;
  input [0:0]dac_data2_carry__3_i_5_3;
  input [0:0]dac_data6__90_carry__0;
  input [1:0]dac_data6__90_carry__2_1;
  input dac_data4__8_carry__2;
  input dac_data4__8_carry__3_0;
  input dac_data4__8_carry__3_1;
  input [0:0]dac_data4__171_carry__2_1;

  wire [7:0]ADDRARDADDR;
  wire [0:0]CO;
  wire [7:0]D;
  wire [3:0]DI;
  wire [1:0]O;
  wire [3:0]S;
  wire [0:0]SR;
  wire [1:0]\_inferred__1/i__carry ;
  wire [3:0]\_inferred__1/i__carry__0 ;
  wire [1:0]\_inferred__1/i__carry__0_0 ;
  wire [3:0]\_inferred__1/i__carry__1 ;
  wire [3:0]\_inferred__1/i__carry__1_0 ;
  wire [3:0]\_inferred__1/i__carry__2 ;
  wire [3:0]\_inferred__1/i__carry__2_0 ;
  wire [1:0]\_inferred__1/i__carry__2_1 ;
  wire [0:0]\_inferred__2/i__carry__0 ;
  wire [7:0]amplitude;
  wire [3:0]\amplitude[0] ;
  wire [2:0]\amplitude[0]_0 ;
  wire [1:0]\amplitude[1] ;
  wire [3:0]\amplitude[1]_0 ;
  wire [3:0]\amplitude[3] ;
  wire [2:0]\amplitude[3]_0 ;
  wire [1:0]\amplitude[4] ;
  wire [3:0]\amplitude[4]_0 ;
  wire [2:0]\amplitude[6] ;
  wire [3:0]\amplitude[6]_0 ;
  wire [0:0]\amplitude[6]_1 ;
  wire dac_clk_out;
  wire [3:0]dac_data2_carry;
  wire [3:0]dac_data2_carry_0;
  wire [3:0]dac_data2_carry__0;
  wire [15:0]dac_data2_carry__1;
  wire [3:0]dac_data2_carry__1_0;
  wire [0:0]dac_data2_carry__1_i_5_0;
  wire [3:0]dac_data2_carry__1_i_5_1;
  wire dac_data2_carry__1_i_5_n_3;
  wire [1:0]dac_data2_carry__3_i_5_0;
  wire [3:0]dac_data2_carry__3_i_5_1;
  wire [0:0]dac_data2_carry__3_i_5_2;
  wire [0:0]dac_data2_carry__3_i_5_3;
  wire dac_data2_carry__3_i_5_n_1;
  wire dac_data2_carry__3_i_5_n_3;
  wire dac_data2_carry__3_i_6_n_0;
  wire [0:0]dac_data2_carry__5;
  wire [0:0]dac_data2_carry__5_0;
  wire [13:0]dac_data3;
  wire [23:23]dac_data4;
  wire [5:1]dac_data40_in;
  wire [3:0]dac_data4__114_carry__3;
  wire [3:0]dac_data4__114_carry__3_0;
  wire [3:0]dac_data4__114_carry__3_1;
  wire [3:0]dac_data4__171_carry__2;
  wire [0:0]dac_data4__171_carry__2_0;
  wire [0:0]dac_data4__171_carry__2_1;
  wire dac_data4__171_carry__2_i_10_n_0;
  wire dac_data4__171_carry__2_i_12_n_0;
  wire [1:0]dac_data4__171_carry__2_i_9_0;
  wire dac_data4__171_carry__2_i_9_n_0;
  wire [3:0]dac_data4__171_carry__3;
  wire [3:0]dac_data4__171_carry__3_0;
  wire [3:0]dac_data4__171_carry__3_1;
  wire [2:0]dac_data4__171_carry__3_2;
  wire dac_data4__171_carry__3_i_10_n_0;
  wire dac_data4__171_carry__3_i_11_n_0;
  wire dac_data4__171_carry__3_i_9_n_0;
  wire [3:0]dac_data4__171_carry__4;
  wire [3:0]dac_data4__171_carry__4_0;
  wire [0:0]dac_data4__171_carry__4_1;
  wire [2:0]dac_data4__171_carry__4_2;
  wire [2:0]dac_data4__171_carry__4_i_10_0;
  wire dac_data4__171_carry__4_i_10_n_1;
  wire dac_data4__171_carry__4_i_10_n_3;
  wire dac_data4__171_carry__4_i_10_n_6;
  wire dac_data4__171_carry__4_i_11_n_1;
  wire dac_data4__171_carry__4_i_11_n_3;
  wire dac_data4__171_carry__4_i_11_n_6;
  wire dac_data4__171_carry__4_i_12_n_0;
  wire dac_data4__171_carry__4_i_13_n_0;
  wire dac_data4__171_carry__4_i_14_n_0;
  wire dac_data4__171_carry__4_i_15_n_0;
  wire [3:0]dac_data4__171_carry__4_i_9_0;
  wire dac_data4__171_carry__4_i_9_n_1;
  wire dac_data4__171_carry__4_i_9_n_3;
  wire dac_data4__171_carry__4_i_9_n_6;
  wire [2:0]dac_data4__171_carry__5;
  wire [3:0]dac_data4__171_carry__5_0;
  wire [2:0]dac_data4__171_carry__5_1;
  wire [0:0]dac_data4__171_carry__5_2;
  wire dac_data4__171_carry__5_i_10_n_0;
  wire dac_data4__171_carry__5_i_8_n_1;
  wire dac_data4__171_carry__5_i_8_n_3;
  wire dac_data4__171_carry__5_i_8_n_6;
  wire dac_data4__171_carry__5_i_9_n_0;
  wire [2:0]dac_data4__254_carry;
  wire [1:0]dac_data4__254_carry_0;
  wire [3:0]dac_data4__254_carry__0;
  wire [3:0]dac_data4__254_carry__1;
  wire [3:0]dac_data4__254_carry__1_0;
  wire [3:0]dac_data4__254_carry__2;
  wire [3:0]dac_data4__254_carry__3;
  wire [3:0]dac_data4__254_carry__4;
  wire [3:0]dac_data4__254_carry__5;
  wire [3:0]dac_data4__72_carry__2;
  wire [2:0]dac_data4__72_carry__3;
  wire [3:0]dac_data4__72_carry__3_0;
  wire [0:0]dac_data4__72_carry__3_1;
  wire [3:0]dac_data4__72_carry__3_i_1_0;
  wire [3:0]dac_data4__72_carry__3_i_1_1;
  wire [2:0]dac_data4__72_carry__3_i_1_2;
  wire [2:0]dac_data4__72_carry__3_i_1_3;
  wire [3:0]dac_data4__8_carry__0;
  wire [3:0]dac_data4__8_carry__0_0;
  wire [0:0]dac_data4__8_carry__1_i_6;
  wire [3:0]dac_data4__8_carry__1_i_9_0;
  wire [3:0]dac_data4__8_carry__1_i_9_1;
  wire [3:0]dac_data4__8_carry__1_i_9_2;
  wire [3:0]dac_data4__8_carry__1_i_9_3;
  wire [3:0]dac_data4__8_carry__1_i_9_4;
  wire [3:0]dac_data4__8_carry__1_i_9_5;
  wire dac_data4__8_carry__2;
  wire [1:0]dac_data4__8_carry__2_i_10_0;
  wire dac_data4__8_carry__2_i_10_n_0;
  wire dac_data4__8_carry__2_i_12_n_0;
  wire dac_data4__8_carry__2_i_9_n_0;
  wire dac_data4__8_carry__3;
  wire dac_data4__8_carry__3_0;
  wire dac_data4__8_carry__3_1;
  wire dac_data4__8_carry__3_i_11_n_0;
  wire dac_data4__8_carry__3_i_12_n_0;
  wire [2:0]dac_data4__8_carry__3_i_9_0;
  wire dac_data4__8_carry__3_i_9_n_0;
  wire [3:0]dac_data4__8_carry__4;
  wire [3:0]dac_data4__8_carry__5;
  wire [0:0]dac_data4__8_carry__6;
  wire [0:0]dac_data4__8_carry__6_0;
  wire [0:0]dac_data4__8_carry__6_1;
  wire [3:0]dac_data4__8_carry__6_2;
  wire [15:0]dac_data6;
  wire [0:0]dac_data6__0_carry;
  wire dac_data6__0_carry__0_i_10_n_0;
  wire dac_data6__0_carry__0_i_11_n_0;
  wire dac_data6__0_carry__0_i_12_n_0;
  wire dac_data6__0_carry__0_i_9_n_0;
  wire dac_data6__0_carry_i_8_n_0;
  wire [2:0]dac_data6__30_carry__0;
  wire [2:0]dac_data6__30_carry__0_0;
  wire dac_data6__30_carry__0_i_10_n_0;
  wire dac_data6__30_carry__0_i_11_n_0;
  wire dac_data6__30_carry__0_i_12_n_0;
  wire dac_data6__30_carry__0_i_9_n_0;
  wire [3:0]dac_data6__30_carry__1;
  wire dac_data6__30_carry_i_8_n_0;
  wire [3:0]dac_data6__59_carry__0;
  wire [0:0]dac_data6__59_carry__1;
  wire [0:0]dac_data6__90_carry__0;
  wire dac_data6__90_carry__0_i_9_n_0;
  wire [3:0]dac_data6__90_carry__1;
  wire [1:0]dac_data6__90_carry__1_0;
  wire [2:0]dac_data6__90_carry__1_1;
  wire [3:0]dac_data6__90_carry__1_2;
  wire [1:0]dac_data6__90_carry__1_3;
  wire [3:0]dac_data6__90_carry__1_4;
  wire [0:0]dac_data6__90_carry__1_5;
  wire [1:0]dac_data6__90_carry__1_6;
  wire [0:0]dac_data6__90_carry__1_7;
  wire [3:0]dac_data6__90_carry__2;
  wire [1:0]dac_data6__90_carry__2_0;
  wire [1:0]dac_data6__90_carry__2_1;
  wire \dac_data[0]_i_2_n_0 ;
  wire [0:0]\dac_data_reg[0] ;
  wire [3:0]\dac_data_reg[1] ;
  wire [0:0]\dac_data_reg[1]_0 ;
  wire [2:0]\dac_data_reg[2] ;
  wire [3:0]\dac_data_reg[3] ;
  wire [1:0]\dac_data_reg[7] ;
  wire [1:0]\dac_data_reg[7]_0 ;
  wire [7:0]\^data_reg ;
  wire [3:0]data_reg_0;
  wire [3:0]data_reg_1;
  wire [1:0]data_reg_2;
  wire [1:0]data_reg_3;
  wire [1:0]data_reg_4;
  wire [3:0]data_reg_5;
  wire enable;
  wire [0:0]i__carry__2_i_1_0;
  wire [3:0]i__carry__2_i_5_0;
  wire i__carry__2_i_5_n_3;
  wire [3:0]phase_acc_reg;
  wire [3:0]\phase_acc_reg[31] ;
  wire [3:0]phase_ofst;
  wire reset_n;
  wire [3:1]NLW_dac_data2_carry__1_i_5_CO_UNCONNECTED;
  wire [3:0]NLW_dac_data2_carry__1_i_5_O_UNCONNECTED;
  wire [3:1]NLW_dac_data2_carry__3_i_5_CO_UNCONNECTED;
  wire [3:0]NLW_dac_data2_carry__3_i_5_O_UNCONNECTED;
  wire [3:1]NLW_dac_data4__171_carry__4_i_10_CO_UNCONNECTED;
  wire [3:0]NLW_dac_data4__171_carry__4_i_10_O_UNCONNECTED;
  wire [3:1]NLW_dac_data4__171_carry__4_i_11_CO_UNCONNECTED;
  wire [3:0]NLW_dac_data4__171_carry__4_i_11_O_UNCONNECTED;
  wire [3:1]NLW_dac_data4__171_carry__4_i_9_CO_UNCONNECTED;
  wire [3:0]NLW_dac_data4__171_carry__4_i_9_O_UNCONNECTED;
  wire [3:1]NLW_dac_data4__171_carry__5_i_8_CO_UNCONNECTED;
  wire [3:0]NLW_dac_data4__171_carry__5_i_8_O_UNCONNECTED;
  wire [3:1]NLW_dac_data4__72_carry__3_i_1_CO_UNCONNECTED;
  wire [3:0]NLW_dac_data4__72_carry__3_i_1_O_UNCONNECTED;
  wire [3:1]NLW_dac_data4__8_carry__1_i_9_CO_UNCONNECTED;
  wire [3:0]NLW_dac_data4__8_carry__1_i_9_O_UNCONNECTED;
  wire [15:8]NLW_data_reg_DOADO_UNCONNECTED;
  wire [15:0]NLW_data_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_data_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_data_reg_DOPBDOP_UNCONNECTED;
  wire [3:1]NLW_i__carry__2_i_5_CO_UNCONNECTED;
  wire [3:0]NLW_i__carry__2_i_5_O_UNCONNECTED;

  LUT5 #(
    .INIT(32'hB8BBB888)) 
    dac_data2_carry__0_i_1
       (.I0(dac_data2_carry__1[12]),
        .I1(O[1]),
        .I2(dac_data4__72_carry__3_0[2]),
        .I3(\dac_data[0]_i_2_n_0 ),
        .I4(dac_data2_carry__1_0[1]),
        .O(dac_data3[7]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    dac_data2_carry__0_i_2
       (.I0(dac_data2_carry__1[11]),
        .I1(O[1]),
        .I2(dac_data4__72_carry__3_0[1]),
        .I3(\dac_data[0]_i_2_n_0 ),
        .I4(dac_data2_carry__1_0[0]),
        .O(dac_data3[6]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    dac_data2_carry__0_i_3
       (.I0(dac_data2_carry__1[10]),
        .I1(O[1]),
        .I2(dac_data4__72_carry__3_0[0]),
        .I3(\dac_data[0]_i_2_n_0 ),
        .I4(dac_data2_carry__0[3]),
        .O(dac_data3[5]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    dac_data2_carry__0_i_4
       (.I0(dac_data2_carry__1[9]),
        .I1(O[1]),
        .I2(dac_data4__72_carry__2[3]),
        .I3(\dac_data[0]_i_2_n_0 ),
        .I4(dac_data2_carry__0[2]),
        .O(dac_data3[4]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data2_carry__1_i_1
       (.I0(O[1]),
        .I1(dac_data2_carry__1_i_5_n_3),
        .O(dac_data2_carry__1_i_5_0));
  LUT5 #(
    .INIT(32'hA0A3A0A0)) 
    dac_data2_carry__1_i_2
       (.I0(dac_data2_carry__1[15]),
        .I1(\dac_data_reg[1] [3]),
        .I2(O[1]),
        .I3(\dac_data_reg[1]_0 ),
        .I4(i__carry__2_i_5_n_3),
        .O(dac_data3[10]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    dac_data2_carry__1_i_3
       (.I0(dac_data2_carry__1[14]),
        .I1(O[1]),
        .I2(dac_data4__8_carry__6_0),
        .I3(\dac_data[0]_i_2_n_0 ),
        .I4(dac_data2_carry__1_0[3]),
        .O(dac_data3[9]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    dac_data2_carry__1_i_4
       (.I0(dac_data2_carry__1[13]),
        .I1(O[1]),
        .I2(dac_data4__72_carry__3_0[3]),
        .I3(\dac_data[0]_i_2_n_0 ),
        .I4(dac_data2_carry__1_0[2]),
        .O(dac_data3[8]));
  CARRY4 dac_data2_carry__1_i_5
       (.CI(dac_data2_carry__3_i_5_3),
        .CO({NLW_dac_data2_carry__1_i_5_CO_UNCONNECTED[3:1],dac_data2_carry__1_i_5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_dac_data2_carry__1_i_5_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data2_carry__2_i_1
       (.I0(O[1]),
        .I1(dac_data2_carry__1_i_5_n_3),
        .O(dac_data2_carry__1_i_5_1[3]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data2_carry__2_i_2
       (.I0(O[1]),
        .I1(dac_data2_carry__1_i_5_n_3),
        .O(dac_data2_carry__1_i_5_1[2]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data2_carry__2_i_3
       (.I0(O[1]),
        .I1(dac_data2_carry__1_i_5_n_3),
        .O(dac_data2_carry__1_i_5_1[1]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data2_carry__2_i_4
       (.I0(O[1]),
        .I1(dac_data2_carry__1_i_5_n_3),
        .O(dac_data2_carry__1_i_5_1[0]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data2_carry__3_i_1
       (.I0(O[1]),
        .I1(dac_data2_carry__3_i_5_n_1),
        .O(dac_data2_carry__3_i_5_0[1]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data2_carry__3_i_2
       (.I0(O[1]),
        .I1(dac_data2_carry__3_i_5_n_1),
        .O(dac_data2_carry__3_i_5_0[0]));
  LUT2 #(
    .INIT(4'h8)) 
    dac_data2_carry__3_i_3
       (.I0(dac_data4),
        .I1(O[1]),
        .O(dac_data3[12]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data2_carry__3_i_4
       (.I0(O[1]),
        .I1(dac_data2_carry__1_i_5_n_3),
        .O(dac_data3[11]));
  CARRY4 dac_data2_carry__3_i_5
       (.CI(1'b0),
        .CO({NLW_dac_data2_carry__3_i_5_CO_UNCONNECTED[3],dac_data2_carry__3_i_5_n_1,NLW_dac_data2_carry__3_i_5_CO_UNCONNECTED[1],dac_data2_carry__3_i_5_n_3}),
        .CYINIT(dac_data2_carry__1_i_5_n_3),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_dac_data2_carry__3_i_5_O_UNCONNECTED[3:2],dac_data4,NLW_dac_data2_carry__3_i_5_O_UNCONNECTED[0]}),
        .S({1'b0,1'b1,dac_data2_carry__3_i_6_n_0,1'b1}));
  LUT2 #(
    .INIT(4'hB)) 
    dac_data2_carry__3_i_6
       (.I0(CO),
        .I1(O[1]),
        .O(dac_data2_carry__3_i_6_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data2_carry__4_i_1
       (.I0(O[1]),
        .I1(dac_data2_carry__3_i_5_n_1),
        .O(dac_data2_carry__3_i_5_1[3]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data2_carry__4_i_2
       (.I0(O[1]),
        .I1(dac_data2_carry__3_i_5_n_1),
        .O(dac_data2_carry__3_i_5_1[2]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data2_carry__4_i_3
       (.I0(O[1]),
        .I1(dac_data2_carry__3_i_5_n_1),
        .O(dac_data2_carry__3_i_5_1[1]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data2_carry__4_i_4
       (.I0(O[1]),
        .I1(dac_data2_carry__3_i_5_n_1),
        .O(dac_data2_carry__3_i_5_1[0]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data2_carry__5_i_1
       (.I0(O[1]),
        .I1(dac_data2_carry__3_i_5_n_1),
        .O(dac_data3[13]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data2_carry__5_i_2
       (.I0(O[1]),
        .I1(dac_data2_carry__3_i_5_n_1),
        .O(dac_data2_carry__3_i_5_2));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    dac_data2_carry_i_1
       (.I0(dac_data2_carry__1[6]),
        .I1(O[1]),
        .I2(dac_data4__72_carry__2[0]),
        .I3(\dac_data[0]_i_2_n_0 ),
        .I4(dac_data2_carry_0[3]),
        .O(dac_data3[1]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    dac_data2_carry_i_2
       (.I0(dac_data2_carry__1[8]),
        .I1(O[1]),
        .I2(dac_data4__72_carry__2[2]),
        .I3(\dac_data[0]_i_2_n_0 ),
        .I4(dac_data2_carry__0[1]),
        .O(dac_data3[3]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    dac_data2_carry_i_3
       (.I0(dac_data2_carry__1[7]),
        .I1(O[1]),
        .I2(dac_data4__72_carry__2[1]),
        .I3(\dac_data[0]_i_2_n_0 ),
        .I4(dac_data2_carry__0[0]),
        .O(dac_data3[2]));
  LUT5 #(
    .INIT(32'h001DFF1D)) 
    dac_data2_carry_i_4
       (.I0(dac_data2_carry_0[3]),
        .I1(\dac_data[0]_i_2_n_0 ),
        .I2(dac_data4__72_carry__2[0]),
        .I3(O[1]),
        .I4(dac_data2_carry__1[6]),
        .O(\_inferred__2/i__carry__0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    dac_data2_carry_i_5
       (.I0(dac_data2_carry__1[5]),
        .I1(O[1]),
        .I2(dac_data2_carry[3]),
        .I3(\dac_data[0]_i_2_n_0 ),
        .I4(dac_data2_carry_0[2]),
        .O(dac_data3[0]));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__114_carry__1_i_1
       (.I0(dac_data4__72_carry__2[1]),
        .I1(dac_data4__72_carry__3_0[0]),
        .O(dac_data4__8_carry__6));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__114_carry__2_i_1
       (.I0(dac_data4__72_carry__3_0[1]),
        .I1(dac_data4__8_carry__6_0),
        .O(dac_data4__72_carry__3_i_1_0[3]));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__114_carry__2_i_2
       (.I0(dac_data4__72_carry__3_0[0]),
        .I1(dac_data4__72_carry__3_0[3]),
        .O(dac_data4__72_carry__3_i_1_0[2]));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__114_carry__2_i_3
       (.I0(dac_data4__72_carry__2[3]),
        .I1(dac_data4__72_carry__3_0[2]),
        .O(dac_data4__72_carry__3_i_1_0[1]));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__114_carry__2_i_4
       (.I0(dac_data4__72_carry__2[2]),
        .I1(dac_data4__72_carry__3_0[1]),
        .O(dac_data4__72_carry__3_i_1_0[0]));
  LUT1 #(
    .INIT(2'h1)) 
    dac_data4__114_carry__3_i_1
       (.I0(dac_data4__8_carry__6_0),
        .O(dac_data4__72_carry__3_i_1_2[2]));
  LUT1 #(
    .INIT(2'h1)) 
    dac_data4__114_carry__3_i_2
       (.I0(dac_data4__72_carry__3_0[3]),
        .O(dac_data4__72_carry__3_i_1_2[1]));
  LUT1 #(
    .INIT(2'h1)) 
    dac_data4__114_carry__3_i_3
       (.I0(dac_data4__72_carry__3_0[2]),
        .O(dac_data4__72_carry__3_i_1_2[0]));
  LUT5 #(
    .INIT(32'hFF8E8E00)) 
    dac_data4__171_carry__2_i_1
       (.I0(dac_data4__171_carry__3_2[0]),
        .I1(dac_data4__171_carry__3_1[1]),
        .I2(dac_data4__72_carry__2[3]),
        .I3(dac_data4__72_carry__2[2]),
        .I4(dac_data4__171_carry__2_i_9_n_0),
        .O(dac_data4__171_carry__2_i_9_0[1]));
  LUT3 #(
    .INIT(8'h69)) 
    dac_data4__171_carry__2_i_10
       (.I0(dac_data4__72_carry__2[3]),
        .I1(dac_data4__171_carry__3_1[1]),
        .I2(dac_data4__171_carry__3_2[0]),
        .O(dac_data4__171_carry__2_i_10_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    dac_data4__171_carry__2_i_12
       (.I0(dac_data4__72_carry__3_0[1]),
        .I1(dac_data4__171_carry__3_1[3]),
        .I2(dac_data4__171_carry__3_2[2]),
        .O(dac_data4__171_carry__2_i_12_n_0));
  LUT5 #(
    .INIT(32'hFF8E8E00)) 
    dac_data4__171_carry__2_i_2
       (.I0(dac_data4__171_carry__2_0),
        .I1(dac_data4__171_carry__3_1[0]),
        .I2(dac_data4__72_carry__2[2]),
        .I3(dac_data4__72_carry__2[1]),
        .I4(dac_data4__171_carry__2_i_10_n_0),
        .O(dac_data4__171_carry__2_i_9_0[0]));
  LUT6 #(
    .INIT(64'h6969966996699696)) 
    dac_data4__171_carry__2_i_5
       (.I0(dac_data4__171_carry__2_i_9_0[1]),
        .I1(dac_data4__171_carry__2_i_12_n_0),
        .I2(dac_data4__72_carry__2[3]),
        .I3(dac_data4__72_carry__3_0[0]),
        .I4(dac_data4__171_carry__3_1[2]),
        .I5(dac_data4__171_carry__3_2[1]),
        .O(dac_data4__72_carry__3[2]));
  LUT6 #(
    .INIT(64'h6969966996699696)) 
    dac_data4__171_carry__2_i_6
       (.I0(dac_data4__171_carry__2_i_9_0[0]),
        .I1(dac_data4__171_carry__2_i_9_n_0),
        .I2(dac_data4__72_carry__2[2]),
        .I3(dac_data4__72_carry__2[3]),
        .I4(dac_data4__171_carry__3_1[1]),
        .I5(dac_data4__171_carry__3_2[0]),
        .O(dac_data4__72_carry__3[1]));
  LUT6 #(
    .INIT(64'h6969966996699696)) 
    dac_data4__171_carry__2_i_7
       (.I0(dac_data4__171_carry__2_1),
        .I1(dac_data4__171_carry__2_i_10_n_0),
        .I2(dac_data4__72_carry__2[1]),
        .I3(dac_data4__72_carry__2[2]),
        .I4(dac_data4__171_carry__3_1[0]),
        .I5(dac_data4__171_carry__2_0),
        .O(dac_data4__72_carry__3[0]));
  LUT3 #(
    .INIT(8'h69)) 
    dac_data4__171_carry__2_i_9
       (.I0(dac_data4__72_carry__3_0[0]),
        .I1(dac_data4__171_carry__3_1[2]),
        .I2(dac_data4__171_carry__3_2[1]),
        .O(dac_data4__171_carry__2_i_9_n_0));
  LUT6 #(
    .INIT(64'hF220B0FB20F2FBB0)) 
    dac_data4__171_carry__3_i_1
       (.I0(dac_data4__171_carry__4_2[1]),
        .I1(dac_data4__72_carry__3_0[3]),
        .I2(dac_data4__72_carry__3_0[2]),
        .I3(dac_data4__8_carry__6_0),
        .I4(dac_data4__171_carry__4_1),
        .I5(dac_data4__171_carry__4_2[2]),
        .O(dac_data4__114_carry__3[3]));
  LUT3 #(
    .INIT(8'h96)) 
    dac_data4__171_carry__3_i_10
       (.I0(dac_data4__8_carry__6_0),
        .I1(dac_data4__171_carry__4_1),
        .I2(dac_data4__171_carry__4_2[2]),
        .O(dac_data4__171_carry__3_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h96)) 
    dac_data4__171_carry__3_i_11
       (.I0(dac_data4__72_carry__3_0[3]),
        .I1(dac_data4__171_carry__4_1),
        .I2(dac_data4__171_carry__4_2[1]),
        .O(dac_data4__171_carry__3_i_11_n_0));
  LUT6 #(
    .INIT(64'hF220B0FB20F2FBB0)) 
    dac_data4__171_carry__3_i_2
       (.I0(dac_data4__171_carry__4_2[0]),
        .I1(dac_data4__72_carry__3_0[2]),
        .I2(dac_data4__72_carry__3_0[1]),
        .I3(dac_data4__72_carry__3_0[3]),
        .I4(dac_data4__171_carry__4_1),
        .I5(dac_data4__171_carry__4_2[1]),
        .O(dac_data4__114_carry__3[2]));
  LUT5 #(
    .INIT(32'hFF8E8E00)) 
    dac_data4__171_carry__3_i_3
       (.I0(dac_data4__171_carry__3_2[2]),
        .I1(dac_data4__171_carry__3_1[3]),
        .I2(dac_data4__72_carry__3_0[1]),
        .I3(dac_data4__72_carry__3_0[0]),
        .I4(dac_data4__171_carry__3_i_9_n_0),
        .O(dac_data4__114_carry__3[1]));
  LUT5 #(
    .INIT(32'hFF8E8E00)) 
    dac_data4__171_carry__3_i_4
       (.I0(dac_data4__171_carry__3_2[1]),
        .I1(dac_data4__171_carry__3_1[2]),
        .I2(dac_data4__72_carry__3_0[0]),
        .I3(dac_data4__72_carry__2[3]),
        .I4(dac_data4__171_carry__2_i_12_n_0),
        .O(dac_data4__114_carry__3[0]));
  LUT6 #(
    .INIT(64'h9966699696699966)) 
    dac_data4__171_carry__3_i_5
       (.I0(dac_data4__114_carry__3[3]),
        .I1(dac_data4__171_carry__5_2),
        .I2(dac_data4__171_carry__4_1),
        .I3(dac_data4__72_carry__3_0[3]),
        .I4(dac_data4__8_carry__6_0),
        .I5(dac_data4__171_carry__4_2[2]),
        .O(dac_data4__114_carry__3_0[3]));
  LUT6 #(
    .INIT(64'h9669696996969669)) 
    dac_data4__171_carry__3_i_6
       (.I0(dac_data4__114_carry__3[2]),
        .I1(dac_data4__171_carry__3_i_10_n_0),
        .I2(dac_data4__72_carry__3_0[2]),
        .I3(dac_data4__72_carry__3_0[3]),
        .I4(dac_data4__171_carry__4_1),
        .I5(dac_data4__171_carry__4_2[1]),
        .O(dac_data4__114_carry__3_0[2]));
  LUT6 #(
    .INIT(64'h9669696996969669)) 
    dac_data4__171_carry__3_i_7
       (.I0(dac_data4__114_carry__3[1]),
        .I1(dac_data4__171_carry__3_i_11_n_0),
        .I2(dac_data4__72_carry__3_0[1]),
        .I3(dac_data4__72_carry__3_0[2]),
        .I4(dac_data4__171_carry__4_1),
        .I5(dac_data4__171_carry__4_2[0]),
        .O(dac_data4__114_carry__3_0[1]));
  LUT6 #(
    .INIT(64'h6969966996699696)) 
    dac_data4__171_carry__3_i_8
       (.I0(dac_data4__114_carry__3[0]),
        .I1(dac_data4__171_carry__3_i_9_n_0),
        .I2(dac_data4__72_carry__3_0[0]),
        .I3(dac_data4__72_carry__3_0[1]),
        .I4(dac_data4__171_carry__3_1[3]),
        .I5(dac_data4__171_carry__3_2[2]),
        .O(dac_data4__114_carry__3_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h96)) 
    dac_data4__171_carry__3_i_9
       (.I0(dac_data4__72_carry__3_0[2]),
        .I1(dac_data4__171_carry__4_1),
        .I2(dac_data4__171_carry__4_2[0]),
        .O(dac_data4__171_carry__3_i_9_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    dac_data4__171_carry__4_i_1
       (.I0(dac_data4__171_carry__5_2),
        .I1(dac_data4__171_carry__4_i_9_n_1),
        .O(dac_data4__171_carry__4_i_9_0[3]));
  CARRY4 dac_data4__171_carry__4_i_10
       (.CI(1'b0),
        .CO({NLW_dac_data4__171_carry__4_i_10_CO_UNCONNECTED[3],dac_data4__171_carry__4_i_10_n_1,NLW_dac_data4__171_carry__4_i_10_CO_UNCONNECTED[1],dac_data4__171_carry__4_i_10_n_3}),
        .CYINIT(dac_data4__171_carry__4_i_9_n_1),
        .DI({1'b0,1'b0,dac_data4__171_carry__4_i_13_n_0,1'b0}),
        .O({NLW_dac_data4__171_carry__4_i_10_O_UNCONNECTED[3:2],dac_data4__171_carry__4_i_10_n_6,NLW_dac_data4__171_carry__4_i_10_O_UNCONNECTED[0]}),
        .S({1'b0,1'b1,dac_data4__171_carry__4_i_14_n_0,1'b1}));
  CARRY4 dac_data4__171_carry__4_i_11
       (.CI(1'b0),
        .CO({NLW_dac_data4__171_carry__4_i_11_CO_UNCONNECTED[3],dac_data4__171_carry__4_i_11_n_1,NLW_dac_data4__171_carry__4_i_11_CO_UNCONNECTED[1],dac_data4__171_carry__4_i_11_n_3}),
        .CYINIT(dac_data4__171_carry__5_2),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_dac_data4__171_carry__4_i_11_O_UNCONNECTED[3:2],dac_data4__171_carry__4_i_11_n_6,NLW_dac_data4__171_carry__4_i_11_O_UNCONNECTED[0]}),
        .S({1'b0,1'b1,dac_data4__171_carry__4_i_15_n_0,1'b1}));
  LUT2 #(
    .INIT(4'hB)) 
    dac_data4__171_carry__4_i_12
       (.I0(CO),
        .I1(O[1]),
        .O(dac_data4__171_carry__4_i_12_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__171_carry__4_i_13
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__171_carry__4_i_13_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    dac_data4__171_carry__4_i_14
       (.I0(CO),
        .I1(O[1]),
        .O(dac_data4__171_carry__4_i_14_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    dac_data4__171_carry__4_i_15
       (.I0(CO),
        .I1(O[1]),
        .O(dac_data4__171_carry__4_i_15_n_0));
  LUT3 #(
    .INIT(8'h91)) 
    dac_data4__171_carry__4_i_2
       (.I0(dac_data4__171_carry__4_i_9_n_1),
        .I1(dac_data4__171_carry__5_2),
        .I2(dac_data4__171_carry__4_i_9_n_6),
        .O(dac_data4__171_carry__4_i_9_0[2]));
  LUT4 #(
    .INIT(16'h4DFC)) 
    dac_data4__171_carry__4_i_3
       (.I0(dac_data4__171_carry__4_1),
        .I1(dac_data4__8_carry__6_0),
        .I2(dac_data4__171_carry__4_i_9_n_6),
        .I3(dac_data4__171_carry__5_2),
        .O(dac_data4__171_carry__4_i_9_0[1]));
  LUT5 #(
    .INIT(32'hF2B020FB)) 
    dac_data4__171_carry__4_i_4
       (.I0(dac_data4__171_carry__4_2[2]),
        .I1(dac_data4__8_carry__6_0),
        .I2(dac_data4__72_carry__3_0[3]),
        .I3(dac_data4__171_carry__4_1),
        .I4(dac_data4__171_carry__5_2),
        .O(dac_data4__171_carry__4_i_9_0[0]));
  LUT4 #(
    .INIT(16'h9669)) 
    dac_data4__171_carry__4_i_5
       (.I0(dac_data4__171_carry__4_i_10_n_6),
        .I1(dac_data4__171_carry__4_i_11_n_6),
        .I2(dac_data4__171_carry__4_i_9_n_1),
        .I3(dac_data4__171_carry__5_2),
        .O(dac_data4__114_carry__3_1[3]));
  LUT3 #(
    .INIT(8'h7F)) 
    dac_data4__171_carry__4_i_6
       (.I0(dac_data4__171_carry__4_i_9_n_6),
        .I1(dac_data4__171_carry__5_2),
        .I2(dac_data4__171_carry__4_i_9_n_1),
        .O(dac_data4__114_carry__3_1[2]));
  LUT5 #(
    .INIT(32'h20DF45BA)) 
    dac_data4__171_carry__4_i_7
       (.I0(dac_data4__8_carry__6_0),
        .I1(dac_data4__171_carry__4_1),
        .I2(dac_data4__171_carry__5_2),
        .I3(dac_data4__171_carry__4_i_9_n_1),
        .I4(dac_data4__171_carry__4_i_9_n_6),
        .O(dac_data4__114_carry__3_1[1]));
  LUT5 #(
    .INIT(32'h5AA59669)) 
    dac_data4__171_carry__4_i_8
       (.I0(dac_data4__171_carry__4_i_9_0[0]),
        .I1(dac_data4__171_carry__5_2),
        .I2(dac_data4__171_carry__4_i_9_n_6),
        .I3(dac_data4__8_carry__6_0),
        .I4(dac_data4__171_carry__4_1),
        .O(dac_data4__114_carry__3_1[0]));
  CARRY4 dac_data4__171_carry__4_i_9
       (.CI(1'b0),
        .CO({NLW_dac_data4__171_carry__4_i_9_CO_UNCONNECTED[3],dac_data4__171_carry__4_i_9_n_1,NLW_dac_data4__171_carry__4_i_9_CO_UNCONNECTED[1],dac_data4__171_carry__4_i_9_n_3}),
        .CYINIT(dac_data4__171_carry__4_1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_dac_data4__171_carry__4_i_9_O_UNCONNECTED[3:2],dac_data4__171_carry__4_i_9_n_6,NLW_dac_data4__171_carry__4_i_9_O_UNCONNECTED[0]}),
        .S({1'b0,1'b1,dac_data4__171_carry__4_i_12_n_0,1'b1}));
  (* HLUTNM = "lutpair0" *) 
  LUT2 #(
    .INIT(4'h1)) 
    dac_data4__171_carry__5_i_1
       (.I0(dac_data4__171_carry__4_i_11_n_1),
        .I1(dac_data4__171_carry__4_i_10_n_1),
        .O(dac_data4__171_carry__4_i_10_0[2]));
  LUT2 #(
    .INIT(4'hB)) 
    dac_data4__171_carry__5_i_10
       (.I0(CO),
        .I1(O[1]),
        .O(dac_data4__171_carry__5_i_10_n_0));
  LUT4 #(
    .INIT(16'h9990)) 
    dac_data4__171_carry__5_i_2
       (.I0(dac_data4__171_carry__4_i_10_n_1),
        .I1(dac_data4__171_carry__4_i_11_n_1),
        .I2(dac_data4__171_carry__4_i_10_n_6),
        .I3(dac_data4__171_carry__4_i_11_n_6),
        .O(dac_data4__171_carry__4_i_10_0[1]));
  LUT4 #(
    .INIT(16'h0999)) 
    dac_data4__171_carry__5_i_3
       (.I0(dac_data4__171_carry__4_i_11_n_6),
        .I1(dac_data4__171_carry__4_i_10_n_6),
        .I2(dac_data4__171_carry__5_2),
        .I3(dac_data4__171_carry__4_i_9_n_1),
        .O(dac_data4__171_carry__4_i_10_0[0]));
  LUT6 #(
    .INIT(64'h0FB4B4F00FB40FB4)) 
    dac_data4__171_carry__5_i_4
       (.I0(dac_data4__171_carry__4_i_11_n_1),
        .I1(dac_data4__171_carry__4_i_10_n_1),
        .I2(dac_data4__171_carry__5_i_8_n_1),
        .I3(dac_data4__171_carry__5_i_8_n_6),
        .I4(CO),
        .I5(O[1]),
        .O(dac_data6__90_carry__2[3]));
  LUT6 #(
    .INIT(64'hA5A55AA569699669)) 
    dac_data4__171_carry__5_i_5
       (.I0(dac_data4__171_carry__4_i_10_0[2]),
        .I1(dac_data4__171_carry__4_i_10_n_1),
        .I2(dac_data4__171_carry__5_i_8_n_6),
        .I3(O[1]),
        .I4(CO),
        .I5(dac_data4__171_carry__4_i_11_n_1),
        .O(dac_data6__90_carry__2[2]));
  (* HLUTNM = "lutpair0" *) 
  LUT4 #(
    .INIT(16'h777E)) 
    dac_data4__171_carry__5_i_6
       (.I0(dac_data4__171_carry__4_i_11_n_1),
        .I1(dac_data4__171_carry__4_i_10_n_1),
        .I2(dac_data4__171_carry__4_i_11_n_6),
        .I3(dac_data4__171_carry__4_i_10_n_6),
        .O(dac_data6__90_carry__2[1]));
  LUT6 #(
    .INIT(64'h78870FF00FF08778)) 
    dac_data4__171_carry__5_i_7
       (.I0(dac_data4__171_carry__4_i_9_n_1),
        .I1(dac_data4__171_carry__5_2),
        .I2(dac_data4__171_carry__4_i_11_n_1),
        .I3(dac_data4__171_carry__4_i_10_n_1),
        .I4(dac_data4__171_carry__4_i_11_n_6),
        .I5(dac_data4__171_carry__4_i_10_n_6),
        .O(dac_data6__90_carry__2[0]));
  CARRY4 dac_data4__171_carry__5_i_8
       (.CI(1'b0),
        .CO({NLW_dac_data4__171_carry__5_i_8_CO_UNCONNECTED[3],dac_data4__171_carry__5_i_8_n_1,NLW_dac_data4__171_carry__5_i_8_CO_UNCONNECTED[1],dac_data4__171_carry__5_i_8_n_3}),
        .CYINIT(dac_data4__171_carry__4_i_11_n_1),
        .DI({1'b0,1'b0,dac_data4__171_carry__5_i_9_n_0,1'b0}),
        .O({NLW_dac_data4__171_carry__5_i_8_O_UNCONNECTED[3:2],dac_data4__171_carry__5_i_8_n_6,NLW_dac_data4__171_carry__5_i_8_O_UNCONNECTED[0]}),
        .S({1'b0,1'b1,dac_data4__171_carry__5_i_10_n_0,1'b1}));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__171_carry__5_i_9
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__171_carry__5_i_9_n_0));
  LUT4 #(
    .INIT(16'hABFB)) 
    dac_data4__254_carry__0_i_1
       (.I0(dac_data4__254_carry__0[3]),
        .I1(dac_data4__8_carry__0_0[3]),
        .I2(O[1]),
        .I3(dac_data6[5]),
        .O(\_inferred__1/i__carry__0 [3]));
  LUT4 #(
    .INIT(16'hABFB)) 
    dac_data4__254_carry__0_i_2
       (.I0(dac_data4__254_carry__0[2]),
        .I1(dac_data4__8_carry__0_0[2]),
        .I2(O[1]),
        .I3(dac_data6[4]),
        .O(\_inferred__1/i__carry__0 [2]));
  LUT4 #(
    .INIT(16'hABFB)) 
    dac_data4__254_carry__0_i_3
       (.I0(dac_data4__254_carry__0[1]),
        .I1(dac_data4__8_carry__0_0[1]),
        .I2(O[1]),
        .I3(dac_data6[3]),
        .O(\_inferred__1/i__carry__0 [1]));
  LUT4 #(
    .INIT(16'hABFB)) 
    dac_data4__254_carry__0_i_4
       (.I0(dac_data4__254_carry__0[0]),
        .I1(dac_data4__8_carry__0_0[0]),
        .I2(O[1]),
        .I3(dac_data6[2]),
        .O(\_inferred__1/i__carry__0 [0]));
  LUT4 #(
    .INIT(16'h02A2)) 
    dac_data4__254_carry__1_i_1
       (.I0(dac_data4__254_carry__1_0[3]),
        .I1(dac_data4__254_carry__1[3]),
        .I2(O[1]),
        .I3(dac_data6[9]),
        .O(\_inferred__1/i__carry__1_0 [3]));
  LUT4 #(
    .INIT(16'h02A2)) 
    dac_data4__254_carry__1_i_2
       (.I0(dac_data4__254_carry__1_0[2]),
        .I1(dac_data4__254_carry__1[2]),
        .I2(O[1]),
        .I3(dac_data6[8]),
        .O(\_inferred__1/i__carry__1_0 [2]));
  LUT4 #(
    .INIT(16'h02A2)) 
    dac_data4__254_carry__1_i_3
       (.I0(dac_data4__254_carry__1_0[1]),
        .I1(dac_data4__254_carry__1[1]),
        .I2(O[1]),
        .I3(dac_data6[7]),
        .O(\_inferred__1/i__carry__1_0 [1]));
  LUT4 #(
    .INIT(16'hABFB)) 
    dac_data4__254_carry__1_i_4
       (.I0(dac_data4__254_carry__1_0[0]),
        .I1(dac_data4__254_carry__1[0]),
        .I2(O[1]),
        .I3(dac_data6[6]),
        .O(\_inferred__1/i__carry__1_0 [0]));
  LUT4 #(
    .INIT(16'h02A2)) 
    dac_data4__254_carry__2_i_1
       (.I0(dac_data4__254_carry__2[3]),
        .I1(dac_data4__8_carry__0[3]),
        .I2(O[1]),
        .I3(dac_data6[13]),
        .O(\_inferred__1/i__carry__2_0 [3]));
  LUT4 #(
    .INIT(16'h02A2)) 
    dac_data4__254_carry__2_i_2
       (.I0(dac_data4__254_carry__2[2]),
        .I1(dac_data4__8_carry__0[2]),
        .I2(O[1]),
        .I3(dac_data6[12]),
        .O(\_inferred__1/i__carry__2_0 [2]));
  LUT4 #(
    .INIT(16'h02A2)) 
    dac_data4__254_carry__2_i_3
       (.I0(dac_data4__254_carry__2[1]),
        .I1(dac_data4__8_carry__0[1]),
        .I2(O[1]),
        .I3(dac_data6[11]),
        .O(\_inferred__1/i__carry__2_0 [1]));
  LUT4 #(
    .INIT(16'h02A2)) 
    dac_data4__254_carry__2_i_4
       (.I0(dac_data4__254_carry__2[0]),
        .I1(dac_data4__8_carry__0[0]),
        .I2(O[1]),
        .I3(dac_data6[10]),
        .O(\_inferred__1/i__carry__2_0 [0]));
  LUT6 #(
    .INIT(64'hB8FF47004700B8FF)) 
    dac_data4__254_carry__2_i_5
       (.I0(dac_data6[13]),
        .I1(O[1]),
        .I2(dac_data4__8_carry__0[3]),
        .I3(dac_data4__254_carry__2[3]),
        .I4(dac_data4__254_carry__3[0]),
        .I5(dac_data4__8_carry__3_i_9_n_0),
        .O(dac_data4__8_carry__3_i_9_0[2]));
  LUT6 #(
    .INIT(64'hB8FF47004700B8FF)) 
    dac_data4__254_carry__2_i_6
       (.I0(dac_data6[12]),
        .I1(O[1]),
        .I2(dac_data4__8_carry__0[2]),
        .I3(dac_data4__254_carry__2[2]),
        .I4(dac_data4__254_carry__2[3]),
        .I5(dac_data4__8_carry__3_i_11_n_0),
        .O(dac_data4__8_carry__3_i_9_0[1]));
  LUT6 #(
    .INIT(64'hB8FF47004700B8FF)) 
    dac_data4__254_carry__2_i_7
       (.I0(dac_data6[11]),
        .I1(O[1]),
        .I2(dac_data4__8_carry__0[1]),
        .I3(dac_data4__254_carry__2[1]),
        .I4(dac_data4__254_carry__2[2]),
        .I5(dac_data4__8_carry__2_i_9_n_0),
        .O(dac_data4__8_carry__3_i_9_0[0]));
  LUT3 #(
    .INIT(8'hD0)) 
    dac_data4__254_carry__3_i_1
       (.I0(O[1]),
        .I1(CO),
        .I2(dac_data4__254_carry__3[3]),
        .O(dac_data4__171_carry__2[3]));
  LUT3 #(
    .INIT(8'hD0)) 
    dac_data4__254_carry__3_i_2
       (.I0(O[1]),
        .I1(CO),
        .I2(dac_data4__254_carry__3[2]),
        .O(dac_data4__171_carry__2[2]));
  LUT3 #(
    .INIT(8'h2A)) 
    dac_data4__254_carry__3_i_3
       (.I0(dac_data4__254_carry__3[1]),
        .I1(O[1]),
        .I2(dac_data6[15]),
        .O(dac_data4__171_carry__2[1]));
  LUT4 #(
    .INIT(16'h02A2)) 
    dac_data4__254_carry__3_i_4
       (.I0(dac_data4__254_carry__3[0]),
        .I1(O[0]),
        .I2(O[1]),
        .I3(dac_data6[14]),
        .O(dac_data4__171_carry__2[0]));
  LUT4 #(
    .INIT(16'hBA45)) 
    dac_data4__254_carry__3_i_5
       (.I0(dac_data4__254_carry__3[3]),
        .I1(CO),
        .I2(O[1]),
        .I3(dac_data4__254_carry__4[0]),
        .O(dac_data4__171_carry__3_0[3]));
  LUT4 #(
    .INIT(16'hBA45)) 
    dac_data4__254_carry__3_i_6
       (.I0(dac_data4__254_carry__3[2]),
        .I1(CO),
        .I2(O[1]),
        .I3(dac_data4__254_carry__3[3]),
        .O(dac_data4__171_carry__3_0[2]));
  LUT5 #(
    .INIT(32'h4BCCB433)) 
    dac_data4__254_carry__3_i_7
       (.I0(dac_data6[15]),
        .I1(dac_data4__254_carry__3[1]),
        .I2(CO),
        .I3(O[1]),
        .I4(dac_data4__254_carry__3[2]),
        .O(dac_data4__171_carry__3_0[1]));
  LUT6 #(
    .INIT(64'hAF5050AF30CF30CF)) 
    dac_data4__254_carry__3_i_8
       (.I0(dac_data6[14]),
        .I1(O[0]),
        .I2(dac_data4__254_carry__3[0]),
        .I3(dac_data4__254_carry__3[1]),
        .I4(dac_data6[15]),
        .I5(O[1]),
        .O(dac_data4__171_carry__3_0[0]));
  LUT3 #(
    .INIT(8'hD0)) 
    dac_data4__254_carry__4_i_1
       (.I0(O[1]),
        .I1(CO),
        .I2(dac_data4__254_carry__4[3]),
        .O(dac_data4__171_carry__3[3]));
  LUT3 #(
    .INIT(8'hD0)) 
    dac_data4__254_carry__4_i_2
       (.I0(O[1]),
        .I1(CO),
        .I2(dac_data4__254_carry__4[2]),
        .O(dac_data4__171_carry__3[2]));
  LUT3 #(
    .INIT(8'hD0)) 
    dac_data4__254_carry__4_i_3
       (.I0(O[1]),
        .I1(CO),
        .I2(dac_data4__254_carry__4[1]),
        .O(dac_data4__171_carry__3[1]));
  LUT3 #(
    .INIT(8'hD0)) 
    dac_data4__254_carry__4_i_4
       (.I0(O[1]),
        .I1(CO),
        .I2(dac_data4__254_carry__4[0]),
        .O(dac_data4__171_carry__3[0]));
  LUT4 #(
    .INIT(16'hBA45)) 
    dac_data4__254_carry__4_i_5
       (.I0(dac_data4__254_carry__4[3]),
        .I1(CO),
        .I2(O[1]),
        .I3(dac_data4__254_carry__5[0]),
        .O(dac_data4__171_carry__4_0[3]));
  LUT4 #(
    .INIT(16'hBA45)) 
    dac_data4__254_carry__4_i_6
       (.I0(dac_data4__254_carry__4[2]),
        .I1(CO),
        .I2(O[1]),
        .I3(dac_data4__254_carry__4[3]),
        .O(dac_data4__171_carry__4_0[2]));
  LUT4 #(
    .INIT(16'hBA45)) 
    dac_data4__254_carry__4_i_7
       (.I0(dac_data4__254_carry__4[1]),
        .I1(CO),
        .I2(O[1]),
        .I3(dac_data4__254_carry__4[2]),
        .O(dac_data4__171_carry__4_0[1]));
  LUT4 #(
    .INIT(16'hBA45)) 
    dac_data4__254_carry__4_i_8
       (.I0(dac_data4__254_carry__4[0]),
        .I1(CO),
        .I2(O[1]),
        .I3(dac_data4__254_carry__4[1]),
        .O(dac_data4__171_carry__4_0[0]));
  LUT3 #(
    .INIT(8'hD0)) 
    dac_data4__254_carry__5_i_1
       (.I0(O[1]),
        .I1(CO),
        .I2(dac_data4__254_carry__5[3]),
        .O(dac_data4__171_carry__4[3]));
  LUT3 #(
    .INIT(8'hD0)) 
    dac_data4__254_carry__5_i_2
       (.I0(O[1]),
        .I1(CO),
        .I2(dac_data4__254_carry__5[2]),
        .O(dac_data4__171_carry__4[2]));
  LUT3 #(
    .INIT(8'hD0)) 
    dac_data4__254_carry__5_i_3
       (.I0(O[1]),
        .I1(CO),
        .I2(dac_data4__254_carry__5[1]),
        .O(dac_data4__171_carry__4[1]));
  LUT3 #(
    .INIT(8'hD0)) 
    dac_data4__254_carry__5_i_4
       (.I0(O[1]),
        .I1(CO),
        .I2(dac_data4__254_carry__5[0]),
        .O(dac_data4__171_carry__4[0]));
  LUT4 #(
    .INIT(16'hBA45)) 
    dac_data4__254_carry__5_i_5
       (.I0(dac_data4__254_carry__5[3]),
        .I1(CO),
        .I2(O[1]),
        .I3(\dac_data_reg[1] [0]),
        .O(dac_data4__171_carry__5_0[3]));
  LUT4 #(
    .INIT(16'hBA45)) 
    dac_data4__254_carry__5_i_6
       (.I0(dac_data4__254_carry__5[2]),
        .I1(CO),
        .I2(O[1]),
        .I3(dac_data4__254_carry__5[3]),
        .O(dac_data4__171_carry__5_0[2]));
  LUT4 #(
    .INIT(16'hBA45)) 
    dac_data4__254_carry__5_i_7
       (.I0(dac_data4__254_carry__5[1]),
        .I1(CO),
        .I2(O[1]),
        .I3(dac_data4__254_carry__5[2]),
        .O(dac_data4__171_carry__5_0[1]));
  LUT4 #(
    .INIT(16'hBA45)) 
    dac_data4__254_carry__5_i_8
       (.I0(dac_data4__254_carry__5[0]),
        .I1(CO),
        .I2(O[1]),
        .I3(dac_data4__254_carry__5[1]),
        .O(dac_data4__171_carry__5_0[0]));
  LUT3 #(
    .INIT(8'hD0)) 
    dac_data4__254_carry__6_i_1
       (.I0(O[1]),
        .I1(CO),
        .I2(\dac_data_reg[1] [2]),
        .O(dac_data4__171_carry__5[2]));
  LUT3 #(
    .INIT(8'hD0)) 
    dac_data4__254_carry__6_i_2
       (.I0(O[1]),
        .I1(CO),
        .I2(\dac_data_reg[1] [1]),
        .O(dac_data4__171_carry__5[1]));
  LUT3 #(
    .INIT(8'hD0)) 
    dac_data4__254_carry__6_i_3
       (.I0(O[1]),
        .I1(CO),
        .I2(\dac_data_reg[1] [0]),
        .O(dac_data4__171_carry__5[0]));
  LUT4 #(
    .INIT(16'hBA45)) 
    dac_data4__254_carry__6_i_4
       (.I0(\dac_data_reg[1] [2]),
        .I1(CO),
        .I2(O[1]),
        .I3(\dac_data_reg[1] [3]),
        .O(dac_data4__171_carry__5_1[2]));
  LUT4 #(
    .INIT(16'hBA45)) 
    dac_data4__254_carry__6_i_5
       (.I0(\dac_data_reg[1] [1]),
        .I1(CO),
        .I2(O[1]),
        .I3(\dac_data_reg[1] [2]),
        .O(dac_data4__171_carry__5_1[1]));
  LUT4 #(
    .INIT(16'hBA45)) 
    dac_data4__254_carry__6_i_6
       (.I0(\dac_data_reg[1] [0]),
        .I1(CO),
        .I2(O[1]),
        .I3(\dac_data_reg[1] [1]),
        .O(dac_data4__171_carry__5_1[0]));
  LUT4 #(
    .INIT(16'hABFB)) 
    dac_data4__254_carry_i_1
       (.I0(dac_data4__254_carry_0[1]),
        .I1(dac_data4__254_carry[2]),
        .I2(O[1]),
        .I3(dac_data6[1]),
        .O(\_inferred__1/i__carry [1]));
  LUT4 #(
    .INIT(16'hABFB)) 
    dac_data4__254_carry_i_2
       (.I0(dac_data4__254_carry_0[0]),
        .I1(dac_data4__254_carry[1]),
        .I2(O[1]),
        .I3(dac_data6[0]),
        .O(\_inferred__1/i__carry [0]));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__72_carry__1_i_1
       (.I0(dac_data4__72_carry__2[1]),
        .I1(dac_data4__72_carry__3_0[0]),
        .O(dac_data4__8_carry__6_1));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__72_carry__2_i_1
       (.I0(dac_data4__72_carry__3_0[1]),
        .I1(dac_data4__8_carry__6_0),
        .O(dac_data4__72_carry__3_i_1_1[3]));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__72_carry__2_i_2
       (.I0(dac_data4__72_carry__3_0[0]),
        .I1(dac_data4__72_carry__3_0[3]),
        .O(dac_data4__72_carry__3_i_1_1[2]));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__72_carry__2_i_3
       (.I0(dac_data4__72_carry__2[3]),
        .I1(dac_data4__72_carry__3_0[2]),
        .O(dac_data4__72_carry__3_i_1_1[1]));
  LUT2 #(
    .INIT(4'h9)) 
    dac_data4__72_carry__2_i_4
       (.I0(dac_data4__72_carry__2[2]),
        .I1(dac_data4__72_carry__3_0[1]),
        .O(dac_data4__72_carry__3_i_1_1[0]));
  CARRY4 dac_data4__72_carry__3_i_1
       (.CI(dac_data4__72_carry__3_1),
        .CO({NLW_dac_data4__72_carry__3_i_1_CO_UNCONNECTED[3:1],dac_data4__8_carry__6_0}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_dac_data4__72_carry__3_i_1_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT1 #(
    .INIT(2'h1)) 
    dac_data4__72_carry__3_i_2
       (.I0(dac_data4__8_carry__6_0),
        .O(dac_data4__72_carry__3_i_1_3[2]));
  LUT1 #(
    .INIT(2'h1)) 
    dac_data4__72_carry__3_i_3
       (.I0(dac_data4__72_carry__3_0[3]),
        .O(dac_data4__72_carry__3_i_1_3[1]));
  LUT1 #(
    .INIT(2'h1)) 
    dac_data4__72_carry__3_i_4
       (.I0(dac_data4__72_carry__3_0[2]),
        .O(dac_data4__72_carry__3_i_1_3[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__0_i_1
       (.I0(dac_data6[13]),
        .I1(O[1]),
        .I2(dac_data4__8_carry__0[3]),
        .O(dac_data6__90_carry__1_0[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__0_i_2
       (.I0(dac_data6[12]),
        .I1(O[1]),
        .I2(dac_data4__8_carry__0[2]),
        .O(dac_data6__90_carry__1_0[0]));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    dac_data4__8_carry__0_i_5
       (.I0(dac_data4__8_carry__0[3]),
        .I1(dac_data6[13]),
        .I2(dac_data4__8_carry__0_0[3]),
        .I3(O[1]),
        .I4(dac_data6[5]),
        .O(\_inferred__1/i__carry__0_0 [1]));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    dac_data4__8_carry__0_i_6
       (.I0(dac_data4__8_carry__0[2]),
        .I1(dac_data6[12]),
        .I2(dac_data4__8_carry__0_0[2]),
        .I3(O[1]),
        .I4(dac_data6[4]),
        .O(\_inferred__1/i__carry__0_0 [0]));
  LUT6 #(
    .INIT(64'hDFD04F40D0D04040)) 
    dac_data4__8_carry__1_i_1
       (.I0(CO),
        .I1(dac_data6[0]),
        .I2(O[1]),
        .I3(dac_data4__254_carry[1]),
        .I4(dac_data6[8]),
        .I5(dac_data4__254_carry__1[2]),
        .O(DI[3]));
  LUT6 #(
    .INIT(64'h606F909F6F609F90)) 
    dac_data4__8_carry__1_i_2
       (.I0(CO),
        .I1(dac_data6[0]),
        .I2(O[1]),
        .I3(dac_data4__254_carry[1]),
        .I4(dac_data6[8]),
        .I5(dac_data4__254_carry__1[2]),
        .O(DI[2]));
  LUT2 #(
    .INIT(4'h8)) 
    dac_data4__8_carry__1_i_3
       (.I0(dac_data6[15]),
        .I1(O[1]),
        .O(DI[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__1_i_4
       (.I0(dac_data6[14]),
        .I1(O[1]),
        .I2(O[0]),
        .O(DI[0]));
  LUT5 #(
    .INIT(32'h995A665A)) 
    dac_data4__8_carry__1_i_7
       (.I0(dac_data4__254_carry[0]),
        .I1(dac_data6[7]),
        .I2(dac_data4__254_carry__1[1]),
        .I3(O[1]),
        .I4(dac_data6[15]),
        .O(\_inferred__1/i__carry__2_1 [1]));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    dac_data4__8_carry__1_i_8
       (.I0(O[0]),
        .I1(dac_data6[14]),
        .I2(dac_data4__254_carry__1[0]),
        .I3(O[1]),
        .I4(dac_data6[6]),
        .O(\_inferred__1/i__carry__2_1 [0]));
  CARRY4 dac_data4__8_carry__1_i_9
       (.CI(dac_data4__8_carry__1_i_6),
        .CO({NLW_dac_data4__8_carry__1_i_9_CO_UNCONNECTED[3:1],CO}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_dac_data4__8_carry__1_i_9_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT6 #(
    .INIT(64'hDFD04F40D0D04040)) 
    dac_data4__8_carry__2_i_1
       (.I0(CO),
        .I1(dac_data6[4]),
        .I2(O[1]),
        .I3(dac_data4__8_carry__0_0[2]),
        .I4(dac_data6[12]),
        .I5(dac_data4__8_carry__0[2]),
        .O(dac_data6__90_carry__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    dac_data4__8_carry__2_i_10
       (.I0(dac_data4__8_carry__0[3]),
        .I1(dac_data6[13]),
        .I2(dac_data4__8_carry__0_0[3]),
        .I3(O[1]),
        .I4(dac_data6[5]),
        .O(dac_data4__8_carry__2_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    dac_data4__8_carry__2_i_12
       (.I0(dac_data4__8_carry__0[2]),
        .I1(dac_data6[12]),
        .I2(dac_data4__8_carry__0_0[2]),
        .I3(O[1]),
        .I4(dac_data6[4]),
        .O(dac_data4__8_carry__2_i_12_n_0));
  LUT6 #(
    .INIT(64'hDFD04F40D0D04040)) 
    dac_data4__8_carry__2_i_2
       (.I0(CO),
        .I1(dac_data6[3]),
        .I2(O[1]),
        .I3(dac_data4__8_carry__0_0[1]),
        .I4(dac_data6[11]),
        .I5(dac_data4__8_carry__0[1]),
        .O(dac_data6__90_carry__1[2]));
  LUT6 #(
    .INIT(64'hDFD04F40D0D04040)) 
    dac_data4__8_carry__2_i_3
       (.I0(CO),
        .I1(dac_data6[2]),
        .I2(O[1]),
        .I3(dac_data4__8_carry__0_0[0]),
        .I4(dac_data6[10]),
        .I5(dac_data4__8_carry__0[0]),
        .O(dac_data6__90_carry__1[1]));
  LUT6 #(
    .INIT(64'hDFD04F40D0D04040)) 
    dac_data4__8_carry__2_i_4
       (.I0(CO),
        .I1(dac_data6[1]),
        .I2(O[1]),
        .I3(dac_data4__254_carry[2]),
        .I4(dac_data6[9]),
        .I5(dac_data4__254_carry__1[3]),
        .O(dac_data6__90_carry__1[0]));
  LUT6 #(
    .INIT(64'h5FFA7777A0058888)) 
    dac_data4__8_carry__2_i_5
       (.I0(dac_data4__8_carry__2_i_9_n_0),
        .I1(dac_data4__8_carry__0_0[2]),
        .I2(dac_data6[4]),
        .I3(CO),
        .I4(O[1]),
        .I5(dac_data4__8_carry__2_i_10_n_0),
        .O(dac_data4__8_carry__2_i_10_0[1]));
  LUT6 #(
    .INIT(64'h5FFA7777A0058888)) 
    dac_data4__8_carry__2_i_6
       (.I0(dac_data4__8_carry__2),
        .I1(dac_data4__8_carry__0_0[1]),
        .I2(dac_data6[3]),
        .I3(CO),
        .I4(O[1]),
        .I5(dac_data4__8_carry__2_i_12_n_0),
        .O(dac_data4__8_carry__2_i_10_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__2_i_9
       (.I0(dac_data6[12]),
        .I1(O[1]),
        .I2(dac_data4__8_carry__0[2]),
        .O(dac_data4__8_carry__2_i_9_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__3_i_1
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_1[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__3_i_11
       (.I0(dac_data6[13]),
        .I1(O[1]),
        .I2(dac_data4__8_carry__0[3]),
        .O(dac_data4__8_carry__3_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    dac_data4__8_carry__3_i_12
       (.I0(O[0]),
        .I1(dac_data6[14]),
        .I2(dac_data4__254_carry__1[0]),
        .I3(O[1]),
        .I4(dac_data6[6]),
        .O(dac_data4__8_carry__3_i_12_n_0));
  LUT4 #(
    .INIT(16'hD040)) 
    dac_data4__8_carry__3_i_2
       (.I0(CO),
        .I1(dac_data6[7]),
        .I2(O[1]),
        .I3(dac_data6[15]),
        .O(dac_data4__8_carry__1_i_9_1[2]));
  LUT6 #(
    .INIT(64'hDFD04F40D0D04040)) 
    dac_data4__8_carry__3_i_3
       (.I0(CO),
        .I1(dac_data6[6]),
        .I2(O[1]),
        .I3(dac_data4__254_carry__1[0]),
        .I4(dac_data6[14]),
        .I5(O[0]),
        .O(dac_data4__8_carry__1_i_9_1[1]));
  LUT6 #(
    .INIT(64'hDFD04F40D0D04040)) 
    dac_data4__8_carry__3_i_4
       (.I0(CO),
        .I1(dac_data6[5]),
        .I2(O[1]),
        .I3(dac_data4__8_carry__0_0[3]),
        .I4(dac_data6[13]),
        .I5(dac_data4__8_carry__0[3]),
        .O(dac_data4__8_carry__1_i_9_1[0]));
  LUT4 #(
    .INIT(16'hB874)) 
    dac_data4__8_carry__3_i_5
       (.I0(CO),
        .I1(O[1]),
        .I2(dac_data4__254_carry__1[3]),
        .I3(dac_data6[9]),
        .O(\_inferred__1/i__carry__1 [3]));
  LUT6 #(
    .INIT(64'h71FF71008EFF8E00)) 
    dac_data4__8_carry__3_i_6
       (.I0(dac_data6[15]),
        .I1(dac_data4__8_carry__3_1),
        .I2(CO),
        .I3(O[1]),
        .I4(dac_data4__254_carry__1[2]),
        .I5(dac_data6[8]),
        .O(\_inferred__1/i__carry__1 [2]));
  LUT6 #(
    .INIT(64'h81777E777E888188)) 
    dac_data4__8_carry__3_i_7
       (.I0(dac_data4__8_carry__3_i_9_n_0),
        .I1(dac_data4__8_carry__3_0),
        .I2(CO),
        .I3(O[1]),
        .I4(dac_data6[15]),
        .I5(dac_data4__8_carry__3_1),
        .O(\_inferred__1/i__carry__1 [1]));
  LUT6 #(
    .INIT(64'h5FFA7777A0058888)) 
    dac_data4__8_carry__3_i_8
       (.I0(dac_data4__8_carry__3_i_11_n_0),
        .I1(dac_data4__8_carry__0_0[3]),
        .I2(dac_data6[5]),
        .I3(CO),
        .I4(O[1]),
        .I5(dac_data4__8_carry__3_i_12_n_0),
        .O(\_inferred__1/i__carry__1 [0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    dac_data4__8_carry__3_i_9
       (.I0(dac_data6[14]),
        .I1(O[1]),
        .I2(O[0]),
        .O(dac_data4__8_carry__3_i_9_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__4_i_1
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_3[3]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__4_i_2
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_3[2]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__4_i_3
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_3[1]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__4_i_4
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_3[0]));
  LUT4 #(
    .INIT(16'hB874)) 
    dac_data4__8_carry__4_i_5
       (.I0(CO),
        .I1(O[1]),
        .I2(dac_data4__8_carry__0[3]),
        .I3(dac_data6[13]),
        .O(\_inferred__1/i__carry__2 [3]));
  LUT4 #(
    .INIT(16'hB874)) 
    dac_data4__8_carry__4_i_6
       (.I0(CO),
        .I1(O[1]),
        .I2(dac_data4__8_carry__0[2]),
        .I3(dac_data6[12]),
        .O(\_inferred__1/i__carry__2 [2]));
  LUT4 #(
    .INIT(16'hB874)) 
    dac_data4__8_carry__4_i_7
       (.I0(CO),
        .I1(O[1]),
        .I2(dac_data4__8_carry__0[1]),
        .I3(dac_data6[11]),
        .O(\_inferred__1/i__carry__2 [1]));
  LUT4 #(
    .INIT(16'hB874)) 
    dac_data4__8_carry__4_i_8
       (.I0(CO),
        .I1(O[1]),
        .I2(dac_data4__8_carry__0[0]),
        .I3(dac_data6[10]),
        .O(\_inferred__1/i__carry__2 [0]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__5_i_1
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_2[3]));
  LUT3 #(
    .INIT(8'h08)) 
    dac_data4__8_carry__5_i_2
       (.I0(dac_data6[15]),
        .I1(O[1]),
        .I2(CO),
        .O(dac_data4__8_carry__1_i_9_2[2]));
  LUT3 #(
    .INIT(8'h08)) 
    dac_data4__8_carry__5_i_3
       (.I0(dac_data6[14]),
        .I1(O[1]),
        .I2(CO),
        .O(dac_data4__8_carry__1_i_9_2[1]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__5_i_4
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_2[0]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__5_i_5
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_0[3]));
  LUT3 #(
    .INIT(8'h08)) 
    dac_data4__8_carry__5_i_6
       (.I0(dac_data6[15]),
        .I1(O[1]),
        .I2(CO),
        .O(dac_data4__8_carry__1_i_9_0[2]));
  LUT4 #(
    .INIT(16'hE010)) 
    dac_data4__8_carry__5_i_7
       (.I0(dac_data6[14]),
        .I1(CO),
        .I2(O[1]),
        .I3(dac_data6[15]),
        .O(dac_data4__8_carry__1_i_9_0[1]));
  LUT3 #(
    .INIT(8'hD8)) 
    dac_data4__8_carry__5_i_8
       (.I0(O[1]),
        .I1(dac_data6[14]),
        .I2(O[0]),
        .O(dac_data4__8_carry__1_i_9_0[0]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__6_i_1
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_5[3]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__6_i_2
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_5[2]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__6_i_3
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_5[1]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__6_i_4
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_5[0]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__6_i_5
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_4[3]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__6_i_6
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_4[2]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__6_i_7
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_4[1]));
  LUT2 #(
    .INIT(4'h2)) 
    dac_data4__8_carry__6_i_8
       (.I0(O[1]),
        .I1(CO),
        .O(dac_data4__8_carry__1_i_9_4[0]));
  LUT4 #(
    .INIT(16'h1DE2)) 
    dac_data4__8_carry_i_6
       (.I0(dac_data4__254_carry__1[1]),
        .I1(O[1]),
        .I2(dac_data6[7]),
        .I3(dac_data4__254_carry[0]),
        .O(dac_data6__0_carry));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    dac_data6__0_carry__0_i_1
       (.I0(amplitude[0]),
        .I1(\^data_reg [6]),
        .I2(\^data_reg [4]),
        .I3(amplitude[2]),
        .I4(\^data_reg [5]),
        .I5(amplitude[1]),
        .O(\amplitude[0] [3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h7)) 
    dac_data6__0_carry__0_i_10
       (.I0(\^data_reg [4]),
        .I1(amplitude[2]),
        .O(dac_data6__0_carry__0_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h7)) 
    dac_data6__0_carry__0_i_11
       (.I0(\^data_reg [3]),
        .I1(amplitude[2]),
        .O(dac_data6__0_carry__0_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h7)) 
    dac_data6__0_carry__0_i_12
       (.I0(\^data_reg [2]),
        .I1(amplitude[2]),
        .O(dac_data6__0_carry__0_i_12_n_0));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    dac_data6__0_carry__0_i_2
       (.I0(amplitude[0]),
        .I1(\^data_reg [5]),
        .I2(\^data_reg [3]),
        .I3(amplitude[2]),
        .I4(\^data_reg [4]),
        .I5(amplitude[1]),
        .O(\amplitude[0] [2]));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    dac_data6__0_carry__0_i_3
       (.I0(amplitude[0]),
        .I1(\^data_reg [4]),
        .I2(\^data_reg [2]),
        .I3(amplitude[2]),
        .I4(\^data_reg [3]),
        .I5(amplitude[1]),
        .O(\amplitude[0] [1]));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    dac_data6__0_carry__0_i_4
       (.I0(amplitude[0]),
        .I1(\^data_reg [3]),
        .I2(\^data_reg [1]),
        .I3(amplitude[2]),
        .I4(\^data_reg [2]),
        .I5(amplitude[1]),
        .O(\amplitude[0] [0]));
  LUT6 #(
    .INIT(64'h956A6A95956A956A)) 
    dac_data6__0_carry__0_i_5
       (.I0(\amplitude[0] [3]),
        .I1(amplitude[1]),
        .I2(\^data_reg [6]),
        .I3(dac_data6__0_carry__0_i_9_n_0),
        .I4(\^data_reg [7]),
        .I5(amplitude[0]),
        .O(\amplitude[1]_0 [3]));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    dac_data6__0_carry__0_i_6
       (.I0(\amplitude[0] [2]),
        .I1(amplitude[1]),
        .I2(\^data_reg [5]),
        .I3(dac_data6__0_carry__0_i_10_n_0),
        .I4(\^data_reg [6]),
        .I5(amplitude[0]),
        .O(\amplitude[1]_0 [2]));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    dac_data6__0_carry__0_i_7
       (.I0(\amplitude[0] [1]),
        .I1(amplitude[1]),
        .I2(\^data_reg [4]),
        .I3(dac_data6__0_carry__0_i_11_n_0),
        .I4(\^data_reg [5]),
        .I5(amplitude[0]),
        .O(\amplitude[1]_0 [1]));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    dac_data6__0_carry__0_i_8
       (.I0(\amplitude[0] [0]),
        .I1(amplitude[1]),
        .I2(\^data_reg [3]),
        .I3(dac_data6__0_carry__0_i_12_n_0),
        .I4(\^data_reg [4]),
        .I5(amplitude[0]),
        .O(\amplitude[1]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h7)) 
    dac_data6__0_carry__0_i_9
       (.I0(\^data_reg [5]),
        .I1(amplitude[2]),
        .O(dac_data6__0_carry__0_i_9_n_0));
  LUT4 #(
    .INIT(16'hD000)) 
    dac_data6__0_carry__1_i_1
       (.I0(amplitude[1]),
        .I1(\^data_reg [7]),
        .I2(amplitude[2]),
        .I3(\^data_reg [6]),
        .O(\amplitude[1] [1]));
  LUT6 #(
    .INIT(64'hF8888000F888F888)) 
    dac_data6__0_carry__1_i_2
       (.I0(amplitude[2]),
        .I1(\^data_reg [5]),
        .I2(\^data_reg [6]),
        .I3(amplitude[1]),
        .I4(\^data_reg [7]),
        .I5(amplitude[0]),
        .O(\amplitude[1] [0]));
  LUT4 #(
    .INIT(16'h5F2F)) 
    dac_data6__0_carry__1_i_3
       (.I0(\^data_reg [6]),
        .I1(amplitude[1]),
        .I2(amplitude[2]),
        .I3(\^data_reg [7]),
        .O(data_reg_3[1]));
  LUT6 #(
    .INIT(64'hF30F2450C3FF4BFF)) 
    dac_data6__0_carry__1_i_4
       (.I0(amplitude[0]),
        .I1(\^data_reg [5]),
        .I2(\^data_reg [6]),
        .I3(amplitude[2]),
        .I4(\^data_reg [7]),
        .I5(amplitude[1]),
        .O(data_reg_3[0]));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    dac_data6__0_carry_i_1
       (.I0(amplitude[0]),
        .I1(\^data_reg [3]),
        .I2(\^data_reg [1]),
        .I3(amplitude[2]),
        .I4(\^data_reg [2]),
        .I5(amplitude[1]),
        .O(\amplitude[0]_0 [2]));
  LUT4 #(
    .INIT(16'h7888)) 
    dac_data6__0_carry_i_2
       (.I0(amplitude[1]),
        .I1(\^data_reg [1]),
        .I2(amplitude[2]),
        .I3(\^data_reg [0]),
        .O(\amplitude[0]_0 [1]));
  LUT2 #(
    .INIT(4'h8)) 
    dac_data6__0_carry_i_3
       (.I0(\^data_reg [1]),
        .I1(amplitude[0]),
        .O(\amplitude[0]_0 [0]));
  LUT6 #(
    .INIT(64'h9699CC3399993333)) 
    dac_data6__0_carry_i_4
       (.I0(\^data_reg [2]),
        .I1(dac_data6__0_carry_i_8_n_0),
        .I2(\^data_reg [0]),
        .I3(\^data_reg [1]),
        .I4(amplitude[1]),
        .I5(amplitude[2]),
        .O(data_reg_0[3]));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    dac_data6__0_carry_i_5
       (.I0(\^data_reg [0]),
        .I1(amplitude[2]),
        .I2(\^data_reg [1]),
        .I3(amplitude[1]),
        .I4(amplitude[0]),
        .I5(\^data_reg [2]),
        .O(data_reg_0[2]));
  LUT4 #(
    .INIT(16'h7888)) 
    dac_data6__0_carry_i_6
       (.I0(amplitude[0]),
        .I1(\^data_reg [1]),
        .I2(amplitude[1]),
        .I3(\^data_reg [0]),
        .O(data_reg_0[1]));
  LUT2 #(
    .INIT(4'h8)) 
    dac_data6__0_carry_i_7
       (.I0(\^data_reg [0]),
        .I1(amplitude[0]),
        .O(data_reg_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h7)) 
    dac_data6__0_carry_i_8
       (.I0(\^data_reg [3]),
        .I1(amplitude[0]),
        .O(dac_data6__0_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    dac_data6__30_carry__0_i_1
       (.I0(amplitude[3]),
        .I1(\^data_reg [6]),
        .I2(\^data_reg [4]),
        .I3(amplitude[5]),
        .I4(\^data_reg [5]),
        .I5(amplitude[4]),
        .O(\amplitude[3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h7)) 
    dac_data6__30_carry__0_i_10
       (.I0(\^data_reg [4]),
        .I1(amplitude[5]),
        .O(dac_data6__30_carry__0_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h7)) 
    dac_data6__30_carry__0_i_11
       (.I0(\^data_reg [3]),
        .I1(amplitude[5]),
        .O(dac_data6__30_carry__0_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h7)) 
    dac_data6__30_carry__0_i_12
       (.I0(\^data_reg [2]),
        .I1(amplitude[5]),
        .O(dac_data6__30_carry__0_i_12_n_0));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    dac_data6__30_carry__0_i_2
       (.I0(amplitude[3]),
        .I1(\^data_reg [5]),
        .I2(\^data_reg [3]),
        .I3(amplitude[5]),
        .I4(\^data_reg [4]),
        .I5(amplitude[4]),
        .O(\amplitude[3] [2]));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    dac_data6__30_carry__0_i_3
       (.I0(amplitude[3]),
        .I1(\^data_reg [4]),
        .I2(\^data_reg [2]),
        .I3(amplitude[5]),
        .I4(\^data_reg [3]),
        .I5(amplitude[4]),
        .O(\amplitude[3] [1]));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    dac_data6__30_carry__0_i_4
       (.I0(amplitude[3]),
        .I1(\^data_reg [3]),
        .I2(\^data_reg [1]),
        .I3(amplitude[5]),
        .I4(\^data_reg [2]),
        .I5(amplitude[4]),
        .O(\amplitude[3] [0]));
  LUT6 #(
    .INIT(64'h956A6A95956A956A)) 
    dac_data6__30_carry__0_i_5
       (.I0(\amplitude[3] [3]),
        .I1(amplitude[4]),
        .I2(\^data_reg [6]),
        .I3(dac_data6__30_carry__0_i_9_n_0),
        .I4(\^data_reg [7]),
        .I5(amplitude[3]),
        .O(\amplitude[4]_0 [3]));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    dac_data6__30_carry__0_i_6
       (.I0(\amplitude[3] [2]),
        .I1(amplitude[4]),
        .I2(\^data_reg [5]),
        .I3(dac_data6__30_carry__0_i_10_n_0),
        .I4(\^data_reg [6]),
        .I5(amplitude[3]),
        .O(\amplitude[4]_0 [2]));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    dac_data6__30_carry__0_i_7
       (.I0(\amplitude[3] [1]),
        .I1(amplitude[4]),
        .I2(\^data_reg [4]),
        .I3(dac_data6__30_carry__0_i_11_n_0),
        .I4(\^data_reg [5]),
        .I5(amplitude[3]),
        .O(\amplitude[4]_0 [1]));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    dac_data6__30_carry__0_i_8
       (.I0(\amplitude[3] [0]),
        .I1(amplitude[4]),
        .I2(\^data_reg [3]),
        .I3(dac_data6__30_carry__0_i_12_n_0),
        .I4(\^data_reg [4]),
        .I5(amplitude[3]),
        .O(\amplitude[4]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h7)) 
    dac_data6__30_carry__0_i_9
       (.I0(\^data_reg [5]),
        .I1(amplitude[5]),
        .O(dac_data6__30_carry__0_i_9_n_0));
  LUT4 #(
    .INIT(16'hD000)) 
    dac_data6__30_carry__1_i_1
       (.I0(amplitude[4]),
        .I1(\^data_reg [7]),
        .I2(amplitude[5]),
        .I3(\^data_reg [6]),
        .O(\amplitude[4] [1]));
  LUT6 #(
    .INIT(64'hF8888000F888F888)) 
    dac_data6__30_carry__1_i_2
       (.I0(amplitude[5]),
        .I1(\^data_reg [5]),
        .I2(\^data_reg [6]),
        .I3(amplitude[4]),
        .I4(\^data_reg [7]),
        .I5(amplitude[3]),
        .O(\amplitude[4] [0]));
  LUT4 #(
    .INIT(16'h5F2F)) 
    dac_data6__30_carry__1_i_3
       (.I0(\^data_reg [6]),
        .I1(amplitude[4]),
        .I2(amplitude[5]),
        .I3(\^data_reg [7]),
        .O(data_reg_4[1]));
  LUT6 #(
    .INIT(64'hF30F2450C3FF4BFF)) 
    dac_data6__30_carry__1_i_4
       (.I0(amplitude[3]),
        .I1(\^data_reg [5]),
        .I2(\^data_reg [6]),
        .I3(amplitude[5]),
        .I4(\^data_reg [7]),
        .I5(amplitude[4]),
        .O(data_reg_4[0]));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    dac_data6__30_carry_i_1
       (.I0(amplitude[3]),
        .I1(\^data_reg [3]),
        .I2(\^data_reg [1]),
        .I3(amplitude[5]),
        .I4(\^data_reg [2]),
        .I5(amplitude[4]),
        .O(\amplitude[3]_0 [2]));
  LUT4 #(
    .INIT(16'h7888)) 
    dac_data6__30_carry_i_2
       (.I0(amplitude[4]),
        .I1(\^data_reg [1]),
        .I2(amplitude[5]),
        .I3(\^data_reg [0]),
        .O(\amplitude[3]_0 [1]));
  LUT2 #(
    .INIT(4'h8)) 
    dac_data6__30_carry_i_3
       (.I0(\^data_reg [1]),
        .I1(amplitude[3]),
        .O(\amplitude[3]_0 [0]));
  LUT6 #(
    .INIT(64'h9699CC3399993333)) 
    dac_data6__30_carry_i_4
       (.I0(\^data_reg [2]),
        .I1(dac_data6__30_carry_i_8_n_0),
        .I2(\^data_reg [0]),
        .I3(\^data_reg [1]),
        .I4(amplitude[4]),
        .I5(amplitude[5]),
        .O(data_reg_1[3]));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    dac_data6__30_carry_i_5
       (.I0(\^data_reg [0]),
        .I1(amplitude[5]),
        .I2(\^data_reg [1]),
        .I3(amplitude[4]),
        .I4(amplitude[3]),
        .I5(\^data_reg [2]),
        .O(data_reg_1[2]));
  LUT4 #(
    .INIT(16'h7888)) 
    dac_data6__30_carry_i_6
       (.I0(amplitude[3]),
        .I1(\^data_reg [1]),
        .I2(amplitude[4]),
        .I3(\^data_reg [0]),
        .O(data_reg_1[1]));
  LUT2 #(
    .INIT(4'h8)) 
    dac_data6__30_carry_i_7
       (.I0(\^data_reg [0]),
        .I1(amplitude[3]),
        .O(data_reg_1[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h7)) 
    dac_data6__30_carry_i_8
       (.I0(\^data_reg [3]),
        .I1(amplitude[3]),
        .O(dac_data6__30_carry_i_8_n_0));
  LUT4 #(
    .INIT(16'hF888)) 
    dac_data6__59_carry__0_i_1
       (.I0(amplitude[6]),
        .I1(\^data_reg [6]),
        .I2(amplitude[7]),
        .I3(\^data_reg [5]),
        .O(\amplitude[6]_0 [3]));
  LUT4 #(
    .INIT(16'hF888)) 
    dac_data6__59_carry__0_i_2
       (.I0(amplitude[6]),
        .I1(\^data_reg [5]),
        .I2(amplitude[7]),
        .I3(\^data_reg [4]),
        .O(\amplitude[6]_0 [2]));
  LUT4 #(
    .INIT(16'hF888)) 
    dac_data6__59_carry__0_i_3
       (.I0(amplitude[6]),
        .I1(\^data_reg [4]),
        .I2(amplitude[7]),
        .I3(\^data_reg [3]),
        .O(\amplitude[6]_0 [1]));
  LUT4 #(
    .INIT(16'hF888)) 
    dac_data6__59_carry__0_i_4
       (.I0(amplitude[6]),
        .I1(\^data_reg [3]),
        .I2(amplitude[7]),
        .I3(\^data_reg [2]),
        .O(\amplitude[6]_0 [0]));
  LUT5 #(
    .INIT(32'h2CD36060)) 
    dac_data6__59_carry__0_i_5
       (.I0(\^data_reg [5]),
        .I1(\^data_reg [6]),
        .I2(amplitude[7]),
        .I3(\^data_reg [7]),
        .I4(amplitude[6]),
        .O(data_reg_5[3]));
  LUT5 #(
    .INIT(32'h2CD39F9F)) 
    dac_data6__59_carry__0_i_6
       (.I0(\^data_reg [4]),
        .I1(\^data_reg [5]),
        .I2(amplitude[7]),
        .I3(\^data_reg [6]),
        .I4(amplitude[6]),
        .O(data_reg_5[2]));
  LUT5 #(
    .INIT(32'h2CD39F9F)) 
    dac_data6__59_carry__0_i_7
       (.I0(\^data_reg [3]),
        .I1(\^data_reg [4]),
        .I2(amplitude[7]),
        .I3(\^data_reg [5]),
        .I4(amplitude[6]),
        .O(data_reg_5[1]));
  LUT5 #(
    .INIT(32'h2CD39F9F)) 
    dac_data6__59_carry__0_i_8
       (.I0(\^data_reg [2]),
        .I1(\^data_reg [3]),
        .I2(amplitude[7]),
        .I3(\^data_reg [4]),
        .I4(amplitude[6]),
        .O(data_reg_5[0]));
  LUT4 #(
    .INIT(16'hFDDD)) 
    dac_data6__59_carry__1_i_1
       (.I0(amplitude[6]),
        .I1(\^data_reg [7]),
        .I2(amplitude[7]),
        .I3(\^data_reg [6]),
        .O(\amplitude[6]_1 ));
  LUT2 #(
    .INIT(4'hB)) 
    dac_data6__59_carry__1_i_2
       (.I0(\^data_reg [7]),
        .I1(amplitude[7]),
        .O(data_reg_2[1]));
  LUT4 #(
    .INIT(16'hF4F3)) 
    dac_data6__59_carry__1_i_3
       (.I0(\^data_reg [6]),
        .I1(amplitude[6]),
        .I2(\^data_reg [7]),
        .I3(amplitude[7]),
        .O(data_reg_2[0]));
  LUT4 #(
    .INIT(16'h8777)) 
    dac_data6__59_carry_i_1
       (.I0(amplitude[6]),
        .I1(\^data_reg [3]),
        .I2(amplitude[7]),
        .I3(\^data_reg [2]),
        .O(\amplitude[6] [2]));
  LUT2 #(
    .INIT(4'h7)) 
    dac_data6__59_carry_i_2
       (.I0(amplitude[7]),
        .I1(\^data_reg [1]),
        .O(\amplitude[6] [1]));
  LUT2 #(
    .INIT(4'h8)) 
    dac_data6__59_carry_i_3
       (.I0(\^data_reg [1]),
        .I1(amplitude[6]),
        .O(\amplitude[6] [0]));
  LUT5 #(
    .INIT(32'h6A3F953F)) 
    dac_data6__59_carry_i_4
       (.I0(\^data_reg [2]),
        .I1(\^data_reg [3]),
        .I2(amplitude[6]),
        .I3(amplitude[7]),
        .I4(\^data_reg [1]),
        .O(S[3]));
  LUT4 #(
    .INIT(16'h8777)) 
    dac_data6__59_carry_i_5
       (.I0(amplitude[7]),
        .I1(\^data_reg [1]),
        .I2(amplitude[6]),
        .I3(\^data_reg [2]),
        .O(S[2]));
  LUT4 #(
    .INIT(16'h7888)) 
    dac_data6__59_carry_i_6
       (.I0(amplitude[6]),
        .I1(\^data_reg [1]),
        .I2(amplitude[7]),
        .I3(\^data_reg [0]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h8)) 
    dac_data6__59_carry_i_7
       (.I0(\^data_reg [0]),
        .I1(amplitude[6]),
        .O(S[0]));
  LUT5 #(
    .INIT(32'h96969600)) 
    dac_data6__90_carry__0_i_1
       (.I0(dac_data6__90_carry__1_2[2]),
        .I1(dac_data6__90_carry__1_1[2]),
        .I2(dac_data6__90_carry__1_3[1]),
        .I3(dac_data6__90_carry__1_1[1]),
        .I4(dac_data6__90_carry__1_2[1]),
        .O(dac_data6__30_carry__0[2]));
  LUT5 #(
    .INIT(32'hFEE0E0FE)) 
    dac_data6__90_carry__0_i_2
       (.I0(dac_data6__90_carry__1_1[0]),
        .I1(dac_data6__90_carry__1_2[0]),
        .I2(dac_data6__90_carry__1_3[0]),
        .I3(dac_data6__90_carry__1_2[1]),
        .I4(dac_data6__90_carry__1_1[1]),
        .O(dac_data6__30_carry__0[1]));
  LUT5 #(
    .INIT(32'hE11E1EE1)) 
    dac_data6__90_carry__0_i_3
       (.I0(dac_data6__90_carry__1_1[0]),
        .I1(dac_data6__90_carry__1_2[0]),
        .I2(dac_data6__90_carry__1_3[0]),
        .I3(dac_data6__90_carry__1_2[1]),
        .I4(dac_data6__90_carry__1_1[1]),
        .O(dac_data6__30_carry__0[0]));
  LUT5 #(
    .INIT(32'h99969666)) 
    dac_data6__90_carry__0_i_5
       (.I0(dac_data6__30_carry__0[2]),
        .I1(dac_data6__90_carry__0_i_9_n_0),
        .I2(dac_data6__90_carry__1_3[1]),
        .I3(dac_data6__90_carry__1_1[2]),
        .I4(dac_data6__90_carry__1_2[2]),
        .O(dac_data6__30_carry__0_0[2]));
  LUT6 #(
    .INIT(64'h9669966996696996)) 
    dac_data6__90_carry__0_i_6
       (.I0(dac_data6__30_carry__0[1]),
        .I1(dac_data6__90_carry__1_3[1]),
        .I2(dac_data6__90_carry__1_1[2]),
        .I3(dac_data6__90_carry__1_2[2]),
        .I4(dac_data6__90_carry__1_2[1]),
        .I5(dac_data6__90_carry__1_1[1]),
        .O(dac_data6__30_carry__0_0[1]));
  LUT6 #(
    .INIT(64'h6996969696969669)) 
    dac_data6__90_carry__0_i_7
       (.I0(dac_data6__90_carry__1_1[1]),
        .I1(dac_data6__90_carry__1_2[1]),
        .I2(dac_data6__90_carry__1_3[0]),
        .I3(dac_data6__90_carry__1_2[0]),
        .I4(dac_data6__90_carry__1_1[0]),
        .I5(dac_data6__90_carry__0),
        .O(dac_data6__30_carry__0_0[0]));
  LUT3 #(
    .INIT(8'h96)) 
    dac_data6__90_carry__0_i_9
       (.I0(dac_data6__90_carry__1_5),
        .I1(dac_data6__90_carry__1_4[0]),
        .I2(dac_data6__90_carry__1_2[3]),
        .O(dac_data6__90_carry__0_i_9_n_0));
  LUT4 #(
    .INIT(16'h6000)) 
    dac_data6__90_carry__1_i_1
       (.I0(dac_data6__90_carry__1_4[3]),
        .I1(dac_data6__90_carry__1_7),
        .I2(dac_data6__90_carry__1_6[1]),
        .I3(dac_data6__90_carry__1_4[2]),
        .O(dac_data6__59_carry__0[3]));
  LUT4 #(
    .INIT(16'h6000)) 
    dac_data6__90_carry__1_i_2
       (.I0(dac_data6__90_carry__1_4[2]),
        .I1(dac_data6__90_carry__1_6[1]),
        .I2(dac_data6__90_carry__1_6[0]),
        .I3(dac_data6__90_carry__1_4[1]),
        .O(dac_data6__59_carry__0[2]));
  LUT5 #(
    .INIT(32'h66606000)) 
    dac_data6__90_carry__1_i_3
       (.I0(dac_data6__90_carry__1_4[1]),
        .I1(dac_data6__90_carry__1_6[0]),
        .I2(dac_data6__90_carry__1_2[3]),
        .I3(dac_data6__90_carry__1_4[0]),
        .I4(dac_data6__90_carry__1_5),
        .O(dac_data6__59_carry__0[1]));
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    dac_data6__90_carry__1_i_4
       (.I0(dac_data6__90_carry__1_2[3]),
        .I1(dac_data6__90_carry__1_4[0]),
        .I2(dac_data6__90_carry__1_5),
        .I3(dac_data6__90_carry__1_2[2]),
        .I4(dac_data6__90_carry__1_1[2]),
        .I5(dac_data6__90_carry__1_3[1]),
        .O(dac_data6__59_carry__0[0]));
  LUT5 #(
    .INIT(32'h0F7878F0)) 
    dac_data6__90_carry__1_i_5
       (.I0(dac_data6__90_carry__1_4[2]),
        .I1(dac_data6__90_carry__1_6[1]),
        .I2(dac_data6__90_carry__2_1[0]),
        .I3(dac_data6__90_carry__1_4[3]),
        .I4(dac_data6__90_carry__1_7),
        .O(dac_data6__30_carry__1[3]));
  LUT5 #(
    .INIT(32'h69969696)) 
    dac_data6__90_carry__1_i_6
       (.I0(dac_data6__59_carry__0[2]),
        .I1(dac_data6__90_carry__1_7),
        .I2(dac_data6__90_carry__1_4[3]),
        .I3(dac_data6__90_carry__1_4[2]),
        .I4(dac_data6__90_carry__1_6[1]),
        .O(dac_data6__30_carry__1[2]));
  LUT5 #(
    .INIT(32'h69999666)) 
    dac_data6__90_carry__1_i_7
       (.I0(dac_data6__90_carry__1_4[2]),
        .I1(dac_data6__90_carry__1_6[1]),
        .I2(dac_data6__90_carry__1_6[0]),
        .I3(dac_data6__90_carry__1_4[1]),
        .I4(dac_data6__59_carry__0[1]),
        .O(dac_data6__30_carry__1[1]));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    dac_data6__90_carry__1_i_8
       (.I0(dac_data6__59_carry__0[0]),
        .I1(dac_data6__90_carry__1_6[0]),
        .I2(dac_data6__90_carry__1_4[1]),
        .I3(dac_data6__90_carry__1_5),
        .I4(dac_data6__90_carry__1_4[0]),
        .I5(dac_data6__90_carry__1_2[3]),
        .O(dac_data6__30_carry__1[0]));
  LUT4 #(
    .INIT(16'h7F80)) 
    dac_data6__90_carry__2_i_1
       (.I0(dac_data6__90_carry__1_4[3]),
        .I1(dac_data6__90_carry__1_7),
        .I2(dac_data6__90_carry__2_1[0]),
        .I3(dac_data6__90_carry__2_1[1]),
        .O(dac_data6__59_carry__1));
  LUT5 #(
    .INIT(32'hEFEA0000)) 
    \dac_data[0]_i_1 
       (.I0(\dac_data_reg[0] ),
        .I1(\dac_data_reg[2] [0]),
        .I2(\dac_data[0]_i_2_n_0 ),
        .I3(\dac_data_reg[3] [0]),
        .I4(enable),
        .O(D[0]));
  LUT4 #(
    .INIT(16'hFF8A)) 
    \dac_data[0]_i_2 
       (.I0(\dac_data_reg[1] [3]),
        .I1(CO),
        .I2(O[1]),
        .I3(\dac_data_reg[1]_0 ),
        .O(\dac_data[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAA808)) 
    \dac_data[1]_i_1 
       (.I0(enable),
        .I1(dac_data40_in[1]),
        .I2(O[1]),
        .I3(dac_data2_carry__1[0]),
        .I4(\dac_data_reg[0] ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hAAAABFBBAAAA8088)) 
    \dac_data[1]_i_2 
       (.I0(\dac_data_reg[2] [1]),
        .I1(\dac_data_reg[1] [3]),
        .I2(CO),
        .I3(O[1]),
        .I4(\dac_data_reg[1]_0 ),
        .I5(\dac_data_reg[3] [1]),
        .O(dac_data40_in[1]));
  LUT5 #(
    .INIT(32'hAAAAA808)) 
    \dac_data[2]_i_1 
       (.I0(enable),
        .I1(dac_data40_in[2]),
        .I2(O[1]),
        .I3(dac_data2_carry__1[1]),
        .I4(\dac_data_reg[0] ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hAAAABFBBAAAA8088)) 
    \dac_data[2]_i_2 
       (.I0(\dac_data_reg[2] [2]),
        .I1(\dac_data_reg[1] [3]),
        .I2(CO),
        .I3(O[1]),
        .I4(\dac_data_reg[1]_0 ),
        .I5(\dac_data_reg[3] [2]),
        .O(dac_data40_in[2]));
  LUT5 #(
    .INIT(32'hAAAAA808)) 
    \dac_data[3]_i_1 
       (.I0(enable),
        .I1(dac_data40_in[3]),
        .I2(O[1]),
        .I3(dac_data2_carry__1[2]),
        .I4(\dac_data_reg[0] ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hAAAABFBBAAAA8088)) 
    \dac_data[3]_i_2 
       (.I0(dac_data2_carry[0]),
        .I1(\dac_data_reg[1] [3]),
        .I2(CO),
        .I3(O[1]),
        .I4(\dac_data_reg[1]_0 ),
        .I5(\dac_data_reg[3] [3]),
        .O(dac_data40_in[3]));
  LUT5 #(
    .INIT(32'hAAAAA808)) 
    \dac_data[4]_i_1 
       (.I0(enable),
        .I1(dac_data40_in[4]),
        .I2(O[1]),
        .I3(dac_data2_carry__1[3]),
        .I4(\dac_data_reg[0] ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hAAAABFBBAAAA8088)) 
    \dac_data[4]_i_2 
       (.I0(dac_data2_carry[1]),
        .I1(\dac_data_reg[1] [3]),
        .I2(CO),
        .I3(O[1]),
        .I4(\dac_data_reg[1]_0 ),
        .I5(dac_data2_carry_0[0]),
        .O(dac_data40_in[4]));
  LUT5 #(
    .INIT(32'hAAAAA808)) 
    \dac_data[5]_i_1 
       (.I0(enable),
        .I1(dac_data40_in[5]),
        .I2(O[1]),
        .I3(dac_data2_carry__1[4]),
        .I4(\dac_data_reg[0] ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hAAAABFBBAAAA8088)) 
    \dac_data[5]_i_2 
       (.I0(dac_data2_carry[2]),
        .I1(\dac_data_reg[1] [3]),
        .I2(CO),
        .I3(O[1]),
        .I4(\dac_data_reg[1]_0 ),
        .I5(dac_data2_carry_0[1]),
        .O(dac_data40_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h8F)) 
    \dac_data[6]_i_1 
       (.I0(\dac_data_reg[7] [1]),
        .I1(enable),
        .I2(reset_n),
        .O(SR));
  LUT3 #(
    .INIT(8'hE0)) 
    \dac_data[6]_i_2 
       (.I0(\dac_data_reg[0] ),
        .I1(\dac_data_reg[7]_0 [0]),
        .I2(enable),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h5F5D)) 
    \dac_data[7]_i_1 
       (.I0(enable),
        .I1(\dac_data_reg[7]_0 [1]),
        .I2(\dac_data_reg[7] [1]),
        .I3(\dac_data_reg[0] ),
        .O(D[7]));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "system_bd_fra_top_0_0/inst/u_dds/sine_rom_inst/data_reg" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h00AD00AA00A700A500A2009E009B009800950092008F008C0089008600830080),
    .INIT_01(256'h00D700D500D300D000CE00CB00C900C600C400C100BE00BC00B900B600B300B0),
    .INIT_02(256'h00F400F300F100F000EE00ED00EB00EA00E800E600E400E200E000DE00DC00DA),
    .INIT_03(256'h00FF00FF00FF00FE00FE00FE00FD00FD00FC00FB00FA00FA00F900F800F600F5),
    .INIT_04(256'h00F600F800F900FA00FA00FB00FC00FD00FD00FE00FE00FE00FF00FF00FF00FF),
    .INIT_05(256'h00DC00DE00E000E200E400E600E800EA00EB00ED00EE00F000F100F300F400F5),
    .INIT_06(256'h00B300B600B900BC00BE00C100C400C600C900CB00CE00D000D300D500D700DA),
    .INIT_07(256'h008300860089008C008F009200950098009B009E00A200A500A700AA00AD00B0),
    .INIT_08(256'h005200550058005A005D006100640067006A006D0070007300760079007C0080),
    .INIT_09(256'h0028002A002C002F0031003400360039003B003E0041004300460049004C004F),
    .INIT_0A(256'h000B000C000E000F001100120014001500170019001B001D001F002100230025),
    .INIT_0B(256'h000000000000000100010001000200020003000400050005000600070009000A),
    .INIT_0C(256'h0009000700060005000500040003000200020001000100010000000000000000),
    .INIT_0D(256'h00230021001F001D001B001900170015001400120011000F000E000C000B000A),
    .INIT_0E(256'h004C0049004600430041003E003B0039003600340031002F002C002A00280025),
    .INIT_0F(256'h007C0079007600730070006D006A006700640061005D005A005800550052004F),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    data_reg
       (.ADDRARDADDR({1'b0,1'b0,ADDRARDADDR,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(dac_clk_out),
        .CLKBWRCLK(1'b0),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO({NLW_data_reg_DOADO_UNCONNECTED[15:8],\^data_reg }),
        .DOBDO(NLW_data_reg_DOBDO_UNCONNECTED[15:0]),
        .DOPADOP(NLW_data_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_data_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry__0_i_1
       (.I0(dac_data2_carry__0[0]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(dac_data4__72_carry__2[1]),
        .O(dac_data4__8_carry__5[3]));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry__0_i_2
       (.I0(dac_data2_carry_0[3]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(dac_data4__72_carry__2[0]),
        .O(dac_data4__8_carry__5[2]));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry__0_i_3
       (.I0(dac_data2_carry_0[2]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(dac_data2_carry[3]),
        .O(dac_data4__8_carry__5[1]));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry__0_i_4
       (.I0(dac_data2_carry_0[1]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(dac_data2_carry[2]),
        .O(dac_data4__8_carry__5[0]));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry__1_i_1
       (.I0(dac_data2_carry__1_0[0]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(dac_data4__72_carry__3_0[1]),
        .O(dac_data4__8_carry__6_2[3]));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry__1_i_1__0
       (.I0(\dac_data_reg[7] [0]),
        .I1(\dac_data_reg[7] [1]),
        .O(dac_data2_carry__5));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry__1_i_2
       (.I0(dac_data2_carry__0[3]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(dac_data4__72_carry__3_0[0]),
        .O(dac_data4__8_carry__6_2[2]));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry__1_i_3
       (.I0(dac_data2_carry__0[2]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(dac_data4__72_carry__2[3]),
        .O(dac_data4__8_carry__6_2[1]));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry__1_i_4
       (.I0(dac_data2_carry__0[1]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(dac_data4__72_carry__2[2]),
        .O(dac_data4__8_carry__6_2[0]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__1_i_4__0
       (.I0(\dac_data_reg[7] [1]),
        .I1(\dac_data_reg[7] [0]),
        .O(dac_data2_carry__5_0));
  LUT5 #(
    .INIT(32'hFBAAFFFF)) 
    i__carry__2_i_1
       (.I0(\dac_data_reg[1]_0 ),
        .I1(O[1]),
        .I2(CO),
        .I3(\dac_data_reg[1] [3]),
        .I4(i__carry__2_i_5_n_3),
        .O(i__carry__2_i_5_0[3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_1__0
       (.I0(O[1]),
        .O(dac_data6__90_carry__2_0[1]));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry__2_i_2
       (.I0(dac_data2_carry__1_0[3]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(dac_data4__8_carry__6_0),
        .O(i__carry__2_i_5_0[2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_2__0
       (.I0(O[0]),
        .O(dac_data6__90_carry__2_0[0]));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry__2_i_3
       (.I0(dac_data2_carry__1_0[2]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(dac_data4__72_carry__3_0[3]),
        .O(i__carry__2_i_5_0[1]));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry__2_i_4
       (.I0(dac_data2_carry__1_0[1]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(dac_data4__72_carry__3_0[2]),
        .O(i__carry__2_i_5_0[0]));
  CARRY4 i__carry__2_i_5
       (.CI(i__carry__2_i_1_0),
        .CO({NLW_i__carry__2_i_5_CO_UNCONNECTED[3:1],i__carry__2_i_5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_i__carry__2_i_5_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry_i_1
       (.I0(\dac_data_reg[3] [0]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(\dac_data_reg[2] [0]),
        .O(dac_data4__8_carry__3));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry_i_2
       (.I0(dac_data2_carry_0[0]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(dac_data2_carry[1]),
        .O(dac_data4__8_carry__4[3]));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry_i_3
       (.I0(\dac_data_reg[3] [3]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(dac_data2_carry[0]),
        .O(dac_data4__8_carry__4[2]));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry_i_4
       (.I0(\dac_data_reg[3] [2]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(\dac_data_reg[2] [2]),
        .O(dac_data4__8_carry__4[1]));
  LUT6 #(
    .INIT(64'h00101111FFDFDDDD)) 
    i__carry_i_5
       (.I0(\dac_data_reg[3] [1]),
        .I1(\dac_data_reg[1]_0 ),
        .I2(O[1]),
        .I3(CO),
        .I4(\dac_data_reg[1] [3]),
        .I5(\dac_data_reg[2] [1]),
        .O(dac_data4__8_carry__4[0]));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__6_i_1
       (.I0(phase_acc_reg[3]),
        .I1(phase_ofst[3]),
        .O(\phase_acc_reg[31] [3]));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__6_i_2
       (.I0(phase_acc_reg[2]),
        .I1(phase_ofst[2]),
        .O(\phase_acc_reg[31] [2]));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__6_i_3
       (.I0(phase_acc_reg[1]),
        .I1(phase_ofst[1]),
        .O(\phase_acc_reg[31] [1]));
  LUT2 #(
    .INIT(4'h6)) 
    phase_sum_carry__6_i_4
       (.I0(phase_acc_reg[0]),
        .I1(phase_ofst[0]),
        .O(\phase_acc_reg[31] [0]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
