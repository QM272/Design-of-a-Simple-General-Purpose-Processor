LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ssegiii IS
    PORT (
        bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        student_id : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Input for student_id output
        leds1 : OUT STD_LOGIC_VECTOR(1 TO 7);
        leds2 : OUT STD_LOGIC_VECTOR(1 TO 7)
    );
END ssegiii;

ARCHITECTURE Behavior OF ssegiii IS
    SIGNAL odd_even : STD_LOGIC; -- Signal to hold 'y' or 'n' based on student_id

BEGIN
    PROCESS(bcd, student_id)
    BEGIN
        -- Check if student_id is odd or even
        if (student_id(0) = '1') then
            odd_even <= 'y'; -- 'y' if odd
        else
            odd_even <= 'n'; -- 'n' if even
        end if;

        -- Modify the LED outputs based on odd_even
        CASE bcd IS
            WHEN "0000" =>
                leds1 <= "1111110"; --0
                leds2 <= "1111111"; -- Negative sign
            -- Add other cases as needed

            WHEN OTHERS =>
                -- Add logic here for displaying 'y' or 'n' on the 7-segment display
                CASE odd_even IS
                    WHEN 'y' =>
                        -- Display 'y'
                        -- Define the 7-segment display configuration for 'y'
                    WHEN 'n' =>
                        -- Display 'n'
                        -- Define the 7-segment display configuration for 'n'
                    WHEN OTHERS =>
                        -- Handle any other case if needed
                END CASE;
        END CASE;
    END PROCESS;
END Behavior;
