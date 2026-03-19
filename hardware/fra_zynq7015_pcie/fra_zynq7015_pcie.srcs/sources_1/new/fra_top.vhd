library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fra_top is
    port (
        reset_n     : in  std_logic;
        clk         : in  std_logic;
        adc_in      : in  std_logic_vector(7 downto 0);
        adc_clk_out : out std_logic;
        dac_out     : out std_logic_vector(7 downto 0);
        dac_clk_out : out std_logic
    );
end fra_top;

architecture Behavioral of fra_top is

    signal clk_25       : std_logic;

    signal adc_sample_s : std_logic_vector(7 downto 0);

    signal ramp_s       : std_logic_vector(7 downto 0);
    signal lut_addr     : unsigned(7 downto 0);
    signal lut_data     : std_logic_vector(7 downto 0);

begin

    adc_clk_out <= clk_25;
    dac_clk_out <= clk_25;

    lut_addr <= unsigned(ramp_s);

    u_clk_div_2 : entity work.clk_div_2
        port map (
            clk_in  => clk,
            clk_out => clk_25
        );

    u_adc_if : entity work.adc_if
        port map (
            reset_n     => reset_n,
            clk         => clk_25,
            adc_data    => adc_in,
            sample_data => adc_sample_s
        );

    u_sawtooth_gen : entity work.sawtooth_gen
        port map (
            reset_n => reset_n,
            clk     => clk_25,
            ramp    => ramp_s
        );

    u_lut : entity work.sine_lut
        port map (
            clk  => clk_25,
            addr => lut_addr,
            data => lut_data
        );

    u_dac_if : entity work.dac_if
        port map (
            reset_n      => reset_n,
            clk          => clk_25,
            dac_data_reg => lut_data,
            dac_data     => dac_out
        );

end Behavioral;