LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Latch1 IS
	PORT(A: IN STD_LOGIC_VECTOR(7 DOWNTO 0); --8 Bit A input
		Resetn, Clock: IN STD_LOGIC; --1 bit clock input and 1 bit reset input	
		Q: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); --8 bit output
		
	END Latch1;
	
	ARCHITECTURE Behavior OF Latch1 IS
	BEGIN
		PROCESS (Resetn, Clock) -- Process takes reset and clock as inputs
		BEGIN
			IF Resetn = '0' THEN --When reset input is '0' latches does not operate
				Q <= "01110101";
				ELSIF Clock'EVENT AND Clock='1' THEN -- Level sensitive based on clockQ <= A;
				Q<=A;
			END IF;
		END PROCESS;
	END Behavior;
		