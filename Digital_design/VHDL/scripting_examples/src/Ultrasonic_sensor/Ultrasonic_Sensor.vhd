library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ultrasonic_Sensor is
    Port ( pulse_pin : in STD_LOGIC;
           trig_pin : out STD_LOGIC;
           rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (2 downto 0);
           sseg : out STD_LOGIC_VECTOR (7 downto 0));
end Ultrasonic_Sensor;

architecture Behavioral of Ultrasonic_Sensor is

component Range_sensor is
    port(
        fpgaclk: in std_logic;
        pulse: in std_logic;
        trigger_out: out std_logic;
        meters: out std_logic_vector(3 downto 0);
        decimeters: out std_logic_vector(3 downto 0);
        centimeters: out std_logic_vector(3 downto 0)
    );
end component;

component display_cts is
    port(
        clk: in std_logic;
        Display_reset: in std_logic;
        in2: in std_logic_vector(3 downto 0);
        in1: in std_logic_vector(3 downto 0);
        in0: in std_logic_vector(3 downto 0);
        an: out std_logic_vector(2 downto 0);
        sseg: out std_logic_vector (7 downto 0)
    );
end component;

signal meters, decimeters, centimeters: std_logic_vector(3 downto 0);
signal an_temp: std_logic_vector(2 downto 0);

begin
    range_sensor_inst: Range_sensor port map (
        fpgaclk => clk,
        pulse => pulse_pin,
        trigger_out => trig_pin,
        meters => meters,
        decimeters => decimeters,
    centimeters => centimeters
    );

    display_inst: display_cts port map (
        clk => clk,
        Display_reset => rst,
        in2 => meters,
        in1 => decimeters,
        in0 => centimeters,
        an => an_temp,
        sseg => sseg
    );

    an <= an_temp;

end Behavioral;
