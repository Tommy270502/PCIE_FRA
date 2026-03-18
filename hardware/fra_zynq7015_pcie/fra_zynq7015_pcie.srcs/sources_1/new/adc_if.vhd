library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adc_if is
    port (
        reset_n       : in  std_logic;
        clk         : in  std_logic;
        adc_data    : in  std_logic_vector(7 downto 0);
        sample_data : out std_logic_vector(7 downto 0)
    );
end adc_if;

architecture Behavioral of adc_if is
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset_n = '0' then
                sample_data <= (others => '0');
            else
                sample_data <= adc_data;
            end if;
        end if;
    end process;

end Behavioral;
