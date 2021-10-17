-------------------------------------------------------------------------------
-- Peter Le 
-- 9/30/2021
-- This VHDL projects displays a number
-- Prelab 6 VHDL code
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Peter Le 
-- 9/30/2021
-- This VHDL code is part of lab 6. This program determines whether or not to
-- append a negative sign to the 4 seven segments displays
-- Prelab 5 VHDL code
-- This code has never been compiled. 
-------------------------------------------------------------------------------
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

ENTITY sign_mux IS -- Entity
  PORT(In_num : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- numeric input
       HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)); -- LED3 is the sign LED
END sign_mux;

ARCHITECTURE structure OF sign_mux IS -- ARCHITECTURE
  constant DASH:  std_logic_vector(6 downto 0) := "0111111";
  constant blank: std_logic_vector(6 downto 0) := "1111111";
  
  BEGIN 
     sign : PROCESS(In_num)
	 BEGIN
	    IF (In_num(7) = '1') THEN -- if the msb is 1 then the number is negative by 2's complement convention 
		   HEX3 <= DASH;
		ELSE
		   HEX3 <= blank; 
	    END IF; 
		
	 END PROCESS;
  END structure; 