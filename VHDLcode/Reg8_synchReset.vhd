-------------------------------------------------------------------------------
-- Peter Le 
-- 10/16/2021
-- This VHDL program is part of lab 8. This program implements a PlayGround that 
-- counts from 0 to 999 with an enabler. 
-------------------------------------------------------------------------------
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

ENTITY PlayGround IS -- Entity
  PORT(D : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       CLK : IN STD_LOGIC;
	   CLRN : IN STD_LOGIC;
       Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END PlayGround;

ARCHITECTURE structure OF PlayGround IS
  BEGIN
  PROCESS(CLK)
    BEGIN
	  IF(CLK'EVENT AND CLK = '1') THEN
	    IF (CLRN = '0') THEN
		  Q <= x"00";
		ELSE
		  Q <= D;
		END IF;
	  END IF;
  END PROCESS;
  END structure; 