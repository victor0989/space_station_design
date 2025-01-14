library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_cts is
    Port ( clk: in STD_LOGIC;
           Display_reset: in STD_LOGIC;
           in2, in1, in0: in STD_LOGIC_VECTOR(3 downto 0);
           an: out STD_LOGIC_VECTOR(2 downto 0);
           sseg: out STD_LOGIC_VECTOR(7 downto 0));
end display_cts;

architecture Behavioral of display_cts is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if Display_reset = '1' then
                an <= (others => '0');
                sseg <= (others => '0');
            else
                an <= in0(2 downto 0); -- ajuste correcto
                sseg <= in1 & in2(3 downto 0); -- ajuste correcto
            end if;
        end if;
    end process;
end Behavioral;
