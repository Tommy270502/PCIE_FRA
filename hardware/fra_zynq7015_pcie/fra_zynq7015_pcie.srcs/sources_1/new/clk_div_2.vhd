library IEEE;
use IEEE.std_logic_1164.all;

entity clk_div_2 is
    port (
        clk_in  : in  std_logic;
        clk_out : out std_logic
    );
end clk_div_2;

architecture Behavioral of clk_div_2 is
    signal clk_div : std_logic := '0';
begin

    process(clk_in)
    begin
        if rising_edge(clk_in) then
            clk_div <= not clk_div;
        end if;
    end process;

    clk_out <= clk_div;

end Behavioral;