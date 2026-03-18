library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dac_if is
    port (
        reset_n           : in  std_logic;
        clk             : in  std_logic;
        dac_data_reg    : in std_logic_vector(7 downto 0);
        dac_data        : out  std_logic_vector(7 downto 0)
    );
end dac_if;

architecture Behavioral of dac_if is
    
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset_n = '0' then
                dac_data <= "01111111";
            else
                dac_data <= dac_data_reg;
            end if;
        end if;
    end process;

end Behavioral;
