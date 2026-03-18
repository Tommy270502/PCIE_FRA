library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sawtooth_gen is
    port (
        reset_n : in  std_logic;
        clk   : in  std_logic;
        ramp  : out std_logic_vector(7 downto 0)
    );
end sawtooth_gen;

architecture Behavioral of sawtooth_gen is
    --  24999 = 4Hz
    --  12499 = 8Hz
    --  6249 = 16Hz
    --  3124 = 32Hz
    --  1561 = 64Hz
    --  780 = 128Hz
    --  389 = 256Hz
    --  194 = 512Hz
    --  96 = 1024Hz
    --  47 = 2048Hz
    --  23 = 4096Hz
    --  11 = 8192Hz
    --  5 = 16384Hz
    constant DIVIDER_MAX : unsigned(15 downto 0) := to_unsigned(96, 16);

    signal divider_counter : unsigned(15 downto 0);
    signal ramp_counter    : unsigned(7 downto 0);

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset_n = '0' then
                divider_counter <= (others => '0');
                ramp_counter    <= "01111111";
            elsif divider_counter = DIVIDER_MAX then
                divider_counter <= (others => '0');
                ramp_counter    <= ramp_counter - 1;
            else
                divider_counter <= divider_counter + 1;
            end if;
        end if;
    end process;

    ramp <= std_logic_vector(ramp_counter);

end Behavioral;