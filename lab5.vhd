LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab5 IS
	PORT
	(
		clk			: in std_logic;
		data_in  	: in std_logic;
		reset    	: in std_logic;
		student_id  : out std_logic_vector(3 DOWNTO 0);
		current_state : out std_logic_vector(3 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE fsm OF lab5 IS
	--build 9 states for pairing 9 digits of student id
	TYPE state_type IS (s0,s1,s8,s2,s7,s3,s6,s4,s5);
	--register to hold current state_type
	SIGNAL state : state_type;
	BEGIN
		PROCESS(clk, reset, data_in)
		BEGIN
			IF reset = '1' THEN
				state <= s0;
			ELSIF (clk'EVENT AND clk = '1') THEN
				CASE state IS
					WHEN s0=>
						IF data_in = '1' THEN
							state <= s1;
						ELSE
							state <= s0;
						END IF;

					WHEN s1=>
						IF data_in = '1' THEN
							state <= s8;
						ELSE
							state <= s1;
						END IF;

					WHEN s8=>
						IF data_in = '1' THEN
							state <= s2;
						ELSE
							state <= s8;
						END IF;

					WHEN s2=>
						IF data_in = '1' THEN
							state <= s7;
						ELSE
							state <= s2;
						END IF;

					WHEN s7=>
						IF data_in = '1' THEN
							state <= s3;
						ELSE
							state <= s7;
						END IF;

					WHEN s6=>
						IF data_in = '1' THEN
							state <= s4;
						ELSE
							state <= s6;
						END IF;

					WHEN s4=>
						IF data_in = '1' THEN
							state <= s5;
						ELSE
							state <= s4;
						END IF;

					WHEN s5=>
						IF data_in = '1' THEN
							state <= s0;
						ELSE
							state <= s5;
						END IF;
						
				WHEN OTHERS =>
					state<=s0;
				END CASE;
			END IF;
		END PROCESS;

		-- Implement Mealy logic here
		PROCESS (state, data_in)
		BEGIN
			CASE state IS
				WHEN s0 => --5
					IF data_in = '0' THEN
						student_id <= "0101"; -- Output: 5
					ELSE
						student_id <= "0000"; -- Output: 0
					END IF;

				WHEN s1 => --0
					IF data_in = '0' THEN
						student_id <= "0000"; -- Output: 0
					ELSE
						student_id <= "0001"; -- Output: 1
					END IF;

				WHEN s8 => --1
					IF data_in = '0' THEN
						student_id <= "0001"; -- Output: 1
					ELSE
						student_id <= "0001"; -- Output: 1
					END IF;

				WHEN s2 => --1
					IF data_in = '0' THEN
						student_id <= "0001"; -- Output: 1
					ELSE
						student_id <= "0111"; -- Output: 7
					END IF;

				WHEN s7 => --7
					IF data_in = '0' THEN
						student_id <= "0111"; -- Output: 7
					ELSE
						student_id <= "1000"; -- Output: 8
					END IF;

				WHEN s3 => --8
					IF data_in = '0' THEN
						student_id <= "1000"; -- Output: 8
					ELSE
						student_id <= "1001"; -- Output: 9
					END IF;

				WHEN s6 => --9
					IF data_in = '0' THEN
						student_id <= "1001"; -- Output: 9
					ELSE
						student_id <= "1000"; -- Output: 8
					END IF;

				WHEN s4 => --8
					IF data_in = '0' THEN
						student_id <= "1000"; -- Output: 8
					ELSE
						student_id <= "0110"; -- Output: 6
					END IF;

				WHEN s5 => --6
					IF data_in = '0' THEN
						student_id <= "0110"; -- Output: 6
					ELSE
						student_id <= "0101"; -- Output: 5
					END IF;

				WHEN OTHERS =>
					student_id <= "0000"; -- Default output
			END CASE;
		END PROCESS;
		
		process(state)
	 begin 
	 case state is 
            when s0 =>
                 current_state <= "0000";

            when s1 =>
                current_state <= "0001";
            when s2 =>
                current_state <= "0010";
            when s3 =>
                current_state <= "0011";
            when s4 =>
                current_state <= "0100";
            when s5 =>
                current_state <= "0101";
            when s6 =>
                current_state <= "0110";
            when s7 =>
                current_state <= "0111";
            when s8 =>
                current_state <= "1000";    
            
        end case;
    end process;
    
end fsm;              
