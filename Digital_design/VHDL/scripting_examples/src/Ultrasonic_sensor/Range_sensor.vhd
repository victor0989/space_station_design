library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Range_sensor is
    Port ( fpgaclk : in STD_LOGIC;
           pulse: in std_logic;
           trigger_out : out STD_LOGIC;
           meters, decimeters, centimeters : out STD_LOGIC_VECTOR (3 downto 0));
end Range_sensor;

architecture Behavioral of Range_sensor is

begin
    process(fpgaclk)
    begin
        if rising_edge(fpgaclk) then
            -- Lógica para determinar metros, decímetros, centímetros
            -- Ejemplo sencillo
            meters <= "0001";
            decimeters <= "0010";
            centimeters <= "0100";
        end if;
    end process;
end Behavioral;
