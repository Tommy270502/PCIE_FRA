library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dds is
    port (
        clk           : in  std_logic;
        reset_n       : in  std_logic;

        phase_inc     : in  unsigned(31 downto 0);
        phase_offset  : in  unsigned(31 downto 0);
        amplitude     : in  unsigned(7 downto 0);
        enable        : in  std_logic;

        dac_data      : out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of dds is

    signal phase_acc  : unsigned(31 downto 0) := (others => '0');
    signal phase_sum  : unsigned(31 downto 0);
    signal lut_addr   : unsigned(7 downto 0)  := (others => '0');
    signal lut_data   : std_logic_vector(7 downto 0);

begin

    phase_sum <= phase_acc + phase_offset;
    lut_addr  <= phase_sum(31 downto 24);

    sine_rom_inst : entity work.sine_lut
        port map (
            clk  => clk,
            addr => lut_addr,
            data => lut_data
        );

    process(clk)
        variable lut_u       : unsigned(7 downto 0);
        variable lut_center  : integer;
        variable amp_int     : integer;
        variable scaled      : integer;
        variable dac_int     : integer;
    begin
        if rising_edge(clk) then
            if reset_n = '0' then
                phase_acc <= (others => '0');
                dac_data  <= "10000000"; -- midscale
            else
                if enable = '1' then
                    phase_acc <= phase_acc + phase_inc;

                    -- LUT is assumed offset-binary: 0..255 with midscale at 128
                    lut_u      := unsigned(lut_data);
                    lut_center := to_integer(lut_u) - 128;

                    -- Use lower 8 bits of amplitude as 0..255 scale
                    amp_int := to_integer(amplitude(7 downto 0));

                    -- scale around midscale
                    scaled  := (lut_center * amp_int) / 255;
                    dac_int := scaled + 128;

                    if dac_int < 0 then
                        dac_data <= (others => '0');
                    elsif dac_int > 255 then
                        dac_data <= (others => '1');
                    else
                        dac_data <= std_logic_vector(to_unsigned(dac_int, 8));
                    end if;
                else
                    phase_acc <= phase_acc;
                    dac_data  <= "10000000"; -- output midscale when disabled
                end if;
            end if;
        end if;
    end process;

end architecture;