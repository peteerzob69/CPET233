-------------------------------------------------------------------------------
-- Peter Le 
-- 9/30/2021
-- This VHDL code is part of lab 6. This program returns the absolute value of a number
-- Prelab 6 VHDL code
-------------------------------------------------------------------------------
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

ENTITY absval IS -- Entity
  PORT(In_num : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- numeric input
       abs_In_num : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); -- magnitude of In_num 
END absval;

ARCHITECTURE structure OF absval IS -- ARCHITECTURE
  signal num_sign : SIGNED(7 DOWNTO 0); 
  BEGIN 
     num_sign <= signed(In_num);
     sign : PROCESS(In_num, num_sign)
	 BEGIN
	    IF (In_num(7) = '0') THEN -- if the msb is 1 then the number is negative by 2's complement convention
		   abs_In_num <= In_num;
		ELSE
		   abs_In_num <= STD_LOGIC_VECTOR((num_sign XOR "11111111")  + "00000001");  
	    END IF; 
	 END PROCESS;
  END structure; 