library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fra_top is
    port (
        reset_n     : in  std_logic;
        clk         : in  std_logic;

        adc_in      : in  std_logic_vector(7 downto 0);
        sample_out  : out std_logic_vector(7 downto 0);
        adc_clk_out : out std_logic;

        dac_out     : out std_logic_vector(7 downto 0);
        dac_clk_out : out std_logic;

        phase_inc   : in  unsigned(31 downto 0);
        phase_ofst  : in  unsigned(31 downto 0);
        amplitude   : in  unsigned(7 downto 0);
        enable      : in  std_logic
    );
end fra_top;

architecture Behavioral of fra_top is

    signal clk_25       : std_logic;
    signal adc_sample_s : std_logic_vector(7 downto 0);
    signal dds_data_s   : std_logic_vector(7 downto 0);

begin

    --------------------------------------------------------------------
    -- Output clocks
    --------------------------------------------------------------------
    adc_clk_out <= clk_25;
    dac_clk_out <= clk_25;

    --------------------------------------------------------------------
    -- Clock divider
    --------------------------------------------------------------------
    u_clk_div_2 : entity work.clk_div_2
        port map (
            clk_in  => clk,
            clk_out => clk_25
        );

    --------------------------------------------------------------------
    -- ADC interface
    --------------------------------------------------------------------
    u_adc_if : entity work.adc_if
        port map (
            reset_n     => reset_n,
            clk         => clk_25,
            adc_data    => adc_in,
            sample_data => sample_out
        );

    --------------------------------------------------------------------
    -- DDS
    --------------------------------------------------------------------
    u_dds : entity work.dds
        port map (
            clk          => clk_25,
            reset_n      => reset_n,
            phase_inc    => phase_inc,
            phase_offset => phase_ofst,
            amplitude    => amplitude,
            enable       => enable,
            dac_data     => dds_data_s
        );

    --------------------------------------------------------------------
    -- DAC interface
    --------------------------------------------------------------------
    u_dac_if : entity work.dac_if
        port map (
            reset_n      => reset_n,
            clk          => clk_25,
            dac_data_reg => dds_data_s,
            dac_data     => dac_out
        );

end Behavioral;