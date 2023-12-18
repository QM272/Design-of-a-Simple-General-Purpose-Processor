LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decMOD3 IS
    PORT (
        w : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        En : IN STD_LOGIC;
        y : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END decMOD3;

ARCHITECTURE Behavior OF decMOD3 IS
    SIGNAL Enw : STD_LOGIC_VECTOR(4 DOWNTO 0); -- Enw signal increased by 1 bit to accommodate the 'En' signal
BEGIN
    Enw <= En & w;
    WITH Enw SELECT
        y <= "0000000000000000" WHEN "00000",
             "1000000000000000" WHEN "00001",
             "0100000000000000" WHEN "00010",
             "0010000000000000" WHEN "00011",
             "0001000000000000" WHEN "00100",
             "0000100000000000" WHEN "00101",
             "0000010000000000" WHEN "00110",
             "0000001000000000" WHEN "00111",
             "0000000100000000" WHEN "01000",
             "0000000010000000" WHEN "01001",
             "0000000001000000" WHEN "01010",
             "0000000000100000" WHEN "01011",
             "0000000000010000" WHEN "01100",
             "0000000000001000" WHEN "01101",
             "0000000000000100" WHEN "01110",
             "0000000000000010" WHEN "01111",
             "0000000000000001" WHEN OTHERS; -- Added a default case to cover all combinations
END Behavior;