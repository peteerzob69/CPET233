-------------------------------------------------------------------------------
-- Peter Le 
-- HW 3.1 - Sixteen constants
-- 9/11/2021
-------------------------------------------------------------------------------
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
-- This program converts 4-bit binary numbers into their hexadecimal equivalent.
ENTITY HW3_constants IS -- Entity 
  PORT(input : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
       hex   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END HW3_constants;
ARCHITECTURE oh_behave  OF HW3_constants IS -- ARCHITECTURE 
  -- The order of constants is gfedcba with respect to the 7-segment digital display. 
  CONSTANT ZERO  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1000000";
  CONSTANT ONE   : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111001";
  CONSTANT TWO   : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100100";
  CONSTANT THREE : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0110000";
  CONSTANT FOUR  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0011001";
  
  CONSTANT FIVE  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0010010";
  CONSTANT SIX   : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000010";
  CONSTANT SEVEN : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111000";
  CONSTANT EIGHT : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
  CONSTANT NINE  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0011000";
  
  CONSTANT A     : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001000";
  CONSTANT B     : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000011";
  CONSTANT C     : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1000110";
  CONSTANT D     : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100001";
  CONSTANT E     : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000110";
  CONSTANT F     : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001110";
  BEGIN -- case statement to parse binary numbers
     bin_to_hex : PROCESS(input) -- the sensitivity list only includes input BC only input is being processed. 
	     BEGIN
		     CASE input IS
			     WHEN "0000" => hex <= ZERO;
				  WHEN "0001" => hex <= ONE;
				  WHEN "0010" => hex <= TWO;
				  WHEN "0011" => HEX <= THREE;
				  WHEN "0100" => HEX <= FOUR;
				  WHEN "0101" => HEX <= FIVE;
				  WHEN "0110" => HEX <= SIX;
				  WHEN "0111" => HEX <= SEVEN;
				  WHEN "1000" => HEX <= EIGHT;
				  WHEN "1001" => HEX <= NINE;
				  WHEN "1010" => HEX <= A;
				  WHEN "1011" => HEX <= B;
				  WHEN "1100" => HEX <= C;
				  WHEN "1101" => HEX <= D;
				  WHEN "1110" => HEX <= E;
				  WHEN OTHERS => HEX <= F; -- when others condition for all other possibilities. 
				END CASE;
			END PROCESS;
  END oh_behave; 