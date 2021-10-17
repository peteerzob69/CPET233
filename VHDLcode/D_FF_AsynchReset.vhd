
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

ENTITY PlayGround IS -- Entity
  PORT(D, CLK, CLRN : IN STD_LOGIC;
	   Q : OUT STD_LOGIC);
END PlayGround;

ARCHITECTURE structure OF PlayGround IS -- ARCHITECTURE
  BEGIN
    PROCESS(CLK, CLRN)
	  BEGIN
	    IF(CLRN = '0') THEN
		  Q <= '0';
		ELSIF (RISING_EDGE(CLK)) THEN
		  Q <= D;
		END IF;
	END PROCESS;
  END structure; 