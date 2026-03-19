-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Thu Mar 19 14:47:35 2026
-- Host        : ThinkpadT14s running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/thomas/Documents/git/PCIE_FRA/hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.gen/sources_1/bd/system_bd/ip/system_bd_fra_top_0_0/system_bd_fra_top_0_0_sim_netlist.vhdl
-- Design      : system_bd_fra_top_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z015clg485-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_bd_fra_top_0_0_adc_if is
  port (
    sample_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    adc_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dac_clk_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_bd_fra_top_0_0_adc_if : entity is "adc_if";
end system_bd_fra_top_0_0_adc_if;

architecture STRUCTURE of system_bd_fra_top_0_0_adc_if is
begin
\sample_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => adc_in(0),
      Q => sample_out(0),
      R => SR(0)
    );
\sample_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => adc_in(1),
      Q => sample_out(1),
      R => SR(0)
    );
\sample_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => adc_in(2),
      Q => sample_out(2),
      R => SR(0)
    );
\sample_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => adc_in(3),
      Q => sample_out(3),
      R => SR(0)
    );
\sample_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => adc_in(4),
      Q => sample_out(4),
      R => SR(0)
    );
\sample_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => adc_in(5),
      Q => sample_out(5),
      R => SR(0)
    );
\sample_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => adc_in(6),
      Q => sample_out(6),
      R => SR(0)
    );
\sample_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => adc_in(7),
      Q => sample_out(7),
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_bd_fra_top_0_0_clk_div_2 is
  port (
    dac_clk_out : out STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_bd_fra_top_0_0_clk_div_2 : entity is "clk_div_2";
end system_bd_fra_top_0_0_clk_div_2;

architecture STRUCTURE of system_bd_fra_top_0_0_clk_div_2 is
  signal \^dac_clk_out\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
begin
  dac_clk_out <= \^dac_clk_out\;
clk_div_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^dac_clk_out\,
      O => p_0_in
    );
clk_div_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_0_in,
      Q => \^dac_clk_out\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_bd_fra_top_0_0_dac_if is
  port (
    dac_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dac_clk_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_bd_fra_top_0_0_dac_if : entity is "dac_if";
end system_bd_fra_top_0_0_dac_if;

architecture STRUCTURE of system_bd_fra_top_0_0_dac_if is
begin
\dac_data_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => Q(0),
      Q => dac_out(0),
      S => SR(0)
    );
\dac_data_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => Q(1),
      Q => dac_out(1),
      S => SR(0)
    );
\dac_data_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => Q(2),
      Q => dac_out(2),
      S => SR(0)
    );
\dac_data_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => Q(3),
      Q => dac_out(3),
      S => SR(0)
    );
\dac_data_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => Q(4),
      Q => dac_out(4),
      S => SR(0)
    );
\dac_data_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => Q(5),
      Q => dac_out(5),
      S => SR(0)
    );
\dac_data_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => Q(6),
      Q => dac_out(6),
      S => SR(0)
    );
\dac_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => Q(7),
      Q => dac_out(7),
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_bd_fra_top_0_0_sine_lut is
  port (
    DI : out STD_LOGIC_VECTOR ( 3 downto 0 );
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \_inferred__1/i__carry__2\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \_inferred__1/i__carry__1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__8_carry__6\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data4__72_carry__3_i_1_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__8_carry__6_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data4__8_carry__1_i_9_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__8_carry__6_1\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data4__72_carry__3_i_1_1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \phase_acc_reg[31]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \amplitude[0]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \amplitude[0]_0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \amplitude[1]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_reg_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \amplitude[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \amplitude[3]_0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \amplitude[4]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_reg_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \amplitude[6]\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \amplitude[6]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \amplitude[6]_1\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_reg_2 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \dac_data6__30_carry__0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \dac_data6__59_carry__0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \_inferred__1/i__carry__1_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data6__90_carry__1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__8_carry__1_i_9_1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__8_carry__1_i_9_2\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data6__90_carry__2\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__171_carry__2\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__171_carry__3\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__171_carry__4\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__171_carry__5\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    D : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \dac_data4__8_carry__3\ : out STD_LOGIC;
    \dac_data4__8_carry__4\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__8_carry__5\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \i__carry__2_i_5_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dac_data3 : out STD_LOGIC_VECTOR ( 13 downto 0 );
    \dac_data4__8_carry__6_2\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \_inferred__2/i__carry__0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \_inferred__1/i__carry__2_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \_inferred__1/i__carry__0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \_inferred__1/i__carry\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \dac_data4__171_carry__2_i_9_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \dac_data4__114_carry__3\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__72_carry__3_i_1_2\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \dac_data4__171_carry__4_i_9_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__171_carry__4_i_10_0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \dac_data2_carry__5\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data2_carry__5_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data6__90_carry__2_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data6__90_carry__1_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \dac_data4__8_carry__1_i_9_3\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__8_carry__1_i_9_4\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__8_carry__1_i_9_5\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__72_carry__3_i_1_3\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \dac_data2_carry__1_i_5_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data2_carry__1_i_5_1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data2_carry__3_i_5_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \dac_data2_carry__3_i_5_1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data2_carry__3_i_5_2\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \amplitude[1]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    data_reg_3 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \amplitude[4]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    data_reg_4 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_reg_5 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data6__30_carry__0_0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \dac_data6__30_carry__1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data6__59_carry__1\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \_inferred__1/i__carry__2_1\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \dac_data6__0_carry\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data4__8_carry__2_i_10_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \dac_data4__72_carry__3\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \dac_data4__114_carry__3_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__114_carry__3_1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__8_carry__3_i_9_0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \dac_data4__171_carry__3_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__171_carry__4_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__171_carry__5_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__171_carry__5_1\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \_inferred__1/i__carry__0_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    dac_clk_out : in STD_LOGIC;
    ADDRARDADDR : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dac_data6 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    O : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \dac_data4__254_carry\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \dac_data4__254_carry__1\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    amplitude : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \dac_data4__8_carry__0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__72_carry__2\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__72_carry__3_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    phase_acc_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    phase_ofst : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data6__90_carry__1_1\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \dac_data6__90_carry__1_2\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data6__90_carry__1_3\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \dac_data6__90_carry__1_4\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data6__90_carry__1_5\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data6__90_carry__1_6\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \dac_data6__90_carry__1_7\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data4__254_carry__1_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__8_carry__0_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__254_carry__3\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__254_carry__4\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__254_carry__5\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data_reg[1]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data_reg[2]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \dac_data_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    enable : in STD_LOGIC;
    \dac_data_reg[1]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data2_carry__1\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dac_data2_carry : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dac_data2_carry_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data2_carry__0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data2_carry__1_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__254_carry__2\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__254_carry__0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__254_carry_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \dac_data4__171_carry__2_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data4__171_carry__3_1\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dac_data4__171_carry__3_2\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \dac_data4__171_carry__4_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data4__171_carry__4_2\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \dac_data4__171_carry__5_2\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data_reg[7]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \dac_data_reg[7]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    reset_n : in STD_LOGIC;
    \dac_data4__8_carry__1_i_6\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data4__72_carry__3_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \i__carry__2_i_1_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data2_carry__3_i_5_3\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data6__90_carry__0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \dac_data6__90_carry__2_1\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \dac_data4__8_carry__2\ : in STD_LOGIC;
    \dac_data4__8_carry__3_0\ : in STD_LOGIC;
    \dac_data4__8_carry__3_1\ : in STD_LOGIC;
    \dac_data4__171_carry__2_1\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_bd_fra_top_0_0_sine_lut : entity is "sine_lut";
end system_bd_fra_top_0_0_sine_lut;

architecture STRUCTURE of system_bd_fra_top_0_0_sine_lut is
  signal \^co\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^amplitude[0]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^amplitude[3]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \dac_data2_carry__1_i_5_n_3\ : STD_LOGIC;
  signal \dac_data2_carry__3_i_5_n_1\ : STD_LOGIC;
  signal \dac_data2_carry__3_i_5_n_3\ : STD_LOGIC;
  signal \dac_data2_carry__3_i_6_n_0\ : STD_LOGIC;
  signal dac_data4 : STD_LOGIC_VECTOR ( 23 to 23 );
  signal dac_data40_in : STD_LOGIC_VECTOR ( 5 downto 1 );
  signal \^dac_data4__114_carry__3\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \dac_data4__171_carry__2_i_10_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__2_i_12_n_0\ : STD_LOGIC;
  signal \^dac_data4__171_carry__2_i_9_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \dac_data4__171_carry__2_i_9_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__3_i_10_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__3_i_11_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__3_i_9_n_0\ : STD_LOGIC;
  signal \^dac_data4__171_carry__4_i_10_0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \dac_data4__171_carry__4_i_10_n_1\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_i_10_n_3\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_i_10_n_6\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_i_11_n_1\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_i_11_n_3\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_i_11_n_6\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_i_12_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_i_13_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_i_14_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_i_15_n_0\ : STD_LOGIC;
  signal \^dac_data4__171_carry__4_i_9_0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \dac_data4__171_carry__4_i_9_n_1\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_i_9_n_3\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_i_9_n_6\ : STD_LOGIC;
  signal \dac_data4__171_carry__5_i_10_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__5_i_8_n_1\ : STD_LOGIC;
  signal \dac_data4__171_carry__5_i_8_n_3\ : STD_LOGIC;
  signal \dac_data4__171_carry__5_i_8_n_6\ : STD_LOGIC;
  signal \dac_data4__171_carry__5_i_9_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__2_i_10_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__2_i_12_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__2_i_9_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__3_i_11_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__3_i_12_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__3_i_9_n_0\ : STD_LOGIC;
  signal \^dac_data4__8_carry__6_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \dac_data6__0_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \dac_data6__0_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \dac_data6__0_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \dac_data6__0_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \dac_data6__0_carry_i_8_n_0\ : STD_LOGIC;
  signal \^dac_data6__30_carry__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \dac_data6__30_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \dac_data6__30_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \dac_data6__30_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \dac_data6__30_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \dac_data6__30_carry_i_8_n_0\ : STD_LOGIC;
  signal \^dac_data6__59_carry__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \dac_data6__90_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \dac_data[0]_i_2_n_0\ : STD_LOGIC;
  signal \^data_reg\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \i__carry__2_i_5_n_3\ : STD_LOGIC;
  signal \NLW_dac_data2_carry__1_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_dac_data2_carry__1_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data2_carry__3_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_dac_data2_carry__3_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__171_carry__4_i_10_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_dac_data4__171_carry__4_i_10_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__171_carry__4_i_11_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_dac_data4__171_carry__4_i_11_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__171_carry__4_i_9_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_dac_data4__171_carry__4_i_9_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__171_carry__5_i_8_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_dac_data4__171_carry__5_i_8_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__72_carry__3_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_dac_data4__72_carry__3_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__8_carry__1_i_9_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_dac_data4__8_carry__1_i_9_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_data_reg_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal NLW_data_reg_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_data_reg_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_data_reg_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_i__carry__2_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_i__carry__2_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \dac_data4__171_carry__3_i_11\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \dac_data4__171_carry__3_i_9\ : label is "soft_lutpair4";
  attribute HLUTNM : string;
  attribute HLUTNM of \dac_data4__171_carry__5_i_1\ : label is "lutpair0";
  attribute HLUTNM of \dac_data4__171_carry__5_i_6\ : label is "lutpair0";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__2_i_10\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__2_i_12\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__2_i_9\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__3_i_11\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__3_i_12\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__3_i_9\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \dac_data6__0_carry__0_i_10\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \dac_data6__0_carry__0_i_11\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \dac_data6__0_carry__0_i_12\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \dac_data6__0_carry__0_i_9\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \dac_data6__0_carry_i_8\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \dac_data6__30_carry__0_i_10\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \dac_data6__30_carry__0_i_11\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \dac_data6__30_carry__0_i_12\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \dac_data6__30_carry__0_i_9\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \dac_data6__30_carry_i_8\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \dac_data[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \dac_data[7]_i_1\ : label is "soft_lutpair3";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of data_reg : label is "p0_d8";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of data_reg : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of data_reg : label is 2048;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of data_reg : label is "system_bd_fra_top_0_0/inst/u_dds/sine_rom_inst/data_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of data_reg : label is "NONE";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of data_reg : label is "RAM_SP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of data_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of data_reg : label is 1023;
  attribute ram_offset : integer;
  attribute ram_offset of data_reg : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of data_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of data_reg : label is 7;
begin
  CO(0) <= \^co\(0);
  \amplitude[0]\(3 downto 0) <= \^amplitude[0]\(3 downto 0);
  \amplitude[3]\(3 downto 0) <= \^amplitude[3]\(3 downto 0);
  \dac_data4__114_carry__3\(3 downto 0) <= \^dac_data4__114_carry__3\(3 downto 0);
  \dac_data4__171_carry__2_i_9_0\(1 downto 0) <= \^dac_data4__171_carry__2_i_9_0\(1 downto 0);
  \dac_data4__171_carry__4_i_10_0\(2 downto 0) <= \^dac_data4__171_carry__4_i_10_0\(2 downto 0);
  \dac_data4__171_carry__4_i_9_0\(3 downto 0) <= \^dac_data4__171_carry__4_i_9_0\(3 downto 0);
  \dac_data4__8_carry__6_0\(0) <= \^dac_data4__8_carry__6_0\(0);
  \dac_data6__30_carry__0\(2 downto 0) <= \^dac_data6__30_carry__0\(2 downto 0);
  \dac_data6__59_carry__0\(3 downto 0) <= \^dac_data6__59_carry__0\(3 downto 0);
\dac_data2_carry__0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \dac_data2_carry__1\(12),
      I1 => O(1),
      I2 => \dac_data4__72_carry__3_0\(2),
      I3 => \dac_data[0]_i_2_n_0\,
      I4 => \dac_data2_carry__1_0\(1),
      O => dac_data3(7)
    );
\dac_data2_carry__0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \dac_data2_carry__1\(11),
      I1 => O(1),
      I2 => \dac_data4__72_carry__3_0\(1),
      I3 => \dac_data[0]_i_2_n_0\,
      I4 => \dac_data2_carry__1_0\(0),
      O => dac_data3(6)
    );
\dac_data2_carry__0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \dac_data2_carry__1\(10),
      I1 => O(1),
      I2 => \dac_data4__72_carry__3_0\(0),
      I3 => \dac_data[0]_i_2_n_0\,
      I4 => \dac_data2_carry__0\(3),
      O => dac_data3(5)
    );
\dac_data2_carry__0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \dac_data2_carry__1\(9),
      I1 => O(1),
      I2 => \dac_data4__72_carry__2\(3),
      I3 => \dac_data[0]_i_2_n_0\,
      I4 => \dac_data2_carry__0\(2),
      O => dac_data3(4)
    );
\dac_data2_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \dac_data2_carry__1_i_5_n_3\,
      O => \dac_data2_carry__1_i_5_0\(0)
    );
\dac_data2_carry__1_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A3A0A0"
    )
        port map (
      I0 => \dac_data2_carry__1\(15),
      I1 => \dac_data_reg[1]\(3),
      I2 => O(1),
      I3 => \dac_data_reg[1]_0\(0),
      I4 => \i__carry__2_i_5_n_3\,
      O => dac_data3(10)
    );
\dac_data2_carry__1_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \dac_data2_carry__1\(14),
      I1 => O(1),
      I2 => \^dac_data4__8_carry__6_0\(0),
      I3 => \dac_data[0]_i_2_n_0\,
      I4 => \dac_data2_carry__1_0\(3),
      O => dac_data3(9)
    );
\dac_data2_carry__1_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \dac_data2_carry__1\(13),
      I1 => O(1),
      I2 => \dac_data4__72_carry__3_0\(3),
      I3 => \dac_data[0]_i_2_n_0\,
      I4 => \dac_data2_carry__1_0\(2),
      O => dac_data3(8)
    );
\dac_data2_carry__1_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data2_carry__3_i_5_3\(0),
      CO(3 downto 1) => \NLW_dac_data2_carry__1_i_5_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \dac_data2_carry__1_i_5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_dac_data2_carry__1_i_5_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"0001"
    );
\dac_data2_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \dac_data2_carry__1_i_5_n_3\,
      O => \dac_data2_carry__1_i_5_1\(3)
    );
\dac_data2_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \dac_data2_carry__1_i_5_n_3\,
      O => \dac_data2_carry__1_i_5_1\(2)
    );
\dac_data2_carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \dac_data2_carry__1_i_5_n_3\,
      O => \dac_data2_carry__1_i_5_1\(1)
    );
\dac_data2_carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \dac_data2_carry__1_i_5_n_3\,
      O => \dac_data2_carry__1_i_5_1\(0)
    );
\dac_data2_carry__3_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \dac_data2_carry__3_i_5_n_1\,
      O => \dac_data2_carry__3_i_5_0\(1)
    );
\dac_data2_carry__3_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \dac_data2_carry__3_i_5_n_1\,
      O => \dac_data2_carry__3_i_5_0\(0)
    );
\dac_data2_carry__3_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => dac_data4(23),
      I1 => O(1),
      O => dac_data3(12)
    );
\dac_data2_carry__3_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \dac_data2_carry__1_i_5_n_3\,
      O => dac_data3(11)
    );
\dac_data2_carry__3_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \NLW_dac_data2_carry__3_i_5_CO_UNCONNECTED\(3),
      CO(2) => \dac_data2_carry__3_i_5_n_1\,
      CO(1) => \NLW_dac_data2_carry__3_i_5_CO_UNCONNECTED\(1),
      CO(0) => \dac_data2_carry__3_i_5_n_3\,
      CYINIT => \dac_data2_carry__1_i_5_n_3\,
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_dac_data2_carry__3_i_5_O_UNCONNECTED\(3 downto 2),
      O(1) => dac_data4(23),
      O(0) => \NLW_dac_data2_carry__3_i_5_O_UNCONNECTED\(0),
      S(3 downto 2) => B"01",
      S(1) => \dac_data2_carry__3_i_6_n_0\,
      S(0) => '1'
    );
\dac_data2_carry__3_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^co\(0),
      I1 => O(1),
      O => \dac_data2_carry__3_i_6_n_0\
    );
\dac_data2_carry__4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \dac_data2_carry__3_i_5_n_1\,
      O => \dac_data2_carry__3_i_5_1\(3)
    );
\dac_data2_carry__4_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \dac_data2_carry__3_i_5_n_1\,
      O => \dac_data2_carry__3_i_5_1\(2)
    );
\dac_data2_carry__4_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \dac_data2_carry__3_i_5_n_1\,
      O => \dac_data2_carry__3_i_5_1\(1)
    );
\dac_data2_carry__4_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \dac_data2_carry__3_i_5_n_1\,
      O => \dac_data2_carry__3_i_5_1\(0)
    );
\dac_data2_carry__5_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \dac_data2_carry__3_i_5_n_1\,
      O => dac_data3(13)
    );
\dac_data2_carry__5_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \dac_data2_carry__3_i_5_n_1\,
      O => \dac_data2_carry__3_i_5_2\(0)
    );
dac_data2_carry_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \dac_data2_carry__1\(6),
      I1 => O(1),
      I2 => \dac_data4__72_carry__2\(0),
      I3 => \dac_data[0]_i_2_n_0\,
      I4 => dac_data2_carry_0(3),
      O => dac_data3(1)
    );
dac_data2_carry_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \dac_data2_carry__1\(8),
      I1 => O(1),
      I2 => \dac_data4__72_carry__2\(2),
      I3 => \dac_data[0]_i_2_n_0\,
      I4 => \dac_data2_carry__0\(1),
      O => dac_data3(3)
    );
dac_data2_carry_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \dac_data2_carry__1\(7),
      I1 => O(1),
      I2 => \dac_data4__72_carry__2\(1),
      I3 => \dac_data[0]_i_2_n_0\,
      I4 => \dac_data2_carry__0\(0),
      O => dac_data3(2)
    );
dac_data2_carry_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"001DFF1D"
    )
        port map (
      I0 => dac_data2_carry_0(3),
      I1 => \dac_data[0]_i_2_n_0\,
      I2 => \dac_data4__72_carry__2\(0),
      I3 => O(1),
      I4 => \dac_data2_carry__1\(6),
      O => \_inferred__2/i__carry__0\(0)
    );
dac_data2_carry_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \dac_data2_carry__1\(5),
      I1 => O(1),
      I2 => dac_data2_carry(3),
      I3 => \dac_data[0]_i_2_n_0\,
      I4 => dac_data2_carry_0(2),
      O => dac_data3(0)
    );
\dac_data4__114_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__72_carry__2\(1),
      I1 => \dac_data4__72_carry__3_0\(0),
      O => \dac_data4__8_carry__6\(0)
    );
\dac_data4__114_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__72_carry__3_0\(1),
      I1 => \^dac_data4__8_carry__6_0\(0),
      O => \dac_data4__72_carry__3_i_1_0\(3)
    );
\dac_data4__114_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__72_carry__3_0\(0),
      I1 => \dac_data4__72_carry__3_0\(3),
      O => \dac_data4__72_carry__3_i_1_0\(2)
    );
\dac_data4__114_carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__72_carry__2\(3),
      I1 => \dac_data4__72_carry__3_0\(2),
      O => \dac_data4__72_carry__3_i_1_0\(1)
    );
\dac_data4__114_carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__72_carry__2\(2),
      I1 => \dac_data4__72_carry__3_0\(1),
      O => \dac_data4__72_carry__3_i_1_0\(0)
    );
\dac_data4__114_carry__3_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^dac_data4__8_carry__6_0\(0),
      O => \dac_data4__72_carry__3_i_1_2\(2)
    );
\dac_data4__114_carry__3_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data4__72_carry__3_0\(3),
      O => \dac_data4__72_carry__3_i_1_2\(1)
    );
\dac_data4__114_carry__3_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data4__72_carry__3_0\(2),
      O => \dac_data4__72_carry__3_i_1_2\(0)
    );
\dac_data4__171_carry__2_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF8E8E00"
    )
        port map (
      I0 => \dac_data4__171_carry__3_2\(0),
      I1 => \dac_data4__171_carry__3_1\(1),
      I2 => \dac_data4__72_carry__2\(3),
      I3 => \dac_data4__72_carry__2\(2),
      I4 => \dac_data4__171_carry__2_i_9_n_0\,
      O => \^dac_data4__171_carry__2_i_9_0\(1)
    );
\dac_data4__171_carry__2_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \dac_data4__72_carry__2\(3),
      I1 => \dac_data4__171_carry__3_1\(1),
      I2 => \dac_data4__171_carry__3_2\(0),
      O => \dac_data4__171_carry__2_i_10_n_0\
    );
\dac_data4__171_carry__2_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \dac_data4__72_carry__3_0\(1),
      I1 => \dac_data4__171_carry__3_1\(3),
      I2 => \dac_data4__171_carry__3_2\(2),
      O => \dac_data4__171_carry__2_i_12_n_0\
    );
\dac_data4__171_carry__2_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF8E8E00"
    )
        port map (
      I0 => \dac_data4__171_carry__2_0\(0),
      I1 => \dac_data4__171_carry__3_1\(0),
      I2 => \dac_data4__72_carry__2\(2),
      I3 => \dac_data4__72_carry__2\(1),
      I4 => \dac_data4__171_carry__2_i_10_n_0\,
      O => \^dac_data4__171_carry__2_i_9_0\(0)
    );
\dac_data4__171_carry__2_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969966996699696"
    )
        port map (
      I0 => \^dac_data4__171_carry__2_i_9_0\(1),
      I1 => \dac_data4__171_carry__2_i_12_n_0\,
      I2 => \dac_data4__72_carry__2\(3),
      I3 => \dac_data4__72_carry__3_0\(0),
      I4 => \dac_data4__171_carry__3_1\(2),
      I5 => \dac_data4__171_carry__3_2\(1),
      O => \dac_data4__72_carry__3\(2)
    );
\dac_data4__171_carry__2_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969966996699696"
    )
        port map (
      I0 => \^dac_data4__171_carry__2_i_9_0\(0),
      I1 => \dac_data4__171_carry__2_i_9_n_0\,
      I2 => \dac_data4__72_carry__2\(2),
      I3 => \dac_data4__72_carry__2\(3),
      I4 => \dac_data4__171_carry__3_1\(1),
      I5 => \dac_data4__171_carry__3_2\(0),
      O => \dac_data4__72_carry__3\(1)
    );
\dac_data4__171_carry__2_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969966996699696"
    )
        port map (
      I0 => \dac_data4__171_carry__2_1\(0),
      I1 => \dac_data4__171_carry__2_i_10_n_0\,
      I2 => \dac_data4__72_carry__2\(1),
      I3 => \dac_data4__72_carry__2\(2),
      I4 => \dac_data4__171_carry__3_1\(0),
      I5 => \dac_data4__171_carry__2_0\(0),
      O => \dac_data4__72_carry__3\(0)
    );
\dac_data4__171_carry__2_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \dac_data4__72_carry__3_0\(0),
      I1 => \dac_data4__171_carry__3_1\(2),
      I2 => \dac_data4__171_carry__3_2\(1),
      O => \dac_data4__171_carry__2_i_9_n_0\
    );
\dac_data4__171_carry__3_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F220B0FB20F2FBB0"
    )
        port map (
      I0 => \dac_data4__171_carry__4_2\(1),
      I1 => \dac_data4__72_carry__3_0\(3),
      I2 => \dac_data4__72_carry__3_0\(2),
      I3 => \^dac_data4__8_carry__6_0\(0),
      I4 => \dac_data4__171_carry__4_1\(0),
      I5 => \dac_data4__171_carry__4_2\(2),
      O => \^dac_data4__114_carry__3\(3)
    );
\dac_data4__171_carry__3_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \^dac_data4__8_carry__6_0\(0),
      I1 => \dac_data4__171_carry__4_1\(0),
      I2 => \dac_data4__171_carry__4_2\(2),
      O => \dac_data4__171_carry__3_i_10_n_0\
    );
\dac_data4__171_carry__3_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \dac_data4__72_carry__3_0\(3),
      I1 => \dac_data4__171_carry__4_1\(0),
      I2 => \dac_data4__171_carry__4_2\(1),
      O => \dac_data4__171_carry__3_i_11_n_0\
    );
\dac_data4__171_carry__3_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F220B0FB20F2FBB0"
    )
        port map (
      I0 => \dac_data4__171_carry__4_2\(0),
      I1 => \dac_data4__72_carry__3_0\(2),
      I2 => \dac_data4__72_carry__3_0\(1),
      I3 => \dac_data4__72_carry__3_0\(3),
      I4 => \dac_data4__171_carry__4_1\(0),
      I5 => \dac_data4__171_carry__4_2\(1),
      O => \^dac_data4__114_carry__3\(2)
    );
\dac_data4__171_carry__3_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF8E8E00"
    )
        port map (
      I0 => \dac_data4__171_carry__3_2\(2),
      I1 => \dac_data4__171_carry__3_1\(3),
      I2 => \dac_data4__72_carry__3_0\(1),
      I3 => \dac_data4__72_carry__3_0\(0),
      I4 => \dac_data4__171_carry__3_i_9_n_0\,
      O => \^dac_data4__114_carry__3\(1)
    );
\dac_data4__171_carry__3_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF8E8E00"
    )
        port map (
      I0 => \dac_data4__171_carry__3_2\(1),
      I1 => \dac_data4__171_carry__3_1\(2),
      I2 => \dac_data4__72_carry__3_0\(0),
      I3 => \dac_data4__72_carry__2\(3),
      I4 => \dac_data4__171_carry__2_i_12_n_0\,
      O => \^dac_data4__114_carry__3\(0)
    );
\dac_data4__171_carry__3_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9966699696699966"
    )
        port map (
      I0 => \^dac_data4__114_carry__3\(3),
      I1 => \dac_data4__171_carry__5_2\(0),
      I2 => \dac_data4__171_carry__4_1\(0),
      I3 => \dac_data4__72_carry__3_0\(3),
      I4 => \^dac_data4__8_carry__6_0\(0),
      I5 => \dac_data4__171_carry__4_2\(2),
      O => \dac_data4__114_carry__3_0\(3)
    );
\dac_data4__171_carry__3_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669696996969669"
    )
        port map (
      I0 => \^dac_data4__114_carry__3\(2),
      I1 => \dac_data4__171_carry__3_i_10_n_0\,
      I2 => \dac_data4__72_carry__3_0\(2),
      I3 => \dac_data4__72_carry__3_0\(3),
      I4 => \dac_data4__171_carry__4_1\(0),
      I5 => \dac_data4__171_carry__4_2\(1),
      O => \dac_data4__114_carry__3_0\(2)
    );
\dac_data4__171_carry__3_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669696996969669"
    )
        port map (
      I0 => \^dac_data4__114_carry__3\(1),
      I1 => \dac_data4__171_carry__3_i_11_n_0\,
      I2 => \dac_data4__72_carry__3_0\(1),
      I3 => \dac_data4__72_carry__3_0\(2),
      I4 => \dac_data4__171_carry__4_1\(0),
      I5 => \dac_data4__171_carry__4_2\(0),
      O => \dac_data4__114_carry__3_0\(1)
    );
\dac_data4__171_carry__3_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969966996699696"
    )
        port map (
      I0 => \^dac_data4__114_carry__3\(0),
      I1 => \dac_data4__171_carry__3_i_9_n_0\,
      I2 => \dac_data4__72_carry__3_0\(0),
      I3 => \dac_data4__72_carry__3_0\(1),
      I4 => \dac_data4__171_carry__3_1\(3),
      I5 => \dac_data4__171_carry__3_2\(2),
      O => \dac_data4__114_carry__3_0\(0)
    );
\dac_data4__171_carry__3_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \dac_data4__72_carry__3_0\(2),
      I1 => \dac_data4__171_carry__4_1\(0),
      I2 => \dac_data4__171_carry__4_2\(0),
      O => \dac_data4__171_carry__3_i_9_n_0\
    );
\dac_data4__171_carry__4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data4__171_carry__5_2\(0),
      I1 => \dac_data4__171_carry__4_i_9_n_1\,
      O => \^dac_data4__171_carry__4_i_9_0\(3)
    );
\dac_data4__171_carry__4_i_10\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \NLW_dac_data4__171_carry__4_i_10_CO_UNCONNECTED\(3),
      CO(2) => \dac_data4__171_carry__4_i_10_n_1\,
      CO(1) => \NLW_dac_data4__171_carry__4_i_10_CO_UNCONNECTED\(1),
      CO(0) => \dac_data4__171_carry__4_i_10_n_3\,
      CYINIT => \dac_data4__171_carry__4_i_9_n_1\,
      DI(3 downto 2) => B"00",
      DI(1) => \dac_data4__171_carry__4_i_13_n_0\,
      DI(0) => '0',
      O(3 downto 2) => \NLW_dac_data4__171_carry__4_i_10_O_UNCONNECTED\(3 downto 2),
      O(1) => \dac_data4__171_carry__4_i_10_n_6\,
      O(0) => \NLW_dac_data4__171_carry__4_i_10_O_UNCONNECTED\(0),
      S(3 downto 2) => B"01",
      S(1) => \dac_data4__171_carry__4_i_14_n_0\,
      S(0) => '1'
    );
\dac_data4__171_carry__4_i_11\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \NLW_dac_data4__171_carry__4_i_11_CO_UNCONNECTED\(3),
      CO(2) => \dac_data4__171_carry__4_i_11_n_1\,
      CO(1) => \NLW_dac_data4__171_carry__4_i_11_CO_UNCONNECTED\(1),
      CO(0) => \dac_data4__171_carry__4_i_11_n_3\,
      CYINIT => \dac_data4__171_carry__5_2\(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_dac_data4__171_carry__4_i_11_O_UNCONNECTED\(3 downto 2),
      O(1) => \dac_data4__171_carry__4_i_11_n_6\,
      O(0) => \NLW_dac_data4__171_carry__4_i_11_O_UNCONNECTED\(0),
      S(3 downto 2) => B"01",
      S(1) => \dac_data4__171_carry__4_i_15_n_0\,
      S(0) => '1'
    );
\dac_data4__171_carry__4_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^co\(0),
      I1 => O(1),
      O => \dac_data4__171_carry__4_i_12_n_0\
    );
\dac_data4__171_carry__4_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__171_carry__4_i_13_n_0\
    );
\dac_data4__171_carry__4_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^co\(0),
      I1 => O(1),
      O => \dac_data4__171_carry__4_i_14_n_0\
    );
\dac_data4__171_carry__4_i_15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^co\(0),
      I1 => O(1),
      O => \dac_data4__171_carry__4_i_15_n_0\
    );
\dac_data4__171_carry__4_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"91"
    )
        port map (
      I0 => \dac_data4__171_carry__4_i_9_n_1\,
      I1 => \dac_data4__171_carry__5_2\(0),
      I2 => \dac_data4__171_carry__4_i_9_n_6\,
      O => \^dac_data4__171_carry__4_i_9_0\(2)
    );
\dac_data4__171_carry__4_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4DFC"
    )
        port map (
      I0 => \dac_data4__171_carry__4_1\(0),
      I1 => \^dac_data4__8_carry__6_0\(0),
      I2 => \dac_data4__171_carry__4_i_9_n_6\,
      I3 => \dac_data4__171_carry__5_2\(0),
      O => \^dac_data4__171_carry__4_i_9_0\(1)
    );
\dac_data4__171_carry__4_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F2B020FB"
    )
        port map (
      I0 => \dac_data4__171_carry__4_2\(2),
      I1 => \^dac_data4__8_carry__6_0\(0),
      I2 => \dac_data4__72_carry__3_0\(3),
      I3 => \dac_data4__171_carry__4_1\(0),
      I4 => \dac_data4__171_carry__5_2\(0),
      O => \^dac_data4__171_carry__4_i_9_0\(0)
    );
\dac_data4__171_carry__4_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => \dac_data4__171_carry__4_i_10_n_6\,
      I1 => \dac_data4__171_carry__4_i_11_n_6\,
      I2 => \dac_data4__171_carry__4_i_9_n_1\,
      I3 => \dac_data4__171_carry__5_2\(0),
      O => \dac_data4__114_carry__3_1\(3)
    );
\dac_data4__171_carry__4_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \dac_data4__171_carry__4_i_9_n_6\,
      I1 => \dac_data4__171_carry__5_2\(0),
      I2 => \dac_data4__171_carry__4_i_9_n_1\,
      O => \dac_data4__114_carry__3_1\(2)
    );
\dac_data4__171_carry__4_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF45BA"
    )
        port map (
      I0 => \^dac_data4__8_carry__6_0\(0),
      I1 => \dac_data4__171_carry__4_1\(0),
      I2 => \dac_data4__171_carry__5_2\(0),
      I3 => \dac_data4__171_carry__4_i_9_n_1\,
      I4 => \dac_data4__171_carry__4_i_9_n_6\,
      O => \dac_data4__114_carry__3_1\(1)
    );
\dac_data4__171_carry__4_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5AA59669"
    )
        port map (
      I0 => \^dac_data4__171_carry__4_i_9_0\(0),
      I1 => \dac_data4__171_carry__5_2\(0),
      I2 => \dac_data4__171_carry__4_i_9_n_6\,
      I3 => \^dac_data4__8_carry__6_0\(0),
      I4 => \dac_data4__171_carry__4_1\(0),
      O => \dac_data4__114_carry__3_1\(0)
    );
\dac_data4__171_carry__4_i_9\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \NLW_dac_data4__171_carry__4_i_9_CO_UNCONNECTED\(3),
      CO(2) => \dac_data4__171_carry__4_i_9_n_1\,
      CO(1) => \NLW_dac_data4__171_carry__4_i_9_CO_UNCONNECTED\(1),
      CO(0) => \dac_data4__171_carry__4_i_9_n_3\,
      CYINIT => \dac_data4__171_carry__4_1\(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_dac_data4__171_carry__4_i_9_O_UNCONNECTED\(3 downto 2),
      O(1) => \dac_data4__171_carry__4_i_9_n_6\,
      O(0) => \NLW_dac_data4__171_carry__4_i_9_O_UNCONNECTED\(0),
      S(3 downto 2) => B"01",
      S(1) => \dac_data4__171_carry__4_i_12_n_0\,
      S(0) => '1'
    );
\dac_data4__171_carry__5_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data4__171_carry__4_i_11_n_1\,
      I1 => \dac_data4__171_carry__4_i_10_n_1\,
      O => \^dac_data4__171_carry__4_i_10_0\(2)
    );
\dac_data4__171_carry__5_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^co\(0),
      I1 => O(1),
      O => \dac_data4__171_carry__5_i_10_n_0\
    );
\dac_data4__171_carry__5_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9990"
    )
        port map (
      I0 => \dac_data4__171_carry__4_i_10_n_1\,
      I1 => \dac_data4__171_carry__4_i_11_n_1\,
      I2 => \dac_data4__171_carry__4_i_10_n_6\,
      I3 => \dac_data4__171_carry__4_i_11_n_6\,
      O => \^dac_data4__171_carry__4_i_10_0\(1)
    );
\dac_data4__171_carry__5_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0999"
    )
        port map (
      I0 => \dac_data4__171_carry__4_i_11_n_6\,
      I1 => \dac_data4__171_carry__4_i_10_n_6\,
      I2 => \dac_data4__171_carry__5_2\(0),
      I3 => \dac_data4__171_carry__4_i_9_n_1\,
      O => \^dac_data4__171_carry__4_i_10_0\(0)
    );
\dac_data4__171_carry__5_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FB4B4F00FB40FB4"
    )
        port map (
      I0 => \dac_data4__171_carry__4_i_11_n_1\,
      I1 => \dac_data4__171_carry__4_i_10_n_1\,
      I2 => \dac_data4__171_carry__5_i_8_n_1\,
      I3 => \dac_data4__171_carry__5_i_8_n_6\,
      I4 => \^co\(0),
      I5 => O(1),
      O => \dac_data6__90_carry__2\(3)
    );
\dac_data4__171_carry__5_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A5A55AA569699669"
    )
        port map (
      I0 => \^dac_data4__171_carry__4_i_10_0\(2),
      I1 => \dac_data4__171_carry__4_i_10_n_1\,
      I2 => \dac_data4__171_carry__5_i_8_n_6\,
      I3 => O(1),
      I4 => \^co\(0),
      I5 => \dac_data4__171_carry__4_i_11_n_1\,
      O => \dac_data6__90_carry__2\(2)
    );
\dac_data4__171_carry__5_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"777E"
    )
        port map (
      I0 => \dac_data4__171_carry__4_i_11_n_1\,
      I1 => \dac_data4__171_carry__4_i_10_n_1\,
      I2 => \dac_data4__171_carry__4_i_11_n_6\,
      I3 => \dac_data4__171_carry__4_i_10_n_6\,
      O => \dac_data6__90_carry__2\(1)
    );
\dac_data4__171_carry__5_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"78870FF00FF08778"
    )
        port map (
      I0 => \dac_data4__171_carry__4_i_9_n_1\,
      I1 => \dac_data4__171_carry__5_2\(0),
      I2 => \dac_data4__171_carry__4_i_11_n_1\,
      I3 => \dac_data4__171_carry__4_i_10_n_1\,
      I4 => \dac_data4__171_carry__4_i_11_n_6\,
      I5 => \dac_data4__171_carry__4_i_10_n_6\,
      O => \dac_data6__90_carry__2\(0)
    );
\dac_data4__171_carry__5_i_8\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \NLW_dac_data4__171_carry__5_i_8_CO_UNCONNECTED\(3),
      CO(2) => \dac_data4__171_carry__5_i_8_n_1\,
      CO(1) => \NLW_dac_data4__171_carry__5_i_8_CO_UNCONNECTED\(1),
      CO(0) => \dac_data4__171_carry__5_i_8_n_3\,
      CYINIT => \dac_data4__171_carry__4_i_11_n_1\,
      DI(3 downto 2) => B"00",
      DI(1) => \dac_data4__171_carry__5_i_9_n_0\,
      DI(0) => '0',
      O(3 downto 2) => \NLW_dac_data4__171_carry__5_i_8_O_UNCONNECTED\(3 downto 2),
      O(1) => \dac_data4__171_carry__5_i_8_n_6\,
      O(0) => \NLW_dac_data4__171_carry__5_i_8_O_UNCONNECTED\(0),
      S(3 downto 2) => B"01",
      S(1) => \dac_data4__171_carry__5_i_10_n_0\,
      S(0) => '1'
    );
\dac_data4__171_carry__5_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__171_carry__5_i_9_n_0\
    );
\dac_data4__254_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => \dac_data4__254_carry__0\(3),
      I1 => \dac_data4__8_carry__0_0\(3),
      I2 => O(1),
      I3 => dac_data6(5),
      O => \_inferred__1/i__carry__0\(3)
    );
\dac_data4__254_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => \dac_data4__254_carry__0\(2),
      I1 => \dac_data4__8_carry__0_0\(2),
      I2 => O(1),
      I3 => dac_data6(4),
      O => \_inferred__1/i__carry__0\(2)
    );
\dac_data4__254_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => \dac_data4__254_carry__0\(1),
      I1 => \dac_data4__8_carry__0_0\(1),
      I2 => O(1),
      I3 => dac_data6(3),
      O => \_inferred__1/i__carry__0\(1)
    );
\dac_data4__254_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => \dac_data4__254_carry__0\(0),
      I1 => \dac_data4__8_carry__0_0\(0),
      I2 => O(1),
      I3 => dac_data6(2),
      O => \_inferred__1/i__carry__0\(0)
    );
\dac_data4__254_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => \dac_data4__254_carry__1_0\(3),
      I1 => \dac_data4__254_carry__1\(3),
      I2 => O(1),
      I3 => dac_data6(9),
      O => \_inferred__1/i__carry__1_0\(3)
    );
\dac_data4__254_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => \dac_data4__254_carry__1_0\(2),
      I1 => \dac_data4__254_carry__1\(2),
      I2 => O(1),
      I3 => dac_data6(8),
      O => \_inferred__1/i__carry__1_0\(2)
    );
\dac_data4__254_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => \dac_data4__254_carry__1_0\(1),
      I1 => \dac_data4__254_carry__1\(1),
      I2 => O(1),
      I3 => dac_data6(7),
      O => \_inferred__1/i__carry__1_0\(1)
    );
\dac_data4__254_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => \dac_data4__254_carry__1_0\(0),
      I1 => \dac_data4__254_carry__1\(0),
      I2 => O(1),
      I3 => dac_data6(6),
      O => \_inferred__1/i__carry__1_0\(0)
    );
\dac_data4__254_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => \dac_data4__254_carry__2\(3),
      I1 => \dac_data4__8_carry__0\(3),
      I2 => O(1),
      I3 => dac_data6(13),
      O => \_inferred__1/i__carry__2_0\(3)
    );
\dac_data4__254_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => \dac_data4__254_carry__2\(2),
      I1 => \dac_data4__8_carry__0\(2),
      I2 => O(1),
      I3 => dac_data6(12),
      O => \_inferred__1/i__carry__2_0\(2)
    );
\dac_data4__254_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => \dac_data4__254_carry__2\(1),
      I1 => \dac_data4__8_carry__0\(1),
      I2 => O(1),
      I3 => dac_data6(11),
      O => \_inferred__1/i__carry__2_0\(1)
    );
\dac_data4__254_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => \dac_data4__254_carry__2\(0),
      I1 => \dac_data4__8_carry__0\(0),
      I2 => O(1),
      I3 => dac_data6(10),
      O => \_inferred__1/i__carry__2_0\(0)
    );
\dac_data4__254_carry__2_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FF47004700B8FF"
    )
        port map (
      I0 => dac_data6(13),
      I1 => O(1),
      I2 => \dac_data4__8_carry__0\(3),
      I3 => \dac_data4__254_carry__2\(3),
      I4 => \dac_data4__254_carry__3\(0),
      I5 => \dac_data4__8_carry__3_i_9_n_0\,
      O => \dac_data4__8_carry__3_i_9_0\(2)
    );
\dac_data4__254_carry__2_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FF47004700B8FF"
    )
        port map (
      I0 => dac_data6(12),
      I1 => O(1),
      I2 => \dac_data4__8_carry__0\(2),
      I3 => \dac_data4__254_carry__2\(2),
      I4 => \dac_data4__254_carry__2\(3),
      I5 => \dac_data4__8_carry__3_i_11_n_0\,
      O => \dac_data4__8_carry__3_i_9_0\(1)
    );
\dac_data4__254_carry__2_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FF47004700B8FF"
    )
        port map (
      I0 => dac_data6(11),
      I1 => O(1),
      I2 => \dac_data4__8_carry__0\(1),
      I3 => \dac_data4__254_carry__2\(1),
      I4 => \dac_data4__254_carry__2\(2),
      I5 => \dac_data4__8_carry__2_i_9_n_0\,
      O => \dac_data4__8_carry__3_i_9_0\(0)
    );
\dac_data4__254_carry__3_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      I2 => \dac_data4__254_carry__3\(3),
      O => \dac_data4__171_carry__2\(3)
    );
\dac_data4__254_carry__3_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      I2 => \dac_data4__254_carry__3\(2),
      O => \dac_data4__171_carry__2\(2)
    );
\dac_data4__254_carry__3_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \dac_data4__254_carry__3\(1),
      I1 => O(1),
      I2 => dac_data6(15),
      O => \dac_data4__171_carry__2\(1)
    );
\dac_data4__254_carry__3_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => \dac_data4__254_carry__3\(0),
      I1 => O(0),
      I2 => O(1),
      I3 => dac_data6(14),
      O => \dac_data4__171_carry__2\(0)
    );
\dac_data4__254_carry__3_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA45"
    )
        port map (
      I0 => \dac_data4__254_carry__3\(3),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => \dac_data4__254_carry__4\(0),
      O => \dac_data4__171_carry__3_0\(3)
    );
\dac_data4__254_carry__3_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA45"
    )
        port map (
      I0 => \dac_data4__254_carry__3\(2),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => \dac_data4__254_carry__3\(3),
      O => \dac_data4__171_carry__3_0\(2)
    );
\dac_data4__254_carry__3_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4BCCB433"
    )
        port map (
      I0 => dac_data6(15),
      I1 => \dac_data4__254_carry__3\(1),
      I2 => \^co\(0),
      I3 => O(1),
      I4 => \dac_data4__254_carry__3\(2),
      O => \dac_data4__171_carry__3_0\(1)
    );
\dac_data4__254_carry__3_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF5050AF30CF30CF"
    )
        port map (
      I0 => dac_data6(14),
      I1 => O(0),
      I2 => \dac_data4__254_carry__3\(0),
      I3 => \dac_data4__254_carry__3\(1),
      I4 => dac_data6(15),
      I5 => O(1),
      O => \dac_data4__171_carry__3_0\(0)
    );
\dac_data4__254_carry__4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      I2 => \dac_data4__254_carry__4\(3),
      O => \dac_data4__171_carry__3\(3)
    );
\dac_data4__254_carry__4_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      I2 => \dac_data4__254_carry__4\(2),
      O => \dac_data4__171_carry__3\(2)
    );
\dac_data4__254_carry__4_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      I2 => \dac_data4__254_carry__4\(1),
      O => \dac_data4__171_carry__3\(1)
    );
\dac_data4__254_carry__4_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      I2 => \dac_data4__254_carry__4\(0),
      O => \dac_data4__171_carry__3\(0)
    );
\dac_data4__254_carry__4_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA45"
    )
        port map (
      I0 => \dac_data4__254_carry__4\(3),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => \dac_data4__254_carry__5\(0),
      O => \dac_data4__171_carry__4_0\(3)
    );
\dac_data4__254_carry__4_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA45"
    )
        port map (
      I0 => \dac_data4__254_carry__4\(2),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => \dac_data4__254_carry__4\(3),
      O => \dac_data4__171_carry__4_0\(2)
    );
\dac_data4__254_carry__4_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA45"
    )
        port map (
      I0 => \dac_data4__254_carry__4\(1),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => \dac_data4__254_carry__4\(2),
      O => \dac_data4__171_carry__4_0\(1)
    );
\dac_data4__254_carry__4_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA45"
    )
        port map (
      I0 => \dac_data4__254_carry__4\(0),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => \dac_data4__254_carry__4\(1),
      O => \dac_data4__171_carry__4_0\(0)
    );
\dac_data4__254_carry__5_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      I2 => \dac_data4__254_carry__5\(3),
      O => \dac_data4__171_carry__4\(3)
    );
\dac_data4__254_carry__5_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      I2 => \dac_data4__254_carry__5\(2),
      O => \dac_data4__171_carry__4\(2)
    );
\dac_data4__254_carry__5_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      I2 => \dac_data4__254_carry__5\(1),
      O => \dac_data4__171_carry__4\(1)
    );
\dac_data4__254_carry__5_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      I2 => \dac_data4__254_carry__5\(0),
      O => \dac_data4__171_carry__4\(0)
    );
\dac_data4__254_carry__5_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA45"
    )
        port map (
      I0 => \dac_data4__254_carry__5\(3),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => \dac_data_reg[1]\(0),
      O => \dac_data4__171_carry__5_0\(3)
    );
\dac_data4__254_carry__5_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA45"
    )
        port map (
      I0 => \dac_data4__254_carry__5\(2),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => \dac_data4__254_carry__5\(3),
      O => \dac_data4__171_carry__5_0\(2)
    );
\dac_data4__254_carry__5_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA45"
    )
        port map (
      I0 => \dac_data4__254_carry__5\(1),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => \dac_data4__254_carry__5\(2),
      O => \dac_data4__171_carry__5_0\(1)
    );
\dac_data4__254_carry__5_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA45"
    )
        port map (
      I0 => \dac_data4__254_carry__5\(0),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => \dac_data4__254_carry__5\(1),
      O => \dac_data4__171_carry__5_0\(0)
    );
\dac_data4__254_carry__6_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      I2 => \dac_data_reg[1]\(2),
      O => \dac_data4__171_carry__5\(2)
    );
\dac_data4__254_carry__6_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      I2 => \dac_data_reg[1]\(1),
      O => \dac_data4__171_carry__5\(1)
    );
\dac_data4__254_carry__6_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      I2 => \dac_data_reg[1]\(0),
      O => \dac_data4__171_carry__5\(0)
    );
\dac_data4__254_carry__6_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA45"
    )
        port map (
      I0 => \dac_data_reg[1]\(2),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => \dac_data_reg[1]\(3),
      O => \dac_data4__171_carry__5_1\(2)
    );
\dac_data4__254_carry__6_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA45"
    )
        port map (
      I0 => \dac_data_reg[1]\(1),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => \dac_data_reg[1]\(2),
      O => \dac_data4__171_carry__5_1\(1)
    );
\dac_data4__254_carry__6_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA45"
    )
        port map (
      I0 => \dac_data_reg[1]\(0),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => \dac_data_reg[1]\(1),
      O => \dac_data4__171_carry__5_1\(0)
    );
\dac_data4__254_carry_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => \dac_data4__254_carry_0\(1),
      I1 => \dac_data4__254_carry\(2),
      I2 => O(1),
      I3 => dac_data6(1),
      O => \_inferred__1/i__carry\(1)
    );
\dac_data4__254_carry_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => \dac_data4__254_carry_0\(0),
      I1 => \dac_data4__254_carry\(1),
      I2 => O(1),
      I3 => dac_data6(0),
      O => \_inferred__1/i__carry\(0)
    );
\dac_data4__72_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__72_carry__2\(1),
      I1 => \dac_data4__72_carry__3_0\(0),
      O => \dac_data4__8_carry__6_1\(0)
    );
\dac_data4__72_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__72_carry__3_0\(1),
      I1 => \^dac_data4__8_carry__6_0\(0),
      O => \dac_data4__72_carry__3_i_1_1\(3)
    );
\dac_data4__72_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__72_carry__3_0\(0),
      I1 => \dac_data4__72_carry__3_0\(3),
      O => \dac_data4__72_carry__3_i_1_1\(2)
    );
\dac_data4__72_carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__72_carry__2\(3),
      I1 => \dac_data4__72_carry__3_0\(2),
      O => \dac_data4__72_carry__3_i_1_1\(1)
    );
\dac_data4__72_carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__72_carry__2\(2),
      I1 => \dac_data4__72_carry__3_0\(1),
      O => \dac_data4__72_carry__3_i_1_1\(0)
    );
\dac_data4__72_carry__3_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__72_carry__3_1\(0),
      CO(3 downto 1) => \NLW_dac_data4__72_carry__3_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \^dac_data4__8_carry__6_0\(0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_dac_data4__72_carry__3_i_1_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"0001"
    );
\dac_data4__72_carry__3_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^dac_data4__8_carry__6_0\(0),
      O => \dac_data4__72_carry__3_i_1_3\(2)
    );
\dac_data4__72_carry__3_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data4__72_carry__3_0\(3),
      O => \dac_data4__72_carry__3_i_1_3\(1)
    );
\dac_data4__72_carry__3_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data4__72_carry__3_0\(2),
      O => \dac_data4__72_carry__3_i_1_3\(0)
    );
\dac_data4__8_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(13),
      I1 => O(1),
      I2 => \dac_data4__8_carry__0\(3),
      O => \dac_data6__90_carry__1_0\(1)
    );
\dac_data4__8_carry__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(12),
      I1 => O(1),
      I2 => \dac_data4__8_carry__0\(2),
      O => \dac_data6__90_carry__1_0\(0)
    );
\dac_data4__8_carry__0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => \dac_data4__8_carry__0\(3),
      I1 => dac_data6(13),
      I2 => \dac_data4__8_carry__0_0\(3),
      I3 => O(1),
      I4 => dac_data6(5),
      O => \_inferred__1/i__carry__0_0\(1)
    );
\dac_data4__8_carry__0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => \dac_data4__8_carry__0\(2),
      I1 => dac_data6(12),
      I2 => \dac_data4__8_carry__0_0\(2),
      I3 => O(1),
      I4 => dac_data6(4),
      O => \_inferred__1/i__carry__0_0\(0)
    );
\dac_data4__8_carry__1_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFD04F40D0D04040"
    )
        port map (
      I0 => \^co\(0),
      I1 => dac_data6(0),
      I2 => O(1),
      I3 => \dac_data4__254_carry\(1),
      I4 => dac_data6(8),
      I5 => \dac_data4__254_carry__1\(2),
      O => DI(3)
    );
\dac_data4__8_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"606F909F6F609F90"
    )
        port map (
      I0 => \^co\(0),
      I1 => dac_data6(0),
      I2 => O(1),
      I3 => \dac_data4__254_carry\(1),
      I4 => dac_data6(8),
      I5 => \dac_data4__254_carry__1\(2),
      O => DI(2)
    );
\dac_data4__8_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => dac_data6(15),
      I1 => O(1),
      O => DI(1)
    );
\dac_data4__8_carry__1_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(14),
      I1 => O(1),
      I2 => O(0),
      O => DI(0)
    );
\dac_data4__8_carry__1_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"995A665A"
    )
        port map (
      I0 => \dac_data4__254_carry\(0),
      I1 => dac_data6(7),
      I2 => \dac_data4__254_carry__1\(1),
      I3 => O(1),
      I4 => dac_data6(15),
      O => \_inferred__1/i__carry__2_1\(1)
    );
\dac_data4__8_carry__1_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => O(0),
      I1 => dac_data6(14),
      I2 => \dac_data4__254_carry__1\(0),
      I3 => O(1),
      I4 => dac_data6(6),
      O => \_inferred__1/i__carry__2_1\(0)
    );
\dac_data4__8_carry__1_i_9\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__8_carry__1_i_6\(0),
      CO(3 downto 1) => \NLW_dac_data4__8_carry__1_i_9_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \^co\(0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_dac_data4__8_carry__1_i_9_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"0001"
    );
\dac_data4__8_carry__2_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFD04F40D0D04040"
    )
        port map (
      I0 => \^co\(0),
      I1 => dac_data6(4),
      I2 => O(1),
      I3 => \dac_data4__8_carry__0_0\(2),
      I4 => dac_data6(12),
      I5 => \dac_data4__8_carry__0\(2),
      O => \dac_data6__90_carry__1\(3)
    );
\dac_data4__8_carry__2_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => \dac_data4__8_carry__0\(3),
      I1 => dac_data6(13),
      I2 => \dac_data4__8_carry__0_0\(3),
      I3 => O(1),
      I4 => dac_data6(5),
      O => \dac_data4__8_carry__2_i_10_n_0\
    );
\dac_data4__8_carry__2_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => \dac_data4__8_carry__0\(2),
      I1 => dac_data6(12),
      I2 => \dac_data4__8_carry__0_0\(2),
      I3 => O(1),
      I4 => dac_data6(4),
      O => \dac_data4__8_carry__2_i_12_n_0\
    );
\dac_data4__8_carry__2_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFD04F40D0D04040"
    )
        port map (
      I0 => \^co\(0),
      I1 => dac_data6(3),
      I2 => O(1),
      I3 => \dac_data4__8_carry__0_0\(1),
      I4 => dac_data6(11),
      I5 => \dac_data4__8_carry__0\(1),
      O => \dac_data6__90_carry__1\(2)
    );
\dac_data4__8_carry__2_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFD04F40D0D04040"
    )
        port map (
      I0 => \^co\(0),
      I1 => dac_data6(2),
      I2 => O(1),
      I3 => \dac_data4__8_carry__0_0\(0),
      I4 => dac_data6(10),
      I5 => \dac_data4__8_carry__0\(0),
      O => \dac_data6__90_carry__1\(1)
    );
\dac_data4__8_carry__2_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFD04F40D0D04040"
    )
        port map (
      I0 => \^co\(0),
      I1 => dac_data6(1),
      I2 => O(1),
      I3 => \dac_data4__254_carry\(2),
      I4 => dac_data6(9),
      I5 => \dac_data4__254_carry__1\(3),
      O => \dac_data6__90_carry__1\(0)
    );
\dac_data4__8_carry__2_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5FFA7777A0058888"
    )
        port map (
      I0 => \dac_data4__8_carry__2_i_9_n_0\,
      I1 => \dac_data4__8_carry__0_0\(2),
      I2 => dac_data6(4),
      I3 => \^co\(0),
      I4 => O(1),
      I5 => \dac_data4__8_carry__2_i_10_n_0\,
      O => \dac_data4__8_carry__2_i_10_0\(1)
    );
\dac_data4__8_carry__2_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5FFA7777A0058888"
    )
        port map (
      I0 => \dac_data4__8_carry__2\,
      I1 => \dac_data4__8_carry__0_0\(1),
      I2 => dac_data6(3),
      I3 => \^co\(0),
      I4 => O(1),
      I5 => \dac_data4__8_carry__2_i_12_n_0\,
      O => \dac_data4__8_carry__2_i_10_0\(0)
    );
\dac_data4__8_carry__2_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(12),
      I1 => O(1),
      I2 => \dac_data4__8_carry__0\(2),
      O => \dac_data4__8_carry__2_i_9_n_0\
    );
\dac_data4__8_carry__3_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_1\(3)
    );
\dac_data4__8_carry__3_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(13),
      I1 => O(1),
      I2 => \dac_data4__8_carry__0\(3),
      O => \dac_data4__8_carry__3_i_11_n_0\
    );
\dac_data4__8_carry__3_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => O(0),
      I1 => dac_data6(14),
      I2 => \dac_data4__254_carry__1\(0),
      I3 => O(1),
      I4 => dac_data6(6),
      O => \dac_data4__8_carry__3_i_12_n_0\
    );
\dac_data4__8_carry__3_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D040"
    )
        port map (
      I0 => \^co\(0),
      I1 => dac_data6(7),
      I2 => O(1),
      I3 => dac_data6(15),
      O => \dac_data4__8_carry__1_i_9_1\(2)
    );
\dac_data4__8_carry__3_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFD04F40D0D04040"
    )
        port map (
      I0 => \^co\(0),
      I1 => dac_data6(6),
      I2 => O(1),
      I3 => \dac_data4__254_carry__1\(0),
      I4 => dac_data6(14),
      I5 => O(0),
      O => \dac_data4__8_carry__1_i_9_1\(1)
    );
\dac_data4__8_carry__3_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFD04F40D0D04040"
    )
        port map (
      I0 => \^co\(0),
      I1 => dac_data6(5),
      I2 => O(1),
      I3 => \dac_data4__8_carry__0_0\(3),
      I4 => dac_data6(13),
      I5 => \dac_data4__8_carry__0\(3),
      O => \dac_data4__8_carry__1_i_9_1\(0)
    );
\dac_data4__8_carry__3_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B874"
    )
        port map (
      I0 => \^co\(0),
      I1 => O(1),
      I2 => \dac_data4__254_carry__1\(3),
      I3 => dac_data6(9),
      O => \_inferred__1/i__carry__1\(3)
    );
\dac_data4__8_carry__3_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"71FF71008EFF8E00"
    )
        port map (
      I0 => dac_data6(15),
      I1 => \dac_data4__8_carry__3_1\,
      I2 => \^co\(0),
      I3 => O(1),
      I4 => \dac_data4__254_carry__1\(2),
      I5 => dac_data6(8),
      O => \_inferred__1/i__carry__1\(2)
    );
\dac_data4__8_carry__3_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"81777E777E888188"
    )
        port map (
      I0 => \dac_data4__8_carry__3_i_9_n_0\,
      I1 => \dac_data4__8_carry__3_0\,
      I2 => \^co\(0),
      I3 => O(1),
      I4 => dac_data6(15),
      I5 => \dac_data4__8_carry__3_1\,
      O => \_inferred__1/i__carry__1\(1)
    );
\dac_data4__8_carry__3_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5FFA7777A0058888"
    )
        port map (
      I0 => \dac_data4__8_carry__3_i_11_n_0\,
      I1 => \dac_data4__8_carry__0_0\(3),
      I2 => dac_data6(5),
      I3 => \^co\(0),
      I4 => O(1),
      I5 => \dac_data4__8_carry__3_i_12_n_0\,
      O => \_inferred__1/i__carry__1\(0)
    );
\dac_data4__8_carry__3_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(14),
      I1 => O(1),
      I2 => O(0),
      O => \dac_data4__8_carry__3_i_9_n_0\
    );
\dac_data4__8_carry__4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_3\(3)
    );
\dac_data4__8_carry__4_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_3\(2)
    );
\dac_data4__8_carry__4_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_3\(1)
    );
\dac_data4__8_carry__4_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_3\(0)
    );
\dac_data4__8_carry__4_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B874"
    )
        port map (
      I0 => \^co\(0),
      I1 => O(1),
      I2 => \dac_data4__8_carry__0\(3),
      I3 => dac_data6(13),
      O => \_inferred__1/i__carry__2\(3)
    );
\dac_data4__8_carry__4_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B874"
    )
        port map (
      I0 => \^co\(0),
      I1 => O(1),
      I2 => \dac_data4__8_carry__0\(2),
      I3 => dac_data6(12),
      O => \_inferred__1/i__carry__2\(2)
    );
\dac_data4__8_carry__4_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B874"
    )
        port map (
      I0 => \^co\(0),
      I1 => O(1),
      I2 => \dac_data4__8_carry__0\(1),
      I3 => dac_data6(11),
      O => \_inferred__1/i__carry__2\(1)
    );
\dac_data4__8_carry__4_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B874"
    )
        port map (
      I0 => \^co\(0),
      I1 => O(1),
      I2 => \dac_data4__8_carry__0\(0),
      I3 => dac_data6(10),
      O => \_inferred__1/i__carry__2\(0)
    );
\dac_data4__8_carry__5_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_2\(3)
    );
\dac_data4__8_carry__5_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => dac_data6(15),
      I1 => O(1),
      I2 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_2\(2)
    );
\dac_data4__8_carry__5_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => dac_data6(14),
      I1 => O(1),
      I2 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_2\(1)
    );
\dac_data4__8_carry__5_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_2\(0)
    );
\dac_data4__8_carry__5_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_0\(3)
    );
\dac_data4__8_carry__5_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => dac_data6(15),
      I1 => O(1),
      I2 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_0\(2)
    );
\dac_data4__8_carry__5_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E010"
    )
        port map (
      I0 => dac_data6(14),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => dac_data6(15),
      O => \dac_data4__8_carry__1_i_9_0\(1)
    );
\dac_data4__8_carry__5_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D8"
    )
        port map (
      I0 => O(1),
      I1 => dac_data6(14),
      I2 => O(0),
      O => \dac_data4__8_carry__1_i_9_0\(0)
    );
\dac_data4__8_carry__6_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_5\(3)
    );
\dac_data4__8_carry__6_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_5\(2)
    );
\dac_data4__8_carry__6_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_5\(1)
    );
\dac_data4__8_carry__6_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_5\(0)
    );
\dac_data4__8_carry__6_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_4\(3)
    );
\dac_data4__8_carry__6_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_4\(2)
    );
\dac_data4__8_carry__6_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_4\(1)
    );
\dac_data4__8_carry__6_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => O(1),
      I1 => \^co\(0),
      O => \dac_data4__8_carry__1_i_9_4\(0)
    );
\dac_data4__8_carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1DE2"
    )
        port map (
      I0 => \dac_data4__254_carry__1\(1),
      I1 => O(1),
      I2 => dac_data6(7),
      I3 => \dac_data4__254_carry\(0),
      O => \dac_data6__0_carry\(0)
    );
\dac_data6__0_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => amplitude(0),
      I1 => \^data_reg\(6),
      I2 => \^data_reg\(4),
      I3 => amplitude(2),
      I4 => \^data_reg\(5),
      I5 => amplitude(1),
      O => \^amplitude[0]\(3)
    );
\dac_data6__0_carry__0_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^data_reg\(4),
      I1 => amplitude(2),
      O => \dac_data6__0_carry__0_i_10_n_0\
    );
\dac_data6__0_carry__0_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^data_reg\(3),
      I1 => amplitude(2),
      O => \dac_data6__0_carry__0_i_11_n_0\
    );
\dac_data6__0_carry__0_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^data_reg\(2),
      I1 => amplitude(2),
      O => \dac_data6__0_carry__0_i_12_n_0\
    );
\dac_data6__0_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => amplitude(0),
      I1 => \^data_reg\(5),
      I2 => \^data_reg\(3),
      I3 => amplitude(2),
      I4 => \^data_reg\(4),
      I5 => amplitude(1),
      O => \^amplitude[0]\(2)
    );
\dac_data6__0_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => amplitude(0),
      I1 => \^data_reg\(4),
      I2 => \^data_reg\(2),
      I3 => amplitude(2),
      I4 => \^data_reg\(3),
      I5 => amplitude(1),
      O => \^amplitude[0]\(1)
    );
\dac_data6__0_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => amplitude(0),
      I1 => \^data_reg\(3),
      I2 => \^data_reg\(1),
      I3 => amplitude(2),
      I4 => \^data_reg\(2),
      I5 => amplitude(1),
      O => \^amplitude[0]\(0)
    );
\dac_data6__0_carry__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A95956A956A"
    )
        port map (
      I0 => \^amplitude[0]\(3),
      I1 => amplitude(1),
      I2 => \^data_reg\(6),
      I3 => \dac_data6__0_carry__0_i_9_n_0\,
      I4 => \^data_reg\(7),
      I5 => amplitude(0),
      O => \amplitude[1]_0\(3)
    );
\dac_data6__0_carry__0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \^amplitude[0]\(2),
      I1 => amplitude(1),
      I2 => \^data_reg\(5),
      I3 => \dac_data6__0_carry__0_i_10_n_0\,
      I4 => \^data_reg\(6),
      I5 => amplitude(0),
      O => \amplitude[1]_0\(2)
    );
\dac_data6__0_carry__0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \^amplitude[0]\(1),
      I1 => amplitude(1),
      I2 => \^data_reg\(4),
      I3 => \dac_data6__0_carry__0_i_11_n_0\,
      I4 => \^data_reg\(5),
      I5 => amplitude(0),
      O => \amplitude[1]_0\(1)
    );
\dac_data6__0_carry__0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \^amplitude[0]\(0),
      I1 => amplitude(1),
      I2 => \^data_reg\(3),
      I3 => \dac_data6__0_carry__0_i_12_n_0\,
      I4 => \^data_reg\(4),
      I5 => amplitude(0),
      O => \amplitude[1]_0\(0)
    );
\dac_data6__0_carry__0_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^data_reg\(5),
      I1 => amplitude(2),
      O => \dac_data6__0_carry__0_i_9_n_0\
    );
\dac_data6__0_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D000"
    )
        port map (
      I0 => amplitude(1),
      I1 => \^data_reg\(7),
      I2 => amplitude(2),
      I3 => \^data_reg\(6),
      O => \amplitude[1]\(1)
    );
\dac_data6__0_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8888000F888F888"
    )
        port map (
      I0 => amplitude(2),
      I1 => \^data_reg\(5),
      I2 => \^data_reg\(6),
      I3 => amplitude(1),
      I4 => \^data_reg\(7),
      I5 => amplitude(0),
      O => \amplitude[1]\(0)
    );
\dac_data6__0_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5F2F"
    )
        port map (
      I0 => \^data_reg\(6),
      I1 => amplitude(1),
      I2 => amplitude(2),
      I3 => \^data_reg\(7),
      O => data_reg_3(1)
    );
\dac_data6__0_carry__1_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F30F2450C3FF4BFF"
    )
        port map (
      I0 => amplitude(0),
      I1 => \^data_reg\(5),
      I2 => \^data_reg\(6),
      I3 => amplitude(2),
      I4 => \^data_reg\(7),
      I5 => amplitude(1),
      O => data_reg_3(0)
    );
\dac_data6__0_carry_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => amplitude(0),
      I1 => \^data_reg\(3),
      I2 => \^data_reg\(1),
      I3 => amplitude(2),
      I4 => \^data_reg\(2),
      I5 => amplitude(1),
      O => \amplitude[0]_0\(2)
    );
\dac_data6__0_carry_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => amplitude(1),
      I1 => \^data_reg\(1),
      I2 => amplitude(2),
      I3 => \^data_reg\(0),
      O => \amplitude[0]_0\(1)
    );
\dac_data6__0_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^data_reg\(1),
      I1 => amplitude(0),
      O => \amplitude[0]_0\(0)
    );
\dac_data6__0_carry_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9699CC3399993333"
    )
        port map (
      I0 => \^data_reg\(2),
      I1 => \dac_data6__0_carry_i_8_n_0\,
      I2 => \^data_reg\(0),
      I3 => \^data_reg\(1),
      I4 => amplitude(1),
      I5 => amplitude(2),
      O => data_reg_0(3)
    );
\dac_data6__0_carry_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => \^data_reg\(0),
      I1 => amplitude(2),
      I2 => \^data_reg\(1),
      I3 => amplitude(1),
      I4 => amplitude(0),
      I5 => \^data_reg\(2),
      O => data_reg_0(2)
    );
\dac_data6__0_carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => amplitude(0),
      I1 => \^data_reg\(1),
      I2 => amplitude(1),
      I3 => \^data_reg\(0),
      O => data_reg_0(1)
    );
\dac_data6__0_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^data_reg\(0),
      I1 => amplitude(0),
      O => data_reg_0(0)
    );
\dac_data6__0_carry_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^data_reg\(3),
      I1 => amplitude(0),
      O => \dac_data6__0_carry_i_8_n_0\
    );
\dac_data6__30_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => amplitude(3),
      I1 => \^data_reg\(6),
      I2 => \^data_reg\(4),
      I3 => amplitude(5),
      I4 => \^data_reg\(5),
      I5 => amplitude(4),
      O => \^amplitude[3]\(3)
    );
\dac_data6__30_carry__0_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^data_reg\(4),
      I1 => amplitude(5),
      O => \dac_data6__30_carry__0_i_10_n_0\
    );
\dac_data6__30_carry__0_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^data_reg\(3),
      I1 => amplitude(5),
      O => \dac_data6__30_carry__0_i_11_n_0\
    );
\dac_data6__30_carry__0_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^data_reg\(2),
      I1 => amplitude(5),
      O => \dac_data6__30_carry__0_i_12_n_0\
    );
\dac_data6__30_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => amplitude(3),
      I1 => \^data_reg\(5),
      I2 => \^data_reg\(3),
      I3 => amplitude(5),
      I4 => \^data_reg\(4),
      I5 => amplitude(4),
      O => \^amplitude[3]\(2)
    );
\dac_data6__30_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => amplitude(3),
      I1 => \^data_reg\(4),
      I2 => \^data_reg\(2),
      I3 => amplitude(5),
      I4 => \^data_reg\(3),
      I5 => amplitude(4),
      O => \^amplitude[3]\(1)
    );
\dac_data6__30_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => amplitude(3),
      I1 => \^data_reg\(3),
      I2 => \^data_reg\(1),
      I3 => amplitude(5),
      I4 => \^data_reg\(2),
      I5 => amplitude(4),
      O => \^amplitude[3]\(0)
    );
\dac_data6__30_carry__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A95956A956A"
    )
        port map (
      I0 => \^amplitude[3]\(3),
      I1 => amplitude(4),
      I2 => \^data_reg\(6),
      I3 => \dac_data6__30_carry__0_i_9_n_0\,
      I4 => \^data_reg\(7),
      I5 => amplitude(3),
      O => \amplitude[4]_0\(3)
    );
\dac_data6__30_carry__0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \^amplitude[3]\(2),
      I1 => amplitude(4),
      I2 => \^data_reg\(5),
      I3 => \dac_data6__30_carry__0_i_10_n_0\,
      I4 => \^data_reg\(6),
      I5 => amplitude(3),
      O => \amplitude[4]_0\(2)
    );
\dac_data6__30_carry__0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \^amplitude[3]\(1),
      I1 => amplitude(4),
      I2 => \^data_reg\(4),
      I3 => \dac_data6__30_carry__0_i_11_n_0\,
      I4 => \^data_reg\(5),
      I5 => amplitude(3),
      O => \amplitude[4]_0\(1)
    );
\dac_data6__30_carry__0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \^amplitude[3]\(0),
      I1 => amplitude(4),
      I2 => \^data_reg\(3),
      I3 => \dac_data6__30_carry__0_i_12_n_0\,
      I4 => \^data_reg\(4),
      I5 => amplitude(3),
      O => \amplitude[4]_0\(0)
    );
\dac_data6__30_carry__0_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^data_reg\(5),
      I1 => amplitude(5),
      O => \dac_data6__30_carry__0_i_9_n_0\
    );
\dac_data6__30_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D000"
    )
        port map (
      I0 => amplitude(4),
      I1 => \^data_reg\(7),
      I2 => amplitude(5),
      I3 => \^data_reg\(6),
      O => \amplitude[4]\(1)
    );
\dac_data6__30_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8888000F888F888"
    )
        port map (
      I0 => amplitude(5),
      I1 => \^data_reg\(5),
      I2 => \^data_reg\(6),
      I3 => amplitude(4),
      I4 => \^data_reg\(7),
      I5 => amplitude(3),
      O => \amplitude[4]\(0)
    );
\dac_data6__30_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5F2F"
    )
        port map (
      I0 => \^data_reg\(6),
      I1 => amplitude(4),
      I2 => amplitude(5),
      I3 => \^data_reg\(7),
      O => data_reg_4(1)
    );
\dac_data6__30_carry__1_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F30F2450C3FF4BFF"
    )
        port map (
      I0 => amplitude(3),
      I1 => \^data_reg\(5),
      I2 => \^data_reg\(6),
      I3 => amplitude(5),
      I4 => \^data_reg\(7),
      I5 => amplitude(4),
      O => data_reg_4(0)
    );
\dac_data6__30_carry_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => amplitude(3),
      I1 => \^data_reg\(3),
      I2 => \^data_reg\(1),
      I3 => amplitude(5),
      I4 => \^data_reg\(2),
      I5 => amplitude(4),
      O => \amplitude[3]_0\(2)
    );
\dac_data6__30_carry_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => amplitude(4),
      I1 => \^data_reg\(1),
      I2 => amplitude(5),
      I3 => \^data_reg\(0),
      O => \amplitude[3]_0\(1)
    );
\dac_data6__30_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^data_reg\(1),
      I1 => amplitude(3),
      O => \amplitude[3]_0\(0)
    );
\dac_data6__30_carry_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9699CC3399993333"
    )
        port map (
      I0 => \^data_reg\(2),
      I1 => \dac_data6__30_carry_i_8_n_0\,
      I2 => \^data_reg\(0),
      I3 => \^data_reg\(1),
      I4 => amplitude(4),
      I5 => amplitude(5),
      O => data_reg_1(3)
    );
\dac_data6__30_carry_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => \^data_reg\(0),
      I1 => amplitude(5),
      I2 => \^data_reg\(1),
      I3 => amplitude(4),
      I4 => amplitude(3),
      I5 => \^data_reg\(2),
      O => data_reg_1(2)
    );
\dac_data6__30_carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => amplitude(3),
      I1 => \^data_reg\(1),
      I2 => amplitude(4),
      I3 => \^data_reg\(0),
      O => data_reg_1(1)
    );
\dac_data6__30_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^data_reg\(0),
      I1 => amplitude(3),
      O => data_reg_1(0)
    );
\dac_data6__30_carry_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^data_reg\(3),
      I1 => amplitude(3),
      O => \dac_data6__30_carry_i_8_n_0\
    );
\dac_data6__59_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => amplitude(6),
      I1 => \^data_reg\(6),
      I2 => amplitude(7),
      I3 => \^data_reg\(5),
      O => \amplitude[6]_0\(3)
    );
\dac_data6__59_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => amplitude(6),
      I1 => \^data_reg\(5),
      I2 => amplitude(7),
      I3 => \^data_reg\(4),
      O => \amplitude[6]_0\(2)
    );
\dac_data6__59_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => amplitude(6),
      I1 => \^data_reg\(4),
      I2 => amplitude(7),
      I3 => \^data_reg\(3),
      O => \amplitude[6]_0\(1)
    );
\dac_data6__59_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => amplitude(6),
      I1 => \^data_reg\(3),
      I2 => amplitude(7),
      I3 => \^data_reg\(2),
      O => \amplitude[6]_0\(0)
    );
\dac_data6__59_carry__0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2CD36060"
    )
        port map (
      I0 => \^data_reg\(5),
      I1 => \^data_reg\(6),
      I2 => amplitude(7),
      I3 => \^data_reg\(7),
      I4 => amplitude(6),
      O => data_reg_5(3)
    );
\dac_data6__59_carry__0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2CD39F9F"
    )
        port map (
      I0 => \^data_reg\(4),
      I1 => \^data_reg\(5),
      I2 => amplitude(7),
      I3 => \^data_reg\(6),
      I4 => amplitude(6),
      O => data_reg_5(2)
    );
\dac_data6__59_carry__0_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2CD39F9F"
    )
        port map (
      I0 => \^data_reg\(3),
      I1 => \^data_reg\(4),
      I2 => amplitude(7),
      I3 => \^data_reg\(5),
      I4 => amplitude(6),
      O => data_reg_5(1)
    );
\dac_data6__59_carry__0_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2CD39F9F"
    )
        port map (
      I0 => \^data_reg\(2),
      I1 => \^data_reg\(3),
      I2 => amplitude(7),
      I3 => \^data_reg\(4),
      I4 => amplitude(6),
      O => data_reg_5(0)
    );
\dac_data6__59_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDDD"
    )
        port map (
      I0 => amplitude(6),
      I1 => \^data_reg\(7),
      I2 => amplitude(7),
      I3 => \^data_reg\(6),
      O => \amplitude[6]_1\(0)
    );
\dac_data6__59_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^data_reg\(7),
      I1 => amplitude(7),
      O => data_reg_2(1)
    );
\dac_data6__59_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F4F3"
    )
        port map (
      I0 => \^data_reg\(6),
      I1 => amplitude(6),
      I2 => \^data_reg\(7),
      I3 => amplitude(7),
      O => data_reg_2(0)
    );
\dac_data6__59_carry_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8777"
    )
        port map (
      I0 => amplitude(6),
      I1 => \^data_reg\(3),
      I2 => amplitude(7),
      I3 => \^data_reg\(2),
      O => \amplitude[6]\(2)
    );
\dac_data6__59_carry_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => amplitude(7),
      I1 => \^data_reg\(1),
      O => \amplitude[6]\(1)
    );
\dac_data6__59_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^data_reg\(1),
      I1 => amplitude(6),
      O => \amplitude[6]\(0)
    );
\dac_data6__59_carry_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6A3F953F"
    )
        port map (
      I0 => \^data_reg\(2),
      I1 => \^data_reg\(3),
      I2 => amplitude(6),
      I3 => amplitude(7),
      I4 => \^data_reg\(1),
      O => S(3)
    );
\dac_data6__59_carry_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8777"
    )
        port map (
      I0 => amplitude(7),
      I1 => \^data_reg\(1),
      I2 => amplitude(6),
      I3 => \^data_reg\(2),
      O => S(2)
    );
\dac_data6__59_carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => amplitude(6),
      I1 => \^data_reg\(1),
      I2 => amplitude(7),
      I3 => \^data_reg\(0),
      O => S(1)
    );
\dac_data6__59_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^data_reg\(0),
      I1 => amplitude(6),
      O => S(0)
    );
\dac_data6__90_carry__0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96969600"
    )
        port map (
      I0 => \dac_data6__90_carry__1_2\(2),
      I1 => \dac_data6__90_carry__1_1\(2),
      I2 => \dac_data6__90_carry__1_3\(1),
      I3 => \dac_data6__90_carry__1_1\(1),
      I4 => \dac_data6__90_carry__1_2\(1),
      O => \^dac_data6__30_carry__0\(2)
    );
\dac_data6__90_carry__0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEE0E0FE"
    )
        port map (
      I0 => \dac_data6__90_carry__1_1\(0),
      I1 => \dac_data6__90_carry__1_2\(0),
      I2 => \dac_data6__90_carry__1_3\(0),
      I3 => \dac_data6__90_carry__1_2\(1),
      I4 => \dac_data6__90_carry__1_1\(1),
      O => \^dac_data6__30_carry__0\(1)
    );
\dac_data6__90_carry__0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E11E1EE1"
    )
        port map (
      I0 => \dac_data6__90_carry__1_1\(0),
      I1 => \dac_data6__90_carry__1_2\(0),
      I2 => \dac_data6__90_carry__1_3\(0),
      I3 => \dac_data6__90_carry__1_2\(1),
      I4 => \dac_data6__90_carry__1_1\(1),
      O => \^dac_data6__30_carry__0\(0)
    );
\dac_data6__90_carry__0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"99969666"
    )
        port map (
      I0 => \^dac_data6__30_carry__0\(2),
      I1 => \dac_data6__90_carry__0_i_9_n_0\,
      I2 => \dac_data6__90_carry__1_3\(1),
      I3 => \dac_data6__90_carry__1_1\(2),
      I4 => \dac_data6__90_carry__1_2\(2),
      O => \dac_data6__30_carry__0_0\(2)
    );
\dac_data6__90_carry__0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669966996696996"
    )
        port map (
      I0 => \^dac_data6__30_carry__0\(1),
      I1 => \dac_data6__90_carry__1_3\(1),
      I2 => \dac_data6__90_carry__1_1\(2),
      I3 => \dac_data6__90_carry__1_2\(2),
      I4 => \dac_data6__90_carry__1_2\(1),
      I5 => \dac_data6__90_carry__1_1\(1),
      O => \dac_data6__30_carry__0_0\(1)
    );
\dac_data6__90_carry__0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996969696969669"
    )
        port map (
      I0 => \dac_data6__90_carry__1_1\(1),
      I1 => \dac_data6__90_carry__1_2\(1),
      I2 => \dac_data6__90_carry__1_3\(0),
      I3 => \dac_data6__90_carry__1_2\(0),
      I4 => \dac_data6__90_carry__1_1\(0),
      I5 => \dac_data6__90_carry__0\(0),
      O => \dac_data6__30_carry__0_0\(0)
    );
\dac_data6__90_carry__0_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \dac_data6__90_carry__1_5\(0),
      I1 => \dac_data6__90_carry__1_4\(0),
      I2 => \dac_data6__90_carry__1_2\(3),
      O => \dac_data6__90_carry__0_i_9_n_0\
    );
\dac_data6__90_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6000"
    )
        port map (
      I0 => \dac_data6__90_carry__1_4\(3),
      I1 => \dac_data6__90_carry__1_7\(0),
      I2 => \dac_data6__90_carry__1_6\(1),
      I3 => \dac_data6__90_carry__1_4\(2),
      O => \^dac_data6__59_carry__0\(3)
    );
\dac_data6__90_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6000"
    )
        port map (
      I0 => \dac_data6__90_carry__1_4\(2),
      I1 => \dac_data6__90_carry__1_6\(1),
      I2 => \dac_data6__90_carry__1_6\(0),
      I3 => \dac_data6__90_carry__1_4\(1),
      O => \^dac_data6__59_carry__0\(2)
    );
\dac_data6__90_carry__1_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"66606000"
    )
        port map (
      I0 => \dac_data6__90_carry__1_4\(1),
      I1 => \dac_data6__90_carry__1_6\(0),
      I2 => \dac_data6__90_carry__1_2\(3),
      I3 => \dac_data6__90_carry__1_4\(0),
      I4 => \dac_data6__90_carry__1_5\(0),
      O => \^dac_data6__59_carry__0\(1)
    );
\dac_data6__90_carry__1_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9696960096000000"
    )
        port map (
      I0 => \dac_data6__90_carry__1_2\(3),
      I1 => \dac_data6__90_carry__1_4\(0),
      I2 => \dac_data6__90_carry__1_5\(0),
      I3 => \dac_data6__90_carry__1_2\(2),
      I4 => \dac_data6__90_carry__1_1\(2),
      I5 => \dac_data6__90_carry__1_3\(1),
      O => \^dac_data6__59_carry__0\(0)
    );
\dac_data6__90_carry__1_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F7878F0"
    )
        port map (
      I0 => \dac_data6__90_carry__1_4\(2),
      I1 => \dac_data6__90_carry__1_6\(1),
      I2 => \dac_data6__90_carry__2_1\(0),
      I3 => \dac_data6__90_carry__1_4\(3),
      I4 => \dac_data6__90_carry__1_7\(0),
      O => \dac_data6__30_carry__1\(3)
    );
\dac_data6__90_carry__1_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969696"
    )
        port map (
      I0 => \^dac_data6__59_carry__0\(2),
      I1 => \dac_data6__90_carry__1_7\(0),
      I2 => \dac_data6__90_carry__1_4\(3),
      I3 => \dac_data6__90_carry__1_4\(2),
      I4 => \dac_data6__90_carry__1_6\(1),
      O => \dac_data6__30_carry__1\(2)
    );
\dac_data6__90_carry__1_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69999666"
    )
        port map (
      I0 => \dac_data6__90_carry__1_4\(2),
      I1 => \dac_data6__90_carry__1_6\(1),
      I2 => \dac_data6__90_carry__1_6\(0),
      I3 => \dac_data6__90_carry__1_4\(1),
      I4 => \^dac_data6__59_carry__0\(1),
      O => \dac_data6__30_carry__1\(1)
    );
\dac_data6__90_carry__1_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969699669969696"
    )
        port map (
      I0 => \^dac_data6__59_carry__0\(0),
      I1 => \dac_data6__90_carry__1_6\(0),
      I2 => \dac_data6__90_carry__1_4\(1),
      I3 => \dac_data6__90_carry__1_5\(0),
      I4 => \dac_data6__90_carry__1_4\(0),
      I5 => \dac_data6__90_carry__1_2\(3),
      O => \dac_data6__30_carry__1\(0)
    );
\dac_data6__90_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \dac_data6__90_carry__1_4\(3),
      I1 => \dac_data6__90_carry__1_7\(0),
      I2 => \dac_data6__90_carry__2_1\(0),
      I3 => \dac_data6__90_carry__2_1\(1),
      O => \dac_data6__59_carry__1\(0)
    );
\dac_data[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFEA0000"
    )
        port map (
      I0 => \dac_data_reg[0]\(0),
      I1 => \dac_data_reg[2]\(0),
      I2 => \dac_data[0]_i_2_n_0\,
      I3 => \dac_data_reg[3]\(0),
      I4 => enable,
      O => D(0)
    );
\dac_data[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF8A"
    )
        port map (
      I0 => \dac_data_reg[1]\(3),
      I1 => \^co\(0),
      I2 => O(1),
      I3 => \dac_data_reg[1]_0\(0),
      O => \dac_data[0]_i_2_n_0\
    );
\dac_data[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA808"
    )
        port map (
      I0 => enable,
      I1 => dac_data40_in(1),
      I2 => O(1),
      I3 => \dac_data2_carry__1\(0),
      I4 => \dac_data_reg[0]\(0),
      O => D(1)
    );
\dac_data[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABFBBAAAA8088"
    )
        port map (
      I0 => \dac_data_reg[2]\(1),
      I1 => \dac_data_reg[1]\(3),
      I2 => \^co\(0),
      I3 => O(1),
      I4 => \dac_data_reg[1]_0\(0),
      I5 => \dac_data_reg[3]\(1),
      O => dac_data40_in(1)
    );
\dac_data[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA808"
    )
        port map (
      I0 => enable,
      I1 => dac_data40_in(2),
      I2 => O(1),
      I3 => \dac_data2_carry__1\(1),
      I4 => \dac_data_reg[0]\(0),
      O => D(2)
    );
\dac_data[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABFBBAAAA8088"
    )
        port map (
      I0 => \dac_data_reg[2]\(2),
      I1 => \dac_data_reg[1]\(3),
      I2 => \^co\(0),
      I3 => O(1),
      I4 => \dac_data_reg[1]_0\(0),
      I5 => \dac_data_reg[3]\(2),
      O => dac_data40_in(2)
    );
\dac_data[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA808"
    )
        port map (
      I0 => enable,
      I1 => dac_data40_in(3),
      I2 => O(1),
      I3 => \dac_data2_carry__1\(2),
      I4 => \dac_data_reg[0]\(0),
      O => D(3)
    );
\dac_data[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABFBBAAAA8088"
    )
        port map (
      I0 => dac_data2_carry(0),
      I1 => \dac_data_reg[1]\(3),
      I2 => \^co\(0),
      I3 => O(1),
      I4 => \dac_data_reg[1]_0\(0),
      I5 => \dac_data_reg[3]\(3),
      O => dac_data40_in(3)
    );
\dac_data[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA808"
    )
        port map (
      I0 => enable,
      I1 => dac_data40_in(4),
      I2 => O(1),
      I3 => \dac_data2_carry__1\(3),
      I4 => \dac_data_reg[0]\(0),
      O => D(4)
    );
\dac_data[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABFBBAAAA8088"
    )
        port map (
      I0 => dac_data2_carry(1),
      I1 => \dac_data_reg[1]\(3),
      I2 => \^co\(0),
      I3 => O(1),
      I4 => \dac_data_reg[1]_0\(0),
      I5 => dac_data2_carry_0(0),
      O => dac_data40_in(4)
    );
\dac_data[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA808"
    )
        port map (
      I0 => enable,
      I1 => dac_data40_in(5),
      I2 => O(1),
      I3 => \dac_data2_carry__1\(4),
      I4 => \dac_data_reg[0]\(0),
      O => D(5)
    );
\dac_data[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABFBBAAAA8088"
    )
        port map (
      I0 => dac_data2_carry(2),
      I1 => \dac_data_reg[1]\(3),
      I2 => \^co\(0),
      I3 => O(1),
      I4 => \dac_data_reg[1]_0\(0),
      I5 => dac_data2_carry_0(1),
      O => dac_data40_in(5)
    );
\dac_data[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => \dac_data_reg[7]\(1),
      I1 => enable,
      I2 => reset_n,
      O => SR(0)
    );
\dac_data[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => \dac_data_reg[0]\(0),
      I1 => \dac_data_reg[7]_0\(0),
      I2 => enable,
      O => D(6)
    );
\dac_data[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5F5D"
    )
        port map (
      I0 => enable,
      I1 => \dac_data_reg[7]_0\(1),
      I2 => \dac_data_reg[7]\(1),
      I3 => \dac_data_reg[0]\(0),
      O => D(7)
    );
data_reg: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"00AD00AA00A700A500A2009E009B009800950092008F008C0089008600830080",
      INIT_01 => X"00D700D500D300D000CE00CB00C900C600C400C100BE00BC00B900B600B300B0",
      INIT_02 => X"00F400F300F100F000EE00ED00EB00EA00E800E600E400E200E000DE00DC00DA",
      INIT_03 => X"00FF00FF00FF00FE00FE00FE00FD00FD00FC00FB00FA00FA00F900F800F600F5",
      INIT_04 => X"00F600F800F900FA00FA00FB00FC00FD00FD00FE00FE00FE00FF00FF00FF00FF",
      INIT_05 => X"00DC00DE00E000E200E400E600E800EA00EB00ED00EE00F000F100F300F400F5",
      INIT_06 => X"00B300B600B900BC00BE00C100C400C600C900CB00CE00D000D300D500D700DA",
      INIT_07 => X"008300860089008C008F009200950098009B009E00A200A500A700AA00AD00B0",
      INIT_08 => X"005200550058005A005D006100640067006A006D0070007300760079007C0080",
      INIT_09 => X"0028002A002C002F0031003400360039003B003E0041004300460049004C004F",
      INIT_0A => X"000B000C000E000F001100120014001500170019001B001D001F002100230025",
      INIT_0B => X"000000000000000100010001000200020003000400050005000600070009000A",
      INIT_0C => X"0009000700060005000500040003000200020001000100010000000000000000",
      INIT_0D => X"00230021001F001D001B001900170015001400120011000F000E000C000B000A",
      INIT_0E => X"004C0049004600430041003E003B0039003600340031002F002C002A00280025",
      INIT_0F => X"007C0079007600730070006D006A006700640061005D005A005800550052004F",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"00000",
      INIT_B => X"00000",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11 downto 4) => ADDRARDADDR(7 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 0) => B"11111111111111",
      CLKARDCLK => dac_clk_out,
      CLKBWRCLK => '0',
      DIADI(15 downto 0) => B"0000000011111111",
      DIBDI(15 downto 0) => B"1111111111111111",
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => B"11",
      DOADO(15 downto 8) => NLW_data_reg_DOADO_UNCONNECTED(15 downto 8),
      DOADO(7 downto 0) => \^data_reg\(7 downto 0),
      DOBDO(15 downto 0) => NLW_data_reg_DOBDO_UNCONNECTED(15 downto 0),
      DOPADOP(1 downto 0) => NLW_data_reg_DOPADOP_UNCONNECTED(1 downto 0),
      DOPBDOP(1 downto 0) => NLW_data_reg_DOPBDOP_UNCONNECTED(1 downto 0),
      ENARDEN => '1',
      ENBWREN => '0',
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => \dac_data2_carry__0\(0),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => \dac_data4__72_carry__2\(1),
      O => \dac_data4__8_carry__5\(3)
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => dac_data2_carry_0(3),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => \dac_data4__72_carry__2\(0),
      O => \dac_data4__8_carry__5\(2)
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => dac_data2_carry_0(2),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => dac_data2_carry(3),
      O => \dac_data4__8_carry__5\(1)
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => dac_data2_carry_0(1),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => dac_data2_carry(2),
      O => \dac_data4__8_carry__5\(0)
    );
\i__carry__1_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => \dac_data2_carry__1_0\(0),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => \dac_data4__72_carry__3_0\(1),
      O => \dac_data4__8_carry__6_2\(3)
    );
\i__carry__1_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \dac_data_reg[7]\(0),
      I1 => \dac_data_reg[7]\(1),
      O => \dac_data2_carry__5\(0)
    );
\i__carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => \dac_data2_carry__0\(3),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => \dac_data4__72_carry__3_0\(0),
      O => \dac_data4__8_carry__6_2\(2)
    );
\i__carry__1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => \dac_data2_carry__0\(2),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => \dac_data4__72_carry__2\(3),
      O => \dac_data4__8_carry__6_2\(1)
    );
\i__carry__1_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => \dac_data2_carry__0\(1),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => \dac_data4__72_carry__2\(2),
      O => \dac_data4__8_carry__6_2\(0)
    );
\i__carry__1_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data_reg[7]\(1),
      I1 => \dac_data_reg[7]\(0),
      O => \dac_data2_carry__5_0\(0)
    );
\i__carry__2_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBAAFFFF"
    )
        port map (
      I0 => \dac_data_reg[1]_0\(0),
      I1 => O(1),
      I2 => \^co\(0),
      I3 => \dac_data_reg[1]\(3),
      I4 => \i__carry__2_i_5_n_3\,
      O => \i__carry__2_i_5_0\(3)
    );
\i__carry__2_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O(1),
      O => \dac_data6__90_carry__2_0\(1)
    );
\i__carry__2_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => \dac_data2_carry__1_0\(3),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => \^dac_data4__8_carry__6_0\(0),
      O => \i__carry__2_i_5_0\(2)
    );
\i__carry__2_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O(0),
      O => \dac_data6__90_carry__2_0\(0)
    );
\i__carry__2_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => \dac_data2_carry__1_0\(2),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => \dac_data4__72_carry__3_0\(3),
      O => \i__carry__2_i_5_0\(1)
    );
\i__carry__2_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => \dac_data2_carry__1_0\(1),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => \dac_data4__72_carry__3_0\(2),
      O => \i__carry__2_i_5_0\(0)
    );
\i__carry__2_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \i__carry__2_i_1_0\(0),
      CO(3 downto 1) => \NLW_i__carry__2_i_5_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \i__carry__2_i_5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_i__carry__2_i_5_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"0001"
    );
\i__carry_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => \dac_data_reg[3]\(0),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => \dac_data_reg[2]\(0),
      O => \dac_data4__8_carry__3\
    );
\i__carry_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => dac_data2_carry_0(0),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => dac_data2_carry(1),
      O => \dac_data4__8_carry__4\(3)
    );
\i__carry_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => \dac_data_reg[3]\(3),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => dac_data2_carry(0),
      O => \dac_data4__8_carry__4\(2)
    );
\i__carry_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => \dac_data_reg[3]\(2),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => \dac_data_reg[2]\(2),
      O => \dac_data4__8_carry__4\(1)
    );
\i__carry_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00101111FFDFDDDD"
    )
        port map (
      I0 => \dac_data_reg[3]\(1),
      I1 => \dac_data_reg[1]_0\(0),
      I2 => O(1),
      I3 => \^co\(0),
      I4 => \dac_data_reg[1]\(3),
      I5 => \dac_data_reg[2]\(1),
      O => \dac_data4__8_carry__4\(0)
    );
\phase_sum_carry__6_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(3),
      I1 => phase_ofst(3),
      O => \phase_acc_reg[31]\(3)
    );
\phase_sum_carry__6_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(2),
      I1 => phase_ofst(2),
      O => \phase_acc_reg[31]\(2)
    );
\phase_sum_carry__6_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(1),
      I1 => phase_ofst(1),
      O => \phase_acc_reg[31]\(1)
    );
\phase_sum_carry__6_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(0),
      I1 => phase_ofst(0),
      O => \phase_acc_reg[31]\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_bd_fra_top_0_0_dds is
  port (
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dac_clk_out : in STD_LOGIC;
    enable : in STD_LOGIC;
    amplitude : in STD_LOGIC_VECTOR ( 7 downto 0 );
    reset_n : in STD_LOGIC;
    phase_inc : in STD_LOGIC_VECTOR ( 31 downto 0 );
    phase_ofst : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_bd_fra_top_0_0_dds : entity is "dds";
end system_bd_fra_top_0_0_dds;

architecture STRUCTURE of system_bd_fra_top_0_0_dds is
  signal \^ss\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \_inferred__1/i__carry__0_n_0\ : STD_LOGIC;
  signal \_inferred__1/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__1/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__1/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__1/i__carry__1_n_0\ : STD_LOGIC;
  signal \_inferred__1/i__carry__1_n_1\ : STD_LOGIC;
  signal \_inferred__1/i__carry__1_n_2\ : STD_LOGIC;
  signal \_inferred__1/i__carry__1_n_3\ : STD_LOGIC;
  signal \_inferred__1/i__carry__2_n_0\ : STD_LOGIC;
  signal \_inferred__1/i__carry__2_n_1\ : STD_LOGIC;
  signal \_inferred__1/i__carry__2_n_2\ : STD_LOGIC;
  signal \_inferred__1/i__carry__2_n_3\ : STD_LOGIC;
  signal \_inferred__1/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__1/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__1/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__1/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_0\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_0\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_1\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_3\ : STD_LOGIC;
  signal \_inferred__2/i__carry__2_n_0\ : STD_LOGIC;
  signal \_inferred__2/i__carry__2_n_1\ : STD_LOGIC;
  signal \_inferred__2/i__carry__2_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry__2_n_3\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_3\ : STD_LOGIC;
  signal dac_data1 : STD_LOGIC;
  signal \dac_data1_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \dac_data1_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \dac_data1_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \dac_data1_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \dac_data1_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \dac_data1_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \dac_data1_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \dac_data1_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \dac_data1_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \dac_data1_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \dac_data2_carry__0_n_0\ : STD_LOGIC;
  signal \dac_data2_carry__0_n_1\ : STD_LOGIC;
  signal \dac_data2_carry__0_n_2\ : STD_LOGIC;
  signal \dac_data2_carry__0_n_3\ : STD_LOGIC;
  signal \dac_data2_carry__0_n_4\ : STD_LOGIC;
  signal \dac_data2_carry__0_n_5\ : STD_LOGIC;
  signal \dac_data2_carry__0_n_6\ : STD_LOGIC;
  signal \dac_data2_carry__0_n_7\ : STD_LOGIC;
  signal \dac_data2_carry__1_n_0\ : STD_LOGIC;
  signal \dac_data2_carry__1_n_1\ : STD_LOGIC;
  signal \dac_data2_carry__1_n_2\ : STD_LOGIC;
  signal \dac_data2_carry__1_n_3\ : STD_LOGIC;
  signal \dac_data2_carry__1_n_4\ : STD_LOGIC;
  signal \dac_data2_carry__1_n_5\ : STD_LOGIC;
  signal \dac_data2_carry__1_n_6\ : STD_LOGIC;
  signal \dac_data2_carry__1_n_7\ : STD_LOGIC;
  signal \dac_data2_carry__2_n_0\ : STD_LOGIC;
  signal \dac_data2_carry__2_n_1\ : STD_LOGIC;
  signal \dac_data2_carry__2_n_2\ : STD_LOGIC;
  signal \dac_data2_carry__2_n_3\ : STD_LOGIC;
  signal \dac_data2_carry__2_n_4\ : STD_LOGIC;
  signal \dac_data2_carry__2_n_5\ : STD_LOGIC;
  signal \dac_data2_carry__2_n_6\ : STD_LOGIC;
  signal \dac_data2_carry__2_n_7\ : STD_LOGIC;
  signal \dac_data2_carry__3_n_0\ : STD_LOGIC;
  signal \dac_data2_carry__3_n_1\ : STD_LOGIC;
  signal \dac_data2_carry__3_n_2\ : STD_LOGIC;
  signal \dac_data2_carry__3_n_3\ : STD_LOGIC;
  signal \dac_data2_carry__3_n_4\ : STD_LOGIC;
  signal \dac_data2_carry__3_n_5\ : STD_LOGIC;
  signal \dac_data2_carry__3_n_6\ : STD_LOGIC;
  signal \dac_data2_carry__3_n_7\ : STD_LOGIC;
  signal \dac_data2_carry__4_n_0\ : STD_LOGIC;
  signal \dac_data2_carry__4_n_1\ : STD_LOGIC;
  signal \dac_data2_carry__4_n_2\ : STD_LOGIC;
  signal \dac_data2_carry__4_n_3\ : STD_LOGIC;
  signal \dac_data2_carry__4_n_4\ : STD_LOGIC;
  signal \dac_data2_carry__4_n_5\ : STD_LOGIC;
  signal \dac_data2_carry__4_n_6\ : STD_LOGIC;
  signal \dac_data2_carry__4_n_7\ : STD_LOGIC;
  signal \dac_data2_carry__5_n_3\ : STD_LOGIC;
  signal \dac_data2_carry__5_n_6\ : STD_LOGIC;
  signal \dac_data2_carry__5_n_7\ : STD_LOGIC;
  signal dac_data2_carry_n_0 : STD_LOGIC;
  signal dac_data2_carry_n_1 : STD_LOGIC;
  signal dac_data2_carry_n_2 : STD_LOGIC;
  signal dac_data2_carry_n_3 : STD_LOGIC;
  signal dac_data2_carry_n_4 : STD_LOGIC;
  signal dac_data2_carry_n_5 : STD_LOGIC;
  signal dac_data2_carry_n_6 : STD_LOGIC;
  signal dac_data2_carry_n_7 : STD_LOGIC;
  signal dac_data3 : STD_LOGIC_VECTOR ( 24 downto 6 );
  signal dac_data4 : STD_LOGIC_VECTOR ( 16 downto 1 );
  signal \dac_data4__114_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry__0_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry__0_n_1\ : STD_LOGIC;
  signal \dac_data4__114_carry__0_n_2\ : STD_LOGIC;
  signal \dac_data4__114_carry__0_n_3\ : STD_LOGIC;
  signal \dac_data4__114_carry__0_n_4\ : STD_LOGIC;
  signal \dac_data4__114_carry__0_n_5\ : STD_LOGIC;
  signal \dac_data4__114_carry__0_n_6\ : STD_LOGIC;
  signal \dac_data4__114_carry__0_n_7\ : STD_LOGIC;
  signal \dac_data4__114_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry__1_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry__1_n_1\ : STD_LOGIC;
  signal \dac_data4__114_carry__1_n_2\ : STD_LOGIC;
  signal \dac_data4__114_carry__1_n_3\ : STD_LOGIC;
  signal \dac_data4__114_carry__1_n_4\ : STD_LOGIC;
  signal \dac_data4__114_carry__1_n_5\ : STD_LOGIC;
  signal \dac_data4__114_carry__1_n_6\ : STD_LOGIC;
  signal \dac_data4__114_carry__1_n_7\ : STD_LOGIC;
  signal \dac_data4__114_carry__2_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry__2_n_1\ : STD_LOGIC;
  signal \dac_data4__114_carry__2_n_2\ : STD_LOGIC;
  signal \dac_data4__114_carry__2_n_3\ : STD_LOGIC;
  signal \dac_data4__114_carry__2_n_4\ : STD_LOGIC;
  signal \dac_data4__114_carry__2_n_5\ : STD_LOGIC;
  signal \dac_data4__114_carry__2_n_6\ : STD_LOGIC;
  signal \dac_data4__114_carry__2_n_7\ : STD_LOGIC;
  signal \dac_data4__114_carry__3_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry__3_n_2\ : STD_LOGIC;
  signal \dac_data4__114_carry__3_n_3\ : STD_LOGIC;
  signal \dac_data4__114_carry__3_n_5\ : STD_LOGIC;
  signal \dac_data4__114_carry__3_n_6\ : STD_LOGIC;
  signal \dac_data4__114_carry__3_n_7\ : STD_LOGIC;
  signal \dac_data4__114_carry_i_1_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry_i_2_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry_i_3_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry_n_0\ : STD_LOGIC;
  signal \dac_data4__114_carry_n_1\ : STD_LOGIC;
  signal \dac_data4__114_carry_n_2\ : STD_LOGIC;
  signal \dac_data4__114_carry_n_3\ : STD_LOGIC;
  signal \dac_data4__114_carry_n_4\ : STD_LOGIC;
  signal \dac_data4__114_carry_n_5\ : STD_LOGIC;
  signal \dac_data4__114_carry_n_6\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_n_1\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_n_2\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_n_3\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_n_4\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_n_5\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_n_6\ : STD_LOGIC;
  signal \dac_data4__171_carry__0_n_7\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_i_10_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_i_11_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_i_12_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_i_9_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_n_1\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_n_2\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_n_3\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_n_4\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_n_5\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_n_6\ : STD_LOGIC;
  signal \dac_data4__171_carry__1_n_7\ : STD_LOGIC;
  signal \dac_data4__171_carry__2_i_11_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__2_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__2_n_1\ : STD_LOGIC;
  signal \dac_data4__171_carry__2_n_2\ : STD_LOGIC;
  signal \dac_data4__171_carry__2_n_3\ : STD_LOGIC;
  signal \dac_data4__171_carry__2_n_4\ : STD_LOGIC;
  signal \dac_data4__171_carry__2_n_5\ : STD_LOGIC;
  signal \dac_data4__171_carry__2_n_6\ : STD_LOGIC;
  signal \dac_data4__171_carry__2_n_7\ : STD_LOGIC;
  signal \dac_data4__171_carry__3_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__3_n_1\ : STD_LOGIC;
  signal \dac_data4__171_carry__3_n_2\ : STD_LOGIC;
  signal \dac_data4__171_carry__3_n_3\ : STD_LOGIC;
  signal \dac_data4__171_carry__3_n_4\ : STD_LOGIC;
  signal \dac_data4__171_carry__3_n_5\ : STD_LOGIC;
  signal \dac_data4__171_carry__3_n_6\ : STD_LOGIC;
  signal \dac_data4__171_carry__3_n_7\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_n_1\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_n_2\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_n_3\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_n_4\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_n_5\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_n_6\ : STD_LOGIC;
  signal \dac_data4__171_carry__4_n_7\ : STD_LOGIC;
  signal \dac_data4__171_carry__5_n_1\ : STD_LOGIC;
  signal \dac_data4__171_carry__5_n_2\ : STD_LOGIC;
  signal \dac_data4__171_carry__5_n_3\ : STD_LOGIC;
  signal \dac_data4__171_carry__5_n_4\ : STD_LOGIC;
  signal \dac_data4__171_carry__5_n_5\ : STD_LOGIC;
  signal \dac_data4__171_carry__5_n_6\ : STD_LOGIC;
  signal \dac_data4__171_carry__5_n_7\ : STD_LOGIC;
  signal \dac_data4__171_carry_i_1_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry_i_2_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry_i_3_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry_i_4_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry_i_5_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry_n_0\ : STD_LOGIC;
  signal \dac_data4__171_carry_n_1\ : STD_LOGIC;
  signal \dac_data4__171_carry_n_2\ : STD_LOGIC;
  signal \dac_data4__171_carry_n_3\ : STD_LOGIC;
  signal \dac_data4__171_carry_n_4\ : STD_LOGIC;
  signal \dac_data4__171_carry_n_5\ : STD_LOGIC;
  signal \dac_data4__171_carry_n_6\ : STD_LOGIC;
  signal \dac_data4__171_carry_n_7\ : STD_LOGIC;
  signal \dac_data4__254_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__0_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__0_n_1\ : STD_LOGIC;
  signal \dac_data4__254_carry__0_n_2\ : STD_LOGIC;
  signal \dac_data4__254_carry__0_n_3\ : STD_LOGIC;
  signal \dac_data4__254_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__1_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__1_n_1\ : STD_LOGIC;
  signal \dac_data4__254_carry__1_n_2\ : STD_LOGIC;
  signal \dac_data4__254_carry__1_n_3\ : STD_LOGIC;
  signal \dac_data4__254_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__2_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__2_n_1\ : STD_LOGIC;
  signal \dac_data4__254_carry__2_n_2\ : STD_LOGIC;
  signal \dac_data4__254_carry__2_n_3\ : STD_LOGIC;
  signal \dac_data4__254_carry__3_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__3_n_1\ : STD_LOGIC;
  signal \dac_data4__254_carry__3_n_2\ : STD_LOGIC;
  signal \dac_data4__254_carry__3_n_3\ : STD_LOGIC;
  signal \dac_data4__254_carry__4_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__4_n_1\ : STD_LOGIC;
  signal \dac_data4__254_carry__4_n_2\ : STD_LOGIC;
  signal \dac_data4__254_carry__4_n_3\ : STD_LOGIC;
  signal \dac_data4__254_carry__5_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry__5_n_1\ : STD_LOGIC;
  signal \dac_data4__254_carry__5_n_2\ : STD_LOGIC;
  signal \dac_data4__254_carry__5_n_3\ : STD_LOGIC;
  signal \dac_data4__254_carry__6_n_1\ : STD_LOGIC;
  signal \dac_data4__254_carry__6_n_2\ : STD_LOGIC;
  signal \dac_data4__254_carry__6_n_3\ : STD_LOGIC;
  signal \dac_data4__254_carry_i_3_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry_i_4_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry_i_5_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry_i_6_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry_i_7_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry_i_8_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry_i_9_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry_n_0\ : STD_LOGIC;
  signal \dac_data4__254_carry_n_1\ : STD_LOGIC;
  signal \dac_data4__254_carry_n_2\ : STD_LOGIC;
  signal \dac_data4__254_carry_n_3\ : STD_LOGIC;
  signal \dac_data4__315_carry__0_n_0\ : STD_LOGIC;
  signal \dac_data4__315_carry__0_n_1\ : STD_LOGIC;
  signal \dac_data4__315_carry__0_n_2\ : STD_LOGIC;
  signal \dac_data4__315_carry__0_n_3\ : STD_LOGIC;
  signal \dac_data4__315_carry__0_n_4\ : STD_LOGIC;
  signal \dac_data4__315_carry__0_n_5\ : STD_LOGIC;
  signal \dac_data4__315_carry__0_n_6\ : STD_LOGIC;
  signal \dac_data4__315_carry__0_n_7\ : STD_LOGIC;
  signal \dac_data4__315_carry__1_n_0\ : STD_LOGIC;
  signal \dac_data4__315_carry__1_n_1\ : STD_LOGIC;
  signal \dac_data4__315_carry__1_n_2\ : STD_LOGIC;
  signal \dac_data4__315_carry__1_n_3\ : STD_LOGIC;
  signal \dac_data4__315_carry__1_n_4\ : STD_LOGIC;
  signal \dac_data4__315_carry__1_n_5\ : STD_LOGIC;
  signal \dac_data4__315_carry__1_n_6\ : STD_LOGIC;
  signal \dac_data4__315_carry__1_n_7\ : STD_LOGIC;
  signal \dac_data4__315_carry__2_n_0\ : STD_LOGIC;
  signal \dac_data4__315_carry__2_n_1\ : STD_LOGIC;
  signal \dac_data4__315_carry__2_n_2\ : STD_LOGIC;
  signal \dac_data4__315_carry__2_n_3\ : STD_LOGIC;
  signal \dac_data4__315_carry__2_n_4\ : STD_LOGIC;
  signal \dac_data4__315_carry__2_n_5\ : STD_LOGIC;
  signal \dac_data4__315_carry__2_n_6\ : STD_LOGIC;
  signal \dac_data4__315_carry__2_n_7\ : STD_LOGIC;
  signal \dac_data4__315_carry_i_1_n_0\ : STD_LOGIC;
  signal \dac_data4__315_carry_n_0\ : STD_LOGIC;
  signal \dac_data4__315_carry_n_1\ : STD_LOGIC;
  signal \dac_data4__315_carry_n_2\ : STD_LOGIC;
  signal \dac_data4__315_carry_n_3\ : STD_LOGIC;
  signal \dac_data4__315_carry_n_4\ : STD_LOGIC;
  signal \dac_data4__315_carry_n_5\ : STD_LOGIC;
  signal \dac_data4__315_carry_n_6\ : STD_LOGIC;
  signal \dac_data4__315_carry_n_7\ : STD_LOGIC;
  signal \dac_data4__72_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry__0_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry__0_n_1\ : STD_LOGIC;
  signal \dac_data4__72_carry__0_n_2\ : STD_LOGIC;
  signal \dac_data4__72_carry__0_n_3\ : STD_LOGIC;
  signal \dac_data4__72_carry__0_n_4\ : STD_LOGIC;
  signal \dac_data4__72_carry__0_n_5\ : STD_LOGIC;
  signal \dac_data4__72_carry__0_n_6\ : STD_LOGIC;
  signal \dac_data4__72_carry__0_n_7\ : STD_LOGIC;
  signal \dac_data4__72_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry__1_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry__1_n_1\ : STD_LOGIC;
  signal \dac_data4__72_carry__1_n_2\ : STD_LOGIC;
  signal \dac_data4__72_carry__1_n_3\ : STD_LOGIC;
  signal \dac_data4__72_carry__1_n_4\ : STD_LOGIC;
  signal \dac_data4__72_carry__1_n_5\ : STD_LOGIC;
  signal \dac_data4__72_carry__1_n_6\ : STD_LOGIC;
  signal \dac_data4__72_carry__1_n_7\ : STD_LOGIC;
  signal \dac_data4__72_carry__2_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry__2_n_1\ : STD_LOGIC;
  signal \dac_data4__72_carry__2_n_2\ : STD_LOGIC;
  signal \dac_data4__72_carry__2_n_3\ : STD_LOGIC;
  signal \dac_data4__72_carry__2_n_4\ : STD_LOGIC;
  signal \dac_data4__72_carry__2_n_5\ : STD_LOGIC;
  signal \dac_data4__72_carry__2_n_6\ : STD_LOGIC;
  signal \dac_data4__72_carry__2_n_7\ : STD_LOGIC;
  signal \dac_data4__72_carry__3_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry__3_n_2\ : STD_LOGIC;
  signal \dac_data4__72_carry__3_n_3\ : STD_LOGIC;
  signal \dac_data4__72_carry__3_n_5\ : STD_LOGIC;
  signal \dac_data4__72_carry__3_n_6\ : STD_LOGIC;
  signal \dac_data4__72_carry__3_n_7\ : STD_LOGIC;
  signal \dac_data4__72_carry_i_1_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry_i_2_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry_i_3_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry_n_0\ : STD_LOGIC;
  signal \dac_data4__72_carry_n_1\ : STD_LOGIC;
  signal \dac_data4__72_carry_n_2\ : STD_LOGIC;
  signal \dac_data4__72_carry_n_3\ : STD_LOGIC;
  signal \dac_data4__72_carry_n_4\ : STD_LOGIC;
  signal \dac_data4__72_carry_n_5\ : STD_LOGIC;
  signal \dac_data4__72_carry_n_6\ : STD_LOGIC;
  signal \dac_data4__72_carry_n_7\ : STD_LOGIC;
  signal \dac_data4__8_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__0_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__0_n_1\ : STD_LOGIC;
  signal \dac_data4__8_carry__0_n_2\ : STD_LOGIC;
  signal \dac_data4__8_carry__0_n_3\ : STD_LOGIC;
  signal \dac_data4__8_carry__1_i_10_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__1_i_11_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__1_i_12_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__1_i_13_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__1_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__1_n_1\ : STD_LOGIC;
  signal \dac_data4__8_carry__1_n_2\ : STD_LOGIC;
  signal \dac_data4__8_carry__1_n_3\ : STD_LOGIC;
  signal \dac_data4__8_carry__2_i_11_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__2_i_13_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__2_i_14_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__2_i_15_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__2_i_16_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__2_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__2_n_1\ : STD_LOGIC;
  signal \dac_data4__8_carry__2_n_2\ : STD_LOGIC;
  signal \dac_data4__8_carry__2_n_3\ : STD_LOGIC;
  signal \dac_data4__8_carry__3_i_10_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__3_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__3_n_1\ : STD_LOGIC;
  signal \dac_data4__8_carry__3_n_2\ : STD_LOGIC;
  signal \dac_data4__8_carry__3_n_3\ : STD_LOGIC;
  signal \dac_data4__8_carry__3_n_4\ : STD_LOGIC;
  signal \dac_data4__8_carry__3_n_5\ : STD_LOGIC;
  signal \dac_data4__8_carry__3_n_6\ : STD_LOGIC;
  signal \dac_data4__8_carry__4_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__4_n_1\ : STD_LOGIC;
  signal \dac_data4__8_carry__4_n_2\ : STD_LOGIC;
  signal \dac_data4__8_carry__4_n_3\ : STD_LOGIC;
  signal \dac_data4__8_carry__4_n_4\ : STD_LOGIC;
  signal \dac_data4__8_carry__4_n_5\ : STD_LOGIC;
  signal \dac_data4__8_carry__4_n_6\ : STD_LOGIC;
  signal \dac_data4__8_carry__4_n_7\ : STD_LOGIC;
  signal \dac_data4__8_carry__5_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__5_n_1\ : STD_LOGIC;
  signal \dac_data4__8_carry__5_n_2\ : STD_LOGIC;
  signal \dac_data4__8_carry__5_n_3\ : STD_LOGIC;
  signal \dac_data4__8_carry__5_n_4\ : STD_LOGIC;
  signal \dac_data4__8_carry__5_n_5\ : STD_LOGIC;
  signal \dac_data4__8_carry__5_n_6\ : STD_LOGIC;
  signal \dac_data4__8_carry__5_n_7\ : STD_LOGIC;
  signal \dac_data4__8_carry__6_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry__6_n_1\ : STD_LOGIC;
  signal \dac_data4__8_carry__6_n_2\ : STD_LOGIC;
  signal \dac_data4__8_carry__6_n_3\ : STD_LOGIC;
  signal \dac_data4__8_carry__6_n_4\ : STD_LOGIC;
  signal \dac_data4__8_carry__6_n_5\ : STD_LOGIC;
  signal \dac_data4__8_carry__6_n_6\ : STD_LOGIC;
  signal \dac_data4__8_carry__6_n_7\ : STD_LOGIC;
  signal \dac_data4__8_carry_i_1_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry_i_2_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry_i_3_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry_i_4_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry_i_5_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry_i_7_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry_n_0\ : STD_LOGIC;
  signal \dac_data4__8_carry_n_1\ : STD_LOGIC;
  signal \dac_data4__8_carry_n_2\ : STD_LOGIC;
  signal \dac_data4__8_carry_n_3\ : STD_LOGIC;
  signal dac_data6 : STD_LOGIC_VECTOR ( 16 downto 1 );
  signal \dac_data6__0_carry__0_n_0\ : STD_LOGIC;
  signal \dac_data6__0_carry__0_n_1\ : STD_LOGIC;
  signal \dac_data6__0_carry__0_n_2\ : STD_LOGIC;
  signal \dac_data6__0_carry__0_n_3\ : STD_LOGIC;
  signal \dac_data6__0_carry__0_n_4\ : STD_LOGIC;
  signal \dac_data6__0_carry__0_n_5\ : STD_LOGIC;
  signal \dac_data6__0_carry__0_n_6\ : STD_LOGIC;
  signal \dac_data6__0_carry__0_n_7\ : STD_LOGIC;
  signal \dac_data6__0_carry__1_n_1\ : STD_LOGIC;
  signal \dac_data6__0_carry__1_n_3\ : STD_LOGIC;
  signal \dac_data6__0_carry__1_n_6\ : STD_LOGIC;
  signal \dac_data6__0_carry__1_n_7\ : STD_LOGIC;
  signal \dac_data6__0_carry_n_0\ : STD_LOGIC;
  signal \dac_data6__0_carry_n_1\ : STD_LOGIC;
  signal \dac_data6__0_carry_n_2\ : STD_LOGIC;
  signal \dac_data6__0_carry_n_3\ : STD_LOGIC;
  signal \dac_data6__0_carry_n_4\ : STD_LOGIC;
  signal \dac_data6__0_carry_n_5\ : STD_LOGIC;
  signal \dac_data6__0_carry_n_6\ : STD_LOGIC;
  signal \dac_data6__0_carry_n_7\ : STD_LOGIC;
  signal \dac_data6__30_carry__0_n_0\ : STD_LOGIC;
  signal \dac_data6__30_carry__0_n_1\ : STD_LOGIC;
  signal \dac_data6__30_carry__0_n_2\ : STD_LOGIC;
  signal \dac_data6__30_carry__0_n_3\ : STD_LOGIC;
  signal \dac_data6__30_carry__0_n_4\ : STD_LOGIC;
  signal \dac_data6__30_carry__0_n_5\ : STD_LOGIC;
  signal \dac_data6__30_carry__0_n_6\ : STD_LOGIC;
  signal \dac_data6__30_carry__0_n_7\ : STD_LOGIC;
  signal \dac_data6__30_carry__1_n_1\ : STD_LOGIC;
  signal \dac_data6__30_carry__1_n_3\ : STD_LOGIC;
  signal \dac_data6__30_carry__1_n_6\ : STD_LOGIC;
  signal \dac_data6__30_carry__1_n_7\ : STD_LOGIC;
  signal \dac_data6__30_carry_n_0\ : STD_LOGIC;
  signal \dac_data6__30_carry_n_1\ : STD_LOGIC;
  signal \dac_data6__30_carry_n_2\ : STD_LOGIC;
  signal \dac_data6__30_carry_n_3\ : STD_LOGIC;
  signal \dac_data6__30_carry_n_4\ : STD_LOGIC;
  signal \dac_data6__30_carry_n_5\ : STD_LOGIC;
  signal \dac_data6__30_carry_n_6\ : STD_LOGIC;
  signal \dac_data6__30_carry_n_7\ : STD_LOGIC;
  signal \dac_data6__59_carry__0_n_0\ : STD_LOGIC;
  signal \dac_data6__59_carry__0_n_1\ : STD_LOGIC;
  signal \dac_data6__59_carry__0_n_2\ : STD_LOGIC;
  signal \dac_data6__59_carry__0_n_3\ : STD_LOGIC;
  signal \dac_data6__59_carry__0_n_4\ : STD_LOGIC;
  signal \dac_data6__59_carry__0_n_5\ : STD_LOGIC;
  signal \dac_data6__59_carry__0_n_6\ : STD_LOGIC;
  signal \dac_data6__59_carry__0_n_7\ : STD_LOGIC;
  signal \dac_data6__59_carry__1_n_2\ : STD_LOGIC;
  signal \dac_data6__59_carry__1_n_3\ : STD_LOGIC;
  signal \dac_data6__59_carry__1_n_5\ : STD_LOGIC;
  signal \dac_data6__59_carry__1_n_6\ : STD_LOGIC;
  signal \dac_data6__59_carry__1_n_7\ : STD_LOGIC;
  signal \dac_data6__59_carry_n_0\ : STD_LOGIC;
  signal \dac_data6__59_carry_n_1\ : STD_LOGIC;
  signal \dac_data6__59_carry_n_2\ : STD_LOGIC;
  signal \dac_data6__59_carry_n_3\ : STD_LOGIC;
  signal \dac_data6__59_carry_n_4\ : STD_LOGIC;
  signal \dac_data6__59_carry_n_5\ : STD_LOGIC;
  signal \dac_data6__59_carry_n_6\ : STD_LOGIC;
  signal \dac_data6__59_carry_n_7\ : STD_LOGIC;
  signal \dac_data6__90_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \dac_data6__90_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \dac_data6__90_carry__0_n_0\ : STD_LOGIC;
  signal \dac_data6__90_carry__0_n_1\ : STD_LOGIC;
  signal \dac_data6__90_carry__0_n_2\ : STD_LOGIC;
  signal \dac_data6__90_carry__0_n_3\ : STD_LOGIC;
  signal \dac_data6__90_carry__0_n_4\ : STD_LOGIC;
  signal \dac_data6__90_carry__0_n_5\ : STD_LOGIC;
  signal \dac_data6__90_carry__0_n_6\ : STD_LOGIC;
  signal \dac_data6__90_carry__0_n_7\ : STD_LOGIC;
  signal \dac_data6__90_carry__1_n_0\ : STD_LOGIC;
  signal \dac_data6__90_carry__1_n_1\ : STD_LOGIC;
  signal \dac_data6__90_carry__1_n_2\ : STD_LOGIC;
  signal \dac_data6__90_carry__1_n_3\ : STD_LOGIC;
  signal \dac_data6__90_carry__1_n_4\ : STD_LOGIC;
  signal \dac_data6__90_carry__1_n_5\ : STD_LOGIC;
  signal \dac_data6__90_carry__1_n_6\ : STD_LOGIC;
  signal \dac_data6__90_carry__1_n_7\ : STD_LOGIC;
  signal \dac_data6__90_carry__2_n_3\ : STD_LOGIC;
  signal \dac_data6__90_carry__2_n_6\ : STD_LOGIC;
  signal \dac_data6__90_carry__2_n_7\ : STD_LOGIC;
  signal \dac_data6__90_carry_i_1_n_0\ : STD_LOGIC;
  signal \dac_data6__90_carry_i_2_n_0\ : STD_LOGIC;
  signal \dac_data6__90_carry_i_3_n_0\ : STD_LOGIC;
  signal \dac_data6__90_carry_i_4_n_0\ : STD_LOGIC;
  signal \dac_data6__90_carry_i_5_n_0\ : STD_LOGIC;
  signal \dac_data6__90_carry_i_6_n_0\ : STD_LOGIC;
  signal \dac_data6__90_carry_i_7_n_0\ : STD_LOGIC;
  signal \dac_data6__90_carry_n_0\ : STD_LOGIC;
  signal \dac_data6__90_carry_n_1\ : STD_LOGIC;
  signal \dac_data6__90_carry_n_2\ : STD_LOGIC;
  signal \dac_data6__90_carry_n_3\ : STD_LOGIC;
  signal \dac_data6__90_carry_n_4\ : STD_LOGIC;
  signal \dac_data6__90_carry_n_5\ : STD_LOGIC;
  signal \dac_data6__90_carry_n_6\ : STD_LOGIC;
  signal \dac_data6__90_carry_n_7\ : STD_LOGIC;
  signal \i__carry__0_i_1__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_8_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_2__0_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_3__0_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_6_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_3__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_4__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_5__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_6_n_0\ : STD_LOGIC;
  signal \i__carry_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_8_n_0\ : STD_LOGIC;
  signal \i__carry_i_9_n_0\ : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \phase_acc[0]_i_2_n_0\ : STD_LOGIC;
  signal \phase_acc[0]_i_3_n_0\ : STD_LOGIC;
  signal \phase_acc[0]_i_4_n_0\ : STD_LOGIC;
  signal \phase_acc[0]_i_5_n_0\ : STD_LOGIC;
  signal \phase_acc[12]_i_2_n_0\ : STD_LOGIC;
  signal \phase_acc[12]_i_3_n_0\ : STD_LOGIC;
  signal \phase_acc[12]_i_4_n_0\ : STD_LOGIC;
  signal \phase_acc[12]_i_5_n_0\ : STD_LOGIC;
  signal \phase_acc[16]_i_2_n_0\ : STD_LOGIC;
  signal \phase_acc[16]_i_3_n_0\ : STD_LOGIC;
  signal \phase_acc[16]_i_4_n_0\ : STD_LOGIC;
  signal \phase_acc[16]_i_5_n_0\ : STD_LOGIC;
  signal \phase_acc[20]_i_2_n_0\ : STD_LOGIC;
  signal \phase_acc[20]_i_3_n_0\ : STD_LOGIC;
  signal \phase_acc[20]_i_4_n_0\ : STD_LOGIC;
  signal \phase_acc[20]_i_5_n_0\ : STD_LOGIC;
  signal \phase_acc[24]_i_2_n_0\ : STD_LOGIC;
  signal \phase_acc[24]_i_3_n_0\ : STD_LOGIC;
  signal \phase_acc[24]_i_4_n_0\ : STD_LOGIC;
  signal \phase_acc[24]_i_5_n_0\ : STD_LOGIC;
  signal \phase_acc[28]_i_2_n_0\ : STD_LOGIC;
  signal \phase_acc[28]_i_3_n_0\ : STD_LOGIC;
  signal \phase_acc[28]_i_4_n_0\ : STD_LOGIC;
  signal \phase_acc[28]_i_5_n_0\ : STD_LOGIC;
  signal \phase_acc[4]_i_2_n_0\ : STD_LOGIC;
  signal \phase_acc[4]_i_3_n_0\ : STD_LOGIC;
  signal \phase_acc[4]_i_4_n_0\ : STD_LOGIC;
  signal \phase_acc[4]_i_5_n_0\ : STD_LOGIC;
  signal \phase_acc[8]_i_2_n_0\ : STD_LOGIC;
  signal \phase_acc[8]_i_3_n_0\ : STD_LOGIC;
  signal \phase_acc[8]_i_4_n_0\ : STD_LOGIC;
  signal \phase_acc[8]_i_5_n_0\ : STD_LOGIC;
  signal phase_acc_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \phase_acc_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \phase_acc_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \phase_acc_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \phase_acc_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \phase_acc_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \phase_acc_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \phase_acc_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \phase_acc_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \phase_acc_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \phase_acc_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \phase_acc_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \phase_acc_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \phase_acc_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \phase_acc_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \phase_acc_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \phase_acc_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \phase_acc_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \phase_acc_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \phase_acc_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \phase_acc_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \phase_acc_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \phase_acc_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \phase_acc_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \phase_acc_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \phase_acc_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \phase_acc_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \phase_acc_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \phase_acc_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \phase_acc_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \phase_acc_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \phase_acc_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \phase_acc_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \phase_acc_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \phase_acc_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \phase_acc_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \phase_acc_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \phase_acc_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \phase_acc_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \phase_acc_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \phase_acc_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \phase_acc_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \phase_acc_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \phase_acc_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \phase_acc_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \phase_acc_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \phase_acc_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \phase_acc_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \phase_acc_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \phase_acc_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \phase_acc_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \phase_acc_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \phase_acc_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \phase_acc_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \phase_acc_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \phase_acc_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \phase_acc_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \phase_acc_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \phase_acc_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \phase_acc_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \phase_acc_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \phase_acc_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \phase_acc_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \phase_acc_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \phase_sum_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__0_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__0_n_1\ : STD_LOGIC;
  signal \phase_sum_carry__0_n_2\ : STD_LOGIC;
  signal \phase_sum_carry__0_n_3\ : STD_LOGIC;
  signal \phase_sum_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__1_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__1_n_1\ : STD_LOGIC;
  signal \phase_sum_carry__1_n_2\ : STD_LOGIC;
  signal \phase_sum_carry__1_n_3\ : STD_LOGIC;
  signal \phase_sum_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__2_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__2_n_1\ : STD_LOGIC;
  signal \phase_sum_carry__2_n_2\ : STD_LOGIC;
  signal \phase_sum_carry__2_n_3\ : STD_LOGIC;
  signal \phase_sum_carry__3_i_1_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__3_i_2_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__3_i_3_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__3_i_4_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__3_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__3_n_1\ : STD_LOGIC;
  signal \phase_sum_carry__3_n_2\ : STD_LOGIC;
  signal \phase_sum_carry__3_n_3\ : STD_LOGIC;
  signal \phase_sum_carry__4_i_1_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__4_i_2_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__4_i_3_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__4_i_4_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__4_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__4_n_1\ : STD_LOGIC;
  signal \phase_sum_carry__4_n_2\ : STD_LOGIC;
  signal \phase_sum_carry__4_n_3\ : STD_LOGIC;
  signal \phase_sum_carry__5_i_1_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__5_i_2_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__5_i_3_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__5_i_4_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__5_n_0\ : STD_LOGIC;
  signal \phase_sum_carry__5_n_1\ : STD_LOGIC;
  signal \phase_sum_carry__5_n_2\ : STD_LOGIC;
  signal \phase_sum_carry__5_n_3\ : STD_LOGIC;
  signal \phase_sum_carry__6_n_1\ : STD_LOGIC;
  signal \phase_sum_carry__6_n_2\ : STD_LOGIC;
  signal \phase_sum_carry__6_n_3\ : STD_LOGIC;
  signal phase_sum_carry_i_1_n_0 : STD_LOGIC;
  signal phase_sum_carry_i_2_n_0 : STD_LOGIC;
  signal phase_sum_carry_i_3_n_0 : STD_LOGIC;
  signal phase_sum_carry_i_4_n_0 : STD_LOGIC;
  signal phase_sum_carry_n_0 : STD_LOGIC;
  signal phase_sum_carry_n_1 : STD_LOGIC;
  signal phase_sum_carry_n_2 : STD_LOGIC;
  signal phase_sum_carry_n_3 : STD_LOGIC;
  signal sel : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal sine_rom_inst_n_0 : STD_LOGIC;
  signal sine_rom_inst_n_1 : STD_LOGIC;
  signal sine_rom_inst_n_10 : STD_LOGIC;
  signal sine_rom_inst_n_100 : STD_LOGIC;
  signal sine_rom_inst_n_101 : STD_LOGIC;
  signal sine_rom_inst_n_102 : STD_LOGIC;
  signal sine_rom_inst_n_103 : STD_LOGIC;
  signal sine_rom_inst_n_104 : STD_LOGIC;
  signal sine_rom_inst_n_105 : STD_LOGIC;
  signal sine_rom_inst_n_106 : STD_LOGIC;
  signal sine_rom_inst_n_107 : STD_LOGIC;
  signal sine_rom_inst_n_108 : STD_LOGIC;
  signal sine_rom_inst_n_109 : STD_LOGIC;
  signal sine_rom_inst_n_11 : STD_LOGIC;
  signal sine_rom_inst_n_110 : STD_LOGIC;
  signal sine_rom_inst_n_111 : STD_LOGIC;
  signal sine_rom_inst_n_112 : STD_LOGIC;
  signal sine_rom_inst_n_113 : STD_LOGIC;
  signal sine_rom_inst_n_12 : STD_LOGIC;
  signal sine_rom_inst_n_122 : STD_LOGIC;
  signal sine_rom_inst_n_123 : STD_LOGIC;
  signal sine_rom_inst_n_124 : STD_LOGIC;
  signal sine_rom_inst_n_125 : STD_LOGIC;
  signal sine_rom_inst_n_126 : STD_LOGIC;
  signal sine_rom_inst_n_127 : STD_LOGIC;
  signal sine_rom_inst_n_128 : STD_LOGIC;
  signal sine_rom_inst_n_129 : STD_LOGIC;
  signal sine_rom_inst_n_13 : STD_LOGIC;
  signal sine_rom_inst_n_130 : STD_LOGIC;
  signal sine_rom_inst_n_131 : STD_LOGIC;
  signal sine_rom_inst_n_132 : STD_LOGIC;
  signal sine_rom_inst_n_133 : STD_LOGIC;
  signal sine_rom_inst_n_134 : STD_LOGIC;
  signal sine_rom_inst_n_14 : STD_LOGIC;
  signal sine_rom_inst_n_149 : STD_LOGIC;
  signal sine_rom_inst_n_15 : STD_LOGIC;
  signal sine_rom_inst_n_150 : STD_LOGIC;
  signal sine_rom_inst_n_151 : STD_LOGIC;
  signal sine_rom_inst_n_152 : STD_LOGIC;
  signal sine_rom_inst_n_153 : STD_LOGIC;
  signal sine_rom_inst_n_154 : STD_LOGIC;
  signal sine_rom_inst_n_155 : STD_LOGIC;
  signal sine_rom_inst_n_156 : STD_LOGIC;
  signal sine_rom_inst_n_157 : STD_LOGIC;
  signal sine_rom_inst_n_158 : STD_LOGIC;
  signal sine_rom_inst_n_159 : STD_LOGIC;
  signal sine_rom_inst_n_16 : STD_LOGIC;
  signal sine_rom_inst_n_160 : STD_LOGIC;
  signal sine_rom_inst_n_161 : STD_LOGIC;
  signal sine_rom_inst_n_162 : STD_LOGIC;
  signal sine_rom_inst_n_163 : STD_LOGIC;
  signal sine_rom_inst_n_164 : STD_LOGIC;
  signal sine_rom_inst_n_165 : STD_LOGIC;
  signal sine_rom_inst_n_166 : STD_LOGIC;
  signal sine_rom_inst_n_167 : STD_LOGIC;
  signal sine_rom_inst_n_168 : STD_LOGIC;
  signal sine_rom_inst_n_169 : STD_LOGIC;
  signal sine_rom_inst_n_17 : STD_LOGIC;
  signal sine_rom_inst_n_170 : STD_LOGIC;
  signal sine_rom_inst_n_171 : STD_LOGIC;
  signal sine_rom_inst_n_172 : STD_LOGIC;
  signal sine_rom_inst_n_173 : STD_LOGIC;
  signal sine_rom_inst_n_174 : STD_LOGIC;
  signal sine_rom_inst_n_175 : STD_LOGIC;
  signal sine_rom_inst_n_176 : STD_LOGIC;
  signal sine_rom_inst_n_177 : STD_LOGIC;
  signal sine_rom_inst_n_178 : STD_LOGIC;
  signal sine_rom_inst_n_179 : STD_LOGIC;
  signal sine_rom_inst_n_18 : STD_LOGIC;
  signal sine_rom_inst_n_180 : STD_LOGIC;
  signal sine_rom_inst_n_181 : STD_LOGIC;
  signal sine_rom_inst_n_184 : STD_LOGIC;
  signal sine_rom_inst_n_185 : STD_LOGIC;
  signal sine_rom_inst_n_186 : STD_LOGIC;
  signal sine_rom_inst_n_187 : STD_LOGIC;
  signal sine_rom_inst_n_188 : STD_LOGIC;
  signal sine_rom_inst_n_189 : STD_LOGIC;
  signal sine_rom_inst_n_19 : STD_LOGIC;
  signal sine_rom_inst_n_190 : STD_LOGIC;
  signal sine_rom_inst_n_191 : STD_LOGIC;
  signal sine_rom_inst_n_192 : STD_LOGIC;
  signal sine_rom_inst_n_193 : STD_LOGIC;
  signal sine_rom_inst_n_194 : STD_LOGIC;
  signal sine_rom_inst_n_195 : STD_LOGIC;
  signal sine_rom_inst_n_196 : STD_LOGIC;
  signal sine_rom_inst_n_197 : STD_LOGIC;
  signal sine_rom_inst_n_198 : STD_LOGIC;
  signal sine_rom_inst_n_199 : STD_LOGIC;
  signal sine_rom_inst_n_2 : STD_LOGIC;
  signal sine_rom_inst_n_20 : STD_LOGIC;
  signal sine_rom_inst_n_200 : STD_LOGIC;
  signal sine_rom_inst_n_201 : STD_LOGIC;
  signal sine_rom_inst_n_202 : STD_LOGIC;
  signal sine_rom_inst_n_203 : STD_LOGIC;
  signal sine_rom_inst_n_204 : STD_LOGIC;
  signal sine_rom_inst_n_205 : STD_LOGIC;
  signal sine_rom_inst_n_206 : STD_LOGIC;
  signal sine_rom_inst_n_207 : STD_LOGIC;
  signal sine_rom_inst_n_208 : STD_LOGIC;
  signal sine_rom_inst_n_209 : STD_LOGIC;
  signal sine_rom_inst_n_21 : STD_LOGIC;
  signal sine_rom_inst_n_210 : STD_LOGIC;
  signal sine_rom_inst_n_211 : STD_LOGIC;
  signal sine_rom_inst_n_212 : STD_LOGIC;
  signal sine_rom_inst_n_213 : STD_LOGIC;
  signal sine_rom_inst_n_214 : STD_LOGIC;
  signal sine_rom_inst_n_215 : STD_LOGIC;
  signal sine_rom_inst_n_216 : STD_LOGIC;
  signal sine_rom_inst_n_217 : STD_LOGIC;
  signal sine_rom_inst_n_218 : STD_LOGIC;
  signal sine_rom_inst_n_219 : STD_LOGIC;
  signal sine_rom_inst_n_22 : STD_LOGIC;
  signal sine_rom_inst_n_220 : STD_LOGIC;
  signal sine_rom_inst_n_221 : STD_LOGIC;
  signal sine_rom_inst_n_222 : STD_LOGIC;
  signal sine_rom_inst_n_223 : STD_LOGIC;
  signal sine_rom_inst_n_224 : STD_LOGIC;
  signal sine_rom_inst_n_225 : STD_LOGIC;
  signal sine_rom_inst_n_226 : STD_LOGIC;
  signal sine_rom_inst_n_227 : STD_LOGIC;
  signal sine_rom_inst_n_228 : STD_LOGIC;
  signal sine_rom_inst_n_229 : STD_LOGIC;
  signal sine_rom_inst_n_23 : STD_LOGIC;
  signal sine_rom_inst_n_230 : STD_LOGIC;
  signal sine_rom_inst_n_231 : STD_LOGIC;
  signal sine_rom_inst_n_232 : STD_LOGIC;
  signal sine_rom_inst_n_233 : STD_LOGIC;
  signal sine_rom_inst_n_234 : STD_LOGIC;
  signal sine_rom_inst_n_235 : STD_LOGIC;
  signal sine_rom_inst_n_236 : STD_LOGIC;
  signal sine_rom_inst_n_237 : STD_LOGIC;
  signal sine_rom_inst_n_238 : STD_LOGIC;
  signal sine_rom_inst_n_239 : STD_LOGIC;
  signal sine_rom_inst_n_24 : STD_LOGIC;
  signal sine_rom_inst_n_240 : STD_LOGIC;
  signal sine_rom_inst_n_241 : STD_LOGIC;
  signal sine_rom_inst_n_242 : STD_LOGIC;
  signal sine_rom_inst_n_243 : STD_LOGIC;
  signal sine_rom_inst_n_244 : STD_LOGIC;
  signal sine_rom_inst_n_245 : STD_LOGIC;
  signal sine_rom_inst_n_246 : STD_LOGIC;
  signal sine_rom_inst_n_247 : STD_LOGIC;
  signal sine_rom_inst_n_248 : STD_LOGIC;
  signal sine_rom_inst_n_249 : STD_LOGIC;
  signal sine_rom_inst_n_25 : STD_LOGIC;
  signal sine_rom_inst_n_250 : STD_LOGIC;
  signal sine_rom_inst_n_251 : STD_LOGIC;
  signal sine_rom_inst_n_252 : STD_LOGIC;
  signal sine_rom_inst_n_253 : STD_LOGIC;
  signal sine_rom_inst_n_254 : STD_LOGIC;
  signal sine_rom_inst_n_255 : STD_LOGIC;
  signal sine_rom_inst_n_256 : STD_LOGIC;
  signal sine_rom_inst_n_257 : STD_LOGIC;
  signal sine_rom_inst_n_258 : STD_LOGIC;
  signal sine_rom_inst_n_259 : STD_LOGIC;
  signal sine_rom_inst_n_26 : STD_LOGIC;
  signal sine_rom_inst_n_260 : STD_LOGIC;
  signal sine_rom_inst_n_261 : STD_LOGIC;
  signal sine_rom_inst_n_262 : STD_LOGIC;
  signal sine_rom_inst_n_263 : STD_LOGIC;
  signal sine_rom_inst_n_264 : STD_LOGIC;
  signal sine_rom_inst_n_265 : STD_LOGIC;
  signal sine_rom_inst_n_266 : STD_LOGIC;
  signal sine_rom_inst_n_267 : STD_LOGIC;
  signal sine_rom_inst_n_268 : STD_LOGIC;
  signal sine_rom_inst_n_269 : STD_LOGIC;
  signal sine_rom_inst_n_27 : STD_LOGIC;
  signal sine_rom_inst_n_270 : STD_LOGIC;
  signal sine_rom_inst_n_271 : STD_LOGIC;
  signal sine_rom_inst_n_272 : STD_LOGIC;
  signal sine_rom_inst_n_273 : STD_LOGIC;
  signal sine_rom_inst_n_28 : STD_LOGIC;
  signal sine_rom_inst_n_29 : STD_LOGIC;
  signal sine_rom_inst_n_3 : STD_LOGIC;
  signal sine_rom_inst_n_30 : STD_LOGIC;
  signal sine_rom_inst_n_31 : STD_LOGIC;
  signal sine_rom_inst_n_32 : STD_LOGIC;
  signal sine_rom_inst_n_33 : STD_LOGIC;
  signal sine_rom_inst_n_34 : STD_LOGIC;
  signal sine_rom_inst_n_35 : STD_LOGIC;
  signal sine_rom_inst_n_36 : STD_LOGIC;
  signal sine_rom_inst_n_37 : STD_LOGIC;
  signal sine_rom_inst_n_38 : STD_LOGIC;
  signal sine_rom_inst_n_39 : STD_LOGIC;
  signal sine_rom_inst_n_4 : STD_LOGIC;
  signal sine_rom_inst_n_40 : STD_LOGIC;
  signal sine_rom_inst_n_41 : STD_LOGIC;
  signal sine_rom_inst_n_42 : STD_LOGIC;
  signal sine_rom_inst_n_43 : STD_LOGIC;
  signal sine_rom_inst_n_44 : STD_LOGIC;
  signal sine_rom_inst_n_45 : STD_LOGIC;
  signal sine_rom_inst_n_46 : STD_LOGIC;
  signal sine_rom_inst_n_47 : STD_LOGIC;
  signal sine_rom_inst_n_48 : STD_LOGIC;
  signal sine_rom_inst_n_49 : STD_LOGIC;
  signal sine_rom_inst_n_5 : STD_LOGIC;
  signal sine_rom_inst_n_50 : STD_LOGIC;
  signal sine_rom_inst_n_51 : STD_LOGIC;
  signal sine_rom_inst_n_52 : STD_LOGIC;
  signal sine_rom_inst_n_53 : STD_LOGIC;
  signal sine_rom_inst_n_54 : STD_LOGIC;
  signal sine_rom_inst_n_55 : STD_LOGIC;
  signal sine_rom_inst_n_56 : STD_LOGIC;
  signal sine_rom_inst_n_57 : STD_LOGIC;
  signal sine_rom_inst_n_58 : STD_LOGIC;
  signal sine_rom_inst_n_59 : STD_LOGIC;
  signal sine_rom_inst_n_6 : STD_LOGIC;
  signal sine_rom_inst_n_60 : STD_LOGIC;
  signal sine_rom_inst_n_61 : STD_LOGIC;
  signal sine_rom_inst_n_62 : STD_LOGIC;
  signal sine_rom_inst_n_63 : STD_LOGIC;
  signal sine_rom_inst_n_64 : STD_LOGIC;
  signal sine_rom_inst_n_65 : STD_LOGIC;
  signal sine_rom_inst_n_66 : STD_LOGIC;
  signal sine_rom_inst_n_67 : STD_LOGIC;
  signal sine_rom_inst_n_68 : STD_LOGIC;
  signal sine_rom_inst_n_69 : STD_LOGIC;
  signal sine_rom_inst_n_7 : STD_LOGIC;
  signal sine_rom_inst_n_70 : STD_LOGIC;
  signal sine_rom_inst_n_71 : STD_LOGIC;
  signal sine_rom_inst_n_72 : STD_LOGIC;
  signal sine_rom_inst_n_73 : STD_LOGIC;
  signal sine_rom_inst_n_74 : STD_LOGIC;
  signal sine_rom_inst_n_75 : STD_LOGIC;
  signal sine_rom_inst_n_76 : STD_LOGIC;
  signal sine_rom_inst_n_77 : STD_LOGIC;
  signal sine_rom_inst_n_78 : STD_LOGIC;
  signal sine_rom_inst_n_79 : STD_LOGIC;
  signal sine_rom_inst_n_8 : STD_LOGIC;
  signal sine_rom_inst_n_80 : STD_LOGIC;
  signal sine_rom_inst_n_81 : STD_LOGIC;
  signal sine_rom_inst_n_82 : STD_LOGIC;
  signal sine_rom_inst_n_83 : STD_LOGIC;
  signal sine_rom_inst_n_84 : STD_LOGIC;
  signal sine_rom_inst_n_85 : STD_LOGIC;
  signal sine_rom_inst_n_86 : STD_LOGIC;
  signal sine_rom_inst_n_87 : STD_LOGIC;
  signal sine_rom_inst_n_88 : STD_LOGIC;
  signal sine_rom_inst_n_89 : STD_LOGIC;
  signal sine_rom_inst_n_9 : STD_LOGIC;
  signal sine_rom_inst_n_90 : STD_LOGIC;
  signal sine_rom_inst_n_91 : STD_LOGIC;
  signal sine_rom_inst_n_92 : STD_LOGIC;
  signal sine_rom_inst_n_93 : STD_LOGIC;
  signal sine_rom_inst_n_94 : STD_LOGIC;
  signal sine_rom_inst_n_95 : STD_LOGIC;
  signal sine_rom_inst_n_96 : STD_LOGIC;
  signal sine_rom_inst_n_97 : STD_LOGIC;
  signal sine_rom_inst_n_98 : STD_LOGIC;
  signal sine_rom_inst_n_99 : STD_LOGIC;
  signal \NLW_dac_data1_inferred__0/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data1_inferred__0/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data1_inferred__0/i__carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_dac_data1_inferred__0/i__carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data2_carry__5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_dac_data2_carry__5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_dac_data4__114_carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_dac_data4__114_carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \NLW_dac_data4__114_carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_dac_data4__171_carry__5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_dac_data4__254_carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__254_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__254_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__254_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__254_carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__254_carry__4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__254_carry__5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__254_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_dac_data4__254_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__72_carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \NLW_dac_data4__72_carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_dac_data4__8_carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__8_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__8_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__8_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_dac_data4__8_carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_dac_data6__0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_dac_data6__0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_dac_data6__30_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_dac_data6__30_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_dac_data6__59_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_dac_data6__59_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_dac_data6__90_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_dac_data6__90_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_phase_acc_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_phase_sum_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_phase_sum_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_phase_sum_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_phase_sum_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_phase_sum_carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_phase_sum_carry__4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_phase_sum_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of \dac_data1_inferred__0/i__carry\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \dac_data1_inferred__0/i__carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \dac_data1_inferred__0/i__carry__1\ : label is 11;
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of dac_data2_carry : label is 35;
  attribute ADDER_THRESHOLD of \dac_data2_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data2_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data2_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data2_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data2_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data2_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data4__171_carry\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data4__171_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data4__171_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data4__171_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data4__171_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data4__171_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data4__171_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data4__254_carry\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data4__254_carry__0\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \dac_data4__254_carry__0_i_10\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \dac_data4__254_carry__0_i_11\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \dac_data4__254_carry__0_i_9\ : label is "soft_lutpair14";
  attribute ADDER_THRESHOLD of \dac_data4__254_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data4__254_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data4__254_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data4__254_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data4__254_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data4__254_carry__6\ : label is 35;
  attribute SOFT_HLUTNM of \dac_data4__254_carry_i_8\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \dac_data4__254_carry_i_9\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__1_i_10\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__1_i_11\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__1_i_13\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__2_i_11\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__2_i_13\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__2_i_14\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__2_i_15\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__2_i_16\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \dac_data4__8_carry__3_i_10\ : label is "soft_lutpair14";
  attribute ADDER_THRESHOLD of \dac_data6__90_carry\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data6__90_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data6__90_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \dac_data6__90_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \phase_acc_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \phase_acc_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \phase_acc_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \phase_acc_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \phase_acc_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \phase_acc_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \phase_acc_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \phase_acc_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of phase_sum_carry : label is 35;
  attribute ADDER_THRESHOLD of \phase_sum_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \phase_sum_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \phase_sum_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \phase_sum_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \phase_sum_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \phase_sum_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \phase_sum_carry__6\ : label is 35;
begin
  SS(0) <= \^ss\(0);
\_inferred__1/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__1/i__carry_n_0\,
      CO(2) => \_inferred__1/i__carry_n_1\,
      CO(1) => \_inferred__1/i__carry_n_2\,
      CO(0) => \_inferred__1/i__carry_n_3\,
      CYINIT => p_0_out(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => dac_data6(4 downto 1),
      S(3 downto 0) => p_0_out(4 downto 1)
    );
\_inferred__1/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__1/i__carry_n_0\,
      CO(3) => \_inferred__1/i__carry__0_n_0\,
      CO(2) => \_inferred__1/i__carry__0_n_1\,
      CO(1) => \_inferred__1/i__carry__0_n_2\,
      CO(0) => \_inferred__1/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => dac_data6(8 downto 5),
      S(3 downto 0) => p_0_out(8 downto 5)
    );
\_inferred__1/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__1/i__carry__0_n_0\,
      CO(3) => \_inferred__1/i__carry__1_n_0\,
      CO(2) => \_inferred__1/i__carry__1_n_1\,
      CO(1) => \_inferred__1/i__carry__1_n_2\,
      CO(0) => \_inferred__1/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => dac_data6(12 downto 9),
      S(3 downto 0) => p_0_out(12 downto 9)
    );
\_inferred__1/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__1/i__carry__1_n_0\,
      CO(3) => \_inferred__1/i__carry__2_n_0\,
      CO(2) => \_inferred__1/i__carry__2_n_1\,
      CO(1) => \_inferred__1/i__carry__2_n_2\,
      CO(0) => \_inferred__1/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1000",
      O(3 downto 0) => dac_data6(16 downto 13),
      S(3 downto 0) => p_0_out(16 downto 13)
    );
\_inferred__2/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__2/i__carry_n_0\,
      CO(2) => \_inferred__2/i__carry_n_1\,
      CO(1) => \_inferred__2/i__carry_n_2\,
      CO(0) => \_inferred__2/i__carry_n_3\,
      CYINIT => sine_rom_inst_n_122,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => dac_data4(4 downto 1),
      S(3) => sine_rom_inst_n_123,
      S(2) => sine_rom_inst_n_124,
      S(1) => sine_rom_inst_n_125,
      S(0) => sine_rom_inst_n_126
    );
\_inferred__2/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__2/i__carry_n_0\,
      CO(3) => \_inferred__2/i__carry__0_n_0\,
      CO(2) => \_inferred__2/i__carry__0_n_1\,
      CO(1) => \_inferred__2/i__carry__0_n_2\,
      CO(0) => \_inferred__2/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => dac_data4(8 downto 5),
      S(3) => sine_rom_inst_n_127,
      S(2) => sine_rom_inst_n_128,
      S(1) => sine_rom_inst_n_129,
      S(0) => sine_rom_inst_n_130
    );
\_inferred__2/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__2/i__carry__0_n_0\,
      CO(3) => \_inferred__2/i__carry__1_n_0\,
      CO(2) => \_inferred__2/i__carry__1_n_1\,
      CO(1) => \_inferred__2/i__carry__1_n_2\,
      CO(0) => \_inferred__2/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => dac_data4(12 downto 9),
      S(3) => sine_rom_inst_n_149,
      S(2) => sine_rom_inst_n_150,
      S(1) => sine_rom_inst_n_151,
      S(0) => sine_rom_inst_n_152
    );
\_inferred__2/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__2/i__carry__1_n_0\,
      CO(3) => \_inferred__2/i__carry__2_n_0\,
      CO(2) => \_inferred__2/i__carry__2_n_1\,
      CO(1) => \_inferred__2/i__carry__2_n_2\,
      CO(0) => \_inferred__2/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => dac_data4(16 downto 13),
      S(3) => sine_rom_inst_n_131,
      S(2) => sine_rom_inst_n_132,
      S(1) => sine_rom_inst_n_133,
      S(0) => sine_rom_inst_n_134
    );
\dac_data1_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \dac_data1_inferred__0/i__carry_n_0\,
      CO(2) => \dac_data1_inferred__0/i__carry_n_1\,
      CO(1) => \dac_data1_inferred__0/i__carry_n_2\,
      CO(0) => \dac_data1_inferred__0/i__carry_n_3\,
      CYINIT => \i__carry_i_1__1_n_0\,
      DI(3) => \i__carry_i_2__0_n_0\,
      DI(2) => \i__carry_i_3__0_n_0\,
      DI(1) => \i__carry_i_4__0_n_0\,
      DI(0) => \i__carry_i_5__0_n_0\,
      O(3 downto 0) => \NLW_dac_data1_inferred__0/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry_i_6_n_0\,
      S(2) => \i__carry_i_7_n_0\,
      S(1) => \i__carry_i_8_n_0\,
      S(0) => \i__carry_i_9_n_0\
    );
\dac_data1_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data1_inferred__0/i__carry_n_0\,
      CO(3) => \dac_data1_inferred__0/i__carry__0_n_0\,
      CO(2) => \dac_data1_inferred__0/i__carry__0_n_1\,
      CO(1) => \dac_data1_inferred__0/i__carry__0_n_2\,
      CO(0) => \dac_data1_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry__0_i_1__0_n_0\,
      DI(2) => \i__carry__0_i_2__0_n_0\,
      DI(1) => \i__carry__0_i_3__0_n_0\,
      DI(0) => \i__carry__0_i_4__0_n_0\,
      O(3 downto 0) => \NLW_dac_data1_inferred__0/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry__0_i_5_n_0\,
      S(2) => \i__carry__0_i_6_n_0\,
      S(1) => \i__carry__0_i_7_n_0\,
      S(0) => \i__carry__0_i_8_n_0\
    );
\dac_data1_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data1_inferred__0/i__carry__0_n_0\,
      CO(3) => \NLW_dac_data1_inferred__0/i__carry__1_CO_UNCONNECTED\(3),
      CO(2) => dac_data1,
      CO(1) => \dac_data1_inferred__0/i__carry__1_n_2\,
      CO(0) => \dac_data1_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => sine_rom_inst_n_180,
      DI(1) => \i__carry__1_i_2__0_n_0\,
      DI(0) => \i__carry__1_i_3__0_n_0\,
      O(3 downto 0) => \NLW_dac_data1_inferred__0/i__carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => sine_rom_inst_n_181,
      S(1) => \i__carry__1_i_5_n_0\,
      S(0) => \i__carry__1_i_6_n_0\
    );
dac_data2_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => dac_data2_carry_n_0,
      CO(2) => dac_data2_carry_n_1,
      CO(1) => dac_data2_carry_n_2,
      CO(0) => dac_data2_carry_n_3,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => dac_data3(7),
      DI(0) => '0',
      O(3) => dac_data2_carry_n_4,
      O(2) => dac_data2_carry_n_5,
      O(1) => dac_data2_carry_n_6,
      O(0) => dac_data2_carry_n_7,
      S(3 downto 2) => dac_data3(9 downto 8),
      S(1) => sine_rom_inst_n_153,
      S(0) => dac_data3(6)
    );
\dac_data2_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => dac_data2_carry_n_0,
      CO(3) => \dac_data2_carry__0_n_0\,
      CO(2) => \dac_data2_carry__0_n_1\,
      CO(1) => \dac_data2_carry__0_n_2\,
      CO(0) => \dac_data2_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \dac_data2_carry__0_n_4\,
      O(2) => \dac_data2_carry__0_n_5\,
      O(1) => \dac_data2_carry__0_n_6\,
      O(0) => \dac_data2_carry__0_n_7\,
      S(3 downto 0) => dac_data3(13 downto 10)
    );
\dac_data2_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data2_carry__0_n_0\,
      CO(3) => \dac_data2_carry__1_n_0\,
      CO(2) => \dac_data2_carry__1_n_1\,
      CO(1) => \dac_data2_carry__1_n_2\,
      CO(0) => \dac_data2_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \dac_data2_carry__1_n_4\,
      O(2) => \dac_data2_carry__1_n_5\,
      O(1) => \dac_data2_carry__1_n_6\,
      O(0) => \dac_data2_carry__1_n_7\,
      S(3) => sine_rom_inst_n_202,
      S(2 downto 0) => dac_data3(16 downto 14)
    );
\dac_data2_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data2_carry__1_n_0\,
      CO(3) => \dac_data2_carry__2_n_0\,
      CO(2) => \dac_data2_carry__2_n_1\,
      CO(1) => \dac_data2_carry__2_n_2\,
      CO(0) => \dac_data2_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \dac_data2_carry__2_n_4\,
      O(2) => \dac_data2_carry__2_n_5\,
      O(1) => \dac_data2_carry__2_n_6\,
      O(0) => \dac_data2_carry__2_n_7\,
      S(3) => sine_rom_inst_n_203,
      S(2) => sine_rom_inst_n_204,
      S(1) => sine_rom_inst_n_205,
      S(0) => sine_rom_inst_n_206
    );
\dac_data2_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data2_carry__2_n_0\,
      CO(3) => \dac_data2_carry__3_n_0\,
      CO(2) => \dac_data2_carry__3_n_1\,
      CO(1) => \dac_data2_carry__3_n_2\,
      CO(0) => \dac_data2_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \dac_data2_carry__3_n_4\,
      O(2) => \dac_data2_carry__3_n_5\,
      O(1) => \dac_data2_carry__3_n_6\,
      O(0) => \dac_data2_carry__3_n_7\,
      S(3) => sine_rom_inst_n_207,
      S(2) => sine_rom_inst_n_208,
      S(1) => dac_data3(23),
      S(0) => dac_data3(17)
    );
\dac_data2_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data2_carry__3_n_0\,
      CO(3) => \dac_data2_carry__4_n_0\,
      CO(2) => \dac_data2_carry__4_n_1\,
      CO(1) => \dac_data2_carry__4_n_2\,
      CO(0) => \dac_data2_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \dac_data2_carry__4_n_4\,
      O(2) => \dac_data2_carry__4_n_5\,
      O(1) => \dac_data2_carry__4_n_6\,
      O(0) => \dac_data2_carry__4_n_7\,
      S(3) => sine_rom_inst_n_209,
      S(2) => sine_rom_inst_n_210,
      S(1) => sine_rom_inst_n_211,
      S(0) => sine_rom_inst_n_212
    );
\dac_data2_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data2_carry__4_n_0\,
      CO(3 downto 1) => \NLW_dac_data2_carry__5_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \dac_data2_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_dac_data2_carry__5_O_UNCONNECTED\(3 downto 2),
      O(1) => \dac_data2_carry__5_n_6\,
      O(0) => \dac_data2_carry__5_n_7\,
      S(3 downto 2) => B"00",
      S(1) => dac_data3(24),
      S(0) => sine_rom_inst_n_213
    );
\dac_data4__114_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \dac_data4__114_carry_n_0\,
      CO(2) => \dac_data4__114_carry_n_1\,
      CO(1) => \dac_data4__114_carry_n_2\,
      CO(0) => \dac_data4__114_carry_n_3\,
      CYINIT => '0',
      DI(3) => \dac_data4__8_carry__3_n_6\,
      DI(2 downto 0) => B"001",
      O(3) => \dac_data4__114_carry_n_4\,
      O(2) => \dac_data4__114_carry_n_5\,
      O(1) => \dac_data4__114_carry_n_6\,
      O(0) => \NLW_dac_data4__114_carry_O_UNCONNECTED\(0),
      S(3) => \dac_data4__114_carry_i_1_n_0\,
      S(2) => \dac_data4__114_carry_i_2_n_0\,
      S(1) => \dac_data4__114_carry_i_3_n_0\,
      S(0) => \dac_data4__8_carry__3_n_6\
    );
\dac_data4__114_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__114_carry_n_0\,
      CO(3) => \dac_data4__114_carry__0_n_0\,
      CO(2) => \dac_data4__114_carry__0_n_1\,
      CO(1) => \dac_data4__114_carry__0_n_2\,
      CO(0) => \dac_data4__114_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \dac_data4__8_carry__4_n_6\,
      DI(2) => \dac_data4__8_carry__4_n_7\,
      DI(1) => \dac_data4__8_carry__3_n_4\,
      DI(0) => \dac_data4__8_carry__3_n_5\,
      O(3) => \dac_data4__114_carry__0_n_4\,
      O(2) => \dac_data4__114_carry__0_n_5\,
      O(1) => \dac_data4__114_carry__0_n_6\,
      O(0) => \dac_data4__114_carry__0_n_7\,
      S(3) => \dac_data4__114_carry__0_i_1_n_0\,
      S(2) => \dac_data4__114_carry__0_i_2_n_0\,
      S(1) => \dac_data4__114_carry__0_i_3_n_0\,
      S(0) => \dac_data4__114_carry__0_i_4_n_0\
    );
\dac_data4__114_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__4_n_6\,
      I1 => \dac_data4__8_carry__5_n_7\,
      O => \dac_data4__114_carry__0_i_1_n_0\
    );
\dac_data4__114_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__4_n_7\,
      I1 => \dac_data4__8_carry__4_n_4\,
      O => \dac_data4__114_carry__0_i_2_n_0\
    );
\dac_data4__114_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__3_n_4\,
      I1 => \dac_data4__8_carry__4_n_5\,
      O => \dac_data4__114_carry__0_i_3_n_0\
    );
\dac_data4__114_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__3_n_5\,
      I1 => \dac_data4__8_carry__4_n_6\,
      O => \dac_data4__114_carry__0_i_4_n_0\
    );
\dac_data4__114_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__114_carry__0_n_0\,
      CO(3) => \dac_data4__114_carry__1_n_0\,
      CO(2) => \dac_data4__114_carry__1_n_1\,
      CO(1) => \dac_data4__114_carry__1_n_2\,
      CO(0) => \dac_data4__114_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \dac_data4__8_carry__5_n_6\,
      DI(2) => \dac_data4__8_carry__5_n_7\,
      DI(1) => \dac_data4__8_carry__4_n_4\,
      DI(0) => \dac_data4__8_carry__4_n_5\,
      O(3) => \dac_data4__114_carry__1_n_4\,
      O(2) => \dac_data4__114_carry__1_n_5\,
      O(1) => \dac_data4__114_carry__1_n_6\,
      O(0) => \dac_data4__114_carry__1_n_7\,
      S(3) => sine_rom_inst_n_17,
      S(2) => \dac_data4__114_carry__1_i_2_n_0\,
      S(1) => \dac_data4__114_carry__1_i_3_n_0\,
      S(0) => \dac_data4__114_carry__1_i_4_n_0\
    );
\dac_data4__114_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__5_n_7\,
      I1 => \dac_data4__8_carry__5_n_4\,
      O => \dac_data4__114_carry__1_i_2_n_0\
    );
\dac_data4__114_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__4_n_4\,
      I1 => \dac_data4__8_carry__5_n_5\,
      O => \dac_data4__114_carry__1_i_3_n_0\
    );
\dac_data4__114_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__4_n_5\,
      I1 => \dac_data4__8_carry__5_n_6\,
      O => \dac_data4__114_carry__1_i_4_n_0\
    );
\dac_data4__114_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__114_carry__1_n_0\,
      CO(3) => \dac_data4__114_carry__2_n_0\,
      CO(2) => \dac_data4__114_carry__2_n_1\,
      CO(1) => \dac_data4__114_carry__2_n_2\,
      CO(0) => \dac_data4__114_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \dac_data4__8_carry__6_n_6\,
      DI(2) => \dac_data4__8_carry__6_n_7\,
      DI(1) => \dac_data4__8_carry__5_n_4\,
      DI(0) => \dac_data4__8_carry__5_n_5\,
      O(3) => \dac_data4__114_carry__2_n_4\,
      O(2) => \dac_data4__114_carry__2_n_5\,
      O(1) => \dac_data4__114_carry__2_n_6\,
      O(0) => \dac_data4__114_carry__2_n_7\,
      S(3) => sine_rom_inst_n_18,
      S(2) => sine_rom_inst_n_19,
      S(1) => sine_rom_inst_n_20,
      S(0) => sine_rom_inst_n_21
    );
\dac_data4__114_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__114_carry__2_n_0\,
      CO(3) => \dac_data4__114_carry__3_n_0\,
      CO(2) => \NLW_dac_data4__114_carry__3_CO_UNCONNECTED\(2),
      CO(1) => \dac_data4__114_carry__3_n_2\,
      CO(0) => \dac_data4__114_carry__3_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => sine_rom_inst_n_22,
      DI(1) => \dac_data4__8_carry__6_n_4\,
      DI(0) => \dac_data4__8_carry__6_n_5\,
      O(3) => \NLW_dac_data4__114_carry__3_O_UNCONNECTED\(3),
      O(2) => \dac_data4__114_carry__3_n_5\,
      O(1) => \dac_data4__114_carry__3_n_6\,
      O(0) => \dac_data4__114_carry__3_n_7\,
      S(3) => '1',
      S(2) => sine_rom_inst_n_170,
      S(1) => sine_rom_inst_n_171,
      S(0) => sine_rom_inst_n_172
    );
\dac_data4__114_carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__3_n_6\,
      I1 => \dac_data4__8_carry__4_n_7\,
      O => \dac_data4__114_carry_i_1_n_0\
    );
\dac_data4__114_carry_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data4__8_carry__3_n_4\,
      O => \dac_data4__114_carry_i_2_n_0\
    );
\dac_data4__114_carry_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data4__8_carry__3_n_5\,
      O => \dac_data4__114_carry_i_3_n_0\
    );
\dac_data4__171_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \dac_data4__171_carry_n_0\,
      CO(2) => \dac_data4__171_carry_n_1\,
      CO(1) => \dac_data4__171_carry_n_2\,
      CO(0) => \dac_data4__171_carry_n_3\,
      CYINIT => '0',
      DI(3) => \dac_data4__171_carry_i_1_n_0\,
      DI(2) => \dac_data4__72_carry__0_n_6\,
      DI(1) => \dac_data4__72_carry__0_n_7\,
      DI(0) => \dac_data4__72_carry_n_4\,
      O(3) => \dac_data4__171_carry_n_4\,
      O(2) => \dac_data4__171_carry_n_5\,
      O(1) => \dac_data4__171_carry_n_6\,
      O(0) => \dac_data4__171_carry_n_7\,
      S(3) => \dac_data4__171_carry_i_2_n_0\,
      S(2) => \dac_data4__171_carry_i_3_n_0\,
      S(1) => \dac_data4__171_carry_i_4_n_0\,
      S(0) => \dac_data4__171_carry_i_5_n_0\
    );
\dac_data4__171_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__171_carry_n_0\,
      CO(3) => \dac_data4__171_carry__0_n_0\,
      CO(2) => \dac_data4__171_carry__0_n_1\,
      CO(1) => \dac_data4__171_carry__0_n_2\,
      CO(0) => \dac_data4__171_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \dac_data4__171_carry__0_i_1_n_0\,
      DI(2) => \dac_data4__171_carry__0_i_2_n_0\,
      DI(1) => \dac_data4__171_carry__0_i_3_n_0\,
      DI(0) => \dac_data4__171_carry__0_i_4_n_0\,
      O(3) => \dac_data4__171_carry__0_n_4\,
      O(2) => \dac_data4__171_carry__0_n_5\,
      O(1) => \dac_data4__171_carry__0_n_6\,
      O(0) => \dac_data4__171_carry__0_n_7\,
      S(3) => \dac_data4__171_carry__0_i_5_n_0\,
      S(2) => \dac_data4__171_carry__0_i_6_n_0\,
      S(1) => \dac_data4__171_carry__0_i_7_n_0\,
      S(0) => \dac_data4__171_carry__0_i_8_n_0\
    );
\dac_data4__171_carry__0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF8E8E00"
    )
        port map (
      I0 => \dac_data4__72_carry__1_n_7\,
      I1 => \dac_data4__114_carry__0_n_6\,
      I2 => \dac_data4__8_carry__3_n_4\,
      I3 => \dac_data4__8_carry__3_n_5\,
      I4 => \dac_data4__171_carry__0_i_9_n_0\,
      O => \dac_data4__171_carry__0_i_1_n_0\
    );
\dac_data4__171_carry__0_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \dac_data4__8_carry__4_n_6\,
      I1 => \dac_data4__114_carry__0_n_4\,
      I2 => \dac_data4__72_carry__1_n_5\,
      O => \dac_data4__171_carry__0_i_10_n_0\
    );
\dac_data4__171_carry__0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8E71718E"
    )
        port map (
      I0 => \dac_data4__72_carry__1_n_7\,
      I1 => \dac_data4__114_carry__0_n_6\,
      I2 => \dac_data4__8_carry__3_n_4\,
      I3 => \dac_data4__8_carry__3_n_5\,
      I4 => \dac_data4__171_carry__0_i_9_n_0\,
      O => \dac_data4__171_carry__0_i_2_n_0\
    );
\dac_data4__171_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => \dac_data4__72_carry__1_n_7\,
      I1 => \dac_data4__114_carry__0_n_6\,
      I2 => \dac_data4__8_carry__3_n_4\,
      I3 => \dac_data4__8_carry__3_n_6\,
      O => \dac_data4__171_carry__0_i_3_n_0\
    );
\dac_data4__171_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \dac_data4__72_carry__0_n_5\,
      I1 => \dac_data4__114_carry_n_4\,
      O => \dac_data4__171_carry__0_i_4_n_0\
    );
\dac_data4__171_carry__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969966996699696"
    )
        port map (
      I0 => \dac_data4__171_carry__0_i_1_n_0\,
      I1 => \dac_data4__171_carry__0_i_10_n_0\,
      I2 => \dac_data4__8_carry__3_n_4\,
      I3 => \dac_data4__8_carry__4_n_7\,
      I4 => \dac_data4__114_carry__0_n_5\,
      I5 => \dac_data4__72_carry__1_n_6\,
      O => \dac_data4__171_carry__0_i_5_n_0\
    );
\dac_data4__171_carry__0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9699996999696966"
    )
        port map (
      I0 => \dac_data4__171_carry__0_i_9_n_0\,
      I1 => \dac_data4__8_carry__3_n_5\,
      I2 => \dac_data4__8_carry__3_n_4\,
      I3 => \dac_data4__114_carry__0_n_6\,
      I4 => \dac_data4__72_carry__1_n_7\,
      I5 => \dac_data4__8_carry__3_n_6\,
      O => \dac_data4__171_carry__0_i_6_n_0\
    );
\dac_data4__171_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6A56"
    )
        port map (
      I0 => \dac_data4__171_carry__0_i_3_n_0\,
      I1 => \dac_data4__72_carry__0_n_4\,
      I2 => \dac_data4__114_carry__0_n_7\,
      I3 => \dac_data4__8_carry__3_n_5\,
      O => \dac_data4__171_carry__0_i_7_n_0\
    );
\dac_data4__171_carry__0_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E11E1EE1"
    )
        port map (
      I0 => \dac_data4__114_carry_n_4\,
      I1 => \dac_data4__72_carry__0_n_5\,
      I2 => \dac_data4__72_carry__0_n_4\,
      I3 => \dac_data4__114_carry__0_n_7\,
      I4 => \dac_data4__8_carry__3_n_5\,
      O => \dac_data4__171_carry__0_i_8_n_0\
    );
\dac_data4__171_carry__0_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \dac_data4__8_carry__4_n_7\,
      I1 => \dac_data4__114_carry__0_n_5\,
      I2 => \dac_data4__72_carry__1_n_6\,
      O => \dac_data4__171_carry__0_i_9_n_0\
    );
\dac_data4__171_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__171_carry__0_n_0\,
      CO(3) => \dac_data4__171_carry__1_n_0\,
      CO(2) => \dac_data4__171_carry__1_n_1\,
      CO(1) => \dac_data4__171_carry__1_n_2\,
      CO(0) => \dac_data4__171_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \dac_data4__171_carry__1_i_1_n_0\,
      DI(2) => \dac_data4__171_carry__1_i_2_n_0\,
      DI(1) => \dac_data4__171_carry__1_i_3_n_0\,
      DI(0) => \dac_data4__171_carry__1_i_4_n_0\,
      O(3) => \dac_data4__171_carry__1_n_4\,
      O(2) => \dac_data4__171_carry__1_n_5\,
      O(1) => \dac_data4__171_carry__1_n_6\,
      O(0) => \dac_data4__171_carry__1_n_7\,
      S(3) => \dac_data4__171_carry__1_i_5_n_0\,
      S(2) => \dac_data4__171_carry__1_i_6_n_0\,
      S(1) => \dac_data4__171_carry__1_i_7_n_0\,
      S(0) => \dac_data4__171_carry__1_i_8_n_0\
    );
\dac_data4__171_carry__1_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF8E8E00"
    )
        port map (
      I0 => \dac_data4__72_carry__2_n_7\,
      I1 => \dac_data4__114_carry__1_n_6\,
      I2 => \dac_data4__8_carry__4_n_4\,
      I3 => \dac_data4__8_carry__4_n_5\,
      I4 => \dac_data4__171_carry__1_i_9_n_0\,
      O => \dac_data4__171_carry__1_i_1_n_0\
    );
\dac_data4__171_carry__1_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \dac_data4__8_carry__4_n_4\,
      I1 => \dac_data4__114_carry__1_n_6\,
      I2 => \dac_data4__72_carry__2_n_7\,
      O => \dac_data4__171_carry__1_i_10_n_0\
    );
\dac_data4__171_carry__1_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \dac_data4__8_carry__4_n_5\,
      I1 => \dac_data4__114_carry__1_n_7\,
      I2 => \dac_data4__72_carry__1_n_4\,
      O => \dac_data4__171_carry__1_i_11_n_0\
    );
\dac_data4__171_carry__1_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \dac_data4__8_carry__5_n_6\,
      I1 => \dac_data4__114_carry__1_n_4\,
      I2 => \dac_data4__72_carry__2_n_5\,
      O => \dac_data4__171_carry__1_i_12_n_0\
    );
\dac_data4__171_carry__1_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF8E8E00"
    )
        port map (
      I0 => \dac_data4__72_carry__1_n_4\,
      I1 => \dac_data4__114_carry__1_n_7\,
      I2 => \dac_data4__8_carry__4_n_5\,
      I3 => \dac_data4__8_carry__4_n_6\,
      I4 => \dac_data4__171_carry__1_i_10_n_0\,
      O => \dac_data4__171_carry__1_i_2_n_0\
    );
\dac_data4__171_carry__1_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF8E8E00"
    )
        port map (
      I0 => \dac_data4__72_carry__1_n_5\,
      I1 => \dac_data4__114_carry__0_n_4\,
      I2 => \dac_data4__8_carry__4_n_6\,
      I3 => \dac_data4__8_carry__4_n_7\,
      I4 => \dac_data4__171_carry__1_i_11_n_0\,
      O => \dac_data4__171_carry__1_i_3_n_0\
    );
\dac_data4__171_carry__1_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF8E8E00"
    )
        port map (
      I0 => \dac_data4__72_carry__1_n_6\,
      I1 => \dac_data4__114_carry__0_n_5\,
      I2 => \dac_data4__8_carry__4_n_7\,
      I3 => \dac_data4__8_carry__3_n_4\,
      I4 => \dac_data4__171_carry__0_i_10_n_0\,
      O => \dac_data4__171_carry__1_i_4_n_0\
    );
\dac_data4__171_carry__1_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969966996699696"
    )
        port map (
      I0 => \dac_data4__171_carry__1_i_1_n_0\,
      I1 => \dac_data4__171_carry__1_i_12_n_0\,
      I2 => \dac_data4__8_carry__4_n_4\,
      I3 => \dac_data4__8_carry__5_n_7\,
      I4 => \dac_data4__114_carry__1_n_5\,
      I5 => \dac_data4__72_carry__2_n_6\,
      O => \dac_data4__171_carry__1_i_5_n_0\
    );
\dac_data4__171_carry__1_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969966996699696"
    )
        port map (
      I0 => \dac_data4__171_carry__1_i_2_n_0\,
      I1 => \dac_data4__171_carry__1_i_9_n_0\,
      I2 => \dac_data4__8_carry__4_n_5\,
      I3 => \dac_data4__8_carry__4_n_4\,
      I4 => \dac_data4__114_carry__1_n_6\,
      I5 => \dac_data4__72_carry__2_n_7\,
      O => \dac_data4__171_carry__1_i_6_n_0\
    );
\dac_data4__171_carry__1_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969966996699696"
    )
        port map (
      I0 => \dac_data4__171_carry__1_i_3_n_0\,
      I1 => \dac_data4__171_carry__1_i_10_n_0\,
      I2 => \dac_data4__8_carry__4_n_6\,
      I3 => \dac_data4__8_carry__4_n_5\,
      I4 => \dac_data4__114_carry__1_n_7\,
      I5 => \dac_data4__72_carry__1_n_4\,
      O => \dac_data4__171_carry__1_i_7_n_0\
    );
\dac_data4__171_carry__1_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969966996699696"
    )
        port map (
      I0 => \dac_data4__171_carry__1_i_4_n_0\,
      I1 => \dac_data4__171_carry__1_i_11_n_0\,
      I2 => \dac_data4__8_carry__4_n_7\,
      I3 => \dac_data4__8_carry__4_n_6\,
      I4 => \dac_data4__114_carry__0_n_4\,
      I5 => \dac_data4__72_carry__1_n_5\,
      O => \dac_data4__171_carry__1_i_8_n_0\
    );
\dac_data4__171_carry__1_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \dac_data4__8_carry__5_n_7\,
      I1 => \dac_data4__114_carry__1_n_5\,
      I2 => \dac_data4__72_carry__2_n_6\,
      O => \dac_data4__171_carry__1_i_9_n_0\
    );
\dac_data4__171_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__171_carry__1_n_0\,
      CO(3) => \dac_data4__171_carry__2_n_0\,
      CO(2) => \dac_data4__171_carry__2_n_1\,
      CO(1) => \dac_data4__171_carry__2_n_2\,
      CO(0) => \dac_data4__171_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_164,
      DI(2) => sine_rom_inst_n_165,
      DI(1) => \dac_data4__171_carry__2_i_3_n_0\,
      DI(0) => \dac_data4__171_carry__2_i_4_n_0\,
      O(3) => \dac_data4__171_carry__2_n_4\,
      O(2) => \dac_data4__171_carry__2_n_5\,
      O(1) => \dac_data4__171_carry__2_n_6\,
      O(0) => \dac_data4__171_carry__2_n_7\,
      S(3) => sine_rom_inst_n_243,
      S(2) => sine_rom_inst_n_244,
      S(1) => sine_rom_inst_n_245,
      S(0) => \dac_data4__171_carry__2_i_8_n_0\
    );
\dac_data4__171_carry__2_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \dac_data4__8_carry__5_n_5\,
      I1 => \dac_data4__114_carry__2_n_7\,
      I2 => \dac_data4__72_carry__2_n_4\,
      O => \dac_data4__171_carry__2_i_11_n_0\
    );
\dac_data4__171_carry__2_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF8E8E00"
    )
        port map (
      I0 => \dac_data4__72_carry__2_n_5\,
      I1 => \dac_data4__114_carry__1_n_4\,
      I2 => \dac_data4__8_carry__5_n_6\,
      I3 => \dac_data4__8_carry__5_n_7\,
      I4 => \dac_data4__171_carry__2_i_11_n_0\,
      O => \dac_data4__171_carry__2_i_3_n_0\
    );
\dac_data4__171_carry__2_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF8E8E00"
    )
        port map (
      I0 => \dac_data4__72_carry__2_n_6\,
      I1 => \dac_data4__114_carry__1_n_5\,
      I2 => \dac_data4__8_carry__5_n_7\,
      I3 => \dac_data4__8_carry__4_n_4\,
      I4 => \dac_data4__171_carry__1_i_12_n_0\,
      O => \dac_data4__171_carry__2_i_4_n_0\
    );
\dac_data4__171_carry__2_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969966996699696"
    )
        port map (
      I0 => \dac_data4__171_carry__2_i_4_n_0\,
      I1 => \dac_data4__171_carry__2_i_11_n_0\,
      I2 => \dac_data4__8_carry__5_n_7\,
      I3 => \dac_data4__8_carry__5_n_6\,
      I4 => \dac_data4__114_carry__1_n_4\,
      I5 => \dac_data4__72_carry__2_n_5\,
      O => \dac_data4__171_carry__2_i_8_n_0\
    );
\dac_data4__171_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__171_carry__2_n_0\,
      CO(3) => \dac_data4__171_carry__3_n_0\,
      CO(2) => \dac_data4__171_carry__3_n_1\,
      CO(1) => \dac_data4__171_carry__3_n_2\,
      CO(0) => \dac_data4__171_carry__3_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_166,
      DI(2) => sine_rom_inst_n_167,
      DI(1) => sine_rom_inst_n_168,
      DI(0) => sine_rom_inst_n_169,
      O(3) => \dac_data4__171_carry__3_n_4\,
      O(2) => \dac_data4__171_carry__3_n_5\,
      O(1) => \dac_data4__171_carry__3_n_6\,
      O(0) => \dac_data4__171_carry__3_n_7\,
      S(3) => sine_rom_inst_n_246,
      S(2) => sine_rom_inst_n_247,
      S(1) => sine_rom_inst_n_248,
      S(0) => sine_rom_inst_n_249
    );
\dac_data4__171_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__171_carry__3_n_0\,
      CO(3) => \dac_data4__171_carry__4_n_0\,
      CO(2) => \dac_data4__171_carry__4_n_1\,
      CO(1) => \dac_data4__171_carry__4_n_2\,
      CO(0) => \dac_data4__171_carry__4_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_173,
      DI(2) => sine_rom_inst_n_174,
      DI(1) => sine_rom_inst_n_175,
      DI(0) => sine_rom_inst_n_176,
      O(3) => \dac_data4__171_carry__4_n_4\,
      O(2) => \dac_data4__171_carry__4_n_5\,
      O(1) => \dac_data4__171_carry__4_n_6\,
      O(0) => \dac_data4__171_carry__4_n_7\,
      S(3) => sine_rom_inst_n_250,
      S(2) => sine_rom_inst_n_251,
      S(1) => sine_rom_inst_n_252,
      S(0) => sine_rom_inst_n_253
    );
\dac_data4__171_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__171_carry__4_n_0\,
      CO(3) => \NLW_dac_data4__171_carry__5_CO_UNCONNECTED\(3),
      CO(2) => \dac_data4__171_carry__5_n_1\,
      CO(1) => \dac_data4__171_carry__5_n_2\,
      CO(0) => \dac_data4__171_carry__5_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => sine_rom_inst_n_177,
      DI(1) => sine_rom_inst_n_178,
      DI(0) => sine_rom_inst_n_179,
      O(3) => \dac_data4__171_carry__5_n_4\,
      O(2) => \dac_data4__171_carry__5_n_5\,
      O(1) => \dac_data4__171_carry__5_n_6\,
      O(0) => \dac_data4__171_carry__5_n_7\,
      S(3) => sine_rom_inst_n_95,
      S(2) => sine_rom_inst_n_96,
      S(1) => sine_rom_inst_n_97,
      S(0) => sine_rom_inst_n_98
    );
\dac_data4__171_carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__72_carry__0_n_5\,
      I1 => \dac_data4__114_carry_n_4\,
      O => \dac_data4__171_carry_i_1_n_0\
    );
\dac_data4__171_carry_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \dac_data4__114_carry_n_4\,
      I1 => \dac_data4__72_carry__0_n_5\,
      I2 => \dac_data4__8_carry__3_n_6\,
      O => \dac_data4__171_carry_i_2_n_0\
    );
\dac_data4__171_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \dac_data4__72_carry__0_n_6\,
      I1 => \dac_data4__114_carry_n_5\,
      O => \dac_data4__171_carry_i_3_n_0\
    );
\dac_data4__171_carry_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \dac_data4__72_carry__0_n_7\,
      I1 => \dac_data4__114_carry_n_6\,
      O => \dac_data4__171_carry_i_4_n_0\
    );
\dac_data4__171_carry_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \dac_data4__72_carry_n_4\,
      I1 => \dac_data4__8_carry__3_n_6\,
      O => \dac_data4__171_carry_i_5_n_0\
    );
\dac_data4__254_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \dac_data4__254_carry_n_0\,
      CO(2) => \dac_data4__254_carry_n_1\,
      CO(1) => \dac_data4__254_carry_n_2\,
      CO(0) => \dac_data4__254_carry_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_162,
      DI(2) => sine_rom_inst_n_163,
      DI(1) => \dac_data4__254_carry_i_3_n_0\,
      DI(0) => '0',
      O(3 downto 0) => \NLW_dac_data4__254_carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \dac_data4__254_carry_i_4_n_0\,
      S(2) => \dac_data4__254_carry_i_5_n_0\,
      S(1) => \dac_data4__254_carry_i_6_n_0\,
      S(0) => \dac_data4__254_carry_i_7_n_0\
    );
\dac_data4__254_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__254_carry_n_0\,
      CO(3) => \dac_data4__254_carry__0_n_0\,
      CO(2) => \dac_data4__254_carry__0_n_1\,
      CO(1) => \dac_data4__254_carry__0_n_2\,
      CO(0) => \dac_data4__254_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_158,
      DI(2) => sine_rom_inst_n_159,
      DI(1) => sine_rom_inst_n_160,
      DI(0) => sine_rom_inst_n_161,
      O(3 downto 0) => \NLW_dac_data4__254_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \dac_data4__254_carry__0_i_5_n_0\,
      S(2) => \dac_data4__254_carry__0_i_6_n_0\,
      S(1) => \dac_data4__254_carry__0_i_7_n_0\,
      S(0) => \dac_data4__254_carry__0_i_8_n_0\
    );
\dac_data4__254_carry__0_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(5),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry_n_5\,
      O => \dac_data4__254_carry__0_i_10_n_0\
    );
\dac_data4__254_carry__0_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(4),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry_n_6\,
      O => \dac_data4__254_carry__0_i_11_n_0\
    );
\dac_data4__254_carry__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF4700B800B8FF47"
    )
        port map (
      I0 => dac_data6(6),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry_n_4\,
      I3 => \dac_data4__171_carry_n_4\,
      I4 => \dac_data4__171_carry__0_n_7\,
      I5 => \dac_data4__8_carry__3_i_10_n_0\,
      O => \dac_data4__254_carry__0_i_5_n_0\
    );
\dac_data4__254_carry__0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF4700B800B8FF47"
    )
        port map (
      I0 => dac_data6(5),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry_n_5\,
      I3 => \dac_data4__171_carry_n_5\,
      I4 => \dac_data4__171_carry_n_4\,
      I5 => \dac_data4__254_carry__0_i_9_n_0\,
      O => \dac_data4__254_carry__0_i_6_n_0\
    );
\dac_data4__254_carry__0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF4700B800B8FF47"
    )
        port map (
      I0 => dac_data6(4),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry_n_6\,
      I3 => \dac_data4__171_carry_n_6\,
      I4 => \dac_data4__171_carry_n_5\,
      I5 => \dac_data4__254_carry__0_i_10_n_0\,
      O => \dac_data4__254_carry__0_i_7_n_0\
    );
\dac_data4__254_carry__0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF4700B800B8FF47"
    )
        port map (
      I0 => dac_data6(3),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry_n_7\,
      I3 => \dac_data4__171_carry_n_7\,
      I4 => \dac_data4__171_carry_n_6\,
      I5 => \dac_data4__254_carry__0_i_11_n_0\,
      O => \dac_data4__254_carry__0_i_8_n_0\
    );
\dac_data4__254_carry__0_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(6),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry_n_4\,
      O => \dac_data4__254_carry__0_i_9_n_0\
    );
\dac_data4__254_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__254_carry__0_n_0\,
      CO(3) => \dac_data4__254_carry__1_n_0\,
      CO(2) => \dac_data4__254_carry__1_n_1\,
      CO(1) => \dac_data4__254_carry__1_n_2\,
      CO(0) => \dac_data4__254_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_79,
      DI(2) => sine_rom_inst_n_80,
      DI(1) => sine_rom_inst_n_81,
      DI(0) => sine_rom_inst_n_82,
      O(3 downto 0) => \NLW_dac_data4__254_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \dac_data4__254_carry__1_i_5_n_0\,
      S(2) => \dac_data4__254_carry__1_i_6_n_0\,
      S(1) => \dac_data4__254_carry__1_i_7_n_0\,
      S(0) => \dac_data4__254_carry__1_i_8_n_0\
    );
\dac_data4__254_carry__1_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FF47004700B8FF"
    )
        port map (
      I0 => dac_data6(10),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__0_n_4\,
      I3 => \dac_data4__171_carry__0_n_4\,
      I4 => \dac_data4__171_carry__1_n_7\,
      I5 => \dac_data4__8_carry__2_i_13_n_0\,
      O => \dac_data4__254_carry__1_i_5_n_0\
    );
\dac_data4__254_carry__1_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FF47004700B8FF"
    )
        port map (
      I0 => dac_data6(9),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__0_n_5\,
      I3 => \dac_data4__171_carry__0_n_5\,
      I4 => \dac_data4__171_carry__0_n_4\,
      I5 => \dac_data4__8_carry__2_i_15_n_0\,
      O => \dac_data4__254_carry__1_i_6_n_0\
    );
\dac_data4__254_carry__1_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B44BB4B4B44B4B4B"
    )
        port map (
      I0 => \dac_data4__8_carry__1_i_13_n_0\,
      I1 => \dac_data4__171_carry__0_n_6\,
      I2 => \dac_data4__171_carry__0_n_5\,
      I3 => dac_data6(9),
      I4 => \dac_data6__90_carry__2_n_6\,
      I5 => \dac_data6__90_carry__0_n_5\,
      O => \dac_data4__254_carry__1_i_7_n_0\
    );
\dac_data4__254_carry__1_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00B8FF47FF4700B8"
    )
        port map (
      I0 => dac_data6(7),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__0_n_7\,
      I3 => \dac_data4__171_carry__0_n_7\,
      I4 => \dac_data4__171_carry__0_n_6\,
      I5 => \dac_data4__8_carry__1_i_13_n_0\,
      O => \dac_data4__254_carry__1_i_8_n_0\
    );
\dac_data4__254_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__254_carry__1_n_0\,
      CO(3) => \dac_data4__254_carry__2_n_0\,
      CO(2) => \dac_data4__254_carry__2_n_1\,
      CO(1) => \dac_data4__254_carry__2_n_2\,
      CO(0) => \dac_data4__254_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_154,
      DI(2) => sine_rom_inst_n_155,
      DI(1) => sine_rom_inst_n_156,
      DI(0) => sine_rom_inst_n_157,
      O(3 downto 0) => \NLW_dac_data4__254_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => sine_rom_inst_n_254,
      S(2) => sine_rom_inst_n_255,
      S(1) => sine_rom_inst_n_256,
      S(0) => \dac_data4__254_carry__2_i_8_n_0\
    );
\dac_data4__254_carry__2_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FF47004700B8FF"
    )
        port map (
      I0 => dac_data6(11),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__1_n_7\,
      I3 => \dac_data4__171_carry__1_n_7\,
      I4 => \dac_data4__171_carry__1_n_6\,
      I5 => \dac_data4__8_carry__2_i_11_n_0\,
      O => \dac_data4__254_carry__2_i_8_n_0\
    );
\dac_data4__254_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__254_carry__2_n_0\,
      CO(3) => \dac_data4__254_carry__3_n_0\,
      CO(2) => \dac_data4__254_carry__3_n_1\,
      CO(1) => \dac_data4__254_carry__3_n_2\,
      CO(0) => \dac_data4__254_carry__3_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_99,
      DI(2) => sine_rom_inst_n_100,
      DI(1) => sine_rom_inst_n_101,
      DI(0) => sine_rom_inst_n_102,
      O(3 downto 0) => \NLW_dac_data4__254_carry__3_O_UNCONNECTED\(3 downto 0),
      S(3) => sine_rom_inst_n_257,
      S(2) => sine_rom_inst_n_258,
      S(1) => sine_rom_inst_n_259,
      S(0) => sine_rom_inst_n_260
    );
\dac_data4__254_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__254_carry__3_n_0\,
      CO(3) => \dac_data4__254_carry__4_n_0\,
      CO(2) => \dac_data4__254_carry__4_n_1\,
      CO(1) => \dac_data4__254_carry__4_n_2\,
      CO(0) => \dac_data4__254_carry__4_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_103,
      DI(2) => sine_rom_inst_n_104,
      DI(1) => sine_rom_inst_n_105,
      DI(0) => sine_rom_inst_n_106,
      O(3 downto 0) => \NLW_dac_data4__254_carry__4_O_UNCONNECTED\(3 downto 0),
      S(3) => sine_rom_inst_n_261,
      S(2) => sine_rom_inst_n_262,
      S(1) => sine_rom_inst_n_263,
      S(0) => sine_rom_inst_n_264
    );
\dac_data4__254_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__254_carry__4_n_0\,
      CO(3) => \dac_data4__254_carry__5_n_0\,
      CO(2) => \dac_data4__254_carry__5_n_1\,
      CO(1) => \dac_data4__254_carry__5_n_2\,
      CO(0) => \dac_data4__254_carry__5_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_107,
      DI(2) => sine_rom_inst_n_108,
      DI(1) => sine_rom_inst_n_109,
      DI(0) => sine_rom_inst_n_110,
      O(3 downto 0) => \NLW_dac_data4__254_carry__5_O_UNCONNECTED\(3 downto 0),
      S(3) => sine_rom_inst_n_265,
      S(2) => sine_rom_inst_n_266,
      S(1) => sine_rom_inst_n_267,
      S(0) => sine_rom_inst_n_268
    );
\dac_data4__254_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__254_carry__5_n_0\,
      CO(3) => \NLW_dac_data4__254_carry__6_CO_UNCONNECTED\(3),
      CO(2) => \dac_data4__254_carry__6_n_1\,
      CO(1) => \dac_data4__254_carry__6_n_2\,
      CO(0) => \dac_data4__254_carry__6_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => sine_rom_inst_n_111,
      DI(1) => sine_rom_inst_n_112,
      DI(0) => sine_rom_inst_n_113,
      O(3 downto 0) => \NLW_dac_data4__254_carry__6_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => sine_rom_inst_n_269,
      S(1) => sine_rom_inst_n_270,
      S(0) => sine_rom_inst_n_271
    );
\dac_data4__254_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \dac_data4__72_carry_n_7\,
      I1 => \dac_data6__0_carry_n_7\,
      O => \dac_data4__254_carry_i_3_n_0\
    );
\dac_data4__254_carry_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF4700B800B8FF47"
    )
        port map (
      I0 => dac_data6(2),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__0_carry_n_5\,
      I3 => \dac_data4__72_carry_n_5\,
      I4 => \dac_data4__171_carry_n_7\,
      I5 => \dac_data4__254_carry_i_8_n_0\,
      O => \dac_data4__254_carry_i_4_n_0\
    );
\dac_data4__254_carry_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF4700B800B8FF47"
    )
        port map (
      I0 => dac_data6(1),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__0_carry_n_6\,
      I3 => \dac_data4__72_carry_n_6\,
      I4 => \dac_data4__72_carry_n_5\,
      I5 => \dac_data4__254_carry_i_9_n_0\,
      O => \dac_data4__254_carry_i_5_n_0\
    );
\dac_data4__254_carry_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D22DD2D2D22D2D2D"
    )
        port map (
      I0 => \dac_data6__0_carry_n_7\,
      I1 => \dac_data4__72_carry_n_7\,
      I2 => \dac_data4__72_carry_n_6\,
      I3 => dac_data6(1),
      I4 => \dac_data6__90_carry__2_n_6\,
      I5 => \dac_data6__0_carry_n_6\,
      O => \dac_data4__254_carry_i_6_n_0\
    );
\dac_data4__254_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \dac_data6__0_carry_n_7\,
      I1 => \dac_data4__72_carry_n_7\,
      O => \dac_data4__254_carry_i_7_n_0\
    );
\dac_data4__254_carry_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(3),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry_n_7\,
      O => \dac_data4__254_carry_i_8_n_0\
    );
\dac_data4__254_carry_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(2),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__0_carry_n_5\,
      O => \dac_data4__254_carry_i_9_n_0\
    );
\dac_data4__315_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \dac_data4__315_carry_n_0\,
      CO(2) => \dac_data4__315_carry_n_1\,
      CO(1) => \dac_data4__315_carry_n_2\,
      CO(0) => \dac_data4__315_carry_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \dac_data4__315_carry_n_4\,
      O(2) => \dac_data4__315_carry_n_5\,
      O(1) => \dac_data4__315_carry_n_6\,
      O(0) => \dac_data4__315_carry_n_7\,
      S(3) => \dac_data4__8_carry__4_n_7\,
      S(2) => \dac_data4__8_carry__3_n_4\,
      S(1) => \dac_data4__8_carry__3_n_5\,
      S(0) => \dac_data4__315_carry_i_1_n_0\
    );
\dac_data4__315_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__315_carry_n_0\,
      CO(3) => \dac_data4__315_carry__0_n_0\,
      CO(2) => \dac_data4__315_carry__0_n_1\,
      CO(1) => \dac_data4__315_carry__0_n_2\,
      CO(0) => \dac_data4__315_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \dac_data4__315_carry__0_n_4\,
      O(2) => \dac_data4__315_carry__0_n_5\,
      O(1) => \dac_data4__315_carry__0_n_6\,
      O(0) => \dac_data4__315_carry__0_n_7\,
      S(3) => \dac_data4__8_carry__5_n_7\,
      S(2) => \dac_data4__8_carry__4_n_4\,
      S(1) => \dac_data4__8_carry__4_n_5\,
      S(0) => \dac_data4__8_carry__4_n_6\
    );
\dac_data4__315_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__315_carry__0_n_0\,
      CO(3) => \dac_data4__315_carry__1_n_0\,
      CO(2) => \dac_data4__315_carry__1_n_1\,
      CO(1) => \dac_data4__315_carry__1_n_2\,
      CO(0) => \dac_data4__315_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \dac_data4__315_carry__1_n_4\,
      O(2) => \dac_data4__315_carry__1_n_5\,
      O(1) => \dac_data4__315_carry__1_n_6\,
      O(0) => \dac_data4__315_carry__1_n_7\,
      S(3) => \dac_data4__8_carry__6_n_7\,
      S(2) => \dac_data4__8_carry__5_n_4\,
      S(1) => \dac_data4__8_carry__5_n_5\,
      S(0) => \dac_data4__8_carry__5_n_6\
    );
\dac_data4__315_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__315_carry__1_n_0\,
      CO(3) => \dac_data4__315_carry__2_n_0\,
      CO(2) => \dac_data4__315_carry__2_n_1\,
      CO(1) => \dac_data4__315_carry__2_n_2\,
      CO(0) => \dac_data4__315_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \dac_data4__315_carry__2_n_4\,
      O(2) => \dac_data4__315_carry__2_n_5\,
      O(1) => \dac_data4__315_carry__2_n_6\,
      O(0) => \dac_data4__315_carry__2_n_7\,
      S(3) => sine_rom_inst_n_22,
      S(2) => \dac_data4__8_carry__6_n_4\,
      S(1) => \dac_data4__8_carry__6_n_5\,
      S(0) => \dac_data4__8_carry__6_n_6\
    );
\dac_data4__315_carry_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data4__8_carry__3_n_6\,
      O => \dac_data4__315_carry_i_1_n_0\
    );
\dac_data4__72_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \dac_data4__72_carry_n_0\,
      CO(2) => \dac_data4__72_carry_n_1\,
      CO(1) => \dac_data4__72_carry_n_2\,
      CO(0) => \dac_data4__72_carry_n_3\,
      CYINIT => '0',
      DI(3) => \dac_data4__8_carry__3_n_6\,
      DI(2 downto 0) => B"001",
      O(3) => \dac_data4__72_carry_n_4\,
      O(2) => \dac_data4__72_carry_n_5\,
      O(1) => \dac_data4__72_carry_n_6\,
      O(0) => \dac_data4__72_carry_n_7\,
      S(3) => \dac_data4__72_carry_i_1_n_0\,
      S(2) => \dac_data4__72_carry_i_2_n_0\,
      S(1) => \dac_data4__72_carry_i_3_n_0\,
      S(0) => \dac_data4__8_carry__3_n_6\
    );
\dac_data4__72_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__72_carry_n_0\,
      CO(3) => \dac_data4__72_carry__0_n_0\,
      CO(2) => \dac_data4__72_carry__0_n_1\,
      CO(1) => \dac_data4__72_carry__0_n_2\,
      CO(0) => \dac_data4__72_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \dac_data4__8_carry__4_n_6\,
      DI(2) => \dac_data4__8_carry__4_n_7\,
      DI(1) => \dac_data4__8_carry__3_n_4\,
      DI(0) => \dac_data4__8_carry__3_n_5\,
      O(3) => \dac_data4__72_carry__0_n_4\,
      O(2) => \dac_data4__72_carry__0_n_5\,
      O(1) => \dac_data4__72_carry__0_n_6\,
      O(0) => \dac_data4__72_carry__0_n_7\,
      S(3) => \dac_data4__72_carry__0_i_1_n_0\,
      S(2) => \dac_data4__72_carry__0_i_2_n_0\,
      S(1) => \dac_data4__72_carry__0_i_3_n_0\,
      S(0) => \dac_data4__72_carry__0_i_4_n_0\
    );
\dac_data4__72_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__4_n_6\,
      I1 => \dac_data4__8_carry__5_n_7\,
      O => \dac_data4__72_carry__0_i_1_n_0\
    );
\dac_data4__72_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__4_n_7\,
      I1 => \dac_data4__8_carry__4_n_4\,
      O => \dac_data4__72_carry__0_i_2_n_0\
    );
\dac_data4__72_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__3_n_4\,
      I1 => \dac_data4__8_carry__4_n_5\,
      O => \dac_data4__72_carry__0_i_3_n_0\
    );
\dac_data4__72_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__3_n_5\,
      I1 => \dac_data4__8_carry__4_n_6\,
      O => \dac_data4__72_carry__0_i_4_n_0\
    );
\dac_data4__72_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__72_carry__0_n_0\,
      CO(3) => \dac_data4__72_carry__1_n_0\,
      CO(2) => \dac_data4__72_carry__1_n_1\,
      CO(1) => \dac_data4__72_carry__1_n_2\,
      CO(0) => \dac_data4__72_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \dac_data4__8_carry__5_n_6\,
      DI(2) => \dac_data4__8_carry__5_n_7\,
      DI(1) => \dac_data4__8_carry__4_n_4\,
      DI(0) => \dac_data4__8_carry__4_n_5\,
      O(3) => \dac_data4__72_carry__1_n_4\,
      O(2) => \dac_data4__72_carry__1_n_5\,
      O(1) => \dac_data4__72_carry__1_n_6\,
      O(0) => \dac_data4__72_carry__1_n_7\,
      S(3) => sine_rom_inst_n_27,
      S(2) => \dac_data4__72_carry__1_i_2_n_0\,
      S(1) => \dac_data4__72_carry__1_i_3_n_0\,
      S(0) => \dac_data4__72_carry__1_i_4_n_0\
    );
\dac_data4__72_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__5_n_7\,
      I1 => \dac_data4__8_carry__5_n_4\,
      O => \dac_data4__72_carry__1_i_2_n_0\
    );
\dac_data4__72_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__4_n_4\,
      I1 => \dac_data4__8_carry__5_n_5\,
      O => \dac_data4__72_carry__1_i_3_n_0\
    );
\dac_data4__72_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__4_n_5\,
      I1 => \dac_data4__8_carry__5_n_6\,
      O => \dac_data4__72_carry__1_i_4_n_0\
    );
\dac_data4__72_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__72_carry__1_n_0\,
      CO(3) => \dac_data4__72_carry__2_n_0\,
      CO(2) => \dac_data4__72_carry__2_n_1\,
      CO(1) => \dac_data4__72_carry__2_n_2\,
      CO(0) => \dac_data4__72_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \dac_data4__8_carry__6_n_6\,
      DI(2) => \dac_data4__8_carry__6_n_7\,
      DI(1) => \dac_data4__8_carry__5_n_4\,
      DI(0) => \dac_data4__8_carry__5_n_5\,
      O(3) => \dac_data4__72_carry__2_n_4\,
      O(2) => \dac_data4__72_carry__2_n_5\,
      O(1) => \dac_data4__72_carry__2_n_6\,
      O(0) => \dac_data4__72_carry__2_n_7\,
      S(3) => sine_rom_inst_n_28,
      S(2) => sine_rom_inst_n_29,
      S(1) => sine_rom_inst_n_30,
      S(0) => sine_rom_inst_n_31
    );
\dac_data4__72_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__72_carry__2_n_0\,
      CO(3) => \dac_data4__72_carry__3_n_0\,
      CO(2) => \NLW_dac_data4__72_carry__3_CO_UNCONNECTED\(2),
      CO(1) => \dac_data4__72_carry__3_n_2\,
      CO(0) => \dac_data4__72_carry__3_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => sine_rom_inst_n_22,
      DI(1) => \dac_data4__8_carry__6_n_4\,
      DI(0) => \dac_data4__8_carry__6_n_5\,
      O(3) => \NLW_dac_data4__72_carry__3_O_UNCONNECTED\(3),
      O(2) => \dac_data4__72_carry__3_n_5\,
      O(1) => \dac_data4__72_carry__3_n_6\,
      O(0) => \dac_data4__72_carry__3_n_7\,
      S(3) => '1',
      S(2) => sine_rom_inst_n_199,
      S(1) => sine_rom_inst_n_200,
      S(0) => sine_rom_inst_n_201
    );
\dac_data4__72_carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dac_data4__8_carry__3_n_6\,
      I1 => \dac_data4__8_carry__4_n_7\,
      O => \dac_data4__72_carry_i_1_n_0\
    );
\dac_data4__72_carry_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data4__8_carry__3_n_4\,
      O => \dac_data4__72_carry_i_2_n_0\
    );
\dac_data4__72_carry_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data4__8_carry__3_n_5\,
      O => \dac_data4__72_carry_i_3_n_0\
    );
\dac_data4__8_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \dac_data4__8_carry_n_0\,
      CO(2) => \dac_data4__8_carry_n_1\,
      CO(1) => \dac_data4__8_carry_n_2\,
      CO(0) => \dac_data4__8_carry_n_3\,
      CYINIT => '0',
      DI(3) => \dac_data4__8_carry_i_1_n_0\,
      DI(2) => \dac_data4__8_carry_i_2_n_0\,
      DI(1) => \dac_data4__8_carry_i_3_n_0\,
      DI(0) => '0',
      O(3 downto 0) => \NLW_dac_data4__8_carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \dac_data4__8_carry_i_4_n_0\,
      S(2) => \dac_data4__8_carry_i_5_n_0\,
      S(1) => sine_rom_inst_n_240,
      S(0) => \dac_data4__8_carry_i_7_n_0\
    );
\dac_data4__8_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__8_carry_n_0\,
      CO(3) => \dac_data4__8_carry__0_n_0\,
      CO(2) => \dac_data4__8_carry__0_n_1\,
      CO(1) => \dac_data4__8_carry__0_n_2\,
      CO(0) => \dac_data4__8_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_185,
      DI(2) => sine_rom_inst_n_186,
      DI(1) => \dac_data4__8_carry__0_i_3_n_0\,
      DI(0) => \dac_data4__8_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_dac_data4__8_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => sine_rom_inst_n_272,
      S(2) => sine_rom_inst_n_273,
      S(1) => \dac_data4__8_carry__0_i_7_n_0\,
      S(0) => \dac_data4__8_carry__0_i_8_n_0\
    );
\dac_data4__8_carry__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(12),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__1_n_6\,
      O => \dac_data4__8_carry__0_i_3_n_0\
    );
\dac_data4__8_carry__0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(11),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__1_n_7\,
      O => \dac_data4__8_carry__0_i_4_n_0\
    );
\dac_data4__8_carry__0_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => \dac_data6__90_carry__1_n_6\,
      I1 => dac_data6(12),
      I2 => \dac_data6__90_carry_n_6\,
      I3 => \dac_data6__90_carry__2_n_6\,
      I4 => dac_data6(4),
      O => \dac_data4__8_carry__0_i_7_n_0\
    );
\dac_data4__8_carry__0_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => \dac_data6__90_carry__1_n_7\,
      I1 => dac_data6(11),
      I2 => \dac_data6__90_carry_n_7\,
      I3 => \dac_data6__90_carry__2_n_6\,
      I4 => dac_data6(3),
      O => \dac_data4__8_carry__0_i_8_n_0\
    );
\dac_data4__8_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__8_carry__0_n_0\,
      CO(3) => \dac_data4__8_carry__1_n_0\,
      CO(2) => \dac_data4__8_carry__1_n_1\,
      CO(1) => \dac_data4__8_carry__1_n_2\,
      CO(0) => \dac_data4__8_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_0,
      DI(2) => sine_rom_inst_n_1,
      DI(1) => sine_rom_inst_n_2,
      DI(0) => sine_rom_inst_n_3,
      O(3 downto 0) => \NLW_dac_data4__8_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \dac_data4__8_carry__1_i_5_n_0\,
      S(2) => \dac_data4__8_carry__1_i_6_n_0\,
      S(1) => sine_rom_inst_n_238,
      S(0) => sine_rom_inst_n_239
    );
\dac_data4__8_carry__1_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(9),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__0_n_5\,
      O => \dac_data4__8_carry__1_i_10_n_0\
    );
\dac_data4__8_carry__1_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => \dac_data6__90_carry__0_n_4\,
      I1 => dac_data6(10),
      I2 => \dac_data6__0_carry_n_5\,
      I3 => \dac_data6__90_carry__2_n_6\,
      I4 => dac_data6(2),
      O => \dac_data4__8_carry__1_i_11_n_0\
    );
\dac_data4__8_carry__1_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(1),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__0_carry_n_6\,
      O => \dac_data4__8_carry__1_i_12_n_0\
    );
\dac_data4__8_carry__1_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(8),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__0_n_6\,
      O => \dac_data4__8_carry__1_i_13_n_0\
    );
\dac_data4__8_carry__1_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5FFA7777A0058888"
    )
        port map (
      I0 => \dac_data4__8_carry__1_i_10_n_0\,
      I1 => \dac_data6__0_carry_n_6\,
      I2 => dac_data6(1),
      I3 => sine_rom_inst_n_4,
      I4 => \dac_data6__90_carry__2_n_6\,
      I5 => \dac_data4__8_carry__1_i_11_n_0\,
      O => \dac_data4__8_carry__1_i_5_n_0\
    );
\dac_data4__8_carry__1_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9699696669666966"
    )
        port map (
      I0 => \dac_data4__8_carry__1_i_10_n_0\,
      I1 => \dac_data4__8_carry__1_i_12_n_0\,
      I2 => sine_rom_inst_n_4,
      I3 => \dac_data6__90_carry__2_n_6\,
      I4 => \dac_data6__0_carry_n_7\,
      I5 => \dac_data4__8_carry__1_i_13_n_0\,
      O => \dac_data4__8_carry__1_i_6_n_0\
    );
\dac_data4__8_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__8_carry__1_n_0\,
      CO(3) => \dac_data4__8_carry__2_n_0\,
      CO(2) => \dac_data4__8_carry__2_n_1\,
      CO(1) => \dac_data4__8_carry__2_n_2\,
      CO(0) => \dac_data4__8_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_83,
      DI(2) => sine_rom_inst_n_84,
      DI(1) => sine_rom_inst_n_85,
      DI(0) => sine_rom_inst_n_86,
      O(3 downto 0) => \NLW_dac_data4__8_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => sine_rom_inst_n_241,
      S(2) => sine_rom_inst_n_242,
      S(1) => \dac_data4__8_carry__2_i_7_n_0\,
      S(0) => \dac_data4__8_carry__2_i_8_n_0\
    );
\dac_data4__8_carry__2_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(12),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__1_n_6\,
      O => \dac_data4__8_carry__2_i_11_n_0\
    );
\dac_data4__8_carry__2_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(11),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__1_n_7\,
      O => \dac_data4__8_carry__2_i_13_n_0\
    );
\dac_data4__8_carry__2_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => \dac_data6__90_carry__1_n_6\,
      I1 => dac_data6(12),
      I2 => \dac_data6__90_carry_n_6\,
      I3 => \dac_data6__90_carry__2_n_6\,
      I4 => dac_data6(4),
      O => \dac_data4__8_carry__2_i_14_n_0\
    );
\dac_data4__8_carry__2_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(10),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__0_n_4\,
      O => \dac_data4__8_carry__2_i_15_n_0\
    );
\dac_data4__8_carry__2_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => \dac_data6__90_carry__1_n_7\,
      I1 => dac_data6(11),
      I2 => \dac_data6__90_carry_n_7\,
      I3 => \dac_data6__90_carry__2_n_6\,
      I4 => dac_data6(3),
      O => \dac_data4__8_carry__2_i_16_n_0\
    );
\dac_data4__8_carry__2_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5FFA7777A0058888"
    )
        port map (
      I0 => \dac_data4__8_carry__2_i_13_n_0\,
      I1 => \dac_data6__90_carry_n_7\,
      I2 => dac_data6(3),
      I3 => sine_rom_inst_n_4,
      I4 => \dac_data6__90_carry__2_n_6\,
      I5 => \dac_data4__8_carry__2_i_14_n_0\,
      O => \dac_data4__8_carry__2_i_7_n_0\
    );
\dac_data4__8_carry__2_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5FFA7777A0058888"
    )
        port map (
      I0 => \dac_data4__8_carry__2_i_15_n_0\,
      I1 => \dac_data6__0_carry_n_5\,
      I2 => dac_data6(2),
      I3 => sine_rom_inst_n_4,
      I4 => \dac_data6__90_carry__2_n_6\,
      I5 => \dac_data4__8_carry__2_i_16_n_0\,
      O => \dac_data4__8_carry__2_i_8_n_0\
    );
\dac_data4__8_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__8_carry__2_n_0\,
      CO(3) => \dac_data4__8_carry__3_n_0\,
      CO(2) => \dac_data4__8_carry__3_n_1\,
      CO(1) => \dac_data4__8_carry__3_n_2\,
      CO(0) => \dac_data4__8_carry__3_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_87,
      DI(2) => sine_rom_inst_n_88,
      DI(1) => sine_rom_inst_n_89,
      DI(0) => sine_rom_inst_n_90,
      O(3) => \dac_data4__8_carry__3_n_4\,
      O(2) => \dac_data4__8_carry__3_n_5\,
      O(1) => \dac_data4__8_carry__3_n_6\,
      O(0) => \NLW_dac_data4__8_carry__3_O_UNCONNECTED\(0),
      S(3) => sine_rom_inst_n_13,
      S(2) => sine_rom_inst_n_14,
      S(1) => sine_rom_inst_n_15,
      S(0) => sine_rom_inst_n_16
    );
\dac_data4__8_carry__3_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(7),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__0_n_7\,
      O => \dac_data4__8_carry__3_i_10_n_0\
    );
\dac_data4__8_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__8_carry__3_n_0\,
      CO(3) => \dac_data4__8_carry__4_n_0\,
      CO(2) => \dac_data4__8_carry__4_n_1\,
      CO(1) => \dac_data4__8_carry__4_n_2\,
      CO(0) => \dac_data4__8_carry__4_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_187,
      DI(2) => sine_rom_inst_n_188,
      DI(1) => sine_rom_inst_n_189,
      DI(0) => sine_rom_inst_n_190,
      O(3) => \dac_data4__8_carry__4_n_4\,
      O(2) => \dac_data4__8_carry__4_n_5\,
      O(1) => \dac_data4__8_carry__4_n_6\,
      O(0) => \dac_data4__8_carry__4_n_7\,
      S(3) => sine_rom_inst_n_9,
      S(2) => sine_rom_inst_n_10,
      S(1) => sine_rom_inst_n_11,
      S(0) => sine_rom_inst_n_12
    );
\dac_data4__8_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__8_carry__4_n_0\,
      CO(3) => \dac_data4__8_carry__5_n_0\,
      CO(2) => \dac_data4__8_carry__5_n_1\,
      CO(1) => \dac_data4__8_carry__5_n_2\,
      CO(0) => \dac_data4__8_carry__5_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_91,
      DI(2) => sine_rom_inst_n_92,
      DI(1) => sine_rom_inst_n_93,
      DI(0) => sine_rom_inst_n_94,
      O(3) => \dac_data4__8_carry__5_n_4\,
      O(2) => \dac_data4__8_carry__5_n_5\,
      O(1) => \dac_data4__8_carry__5_n_6\,
      O(0) => \dac_data4__8_carry__5_n_7\,
      S(3) => sine_rom_inst_n_23,
      S(2) => sine_rom_inst_n_24,
      S(1) => sine_rom_inst_n_25,
      S(0) => sine_rom_inst_n_26
    );
\dac_data4__8_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data4__8_carry__5_n_0\,
      CO(3) => \dac_data4__8_carry__6_n_0\,
      CO(2) => \dac_data4__8_carry__6_n_1\,
      CO(1) => \dac_data4__8_carry__6_n_2\,
      CO(0) => \dac_data4__8_carry__6_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_195,
      DI(2) => sine_rom_inst_n_196,
      DI(1) => sine_rom_inst_n_197,
      DI(0) => sine_rom_inst_n_198,
      O(3) => \dac_data4__8_carry__6_n_4\,
      O(2) => \dac_data4__8_carry__6_n_5\,
      O(1) => \dac_data4__8_carry__6_n_6\,
      O(0) => \dac_data4__8_carry__6_n_7\,
      S(3) => sine_rom_inst_n_191,
      S(2) => sine_rom_inst_n_192,
      S(1) => sine_rom_inst_n_193,
      S(0) => sine_rom_inst_n_194
    );
\dac_data4__8_carry_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(10),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__0_n_4\,
      O => \dac_data4__8_carry_i_1_n_0\
    );
\dac_data4__8_carry_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(9),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__0_n_5\,
      O => \dac_data4__8_carry_i_2_n_0\
    );
\dac_data4__8_carry_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(8),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__0_n_6\,
      O => \dac_data4__8_carry_i_3_n_0\
    );
\dac_data4__8_carry_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => \dac_data6__90_carry__0_n_4\,
      I1 => dac_data6(10),
      I2 => \dac_data6__0_carry_n_5\,
      I3 => \dac_data6__90_carry__2_n_6\,
      I4 => dac_data6(2),
      O => \dac_data4__8_carry_i_4_n_0\
    );
\dac_data4__8_carry_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => \dac_data6__90_carry__0_n_5\,
      I1 => dac_data6(9),
      I2 => \dac_data6__0_carry_n_6\,
      I3 => \dac_data6__90_carry__2_n_6\,
      I4 => dac_data6(1),
      O => \dac_data4__8_carry_i_5_n_0\
    );
\dac_data4__8_carry_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dac_data6(7),
      I1 => \dac_data6__90_carry__2_n_6\,
      I2 => \dac_data6__90_carry__0_n_7\,
      O => \dac_data4__8_carry_i_7_n_0\
    );
\dac_data6__0_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \dac_data6__0_carry_n_0\,
      CO(2) => \dac_data6__0_carry_n_1\,
      CO(1) => \dac_data6__0_carry_n_2\,
      CO(0) => \dac_data6__0_carry_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_40,
      DI(2) => sine_rom_inst_n_41,
      DI(1) => sine_rom_inst_n_42,
      DI(0) => '0',
      O(3) => \dac_data6__0_carry_n_4\,
      O(2) => \dac_data6__0_carry_n_5\,
      O(1) => \dac_data6__0_carry_n_6\,
      O(0) => \dac_data6__0_carry_n_7\,
      S(3) => sine_rom_inst_n_45,
      S(2) => sine_rom_inst_n_46,
      S(1) => sine_rom_inst_n_47,
      S(0) => sine_rom_inst_n_48
    );
\dac_data6__0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data6__0_carry_n_0\,
      CO(3) => \dac_data6__0_carry__0_n_0\,
      CO(2) => \dac_data6__0_carry__0_n_1\,
      CO(1) => \dac_data6__0_carry__0_n_2\,
      CO(0) => \dac_data6__0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_36,
      DI(2) => sine_rom_inst_n_37,
      DI(1) => sine_rom_inst_n_38,
      DI(0) => sine_rom_inst_n_39,
      O(3) => \dac_data6__0_carry__0_n_4\,
      O(2) => \dac_data6__0_carry__0_n_5\,
      O(1) => \dac_data6__0_carry__0_n_6\,
      O(0) => \dac_data6__0_carry__0_n_7\,
      S(3) => sine_rom_inst_n_214,
      S(2) => sine_rom_inst_n_215,
      S(1) => sine_rom_inst_n_216,
      S(0) => sine_rom_inst_n_217
    );
\dac_data6__0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data6__0_carry__0_n_0\,
      CO(3) => \NLW_dac_data6__0_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \dac_data6__0_carry__1_n_1\,
      CO(1) => \NLW_dac_data6__0_carry__1_CO_UNCONNECTED\(1),
      CO(0) => \dac_data6__0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => sine_rom_inst_n_43,
      DI(0) => sine_rom_inst_n_44,
      O(3 downto 2) => \NLW_dac_data6__0_carry__1_O_UNCONNECTED\(3 downto 2),
      O(1) => \dac_data6__0_carry__1_n_6\,
      O(0) => \dac_data6__0_carry__1_n_7\,
      S(3 downto 2) => B"01",
      S(1) => sine_rom_inst_n_218,
      S(0) => sine_rom_inst_n_219
    );
\dac_data6__30_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \dac_data6__30_carry_n_0\,
      CO(2) => \dac_data6__30_carry_n_1\,
      CO(1) => \dac_data6__30_carry_n_2\,
      CO(0) => \dac_data6__30_carry_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_53,
      DI(2) => sine_rom_inst_n_54,
      DI(1) => sine_rom_inst_n_55,
      DI(0) => '0',
      O(3) => \dac_data6__30_carry_n_4\,
      O(2) => \dac_data6__30_carry_n_5\,
      O(1) => \dac_data6__30_carry_n_6\,
      O(0) => \dac_data6__30_carry_n_7\,
      S(3) => sine_rom_inst_n_58,
      S(2) => sine_rom_inst_n_59,
      S(1) => sine_rom_inst_n_60,
      S(0) => sine_rom_inst_n_61
    );
\dac_data6__30_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data6__30_carry_n_0\,
      CO(3) => \dac_data6__30_carry__0_n_0\,
      CO(2) => \dac_data6__30_carry__0_n_1\,
      CO(1) => \dac_data6__30_carry__0_n_2\,
      CO(0) => \dac_data6__30_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_49,
      DI(2) => sine_rom_inst_n_50,
      DI(1) => sine_rom_inst_n_51,
      DI(0) => sine_rom_inst_n_52,
      O(3) => \dac_data6__30_carry__0_n_4\,
      O(2) => \dac_data6__30_carry__0_n_5\,
      O(1) => \dac_data6__30_carry__0_n_6\,
      O(0) => \dac_data6__30_carry__0_n_7\,
      S(3) => sine_rom_inst_n_220,
      S(2) => sine_rom_inst_n_221,
      S(1) => sine_rom_inst_n_222,
      S(0) => sine_rom_inst_n_223
    );
\dac_data6__30_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data6__30_carry__0_n_0\,
      CO(3) => \NLW_dac_data6__30_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \dac_data6__30_carry__1_n_1\,
      CO(1) => \NLW_dac_data6__30_carry__1_CO_UNCONNECTED\(1),
      CO(0) => \dac_data6__30_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => sine_rom_inst_n_56,
      DI(0) => sine_rom_inst_n_57,
      O(3 downto 2) => \NLW_dac_data6__30_carry__1_O_UNCONNECTED\(3 downto 2),
      O(1) => \dac_data6__30_carry__1_n_6\,
      O(0) => \dac_data6__30_carry__1_n_7\,
      S(3 downto 2) => B"01",
      S(1) => sine_rom_inst_n_224,
      S(0) => sine_rom_inst_n_225
    );
\dac_data6__59_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \dac_data6__59_carry_n_0\,
      CO(2) => \dac_data6__59_carry_n_1\,
      CO(1) => \dac_data6__59_carry_n_2\,
      CO(0) => \dac_data6__59_carry_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_62,
      DI(2) => sine_rom_inst_n_63,
      DI(1) => sine_rom_inst_n_64,
      DI(0) => '0',
      O(3) => \dac_data6__59_carry_n_4\,
      O(2) => \dac_data6__59_carry_n_5\,
      O(1) => \dac_data6__59_carry_n_6\,
      O(0) => \dac_data6__59_carry_n_7\,
      S(3) => sine_rom_inst_n_5,
      S(2) => sine_rom_inst_n_6,
      S(1) => sine_rom_inst_n_7,
      S(0) => sine_rom_inst_n_8
    );
\dac_data6__59_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data6__59_carry_n_0\,
      CO(3) => \dac_data6__59_carry__0_n_0\,
      CO(2) => \dac_data6__59_carry__0_n_1\,
      CO(1) => \dac_data6__59_carry__0_n_2\,
      CO(0) => \dac_data6__59_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_65,
      DI(2) => sine_rom_inst_n_66,
      DI(1) => sine_rom_inst_n_67,
      DI(0) => sine_rom_inst_n_68,
      O(3) => \dac_data6__59_carry__0_n_4\,
      O(2) => \dac_data6__59_carry__0_n_5\,
      O(1) => \dac_data6__59_carry__0_n_6\,
      O(0) => \dac_data6__59_carry__0_n_7\,
      S(3) => sine_rom_inst_n_226,
      S(2) => sine_rom_inst_n_227,
      S(1) => sine_rom_inst_n_228,
      S(0) => sine_rom_inst_n_229
    );
\dac_data6__59_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data6__59_carry__0_n_0\,
      CO(3 downto 2) => \NLW_dac_data6__59_carry__1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \dac_data6__59_carry__1_n_2\,
      CO(0) => \dac_data6__59_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => sine_rom_inst_n_69,
      O(3) => \NLW_dac_data6__59_carry__1_O_UNCONNECTED\(3),
      O(2) => \dac_data6__59_carry__1_n_5\,
      O(1) => \dac_data6__59_carry__1_n_6\,
      O(0) => \dac_data6__59_carry__1_n_7\,
      S(3 downto 2) => B"01",
      S(1) => sine_rom_inst_n_70,
      S(0) => sine_rom_inst_n_71
    );
\dac_data6__90_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \dac_data6__90_carry_n_0\,
      CO(2) => \dac_data6__90_carry_n_1\,
      CO(1) => \dac_data6__90_carry_n_2\,
      CO(0) => \dac_data6__90_carry_n_3\,
      CYINIT => '0',
      DI(3) => \dac_data6__90_carry_i_1_n_0\,
      DI(2) => \dac_data6__90_carry_i_2_n_0\,
      DI(1) => \dac_data6__90_carry_i_3_n_0\,
      DI(0) => '0',
      O(3) => \dac_data6__90_carry_n_4\,
      O(2) => \dac_data6__90_carry_n_5\,
      O(1) => \dac_data6__90_carry_n_6\,
      O(0) => \dac_data6__90_carry_n_7\,
      S(3) => \dac_data6__90_carry_i_4_n_0\,
      S(2) => \dac_data6__90_carry_i_5_n_0\,
      S(1) => \dac_data6__90_carry_i_6_n_0\,
      S(0) => \dac_data6__90_carry_i_7_n_0\
    );
\dac_data6__90_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data6__90_carry_n_0\,
      CO(3) => \dac_data6__90_carry__0_n_0\,
      CO(2) => \dac_data6__90_carry__0_n_1\,
      CO(1) => \dac_data6__90_carry__0_n_2\,
      CO(0) => \dac_data6__90_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_72,
      DI(2) => sine_rom_inst_n_73,
      DI(1) => sine_rom_inst_n_74,
      DI(0) => \dac_data6__90_carry__0_i_4_n_0\,
      O(3) => \dac_data6__90_carry__0_n_4\,
      O(2) => \dac_data6__90_carry__0_n_5\,
      O(1) => \dac_data6__90_carry__0_n_6\,
      O(0) => \dac_data6__90_carry__0_n_7\,
      S(3) => sine_rom_inst_n_230,
      S(2) => sine_rom_inst_n_231,
      S(1) => sine_rom_inst_n_232,
      S(0) => \dac_data6__90_carry__0_i_8_n_0\
    );
\dac_data6__90_carry__0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \dac_data6__59_carry_n_6\,
      I1 => \dac_data6__30_carry__0_n_7\,
      I2 => \dac_data6__0_carry__0_n_4\,
      O => \dac_data6__90_carry__0_i_4_n_0\
    );
\dac_data6__90_carry__0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9696966996696969"
    )
        port map (
      I0 => \dac_data6__0_carry__0_n_4\,
      I1 => \dac_data6__30_carry__0_n_7\,
      I2 => \dac_data6__59_carry_n_6\,
      I3 => \dac_data6__30_carry_n_4\,
      I4 => \dac_data6__59_carry_n_7\,
      I5 => \dac_data6__0_carry__0_n_5\,
      O => \dac_data6__90_carry__0_i_8_n_0\
    );
\dac_data6__90_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data6__90_carry__0_n_0\,
      CO(3) => \dac_data6__90_carry__1_n_0\,
      CO(2) => \dac_data6__90_carry__1_n_1\,
      CO(1) => \dac_data6__90_carry__1_n_2\,
      CO(0) => \dac_data6__90_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => sine_rom_inst_n_75,
      DI(2) => sine_rom_inst_n_76,
      DI(1) => sine_rom_inst_n_77,
      DI(0) => sine_rom_inst_n_78,
      O(3) => \dac_data6__90_carry__1_n_4\,
      O(2) => \dac_data6__90_carry__1_n_5\,
      O(1) => \dac_data6__90_carry__1_n_6\,
      O(0) => \dac_data6__90_carry__1_n_7\,
      S(3) => sine_rom_inst_n_233,
      S(2) => sine_rom_inst_n_234,
      S(1) => sine_rom_inst_n_235,
      S(0) => sine_rom_inst_n_236
    );
\dac_data6__90_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \dac_data6__90_carry__1_n_0\,
      CO(3 downto 1) => \NLW_dac_data6__90_carry__2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \dac_data6__90_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \dac_data6__59_carry__1_n_6\,
      O(3 downto 2) => \NLW_dac_data6__90_carry__2_O_UNCONNECTED\(3 downto 2),
      O(1) => \dac_data6__90_carry__2_n_6\,
      O(0) => \dac_data6__90_carry__2_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \dac_data6__59_carry__1_n_5\,
      S(0) => sine_rom_inst_n_237
    );
\dac_data6__90_carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \dac_data6__30_carry_n_5\,
      I1 => \dac_data6__0_carry__0_n_6\,
      O => \dac_data6__90_carry_i_1_n_0\
    );
\dac_data6__90_carry_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \dac_data6__30_carry_n_6\,
      I1 => \dac_data6__0_carry__0_n_7\,
      O => \dac_data6__90_carry_i_2_n_0\
    );
\dac_data6__90_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \dac_data6__30_carry_n_7\,
      I1 => \dac_data6__0_carry_n_4\,
      O => \dac_data6__90_carry_i_3_n_0\
    );
\dac_data6__90_carry_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \dac_data6__90_carry_i_1_n_0\,
      I1 => \dac_data6__30_carry_n_4\,
      I2 => \dac_data6__59_carry_n_7\,
      I3 => \dac_data6__0_carry__0_n_5\,
      O => \dac_data6__90_carry_i_4_n_0\
    );
\dac_data6__90_carry_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9666"
    )
        port map (
      I0 => \dac_data6__30_carry_n_5\,
      I1 => \dac_data6__0_carry__0_n_6\,
      I2 => \dac_data6__0_carry__0_n_7\,
      I3 => \dac_data6__30_carry_n_6\,
      O => \dac_data6__90_carry_i_5_n_0\
    );
\dac_data6__90_carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \dac_data6__0_carry_n_4\,
      I1 => \dac_data6__30_carry_n_7\,
      I2 => \dac_data6__30_carry_n_6\,
      I3 => \dac_data6__0_carry__0_n_7\,
      O => \dac_data6__90_carry_i_6_n_0\
    );
\dac_data6__90_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \dac_data6__0_carry_n_4\,
      I1 => \dac_data6__30_carry_n_7\,
      O => \dac_data6__90_carry_i_7_n_0\
    );
\dac_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => p_1_in(0),
      Q => Q(0),
      R => sine_rom_inst_n_184
    );
\dac_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => p_1_in(1),
      Q => Q(1),
      R => sine_rom_inst_n_184
    );
\dac_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => p_1_in(2),
      Q => Q(2),
      R => sine_rom_inst_n_184
    );
\dac_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => p_1_in(3),
      Q => Q(3),
      R => sine_rom_inst_n_184
    );
\dac_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => p_1_in(4),
      Q => Q(4),
      R => sine_rom_inst_n_184
    );
\dac_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => p_1_in(5),
      Q => Q(5),
      R => sine_rom_inst_n_184
    );
\dac_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => p_1_in(6),
      Q => Q(6),
      R => sine_rom_inst_n_184
    );
\dac_data_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => dac_clk_out,
      CE => '1',
      D => p_1_in(7),
      Q => Q(7),
      S => \^ss\(0)
    );
\i__carry__0_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \dac_data2_carry__3_n_5\,
      I1 => \dac_data2_carry__3_n_4\,
      O => \i__carry__0_i_1__0_n_0\
    );
\i__carry__0_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__90_carry__0_n_6\,
      O => p_0_out(8)
    );
\i__carry__0_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \dac_data2_carry__3_n_7\,
      I1 => \dac_data2_carry__3_n_6\,
      O => \i__carry__0_i_2__0_n_0\
    );
\i__carry__0_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__90_carry__0_n_7\,
      O => p_0_out(7)
    );
\i__carry__0_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \dac_data2_carry__2_n_5\,
      I1 => \dac_data2_carry__2_n_4\,
      O => \i__carry__0_i_3__0_n_0\
    );
\i__carry__0_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__90_carry_n_4\,
      O => p_0_out(6)
    );
\i__carry__0_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \dac_data2_carry__2_n_7\,
      I1 => \dac_data2_carry__2_n_6\,
      O => \i__carry__0_i_4__0_n_0\
    );
\i__carry__0_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__90_carry_n_5\,
      O => p_0_out(5)
    );
\i__carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data2_carry__3_n_4\,
      I1 => \dac_data2_carry__3_n_5\,
      O => \i__carry__0_i_5_n_0\
    );
\i__carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data2_carry__3_n_6\,
      I1 => \dac_data2_carry__3_n_7\,
      O => \i__carry__0_i_6_n_0\
    );
\i__carry__0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data2_carry__2_n_4\,
      I1 => \dac_data2_carry__2_n_5\,
      O => \i__carry__0_i_7_n_0\
    );
\i__carry__0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data2_carry__2_n_6\,
      I1 => \dac_data2_carry__2_n_7\,
      O => \i__carry__0_i_8_n_0\
    );
\i__carry__1_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__90_carry__1_n_6\,
      O => p_0_out(12)
    );
\i__carry__1_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \dac_data2_carry__4_n_5\,
      I1 => \dac_data2_carry__4_n_4\,
      O => \i__carry__1_i_2__0_n_0\
    );
\i__carry__1_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__90_carry__1_n_7\,
      O => p_0_out(11)
    );
\i__carry__1_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \dac_data2_carry__4_n_7\,
      I1 => \dac_data2_carry__4_n_6\,
      O => \i__carry__1_i_3__0_n_0\
    );
\i__carry__1_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__90_carry__0_n_4\,
      O => p_0_out(10)
    );
\i__carry__1_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__90_carry__0_n_5\,
      O => p_0_out(9)
    );
\i__carry__1_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data2_carry__4_n_4\,
      I1 => \dac_data2_carry__4_n_5\,
      O => \i__carry__1_i_5_n_0\
    );
\i__carry__1_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data2_carry__4_n_6\,
      I1 => \dac_data2_carry__4_n_7\,
      O => \i__carry__1_i_6_n_0\
    );
\i__carry__2_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__90_carry__1_n_4\,
      O => p_0_out(14)
    );
\i__carry__2_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__90_carry__1_n_5\,
      O => p_0_out(13)
    );
\i__carry_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__0_carry_n_7\,
      O => p_0_out(0)
    );
\i__carry_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => dac_data2_carry_n_4,
      I1 => dac_data2_carry_n_5,
      O => \i__carry_i_1__1_n_0\
    );
\i__carry_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \dac_data2_carry__1_n_5\,
      I1 => \dac_data2_carry__1_n_4\,
      O => \i__carry_i_2__0_n_0\
    );
\i__carry_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__90_carry_n_6\,
      O => p_0_out(4)
    );
\i__carry_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \dac_data2_carry__1_n_7\,
      I1 => \dac_data2_carry__1_n_6\,
      O => \i__carry_i_3__0_n_0\
    );
\i__carry_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__90_carry_n_7\,
      O => p_0_out(3)
    );
\i__carry_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \dac_data2_carry__0_n_5\,
      I1 => \dac_data2_carry__0_n_4\,
      O => \i__carry_i_4__0_n_0\
    );
\i__carry_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__0_carry_n_5\,
      O => p_0_out(2)
    );
\i__carry_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \dac_data2_carry__0_n_7\,
      I1 => \dac_data2_carry__0_n_6\,
      O => \i__carry_i_5__0_n_0\
    );
\i__carry_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data6__0_carry_n_6\,
      O => p_0_out(1)
    );
\i__carry_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data2_carry__1_n_4\,
      I1 => \dac_data2_carry__1_n_5\,
      O => \i__carry_i_6_n_0\
    );
\i__carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data2_carry__1_n_6\,
      I1 => \dac_data2_carry__1_n_7\,
      O => \i__carry_i_7_n_0\
    );
\i__carry_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data2_carry__0_n_4\,
      I1 => \dac_data2_carry__0_n_5\,
      O => \i__carry_i_8_n_0\
    );
\i__carry_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dac_data2_carry__0_n_6\,
      I1 => \dac_data2_carry__0_n_7\,
      O => \i__carry_i_9_n_0\
    );
\phase_acc[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(3),
      I1 => phase_acc_reg(3),
      O => \phase_acc[0]_i_2_n_0\
    );
\phase_acc[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(2),
      I1 => phase_acc_reg(2),
      O => \phase_acc[0]_i_3_n_0\
    );
\phase_acc[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(1),
      I1 => phase_acc_reg(1),
      O => \phase_acc[0]_i_4_n_0\
    );
\phase_acc[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(0),
      I1 => phase_acc_reg(0),
      O => \phase_acc[0]_i_5_n_0\
    );
\phase_acc[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(15),
      I1 => phase_acc_reg(15),
      O => \phase_acc[12]_i_2_n_0\
    );
\phase_acc[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(14),
      I1 => phase_acc_reg(14),
      O => \phase_acc[12]_i_3_n_0\
    );
\phase_acc[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(13),
      I1 => phase_acc_reg(13),
      O => \phase_acc[12]_i_4_n_0\
    );
\phase_acc[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(12),
      I1 => phase_acc_reg(12),
      O => \phase_acc[12]_i_5_n_0\
    );
\phase_acc[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(19),
      I1 => phase_acc_reg(19),
      O => \phase_acc[16]_i_2_n_0\
    );
\phase_acc[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(18),
      I1 => phase_acc_reg(18),
      O => \phase_acc[16]_i_3_n_0\
    );
\phase_acc[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(17),
      I1 => phase_acc_reg(17),
      O => \phase_acc[16]_i_4_n_0\
    );
\phase_acc[16]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(16),
      I1 => phase_acc_reg(16),
      O => \phase_acc[16]_i_5_n_0\
    );
\phase_acc[20]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(23),
      I1 => phase_acc_reg(23),
      O => \phase_acc[20]_i_2_n_0\
    );
\phase_acc[20]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(22),
      I1 => phase_acc_reg(22),
      O => \phase_acc[20]_i_3_n_0\
    );
\phase_acc[20]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(21),
      I1 => phase_acc_reg(21),
      O => \phase_acc[20]_i_4_n_0\
    );
\phase_acc[20]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(20),
      I1 => phase_acc_reg(20),
      O => \phase_acc[20]_i_5_n_0\
    );
\phase_acc[24]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(27),
      I1 => phase_acc_reg(27),
      O => \phase_acc[24]_i_2_n_0\
    );
\phase_acc[24]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(26),
      I1 => phase_acc_reg(26),
      O => \phase_acc[24]_i_3_n_0\
    );
\phase_acc[24]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(25),
      I1 => phase_acc_reg(25),
      O => \phase_acc[24]_i_4_n_0\
    );
\phase_acc[24]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(24),
      I1 => phase_acc_reg(24),
      O => \phase_acc[24]_i_5_n_0\
    );
\phase_acc[28]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(31),
      I1 => phase_acc_reg(31),
      O => \phase_acc[28]_i_2_n_0\
    );
\phase_acc[28]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(30),
      I1 => phase_acc_reg(30),
      O => \phase_acc[28]_i_3_n_0\
    );
\phase_acc[28]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(29),
      I1 => phase_acc_reg(29),
      O => \phase_acc[28]_i_4_n_0\
    );
\phase_acc[28]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(28),
      I1 => phase_acc_reg(28),
      O => \phase_acc[28]_i_5_n_0\
    );
\phase_acc[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(7),
      I1 => phase_acc_reg(7),
      O => \phase_acc[4]_i_2_n_0\
    );
\phase_acc[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(6),
      I1 => phase_acc_reg(6),
      O => \phase_acc[4]_i_3_n_0\
    );
\phase_acc[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(5),
      I1 => phase_acc_reg(5),
      O => \phase_acc[4]_i_4_n_0\
    );
\phase_acc[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(4),
      I1 => phase_acc_reg(4),
      O => \phase_acc[4]_i_5_n_0\
    );
\phase_acc[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(11),
      I1 => phase_acc_reg(11),
      O => \phase_acc[8]_i_2_n_0\
    );
\phase_acc[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(10),
      I1 => phase_acc_reg(10),
      O => \phase_acc[8]_i_3_n_0\
    );
\phase_acc[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(9),
      I1 => phase_acc_reg(9),
      O => \phase_acc[8]_i_4_n_0\
    );
\phase_acc[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_inc(8),
      I1 => phase_acc_reg(8),
      O => \phase_acc[8]_i_5_n_0\
    );
\phase_acc_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[0]_i_1_n_7\,
      Q => phase_acc_reg(0),
      R => \^ss\(0)
    );
\phase_acc_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \phase_acc_reg[0]_i_1_n_0\,
      CO(2) => \phase_acc_reg[0]_i_1_n_1\,
      CO(1) => \phase_acc_reg[0]_i_1_n_2\,
      CO(0) => \phase_acc_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_inc(3 downto 0),
      O(3) => \phase_acc_reg[0]_i_1_n_4\,
      O(2) => \phase_acc_reg[0]_i_1_n_5\,
      O(1) => \phase_acc_reg[0]_i_1_n_6\,
      O(0) => \phase_acc_reg[0]_i_1_n_7\,
      S(3) => \phase_acc[0]_i_2_n_0\,
      S(2) => \phase_acc[0]_i_3_n_0\,
      S(1) => \phase_acc[0]_i_4_n_0\,
      S(0) => \phase_acc[0]_i_5_n_0\
    );
\phase_acc_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[8]_i_1_n_5\,
      Q => phase_acc_reg(10),
      R => \^ss\(0)
    );
\phase_acc_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[8]_i_1_n_4\,
      Q => phase_acc_reg(11),
      R => \^ss\(0)
    );
\phase_acc_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[12]_i_1_n_7\,
      Q => phase_acc_reg(12),
      R => \^ss\(0)
    );
\phase_acc_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_acc_reg[8]_i_1_n_0\,
      CO(3) => \phase_acc_reg[12]_i_1_n_0\,
      CO(2) => \phase_acc_reg[12]_i_1_n_1\,
      CO(1) => \phase_acc_reg[12]_i_1_n_2\,
      CO(0) => \phase_acc_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_inc(15 downto 12),
      O(3) => \phase_acc_reg[12]_i_1_n_4\,
      O(2) => \phase_acc_reg[12]_i_1_n_5\,
      O(1) => \phase_acc_reg[12]_i_1_n_6\,
      O(0) => \phase_acc_reg[12]_i_1_n_7\,
      S(3) => \phase_acc[12]_i_2_n_0\,
      S(2) => \phase_acc[12]_i_3_n_0\,
      S(1) => \phase_acc[12]_i_4_n_0\,
      S(0) => \phase_acc[12]_i_5_n_0\
    );
\phase_acc_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[12]_i_1_n_6\,
      Q => phase_acc_reg(13),
      R => \^ss\(0)
    );
\phase_acc_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[12]_i_1_n_5\,
      Q => phase_acc_reg(14),
      R => \^ss\(0)
    );
\phase_acc_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[12]_i_1_n_4\,
      Q => phase_acc_reg(15),
      R => \^ss\(0)
    );
\phase_acc_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[16]_i_1_n_7\,
      Q => phase_acc_reg(16),
      R => \^ss\(0)
    );
\phase_acc_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_acc_reg[12]_i_1_n_0\,
      CO(3) => \phase_acc_reg[16]_i_1_n_0\,
      CO(2) => \phase_acc_reg[16]_i_1_n_1\,
      CO(1) => \phase_acc_reg[16]_i_1_n_2\,
      CO(0) => \phase_acc_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_inc(19 downto 16),
      O(3) => \phase_acc_reg[16]_i_1_n_4\,
      O(2) => \phase_acc_reg[16]_i_1_n_5\,
      O(1) => \phase_acc_reg[16]_i_1_n_6\,
      O(0) => \phase_acc_reg[16]_i_1_n_7\,
      S(3) => \phase_acc[16]_i_2_n_0\,
      S(2) => \phase_acc[16]_i_3_n_0\,
      S(1) => \phase_acc[16]_i_4_n_0\,
      S(0) => \phase_acc[16]_i_5_n_0\
    );
\phase_acc_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[16]_i_1_n_6\,
      Q => phase_acc_reg(17),
      R => \^ss\(0)
    );
\phase_acc_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[16]_i_1_n_5\,
      Q => phase_acc_reg(18),
      R => \^ss\(0)
    );
\phase_acc_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[16]_i_1_n_4\,
      Q => phase_acc_reg(19),
      R => \^ss\(0)
    );
\phase_acc_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[0]_i_1_n_6\,
      Q => phase_acc_reg(1),
      R => \^ss\(0)
    );
\phase_acc_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[20]_i_1_n_7\,
      Q => phase_acc_reg(20),
      R => \^ss\(0)
    );
\phase_acc_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_acc_reg[16]_i_1_n_0\,
      CO(3) => \phase_acc_reg[20]_i_1_n_0\,
      CO(2) => \phase_acc_reg[20]_i_1_n_1\,
      CO(1) => \phase_acc_reg[20]_i_1_n_2\,
      CO(0) => \phase_acc_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_inc(23 downto 20),
      O(3) => \phase_acc_reg[20]_i_1_n_4\,
      O(2) => \phase_acc_reg[20]_i_1_n_5\,
      O(1) => \phase_acc_reg[20]_i_1_n_6\,
      O(0) => \phase_acc_reg[20]_i_1_n_7\,
      S(3) => \phase_acc[20]_i_2_n_0\,
      S(2) => \phase_acc[20]_i_3_n_0\,
      S(1) => \phase_acc[20]_i_4_n_0\,
      S(0) => \phase_acc[20]_i_5_n_0\
    );
\phase_acc_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[20]_i_1_n_6\,
      Q => phase_acc_reg(21),
      R => \^ss\(0)
    );
\phase_acc_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[20]_i_1_n_5\,
      Q => phase_acc_reg(22),
      R => \^ss\(0)
    );
\phase_acc_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[20]_i_1_n_4\,
      Q => phase_acc_reg(23),
      R => \^ss\(0)
    );
\phase_acc_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[24]_i_1_n_7\,
      Q => phase_acc_reg(24),
      R => \^ss\(0)
    );
\phase_acc_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_acc_reg[20]_i_1_n_0\,
      CO(3) => \phase_acc_reg[24]_i_1_n_0\,
      CO(2) => \phase_acc_reg[24]_i_1_n_1\,
      CO(1) => \phase_acc_reg[24]_i_1_n_2\,
      CO(0) => \phase_acc_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_inc(27 downto 24),
      O(3) => \phase_acc_reg[24]_i_1_n_4\,
      O(2) => \phase_acc_reg[24]_i_1_n_5\,
      O(1) => \phase_acc_reg[24]_i_1_n_6\,
      O(0) => \phase_acc_reg[24]_i_1_n_7\,
      S(3) => \phase_acc[24]_i_2_n_0\,
      S(2) => \phase_acc[24]_i_3_n_0\,
      S(1) => \phase_acc[24]_i_4_n_0\,
      S(0) => \phase_acc[24]_i_5_n_0\
    );
\phase_acc_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[24]_i_1_n_6\,
      Q => phase_acc_reg(25),
      R => \^ss\(0)
    );
\phase_acc_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[24]_i_1_n_5\,
      Q => phase_acc_reg(26),
      R => \^ss\(0)
    );
\phase_acc_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[24]_i_1_n_4\,
      Q => phase_acc_reg(27),
      R => \^ss\(0)
    );
\phase_acc_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[28]_i_1_n_7\,
      Q => phase_acc_reg(28),
      R => \^ss\(0)
    );
\phase_acc_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_acc_reg[24]_i_1_n_0\,
      CO(3) => \NLW_phase_acc_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \phase_acc_reg[28]_i_1_n_1\,
      CO(1) => \phase_acc_reg[28]_i_1_n_2\,
      CO(0) => \phase_acc_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => phase_inc(30 downto 28),
      O(3) => \phase_acc_reg[28]_i_1_n_4\,
      O(2) => \phase_acc_reg[28]_i_1_n_5\,
      O(1) => \phase_acc_reg[28]_i_1_n_6\,
      O(0) => \phase_acc_reg[28]_i_1_n_7\,
      S(3) => \phase_acc[28]_i_2_n_0\,
      S(2) => \phase_acc[28]_i_3_n_0\,
      S(1) => \phase_acc[28]_i_4_n_0\,
      S(0) => \phase_acc[28]_i_5_n_0\
    );
\phase_acc_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[28]_i_1_n_6\,
      Q => phase_acc_reg(29),
      R => \^ss\(0)
    );
\phase_acc_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[0]_i_1_n_5\,
      Q => phase_acc_reg(2),
      R => \^ss\(0)
    );
\phase_acc_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[28]_i_1_n_5\,
      Q => phase_acc_reg(30),
      R => \^ss\(0)
    );
\phase_acc_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[28]_i_1_n_4\,
      Q => phase_acc_reg(31),
      R => \^ss\(0)
    );
\phase_acc_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[0]_i_1_n_4\,
      Q => phase_acc_reg(3),
      R => \^ss\(0)
    );
\phase_acc_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[4]_i_1_n_7\,
      Q => phase_acc_reg(4),
      R => \^ss\(0)
    );
\phase_acc_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_acc_reg[0]_i_1_n_0\,
      CO(3) => \phase_acc_reg[4]_i_1_n_0\,
      CO(2) => \phase_acc_reg[4]_i_1_n_1\,
      CO(1) => \phase_acc_reg[4]_i_1_n_2\,
      CO(0) => \phase_acc_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_inc(7 downto 4),
      O(3) => \phase_acc_reg[4]_i_1_n_4\,
      O(2) => \phase_acc_reg[4]_i_1_n_5\,
      O(1) => \phase_acc_reg[4]_i_1_n_6\,
      O(0) => \phase_acc_reg[4]_i_1_n_7\,
      S(3) => \phase_acc[4]_i_2_n_0\,
      S(2) => \phase_acc[4]_i_3_n_0\,
      S(1) => \phase_acc[4]_i_4_n_0\,
      S(0) => \phase_acc[4]_i_5_n_0\
    );
\phase_acc_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[4]_i_1_n_6\,
      Q => phase_acc_reg(5),
      R => \^ss\(0)
    );
\phase_acc_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[4]_i_1_n_5\,
      Q => phase_acc_reg(6),
      R => \^ss\(0)
    );
\phase_acc_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[4]_i_1_n_4\,
      Q => phase_acc_reg(7),
      R => \^ss\(0)
    );
\phase_acc_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[8]_i_1_n_7\,
      Q => phase_acc_reg(8),
      R => \^ss\(0)
    );
\phase_acc_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_acc_reg[4]_i_1_n_0\,
      CO(3) => \phase_acc_reg[8]_i_1_n_0\,
      CO(2) => \phase_acc_reg[8]_i_1_n_1\,
      CO(1) => \phase_acc_reg[8]_i_1_n_2\,
      CO(0) => \phase_acc_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_inc(11 downto 8),
      O(3) => \phase_acc_reg[8]_i_1_n_4\,
      O(2) => \phase_acc_reg[8]_i_1_n_5\,
      O(1) => \phase_acc_reg[8]_i_1_n_6\,
      O(0) => \phase_acc_reg[8]_i_1_n_7\,
      S(3) => \phase_acc[8]_i_2_n_0\,
      S(2) => \phase_acc[8]_i_3_n_0\,
      S(1) => \phase_acc[8]_i_4_n_0\,
      S(0) => \phase_acc[8]_i_5_n_0\
    );
\phase_acc_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dac_clk_out,
      CE => enable,
      D => \phase_acc_reg[8]_i_1_n_6\,
      Q => phase_acc_reg(9),
      R => \^ss\(0)
    );
phase_sum_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => phase_sum_carry_n_0,
      CO(2) => phase_sum_carry_n_1,
      CO(1) => phase_sum_carry_n_2,
      CO(0) => phase_sum_carry_n_3,
      CYINIT => '0',
      DI(3 downto 0) => phase_acc_reg(3 downto 0),
      O(3 downto 0) => NLW_phase_sum_carry_O_UNCONNECTED(3 downto 0),
      S(3) => phase_sum_carry_i_1_n_0,
      S(2) => phase_sum_carry_i_2_n_0,
      S(1) => phase_sum_carry_i_3_n_0,
      S(0) => phase_sum_carry_i_4_n_0
    );
\phase_sum_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => phase_sum_carry_n_0,
      CO(3) => \phase_sum_carry__0_n_0\,
      CO(2) => \phase_sum_carry__0_n_1\,
      CO(1) => \phase_sum_carry__0_n_2\,
      CO(0) => \phase_sum_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_acc_reg(7 downto 4),
      O(3 downto 0) => \NLW_phase_sum_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \phase_sum_carry__0_i_1_n_0\,
      S(2) => \phase_sum_carry__0_i_2_n_0\,
      S(1) => \phase_sum_carry__0_i_3_n_0\,
      S(0) => \phase_sum_carry__0_i_4_n_0\
    );
\phase_sum_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(7),
      I1 => phase_ofst(7),
      O => \phase_sum_carry__0_i_1_n_0\
    );
\phase_sum_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(6),
      I1 => phase_ofst(6),
      O => \phase_sum_carry__0_i_2_n_0\
    );
\phase_sum_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(5),
      I1 => phase_ofst(5),
      O => \phase_sum_carry__0_i_3_n_0\
    );
\phase_sum_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(4),
      I1 => phase_ofst(4),
      O => \phase_sum_carry__0_i_4_n_0\
    );
\phase_sum_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_sum_carry__0_n_0\,
      CO(3) => \phase_sum_carry__1_n_0\,
      CO(2) => \phase_sum_carry__1_n_1\,
      CO(1) => \phase_sum_carry__1_n_2\,
      CO(0) => \phase_sum_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_acc_reg(11 downto 8),
      O(3 downto 0) => \NLW_phase_sum_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \phase_sum_carry__1_i_1_n_0\,
      S(2) => \phase_sum_carry__1_i_2_n_0\,
      S(1) => \phase_sum_carry__1_i_3_n_0\,
      S(0) => \phase_sum_carry__1_i_4_n_0\
    );
\phase_sum_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(11),
      I1 => phase_ofst(11),
      O => \phase_sum_carry__1_i_1_n_0\
    );
\phase_sum_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(10),
      I1 => phase_ofst(10),
      O => \phase_sum_carry__1_i_2_n_0\
    );
\phase_sum_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(9),
      I1 => phase_ofst(9),
      O => \phase_sum_carry__1_i_3_n_0\
    );
\phase_sum_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(8),
      I1 => phase_ofst(8),
      O => \phase_sum_carry__1_i_4_n_0\
    );
\phase_sum_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_sum_carry__1_n_0\,
      CO(3) => \phase_sum_carry__2_n_0\,
      CO(2) => \phase_sum_carry__2_n_1\,
      CO(1) => \phase_sum_carry__2_n_2\,
      CO(0) => \phase_sum_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_acc_reg(15 downto 12),
      O(3 downto 0) => \NLW_phase_sum_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \phase_sum_carry__2_i_1_n_0\,
      S(2) => \phase_sum_carry__2_i_2_n_0\,
      S(1) => \phase_sum_carry__2_i_3_n_0\,
      S(0) => \phase_sum_carry__2_i_4_n_0\
    );
\phase_sum_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(15),
      I1 => phase_ofst(15),
      O => \phase_sum_carry__2_i_1_n_0\
    );
\phase_sum_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(14),
      I1 => phase_ofst(14),
      O => \phase_sum_carry__2_i_2_n_0\
    );
\phase_sum_carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(13),
      I1 => phase_ofst(13),
      O => \phase_sum_carry__2_i_3_n_0\
    );
\phase_sum_carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(12),
      I1 => phase_ofst(12),
      O => \phase_sum_carry__2_i_4_n_0\
    );
\phase_sum_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_sum_carry__2_n_0\,
      CO(3) => \phase_sum_carry__3_n_0\,
      CO(2) => \phase_sum_carry__3_n_1\,
      CO(1) => \phase_sum_carry__3_n_2\,
      CO(0) => \phase_sum_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_acc_reg(19 downto 16),
      O(3 downto 0) => \NLW_phase_sum_carry__3_O_UNCONNECTED\(3 downto 0),
      S(3) => \phase_sum_carry__3_i_1_n_0\,
      S(2) => \phase_sum_carry__3_i_2_n_0\,
      S(1) => \phase_sum_carry__3_i_3_n_0\,
      S(0) => \phase_sum_carry__3_i_4_n_0\
    );
\phase_sum_carry__3_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(19),
      I1 => phase_ofst(19),
      O => \phase_sum_carry__3_i_1_n_0\
    );
\phase_sum_carry__3_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(18),
      I1 => phase_ofst(18),
      O => \phase_sum_carry__3_i_2_n_0\
    );
\phase_sum_carry__3_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(17),
      I1 => phase_ofst(17),
      O => \phase_sum_carry__3_i_3_n_0\
    );
\phase_sum_carry__3_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(16),
      I1 => phase_ofst(16),
      O => \phase_sum_carry__3_i_4_n_0\
    );
\phase_sum_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_sum_carry__3_n_0\,
      CO(3) => \phase_sum_carry__4_n_0\,
      CO(2) => \phase_sum_carry__4_n_1\,
      CO(1) => \phase_sum_carry__4_n_2\,
      CO(0) => \phase_sum_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_acc_reg(23 downto 20),
      O(3 downto 0) => \NLW_phase_sum_carry__4_O_UNCONNECTED\(3 downto 0),
      S(3) => \phase_sum_carry__4_i_1_n_0\,
      S(2) => \phase_sum_carry__4_i_2_n_0\,
      S(1) => \phase_sum_carry__4_i_3_n_0\,
      S(0) => \phase_sum_carry__4_i_4_n_0\
    );
\phase_sum_carry__4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(23),
      I1 => phase_ofst(23),
      O => \phase_sum_carry__4_i_1_n_0\
    );
\phase_sum_carry__4_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(22),
      I1 => phase_ofst(22),
      O => \phase_sum_carry__4_i_2_n_0\
    );
\phase_sum_carry__4_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(21),
      I1 => phase_ofst(21),
      O => \phase_sum_carry__4_i_3_n_0\
    );
\phase_sum_carry__4_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(20),
      I1 => phase_ofst(20),
      O => \phase_sum_carry__4_i_4_n_0\
    );
\phase_sum_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_sum_carry__4_n_0\,
      CO(3) => \phase_sum_carry__5_n_0\,
      CO(2) => \phase_sum_carry__5_n_1\,
      CO(1) => \phase_sum_carry__5_n_2\,
      CO(0) => \phase_sum_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_acc_reg(27 downto 24),
      O(3 downto 0) => sel(3 downto 0),
      S(3) => \phase_sum_carry__5_i_1_n_0\,
      S(2) => \phase_sum_carry__5_i_2_n_0\,
      S(1) => \phase_sum_carry__5_i_3_n_0\,
      S(0) => \phase_sum_carry__5_i_4_n_0\
    );
\phase_sum_carry__5_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(27),
      I1 => phase_ofst(27),
      O => \phase_sum_carry__5_i_1_n_0\
    );
\phase_sum_carry__5_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(26),
      I1 => phase_ofst(26),
      O => \phase_sum_carry__5_i_2_n_0\
    );
\phase_sum_carry__5_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(25),
      I1 => phase_ofst(25),
      O => \phase_sum_carry__5_i_3_n_0\
    );
\phase_sum_carry__5_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(24),
      I1 => phase_ofst(24),
      O => \phase_sum_carry__5_i_4_n_0\
    );
\phase_sum_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_sum_carry__5_n_0\,
      CO(3) => \NLW_phase_sum_carry__6_CO_UNCONNECTED\(3),
      CO(2) => \phase_sum_carry__6_n_1\,
      CO(1) => \phase_sum_carry__6_n_2\,
      CO(0) => \phase_sum_carry__6_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => phase_acc_reg(30 downto 28),
      O(3 downto 0) => sel(7 downto 4),
      S(3) => sine_rom_inst_n_32,
      S(2) => sine_rom_inst_n_33,
      S(1) => sine_rom_inst_n_34,
      S(0) => sine_rom_inst_n_35
    );
phase_sum_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(3),
      I1 => phase_ofst(3),
      O => phase_sum_carry_i_1_n_0
    );
phase_sum_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(2),
      I1 => phase_ofst(2),
      O => phase_sum_carry_i_2_n_0
    );
phase_sum_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(1),
      I1 => phase_ofst(1),
      O => phase_sum_carry_i_3_n_0
    );
phase_sum_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_acc_reg(0),
      I1 => phase_ofst(0),
      O => phase_sum_carry_i_4_n_0
    );
\sample_data[7]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset_n,
      O => \^ss\(0)
    );
sine_rom_inst: entity work.system_bd_fra_top_0_0_sine_lut
     port map (
      ADDRARDADDR(7 downto 0) => sel(7 downto 0),
      CO(0) => sine_rom_inst_n_4,
      D(7 downto 0) => p_1_in(7 downto 0),
      DI(3) => sine_rom_inst_n_0,
      DI(2) => sine_rom_inst_n_1,
      DI(1) => sine_rom_inst_n_2,
      DI(0) => sine_rom_inst_n_3,
      O(1) => \dac_data6__90_carry__2_n_6\,
      O(0) => \dac_data6__90_carry__2_n_7\,
      S(3) => sine_rom_inst_n_5,
      S(2) => sine_rom_inst_n_6,
      S(1) => sine_rom_inst_n_7,
      S(0) => sine_rom_inst_n_8,
      SR(0) => sine_rom_inst_n_184,
      \_inferred__1/i__carry\(1) => sine_rom_inst_n_162,
      \_inferred__1/i__carry\(0) => sine_rom_inst_n_163,
      \_inferred__1/i__carry__0\(3) => sine_rom_inst_n_158,
      \_inferred__1/i__carry__0\(2) => sine_rom_inst_n_159,
      \_inferred__1/i__carry__0\(1) => sine_rom_inst_n_160,
      \_inferred__1/i__carry__0\(0) => sine_rom_inst_n_161,
      \_inferred__1/i__carry__0_0\(1) => sine_rom_inst_n_272,
      \_inferred__1/i__carry__0_0\(0) => sine_rom_inst_n_273,
      \_inferred__1/i__carry__1\(3) => sine_rom_inst_n_13,
      \_inferred__1/i__carry__1\(2) => sine_rom_inst_n_14,
      \_inferred__1/i__carry__1\(1) => sine_rom_inst_n_15,
      \_inferred__1/i__carry__1\(0) => sine_rom_inst_n_16,
      \_inferred__1/i__carry__1_0\(3) => sine_rom_inst_n_79,
      \_inferred__1/i__carry__1_0\(2) => sine_rom_inst_n_80,
      \_inferred__1/i__carry__1_0\(1) => sine_rom_inst_n_81,
      \_inferred__1/i__carry__1_0\(0) => sine_rom_inst_n_82,
      \_inferred__1/i__carry__2\(3) => sine_rom_inst_n_9,
      \_inferred__1/i__carry__2\(2) => sine_rom_inst_n_10,
      \_inferred__1/i__carry__2\(1) => sine_rom_inst_n_11,
      \_inferred__1/i__carry__2\(0) => sine_rom_inst_n_12,
      \_inferred__1/i__carry__2_0\(3) => sine_rom_inst_n_154,
      \_inferred__1/i__carry__2_0\(2) => sine_rom_inst_n_155,
      \_inferred__1/i__carry__2_0\(1) => sine_rom_inst_n_156,
      \_inferred__1/i__carry__2_0\(0) => sine_rom_inst_n_157,
      \_inferred__1/i__carry__2_1\(1) => sine_rom_inst_n_238,
      \_inferred__1/i__carry__2_1\(0) => sine_rom_inst_n_239,
      \_inferred__2/i__carry__0\(0) => sine_rom_inst_n_153,
      amplitude(7 downto 0) => amplitude(7 downto 0),
      \amplitude[0]\(3) => sine_rom_inst_n_36,
      \amplitude[0]\(2) => sine_rom_inst_n_37,
      \amplitude[0]\(1) => sine_rom_inst_n_38,
      \amplitude[0]\(0) => sine_rom_inst_n_39,
      \amplitude[0]_0\(2) => sine_rom_inst_n_40,
      \amplitude[0]_0\(1) => sine_rom_inst_n_41,
      \amplitude[0]_0\(0) => sine_rom_inst_n_42,
      \amplitude[1]\(1) => sine_rom_inst_n_43,
      \amplitude[1]\(0) => sine_rom_inst_n_44,
      \amplitude[1]_0\(3) => sine_rom_inst_n_214,
      \amplitude[1]_0\(2) => sine_rom_inst_n_215,
      \amplitude[1]_0\(1) => sine_rom_inst_n_216,
      \amplitude[1]_0\(0) => sine_rom_inst_n_217,
      \amplitude[3]\(3) => sine_rom_inst_n_49,
      \amplitude[3]\(2) => sine_rom_inst_n_50,
      \amplitude[3]\(1) => sine_rom_inst_n_51,
      \amplitude[3]\(0) => sine_rom_inst_n_52,
      \amplitude[3]_0\(2) => sine_rom_inst_n_53,
      \amplitude[3]_0\(1) => sine_rom_inst_n_54,
      \amplitude[3]_0\(0) => sine_rom_inst_n_55,
      \amplitude[4]\(1) => sine_rom_inst_n_56,
      \amplitude[4]\(0) => sine_rom_inst_n_57,
      \amplitude[4]_0\(3) => sine_rom_inst_n_220,
      \amplitude[4]_0\(2) => sine_rom_inst_n_221,
      \amplitude[4]_0\(1) => sine_rom_inst_n_222,
      \amplitude[4]_0\(0) => sine_rom_inst_n_223,
      \amplitude[6]\(2) => sine_rom_inst_n_62,
      \amplitude[6]\(1) => sine_rom_inst_n_63,
      \amplitude[6]\(0) => sine_rom_inst_n_64,
      \amplitude[6]_0\(3) => sine_rom_inst_n_65,
      \amplitude[6]_0\(2) => sine_rom_inst_n_66,
      \amplitude[6]_0\(1) => sine_rom_inst_n_67,
      \amplitude[6]_0\(0) => sine_rom_inst_n_68,
      \amplitude[6]_1\(0) => sine_rom_inst_n_69,
      dac_clk_out => dac_clk_out,
      dac_data2_carry(3) => \dac_data4__8_carry__4_n_4\,
      dac_data2_carry(2) => \dac_data4__8_carry__4_n_5\,
      dac_data2_carry(1) => \dac_data4__8_carry__4_n_6\,
      dac_data2_carry(0) => \dac_data4__8_carry__4_n_7\,
      dac_data2_carry_0(3) => \dac_data4__315_carry__0_n_4\,
      dac_data2_carry_0(2) => \dac_data4__315_carry__0_n_5\,
      dac_data2_carry_0(1) => \dac_data4__315_carry__0_n_6\,
      dac_data2_carry_0(0) => \dac_data4__315_carry__0_n_7\,
      \dac_data2_carry__0\(3) => \dac_data4__315_carry__1_n_4\,
      \dac_data2_carry__0\(2) => \dac_data4__315_carry__1_n_5\,
      \dac_data2_carry__0\(1) => \dac_data4__315_carry__1_n_6\,
      \dac_data2_carry__0\(0) => \dac_data4__315_carry__1_n_7\,
      \dac_data2_carry__1\(15 downto 0) => dac_data4(16 downto 1),
      \dac_data2_carry__1_0\(3) => \dac_data4__315_carry__2_n_4\,
      \dac_data2_carry__1_0\(2) => \dac_data4__315_carry__2_n_5\,
      \dac_data2_carry__1_0\(1) => \dac_data4__315_carry__2_n_6\,
      \dac_data2_carry__1_0\(0) => \dac_data4__315_carry__2_n_7\,
      \dac_data2_carry__1_i_5_0\(0) => sine_rom_inst_n_202,
      \dac_data2_carry__1_i_5_1\(3) => sine_rom_inst_n_203,
      \dac_data2_carry__1_i_5_1\(2) => sine_rom_inst_n_204,
      \dac_data2_carry__1_i_5_1\(1) => sine_rom_inst_n_205,
      \dac_data2_carry__1_i_5_1\(0) => sine_rom_inst_n_206,
      \dac_data2_carry__3_i_5_0\(1) => sine_rom_inst_n_207,
      \dac_data2_carry__3_i_5_0\(0) => sine_rom_inst_n_208,
      \dac_data2_carry__3_i_5_1\(3) => sine_rom_inst_n_209,
      \dac_data2_carry__3_i_5_1\(2) => sine_rom_inst_n_210,
      \dac_data2_carry__3_i_5_1\(1) => sine_rom_inst_n_211,
      \dac_data2_carry__3_i_5_1\(0) => sine_rom_inst_n_212,
      \dac_data2_carry__3_i_5_2\(0) => sine_rom_inst_n_213,
      \dac_data2_carry__3_i_5_3\(0) => \_inferred__2/i__carry__2_n_0\,
      \dac_data2_carry__5\(0) => sine_rom_inst_n_180,
      \dac_data2_carry__5_0\(0) => sine_rom_inst_n_181,
      dac_data3(13 downto 12) => dac_data3(24 downto 23),
      dac_data3(11 downto 0) => dac_data3(17 downto 6),
      \dac_data4__114_carry__3\(3) => sine_rom_inst_n_166,
      \dac_data4__114_carry__3\(2) => sine_rom_inst_n_167,
      \dac_data4__114_carry__3\(1) => sine_rom_inst_n_168,
      \dac_data4__114_carry__3\(0) => sine_rom_inst_n_169,
      \dac_data4__114_carry__3_0\(3) => sine_rom_inst_n_246,
      \dac_data4__114_carry__3_0\(2) => sine_rom_inst_n_247,
      \dac_data4__114_carry__3_0\(1) => sine_rom_inst_n_248,
      \dac_data4__114_carry__3_0\(0) => sine_rom_inst_n_249,
      \dac_data4__114_carry__3_1\(3) => sine_rom_inst_n_250,
      \dac_data4__114_carry__3_1\(2) => sine_rom_inst_n_251,
      \dac_data4__114_carry__3_1\(1) => sine_rom_inst_n_252,
      \dac_data4__114_carry__3_1\(0) => sine_rom_inst_n_253,
      \dac_data4__171_carry__2\(3) => sine_rom_inst_n_99,
      \dac_data4__171_carry__2\(2) => sine_rom_inst_n_100,
      \dac_data4__171_carry__2\(1) => sine_rom_inst_n_101,
      \dac_data4__171_carry__2\(0) => sine_rom_inst_n_102,
      \dac_data4__171_carry__2_0\(0) => \dac_data4__72_carry__2_n_4\,
      \dac_data4__171_carry__2_1\(0) => \dac_data4__171_carry__2_i_3_n_0\,
      \dac_data4__171_carry__2_i_9_0\(1) => sine_rom_inst_n_164,
      \dac_data4__171_carry__2_i_9_0\(0) => sine_rom_inst_n_165,
      \dac_data4__171_carry__3\(3) => sine_rom_inst_n_103,
      \dac_data4__171_carry__3\(2) => sine_rom_inst_n_104,
      \dac_data4__171_carry__3\(1) => sine_rom_inst_n_105,
      \dac_data4__171_carry__3\(0) => sine_rom_inst_n_106,
      \dac_data4__171_carry__3_0\(3) => sine_rom_inst_n_257,
      \dac_data4__171_carry__3_0\(2) => sine_rom_inst_n_258,
      \dac_data4__171_carry__3_0\(1) => sine_rom_inst_n_259,
      \dac_data4__171_carry__3_0\(0) => sine_rom_inst_n_260,
      \dac_data4__171_carry__3_1\(3) => \dac_data4__114_carry__2_n_4\,
      \dac_data4__171_carry__3_1\(2) => \dac_data4__114_carry__2_n_5\,
      \dac_data4__171_carry__3_1\(1) => \dac_data4__114_carry__2_n_6\,
      \dac_data4__171_carry__3_1\(0) => \dac_data4__114_carry__2_n_7\,
      \dac_data4__171_carry__3_2\(2) => \dac_data4__72_carry__3_n_5\,
      \dac_data4__171_carry__3_2\(1) => \dac_data4__72_carry__3_n_6\,
      \dac_data4__171_carry__3_2\(0) => \dac_data4__72_carry__3_n_7\,
      \dac_data4__171_carry__4\(3) => sine_rom_inst_n_107,
      \dac_data4__171_carry__4\(2) => sine_rom_inst_n_108,
      \dac_data4__171_carry__4\(1) => sine_rom_inst_n_109,
      \dac_data4__171_carry__4\(0) => sine_rom_inst_n_110,
      \dac_data4__171_carry__4_0\(3) => sine_rom_inst_n_261,
      \dac_data4__171_carry__4_0\(2) => sine_rom_inst_n_262,
      \dac_data4__171_carry__4_0\(1) => sine_rom_inst_n_263,
      \dac_data4__171_carry__4_0\(0) => sine_rom_inst_n_264,
      \dac_data4__171_carry__4_1\(0) => \dac_data4__72_carry__3_n_0\,
      \dac_data4__171_carry__4_2\(2) => \dac_data4__114_carry__3_n_5\,
      \dac_data4__171_carry__4_2\(1) => \dac_data4__114_carry__3_n_6\,
      \dac_data4__171_carry__4_2\(0) => \dac_data4__114_carry__3_n_7\,
      \dac_data4__171_carry__4_i_10_0\(2) => sine_rom_inst_n_177,
      \dac_data4__171_carry__4_i_10_0\(1) => sine_rom_inst_n_178,
      \dac_data4__171_carry__4_i_10_0\(0) => sine_rom_inst_n_179,
      \dac_data4__171_carry__4_i_9_0\(3) => sine_rom_inst_n_173,
      \dac_data4__171_carry__4_i_9_0\(2) => sine_rom_inst_n_174,
      \dac_data4__171_carry__4_i_9_0\(1) => sine_rom_inst_n_175,
      \dac_data4__171_carry__4_i_9_0\(0) => sine_rom_inst_n_176,
      \dac_data4__171_carry__5\(2) => sine_rom_inst_n_111,
      \dac_data4__171_carry__5\(1) => sine_rom_inst_n_112,
      \dac_data4__171_carry__5\(0) => sine_rom_inst_n_113,
      \dac_data4__171_carry__5_0\(3) => sine_rom_inst_n_265,
      \dac_data4__171_carry__5_0\(2) => sine_rom_inst_n_266,
      \dac_data4__171_carry__5_0\(1) => sine_rom_inst_n_267,
      \dac_data4__171_carry__5_0\(0) => sine_rom_inst_n_268,
      \dac_data4__171_carry__5_1\(2) => sine_rom_inst_n_269,
      \dac_data4__171_carry__5_1\(1) => sine_rom_inst_n_270,
      \dac_data4__171_carry__5_1\(0) => sine_rom_inst_n_271,
      \dac_data4__171_carry__5_2\(0) => \dac_data4__114_carry__3_n_0\,
      \dac_data4__254_carry\(2) => \dac_data6__0_carry_n_5\,
      \dac_data4__254_carry\(1) => \dac_data6__0_carry_n_6\,
      \dac_data4__254_carry\(0) => \dac_data6__0_carry_n_7\,
      \dac_data4__254_carry_0\(1) => \dac_data4__72_carry_n_5\,
      \dac_data4__254_carry_0\(0) => \dac_data4__72_carry_n_6\,
      \dac_data4__254_carry__0\(3) => \dac_data4__171_carry_n_4\,
      \dac_data4__254_carry__0\(2) => \dac_data4__171_carry_n_5\,
      \dac_data4__254_carry__0\(1) => \dac_data4__171_carry_n_6\,
      \dac_data4__254_carry__0\(0) => \dac_data4__171_carry_n_7\,
      \dac_data4__254_carry__1\(3) => \dac_data6__90_carry__0_n_4\,
      \dac_data4__254_carry__1\(2) => \dac_data6__90_carry__0_n_5\,
      \dac_data4__254_carry__1\(1) => \dac_data6__90_carry__0_n_6\,
      \dac_data4__254_carry__1\(0) => \dac_data6__90_carry__0_n_7\,
      \dac_data4__254_carry__1_0\(3) => \dac_data4__171_carry__0_n_4\,
      \dac_data4__254_carry__1_0\(2) => \dac_data4__171_carry__0_n_5\,
      \dac_data4__254_carry__1_0\(1) => \dac_data4__171_carry__0_n_6\,
      \dac_data4__254_carry__1_0\(0) => \dac_data4__171_carry__0_n_7\,
      \dac_data4__254_carry__2\(3) => \dac_data4__171_carry__1_n_4\,
      \dac_data4__254_carry__2\(2) => \dac_data4__171_carry__1_n_5\,
      \dac_data4__254_carry__2\(1) => \dac_data4__171_carry__1_n_6\,
      \dac_data4__254_carry__2\(0) => \dac_data4__171_carry__1_n_7\,
      \dac_data4__254_carry__3\(3) => \dac_data4__171_carry__2_n_4\,
      \dac_data4__254_carry__3\(2) => \dac_data4__171_carry__2_n_5\,
      \dac_data4__254_carry__3\(1) => \dac_data4__171_carry__2_n_6\,
      \dac_data4__254_carry__3\(0) => \dac_data4__171_carry__2_n_7\,
      \dac_data4__254_carry__4\(3) => \dac_data4__171_carry__3_n_4\,
      \dac_data4__254_carry__4\(2) => \dac_data4__171_carry__3_n_5\,
      \dac_data4__254_carry__4\(1) => \dac_data4__171_carry__3_n_6\,
      \dac_data4__254_carry__4\(0) => \dac_data4__171_carry__3_n_7\,
      \dac_data4__254_carry__5\(3) => \dac_data4__171_carry__4_n_4\,
      \dac_data4__254_carry__5\(2) => \dac_data4__171_carry__4_n_5\,
      \dac_data4__254_carry__5\(1) => \dac_data4__171_carry__4_n_6\,
      \dac_data4__254_carry__5\(0) => \dac_data4__171_carry__4_n_7\,
      \dac_data4__72_carry__2\(3) => \dac_data4__8_carry__5_n_4\,
      \dac_data4__72_carry__2\(2) => \dac_data4__8_carry__5_n_5\,
      \dac_data4__72_carry__2\(1) => \dac_data4__8_carry__5_n_6\,
      \dac_data4__72_carry__2\(0) => \dac_data4__8_carry__5_n_7\,
      \dac_data4__72_carry__3\(2) => sine_rom_inst_n_243,
      \dac_data4__72_carry__3\(1) => sine_rom_inst_n_244,
      \dac_data4__72_carry__3\(0) => sine_rom_inst_n_245,
      \dac_data4__72_carry__3_0\(3) => \dac_data4__8_carry__6_n_4\,
      \dac_data4__72_carry__3_0\(2) => \dac_data4__8_carry__6_n_5\,
      \dac_data4__72_carry__3_0\(1) => \dac_data4__8_carry__6_n_6\,
      \dac_data4__72_carry__3_0\(0) => \dac_data4__8_carry__6_n_7\,
      \dac_data4__72_carry__3_1\(0) => \dac_data4__8_carry__6_n_0\,
      \dac_data4__72_carry__3_i_1_0\(3) => sine_rom_inst_n_18,
      \dac_data4__72_carry__3_i_1_0\(2) => sine_rom_inst_n_19,
      \dac_data4__72_carry__3_i_1_0\(1) => sine_rom_inst_n_20,
      \dac_data4__72_carry__3_i_1_0\(0) => sine_rom_inst_n_21,
      \dac_data4__72_carry__3_i_1_1\(3) => sine_rom_inst_n_28,
      \dac_data4__72_carry__3_i_1_1\(2) => sine_rom_inst_n_29,
      \dac_data4__72_carry__3_i_1_1\(1) => sine_rom_inst_n_30,
      \dac_data4__72_carry__3_i_1_1\(0) => sine_rom_inst_n_31,
      \dac_data4__72_carry__3_i_1_2\(2) => sine_rom_inst_n_170,
      \dac_data4__72_carry__3_i_1_2\(1) => sine_rom_inst_n_171,
      \dac_data4__72_carry__3_i_1_2\(0) => sine_rom_inst_n_172,
      \dac_data4__72_carry__3_i_1_3\(2) => sine_rom_inst_n_199,
      \dac_data4__72_carry__3_i_1_3\(1) => sine_rom_inst_n_200,
      \dac_data4__72_carry__3_i_1_3\(0) => sine_rom_inst_n_201,
      \dac_data4__8_carry__0\(3) => \dac_data6__90_carry__1_n_4\,
      \dac_data4__8_carry__0\(2) => \dac_data6__90_carry__1_n_5\,
      \dac_data4__8_carry__0\(1) => \dac_data6__90_carry__1_n_6\,
      \dac_data4__8_carry__0\(0) => \dac_data6__90_carry__1_n_7\,
      \dac_data4__8_carry__0_0\(3) => \dac_data6__90_carry_n_4\,
      \dac_data4__8_carry__0_0\(2) => \dac_data6__90_carry_n_5\,
      \dac_data4__8_carry__0_0\(1) => \dac_data6__90_carry_n_6\,
      \dac_data4__8_carry__0_0\(0) => \dac_data6__90_carry_n_7\,
      \dac_data4__8_carry__1_i_6\(0) => \_inferred__1/i__carry__2_n_0\,
      \dac_data4__8_carry__1_i_9_0\(3) => sine_rom_inst_n_23,
      \dac_data4__8_carry__1_i_9_0\(2) => sine_rom_inst_n_24,
      \dac_data4__8_carry__1_i_9_0\(1) => sine_rom_inst_n_25,
      \dac_data4__8_carry__1_i_9_0\(0) => sine_rom_inst_n_26,
      \dac_data4__8_carry__1_i_9_1\(3) => sine_rom_inst_n_87,
      \dac_data4__8_carry__1_i_9_1\(2) => sine_rom_inst_n_88,
      \dac_data4__8_carry__1_i_9_1\(1) => sine_rom_inst_n_89,
      \dac_data4__8_carry__1_i_9_1\(0) => sine_rom_inst_n_90,
      \dac_data4__8_carry__1_i_9_2\(3) => sine_rom_inst_n_91,
      \dac_data4__8_carry__1_i_9_2\(2) => sine_rom_inst_n_92,
      \dac_data4__8_carry__1_i_9_2\(1) => sine_rom_inst_n_93,
      \dac_data4__8_carry__1_i_9_2\(0) => sine_rom_inst_n_94,
      \dac_data4__8_carry__1_i_9_3\(3) => sine_rom_inst_n_187,
      \dac_data4__8_carry__1_i_9_3\(2) => sine_rom_inst_n_188,
      \dac_data4__8_carry__1_i_9_3\(1) => sine_rom_inst_n_189,
      \dac_data4__8_carry__1_i_9_3\(0) => sine_rom_inst_n_190,
      \dac_data4__8_carry__1_i_9_4\(3) => sine_rom_inst_n_191,
      \dac_data4__8_carry__1_i_9_4\(2) => sine_rom_inst_n_192,
      \dac_data4__8_carry__1_i_9_4\(1) => sine_rom_inst_n_193,
      \dac_data4__8_carry__1_i_9_4\(0) => sine_rom_inst_n_194,
      \dac_data4__8_carry__1_i_9_5\(3) => sine_rom_inst_n_195,
      \dac_data4__8_carry__1_i_9_5\(2) => sine_rom_inst_n_196,
      \dac_data4__8_carry__1_i_9_5\(1) => sine_rom_inst_n_197,
      \dac_data4__8_carry__1_i_9_5\(0) => sine_rom_inst_n_198,
      \dac_data4__8_carry__2\ => \dac_data4__8_carry__2_i_11_n_0\,
      \dac_data4__8_carry__2_i_10_0\(1) => sine_rom_inst_n_241,
      \dac_data4__8_carry__2_i_10_0\(0) => sine_rom_inst_n_242,
      \dac_data4__8_carry__3\ => sine_rom_inst_n_122,
      \dac_data4__8_carry__3_0\ => \dac_data4__8_carry__3_i_10_n_0\,
      \dac_data4__8_carry__3_1\ => \dac_data4__8_carry__1_i_13_n_0\,
      \dac_data4__8_carry__3_i_9_0\(2) => sine_rom_inst_n_254,
      \dac_data4__8_carry__3_i_9_0\(1) => sine_rom_inst_n_255,
      \dac_data4__8_carry__3_i_9_0\(0) => sine_rom_inst_n_256,
      \dac_data4__8_carry__4\(3) => sine_rom_inst_n_123,
      \dac_data4__8_carry__4\(2) => sine_rom_inst_n_124,
      \dac_data4__8_carry__4\(1) => sine_rom_inst_n_125,
      \dac_data4__8_carry__4\(0) => sine_rom_inst_n_126,
      \dac_data4__8_carry__5\(3) => sine_rom_inst_n_127,
      \dac_data4__8_carry__5\(2) => sine_rom_inst_n_128,
      \dac_data4__8_carry__5\(1) => sine_rom_inst_n_129,
      \dac_data4__8_carry__5\(0) => sine_rom_inst_n_130,
      \dac_data4__8_carry__6\(0) => sine_rom_inst_n_17,
      \dac_data4__8_carry__6_0\(0) => sine_rom_inst_n_22,
      \dac_data4__8_carry__6_1\(0) => sine_rom_inst_n_27,
      \dac_data4__8_carry__6_2\(3) => sine_rom_inst_n_149,
      \dac_data4__8_carry__6_2\(2) => sine_rom_inst_n_150,
      \dac_data4__8_carry__6_2\(1) => sine_rom_inst_n_151,
      \dac_data4__8_carry__6_2\(0) => sine_rom_inst_n_152,
      dac_data6(15 downto 0) => dac_data6(16 downto 1),
      \dac_data6__0_carry\(0) => sine_rom_inst_n_240,
      \dac_data6__30_carry__0\(2) => sine_rom_inst_n_72,
      \dac_data6__30_carry__0\(1) => sine_rom_inst_n_73,
      \dac_data6__30_carry__0\(0) => sine_rom_inst_n_74,
      \dac_data6__30_carry__0_0\(2) => sine_rom_inst_n_230,
      \dac_data6__30_carry__0_0\(1) => sine_rom_inst_n_231,
      \dac_data6__30_carry__0_0\(0) => sine_rom_inst_n_232,
      \dac_data6__30_carry__1\(3) => sine_rom_inst_n_233,
      \dac_data6__30_carry__1\(2) => sine_rom_inst_n_234,
      \dac_data6__30_carry__1\(1) => sine_rom_inst_n_235,
      \dac_data6__30_carry__1\(0) => sine_rom_inst_n_236,
      \dac_data6__59_carry__0\(3) => sine_rom_inst_n_75,
      \dac_data6__59_carry__0\(2) => sine_rom_inst_n_76,
      \dac_data6__59_carry__0\(1) => sine_rom_inst_n_77,
      \dac_data6__59_carry__0\(0) => sine_rom_inst_n_78,
      \dac_data6__59_carry__1\(0) => sine_rom_inst_n_237,
      \dac_data6__90_carry__0\(0) => \dac_data6__0_carry__0_n_4\,
      \dac_data6__90_carry__1\(3) => sine_rom_inst_n_83,
      \dac_data6__90_carry__1\(2) => sine_rom_inst_n_84,
      \dac_data6__90_carry__1\(1) => sine_rom_inst_n_85,
      \dac_data6__90_carry__1\(0) => sine_rom_inst_n_86,
      \dac_data6__90_carry__1_0\(1) => sine_rom_inst_n_185,
      \dac_data6__90_carry__1_0\(0) => sine_rom_inst_n_186,
      \dac_data6__90_carry__1_1\(2) => \dac_data6__59_carry_n_4\,
      \dac_data6__90_carry__1_1\(1) => \dac_data6__59_carry_n_5\,
      \dac_data6__90_carry__1_1\(0) => \dac_data6__59_carry_n_6\,
      \dac_data6__90_carry__1_2\(3) => \dac_data6__30_carry__0_n_4\,
      \dac_data6__90_carry__1_2\(2) => \dac_data6__30_carry__0_n_5\,
      \dac_data6__90_carry__1_2\(1) => \dac_data6__30_carry__0_n_6\,
      \dac_data6__90_carry__1_2\(0) => \dac_data6__30_carry__0_n_7\,
      \dac_data6__90_carry__1_3\(1) => \dac_data6__0_carry__1_n_6\,
      \dac_data6__90_carry__1_3\(0) => \dac_data6__0_carry__1_n_7\,
      \dac_data6__90_carry__1_4\(3) => \dac_data6__59_carry__0_n_4\,
      \dac_data6__90_carry__1_4\(2) => \dac_data6__59_carry__0_n_5\,
      \dac_data6__90_carry__1_4\(1) => \dac_data6__59_carry__0_n_6\,
      \dac_data6__90_carry__1_4\(0) => \dac_data6__59_carry__0_n_7\,
      \dac_data6__90_carry__1_5\(0) => \dac_data6__0_carry__1_n_1\,
      \dac_data6__90_carry__1_6\(1) => \dac_data6__30_carry__1_n_6\,
      \dac_data6__90_carry__1_6\(0) => \dac_data6__30_carry__1_n_7\,
      \dac_data6__90_carry__1_7\(0) => \dac_data6__30_carry__1_n_1\,
      \dac_data6__90_carry__2\(3) => sine_rom_inst_n_95,
      \dac_data6__90_carry__2\(2) => sine_rom_inst_n_96,
      \dac_data6__90_carry__2\(1) => sine_rom_inst_n_97,
      \dac_data6__90_carry__2\(0) => sine_rom_inst_n_98,
      \dac_data6__90_carry__2_0\(1 downto 0) => p_0_out(16 downto 15),
      \dac_data6__90_carry__2_1\(1) => \dac_data6__59_carry__1_n_6\,
      \dac_data6__90_carry__2_1\(0) => \dac_data6__59_carry__1_n_7\,
      \dac_data_reg[0]\(0) => dac_data1,
      \dac_data_reg[1]\(3) => \dac_data4__171_carry__5_n_4\,
      \dac_data_reg[1]\(2) => \dac_data4__171_carry__5_n_5\,
      \dac_data_reg[1]\(1) => \dac_data4__171_carry__5_n_6\,
      \dac_data_reg[1]\(0) => \dac_data4__171_carry__5_n_7\,
      \dac_data_reg[1]_0\(0) => \dac_data4__254_carry__6_n_1\,
      \dac_data_reg[2]\(2) => \dac_data4__8_carry__3_n_4\,
      \dac_data_reg[2]\(1) => \dac_data4__8_carry__3_n_5\,
      \dac_data_reg[2]\(0) => \dac_data4__8_carry__3_n_6\,
      \dac_data_reg[3]\(3) => \dac_data4__315_carry_n_4\,
      \dac_data_reg[3]\(2) => \dac_data4__315_carry_n_5\,
      \dac_data_reg[3]\(1) => \dac_data4__315_carry_n_6\,
      \dac_data_reg[3]\(0) => \dac_data4__315_carry_n_7\,
      \dac_data_reg[7]\(1) => \dac_data2_carry__5_n_6\,
      \dac_data_reg[7]\(0) => \dac_data2_carry__5_n_7\,
      \dac_data_reg[7]_0\(1) => dac_data2_carry_n_6,
      \dac_data_reg[7]_0\(0) => dac_data2_carry_n_7,
      data_reg_0(3) => sine_rom_inst_n_45,
      data_reg_0(2) => sine_rom_inst_n_46,
      data_reg_0(1) => sine_rom_inst_n_47,
      data_reg_0(0) => sine_rom_inst_n_48,
      data_reg_1(3) => sine_rom_inst_n_58,
      data_reg_1(2) => sine_rom_inst_n_59,
      data_reg_1(1) => sine_rom_inst_n_60,
      data_reg_1(0) => sine_rom_inst_n_61,
      data_reg_2(1) => sine_rom_inst_n_70,
      data_reg_2(0) => sine_rom_inst_n_71,
      data_reg_3(1) => sine_rom_inst_n_218,
      data_reg_3(0) => sine_rom_inst_n_219,
      data_reg_4(1) => sine_rom_inst_n_224,
      data_reg_4(0) => sine_rom_inst_n_225,
      data_reg_5(3) => sine_rom_inst_n_226,
      data_reg_5(2) => sine_rom_inst_n_227,
      data_reg_5(1) => sine_rom_inst_n_228,
      data_reg_5(0) => sine_rom_inst_n_229,
      enable => enable,
      \i__carry__2_i_1_0\(0) => \dac_data4__315_carry__2_n_0\,
      \i__carry__2_i_5_0\(3) => sine_rom_inst_n_131,
      \i__carry__2_i_5_0\(2) => sine_rom_inst_n_132,
      \i__carry__2_i_5_0\(1) => sine_rom_inst_n_133,
      \i__carry__2_i_5_0\(0) => sine_rom_inst_n_134,
      phase_acc_reg(3 downto 0) => phase_acc_reg(31 downto 28),
      \phase_acc_reg[31]\(3) => sine_rom_inst_n_32,
      \phase_acc_reg[31]\(2) => sine_rom_inst_n_33,
      \phase_acc_reg[31]\(1) => sine_rom_inst_n_34,
      \phase_acc_reg[31]\(0) => sine_rom_inst_n_35,
      phase_ofst(3 downto 0) => phase_ofst(31 downto 28),
      reset_n => reset_n
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_bd_fra_top_0_0_fra_top is
  port (
    dac_clk_out : out STD_LOGIC;
    sample_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dac_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    amplitude : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    adc_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    enable : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    phase_inc : in STD_LOGIC_VECTOR ( 31 downto 0 );
    phase_ofst : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_bd_fra_top_0_0_fra_top : entity is "fra_top";
end system_bd_fra_top_0_0_fra_top;

architecture STRUCTURE of system_bd_fra_top_0_0_fra_top is
  signal \^dac_clk_out\ : STD_LOGIC;
  signal dac_data_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal u_dds_n_0 : STD_LOGIC;
begin
  dac_clk_out <= \^dac_clk_out\;
u_adc_if: entity work.system_bd_fra_top_0_0_adc_if
     port map (
      SR(0) => u_dds_n_0,
      adc_in(7 downto 0) => adc_in(7 downto 0),
      dac_clk_out => \^dac_clk_out\,
      sample_out(7 downto 0) => sample_out(7 downto 0)
    );
u_clk_div_2: entity work.system_bd_fra_top_0_0_clk_div_2
     port map (
      clk => clk,
      dac_clk_out => \^dac_clk_out\
    );
u_dac_if: entity work.system_bd_fra_top_0_0_dac_if
     port map (
      Q(7 downto 0) => dac_data_reg(7 downto 0),
      SR(0) => u_dds_n_0,
      dac_clk_out => \^dac_clk_out\,
      dac_out(7 downto 0) => dac_out(7 downto 0)
    );
u_dds: entity work.system_bd_fra_top_0_0_dds
     port map (
      Q(7 downto 0) => dac_data_reg(7 downto 0),
      SS(0) => u_dds_n_0,
      amplitude(7 downto 0) => amplitude(7 downto 0),
      dac_clk_out => \^dac_clk_out\,
      enable => enable,
      phase_inc(31 downto 0) => phase_inc(31 downto 0),
      phase_ofst(31 downto 0) => phase_ofst(31 downto 0),
      reset_n => reset_n
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_bd_fra_top_0_0 is
  port (
    reset_n : in STD_LOGIC;
    clk : in STD_LOGIC;
    adc_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sample_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    adc_clk_out : out STD_LOGIC;
    dac_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dac_clk_out : out STD_LOGIC;
    phase_inc : in STD_LOGIC_VECTOR ( 31 downto 0 );
    phase_ofst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    amplitude : in STD_LOGIC_VECTOR ( 7 downto 0 );
    enable : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_bd_fra_top_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_bd_fra_top_0_0 : entity is "system_bd_fra_top_0_0,fra_top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_bd_fra_top_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_bd_fra_top_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_bd_fra_top_0_0 : entity is "fra_top,Vivado 2025.1";
end system_bd_fra_top_0_0;

architecture STRUCTURE of system_bd_fra_top_0_0 is
  signal \^adc_clk_out\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of reset_n : signal is "xilinx.com:signal:reset:1.0 reset_n RST";
  attribute X_INTERFACE_MODE of reset_n : signal is "slave";
  attribute X_INTERFACE_PARAMETER of reset_n : signal is "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  adc_clk_out <= \^adc_clk_out\;
  dac_clk_out <= \^adc_clk_out\;
inst: entity work.system_bd_fra_top_0_0_fra_top
     port map (
      adc_in(7 downto 0) => adc_in(7 downto 0),
      amplitude(7 downto 0) => amplitude(7 downto 0),
      clk => clk,
      dac_clk_out => \^adc_clk_out\,
      dac_out(7 downto 0) => dac_out(7 downto 0),
      enable => enable,
      phase_inc(31 downto 0) => phase_inc(31 downto 0),
      phase_ofst(31 downto 0) => phase_ofst(31 downto 0),
      reset_n => reset_n,
      sample_out(7 downto 0) => sample_out(7 downto 0)
    );
end STRUCTURE;
