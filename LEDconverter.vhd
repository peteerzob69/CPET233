-- Peter Le 
-- 9/30/2021
-- This VHDL code is part of lab 6. It converts a STD_LOGIC_VECTOR to HEX_n led display
-- Prelab 6 VHDL code
-------------------------------------------------------------------------------
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

-- Precondition: decimal_place < 10 and is a postive number. 

ENTITY LEDconverter IS -- Entity
  PORT(decimal_place : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       HEX_n : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)); 
END LEDconverter;

ARCHITECTURE structure OF LEDconverter IS -- ARCHITECTURE
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
  
  BEGIN 
     bin_to_HEX_n : PROCESS(decimal_place)
	     BEGIN
		     CASE decimal_place IS
			    WHEN "00000000" => HEX_n <= ZERO;
				 WHEN "00000001" => HEX_n <= ONE;
				 WHEN "00000010" => HEX_n <= TWO;
				 WHEN "00000011" => HEX_n <= THREE;
				 WHEN "00000100" => HEX_n <= FOUR;
				 WHEN "00000101" => HEX_n <= FIVE;
				 WHEN "00000110" => HEX_n <= SIX;
				 WHEN "00000111" => HEX_n <= SEVEN;
				 WHEN "00001000" => HEX_n <= EIGHT;
				 WHEN "00001001" => HEX_n <= NINE;
				 WHEN OTHERS => HEX_n <= NINE; -- when others condition for all other possibilities. 
			   END CASE;
			END PROCESS;
  END structure; 