LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU3 IS
    PORT (
        Clock : IN STD_LOGIC;
        A, B : IN UNSIGNED(7 DOWNTO 0);
        Student_id: IN UNSIGNED(3 DOWNTO 0);
        OP: IN UNSIGNED(15 DOWNTO 0);
        Neg: OUT STD_LOGIC;
        Result: OUT UNSIGNED(3 DOWNTO 0)
    );
END ALU3;

ARCHITECTURE Behavior OF ALU3 IS
    SIGNAL Reg1, Reg2: UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL odd_even: STD_LOGIC; -- Signal to hold 'y' or 'n' based on student_id

BEGIN
    Reg1 <= to_UNSIGNED(to_integer(UNSIGNED(A)) / 10, 4);
    Reg2 <= to_UNSIGNED(to_integer(UNSIGNED(A)) mod 10, 4);

    PROCESS (Clock, OP, A, B)
    BEGIN
        IF (rising_edge(Clock)) THEN
            CASE OP IS
                -- ... (existing cases)

                WHEN "0000000000000001" | "0000000000000010" | "0000000000000100" |
                     "0000000000001000" | "0000000000010000" | "0000000000100000" |
                     "0000000001000000" | "0000000010000000" | "0000000100000000" => 
                    neg <= '0';
                    -- Check if any digit of A is less than Student_id
                    if (Reg1 < Student_id) OR (Reg2 < Student_id) then
                        odd_even <= '1'; -- 'y' if true
                    else 
                        odd_even <= '0'; -- 'n' if false
                    end if;
                    Result <= "0000"; -- Just for placeholder (change as per your design)
                    
                WHEN OTHERS =>
                    -- Don't care
            END CASE;
        END IF;
    END PROCESS;
END Behavior;
