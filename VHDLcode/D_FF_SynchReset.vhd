
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

ENTITY D_FF_SynchReset IS -- Entity
  PORT(D, CLK, CLRN : IN STD_LOGIC;
	   Q : OUT STD_LOGIC);
END D_FF_SynchReset;

ARCHITECTURE structure OF D_FF_SynchReset IS -- ARCHITECTURE
  BEGIN
    PROCESS(CLK)
	  BEGIN
	    IF(RISING_EDGE(CLK)) THEN
		  IF(CLRN = '0') THEN
		    Q <= '0';
		  ELSE
		    Q <= D;
		  END IF;
		END IF;
	END PROCESS;
  END structure; 