LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY ALU2 IS
PORT (Clock : IN STD_LOGIC ;
A ,B : IN UNSIGNED(7 DOWNTO 0);
Student_id: IN UNSIGNED(3 DOWNTO 0);
OP: IN UNSIGNED(15 DOWNTO 0);
Neg: OUT STD_LOGIC;
R1: OUT UNSIGNED(3 DOWNTO 0);
R2: OUT UNSIGNED(3 DOWNTO 0));
END ALU2;

ARCHITECTURE Behavior OF ALU2 IS
SIGNAL Reg1, Reg2, Result: UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
SIGNAL Reg4: UNSIGNED(0 TO 7);
SIGNAL Reg5: UNSIGNED(0 TO 3);

BEGIN
	Reg1 <= A;
	Reg2 <= B;
	PROCESS (Clock,OP,A,B)
	BEGIN
	IF (rising_edge(Clock)) THEN
		CASE OP IS
when "0000000000000001" => -- F1 INCREMENT A BY 2
    neg <= '0'; 
    Result <= Reg1 + 2; -- Increment Reg1 by 2

			
			when "0000000000000010" => -- F2 SHR B BY 2 BITS
    neg <= '0'; -- Not a decrement, so negate flag is set to '0'
    Result <= Reg2 srl 2; -- Shift right by 2 bits

		when "0000000000000100" => -- F3 SHR A BY 4 BITS, input bit = 1
    neg <= '0'; -- Not a decrement, so negate flag is set to '0'
	Result <= "111" & Reg1(6 downto 2); -- Shift right by 4 bits with input bit = 1

					 
when "0000000000001000" => -- F4 Min(A,B)
    neg <= '0';
    if (Reg1 < Reg2) then
        Result <= Reg1; -- Assign the smaller value (Reg1) if Reg1 is less than Reg2
    else
        Result <= Reg2; -- Otherwise, assign the smaller value (Reg2)
    end if;

	 when "0000000000010000" => -- F5 ROR A BY 2 BITS
    neg <= '0';
    Result <= Reg1(1 downto 0) & Reg1(7 downto 2); -- Rotate right by 2 bits

	 when "0000000000100000" => -- F6 Invert bit-significance order of B
    neg <= '0';
    Result <= Reg2(7 downto 0); -- Reverse the bit order of Reg2 (B)

	 when "0000000001000000" => -- F7 XOR A and B
    neg <= '0';
    Result <= Reg1 xor Reg2; -- Perform XOR operation between Reg1 and Reg2

	when "0000000010000000" => -- Sum of A and B, decrease by 4
    neg <= '0';
    Result <= (Reg1 + Reg2) - 4; -- Sum of Reg1 and Reg2, then decrease by 4
	
when "0000000100000000" => -- All high bits on the output
    neg <= '0';
    Result <= (others => '1'); -- Set all bits of Result to logic high
	
			WHEN OTHERS =>-- Don't care, no states greater than 9
			
			END CASE;
		END IF;
	END PROCESS;
	
	R1 <= Result(3 DOWNTO 0); --only 4-bits, split the 8-bit into 2 4-bits
	R2 <= Result(7 DOWNTO 4); --only 4-bits, split the 8-bit into 2 4-bits

END Behavior;
