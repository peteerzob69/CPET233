-------------------------------------------------------------------------------
-- Peter Le 
-- 9/30/2021
-- This VHDL code is part of lab 6. This program returns a specified place. 
-- Prelab 6 VHDL code
-------------------------------------------------------------------------------
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

--Precondition: abs_In_num is a unsigned number.
ENTITY getDecimalPlace IS -- Entity
  PORT(abs_In_num : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- numeric input
       Op : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
       decimal_place : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END getDecimalPlace;

-- OP = "00" returns 1's place 
-- OP = "01" returns tenth's place.
-- when others returns hundrenths place

ARCHITECTURE structure OF getDecimalPlace IS -- ARCHITECTURE
  signal num_sign : unsigned(7 downto 0);
  
  BEGIN 
     num_sign <= unsigned(abs_In_num);
	 
     process_decimal : PROCESS(num_sign, Op)
	 BEGIN
	    IF (OP = "00") THEN 
		   decimal_place <= STD_LOGIC_VECTOR(num_sign rem "00001010"); -- returns 1 place
		ELSIF (OP = "01") THEN
		   decimal_place <= STD_LOGIC_VECTOR((num_sign / "00001010") rem "00001010" ); --returns 10's place 
		else
		   decimal_place <= STD_LOGIC_VECTOR(num_sign / "01100100"); -- returns 100's place
		END IF; 
	 END PROCESS;
  END structure; 