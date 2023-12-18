LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ssegFinal IS
	PORT (
		bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		leds1 : OUT STD_LOGIC_VECTOR(1 TO 7);
		leds2 : OUT STD_LOGIC_VECTOR(1 TO 7)
	);
END ssegFinal;

ARCHITECTURE Behavior OF ssegFinal IS
BEGIN
	PROCESS(bcd)
	BEGIN
		CASE bcd IS
			WHEN "0000" =>
				leds1 <= "1111110"; --0
				leds2 <= "1111111"; -- Negative sign
			WHEN "0001" =>
				leds1 <= "0110000"; --1
				leds2 <= "0000000"; -- No negative sign
			WHEN "0010" =>
				leds1 <= "1101101"; --2
				leds2 <= "0000000"; -- No negative sign
			WHEN "0011" =>
				leds1 <= "1111001"; --3
				leds2 <= "0000000"; -- No negative sign
			WHEN "0100" =>
				leds1 <= "0110011"; --4
				leds2 <= "0000000"; -- No negative sign
			WHEN "0101" =>
				leds1 <= "1011011"; --5
				leds2 <= "0000000"; -- No negative sign
			WHEN "0110" =>
				leds1 <= "1011111"; --6
				leds2 <= "0000000"; -- No negative sign
			WHEN "0111" =>
				leds1 <= "1110000"; --7
				leds2 <= "0000000"; -- No negative sign
			WHEN "1000" =>
				leds1 <= "1111111"; --8
				leds2 <= "0000000"; -- No negative sign
			WHEN "1001" =>
				leds1 <= "1110011"; --9
				leds2 <= "0000000"; -- No negative sign
			WHEN "1010" =>
				leds1 <= "1110111"; --A
				leds2 <= "0000000"; -- No negative sign
			WHEN "1011" =>
				leds1 <= "1111111"; --B
				leds2 <= "0000000"; -- No negative sign
			WHEN "1100" =>
				leds1 <= "1001110"; --C
				leds2 <= "0000000"; -- No negative sign
			WHEN "1101" =>
				leds1 <= "1111110"; --D
				leds2 <= "0000000"; -- No negative sign
			WHEN "1110" =>
				leds1 <= "1001111"; --E
				leds2 <= "0000000"; -- No negative sign
			WHEN "1111" =>
				leds1 <= "1000111"; --F
				leds2 <= "1111111"; -- Negative sign
		END CASE;
	END PROCESS;
END Behavior;
