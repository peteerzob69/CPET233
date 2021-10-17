-------------------------------------------------------------------------------
-- Peter Le 
-- 10/16/2021
-- This VHDL program is part of lab 8. This program implements a counter that 
-- counts from 0 to 999 with an enabler. 
-------------------------------------------------------------------------------
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

ENTITY counter IS -- Entity
  PORT(set_n : IN STD_LOGIC;
       time0 : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	   enable : IN STD_LOGIC;
	   clk : IN STD_LOGIC;
	   reset_n : IN STD_LOGIC;
       count : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
END counter;

ARCHITECTURE structure OF counter IS -- architecture
  SIGNAL cnt : UNSIGNED(9 DOWNTO 0);
  CONSTANT MAX_VAL : UNSIGNED(9 DOWNTO 0) := "1111100111";
  
  BEGIN
    PROCESS(CLK, reset_n) -- asynchronous reset
	  BEGIN
	    IF(reset_n = '0') THEN
		  cnt <= (others => '0');
		ELSIF(RISING_EDGE(CLK)) THEN 
		  IF (set_n = '0') THEN
		    cnt <= 	unsigned(time0);
		  ELSIF (enable = '1') THEN
		    IF(cnt = MAX_VAL) THEN 
			  cnt <= (others => '0');
			ELSE
			  cnt <= cnt + 1;
			END IF;
		  END IF;
		END IF;
    END PROCESS;
	
    count <= STD_LOGIC_VECTOR(cnt);
  END structure; 