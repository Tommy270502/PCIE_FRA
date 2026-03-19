library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dds is
    port (
        clk           : in  std_logic;
        reset_n       : in  std_logic;

        -- Frequency control word
        phase_inc     : in  unsigned(31 downto 0);

        -- Optional phase offset
        phase_offset  : in  unsigned(31 downto 0);

        -- DAC output
        dac_data      : out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of dds is

    signal phase_acc      : unsigned(31 downto 0) := (others => '0');
    signal lut_addr       : unsigned(7 downto 0)  := (others => '0');
    signal lut_data       : std_logic_vector(7 downto 0);
    signal phase_sum      : unsigned(31 downto 0);

begin

    -- Add phase offset to accumulator
    phase_sum <= phase_acc + phase_offset;

    -- Use top 8 bits as LUT address
    lut_addr <= phase_sum(31 downto 24);

    -- Sine lookup table
    sine_rom_inst : entity work.sine_lut
        port map (
            clk  => clk,
            addr => lut_addr,
            data => lut_data
        );

    -- DDS phase accumulator and DAC output register
    process(clk)
    begin
        if rising_edge(clk) then
            if reset_n = '0' then
                phase_acc <= (others => '0');
                dac_data  <= "10000000";  -- midscale
            else
                phase_acc <= phase_acc + phase_inc;
                dac_data  <= lut_data;
            end if;
        end if;
    end process;

end architecture;