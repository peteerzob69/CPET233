-------------------------------------------------------------------------------
-- Peter Le 
-- 10/17/2021
-- This VHDL code is part of lab 8. This program is the delay_unit
-- Prelab 8 VHDL code
-------------------------------------------------------------------------------
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

ENTITY delay_unit IS -- Entity
  PORT(max_value : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
       clk : IN STD_LOGIC;
	   reset_n : IN STD_LOGIC;
	   flag : OUT STD_LOGIC);
END delay_unit;

ARCHITECTURE structure OF delay_unit IS -- ARCHITECTURE
  SIGNAL count : unsigned(23 DOWNTO 0);
  BEGIN 
    PROCESS(clk, reset_n) IS 
	  BEGIN
	    IF (reset_n = '0') THEN
		  count <= (others => '0');
		ELSIF (clk'EVENT AND clk = '1') THEN
		  IF (count = max_value) then
		    count <= (others => '0');
		  ELSE
		    count <= count + 1;
		  END IF;
		END IF;
	END PROCESS; 
	
	PROCESS(clk, reset_n) IS
	  BEGIN
	    IF (reset_n = '0') then
		  flag <= '0';
		ELSIF (clk'EVENT AND clk = '1') THEN
		  IF (count = max_value) THEN
		    flag <= '1';
		  ELSE
		    flag <= '0';
		  END IF;
		END IF;
	END PROCESS; 
  END structure; 