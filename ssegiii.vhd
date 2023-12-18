LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY ssegiii IS
PORT (
bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
neg : IN STD_LOGIC;
leds1, leds2 : OUT STD_LOGIC_VECTOR(1 TO 7));
END ssegiii;

ARCHITECTURE Behavior OF ssegiii IS
BEGIN
PROCESS (bcd, neg)

BEGIN

CASE bcd IS --abcdefg
WHEN "0001" =>leds1 <= ("1000100");--y 0111011
WHEN "0000" =>leds1 <= ("1101010");--n 0010101 --based on diagram in lab manual 3
WHEN OTHERS =>leds1 <= ("-------");
END CASE;

IF neg = '1' then
leds2 <= "1111110"; --0000001
else
leds2 <= "1111111"; --0000000
END IF;

END PROCESS;
END Behavior;