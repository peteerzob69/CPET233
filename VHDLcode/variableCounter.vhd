LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

ENTITY variableCounter IS -- Entity
  PORT(clk, reset_n : IN STD_LOGIC;
       count : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END variableCounter;

ARCHITECTURE structure OF variableCounter IS
  SIGNAL cnt  : UNSIGNED(3 DOWNTO 0) := "0001"; -- initalize cnt to start at one
  CONSTANT MAX_VALUE : UNSIGNED(3 DOWNTO 0) := "1110"; -- max value is 14
  CONSTANT MIN_VALUE : UNSIGNED(3 DOWNTO 0) := "0001"; -- restarts at 1
  
  BEGIN
     PROCESS(clk, reset_n)
	  begin
	    IF (reset_n = '0') THEN
		  CNT <= MIN_VALUE;
		ELSIF (RISING_EDGE(clk) AND CLK = '1') THEN
		  IF(cnt = MAX_VALUE) THEN
		    cnt <= MIN_VALUE;
		  ELSE
		    cnt <= cnt + 1;
		  END IF;
		END IF;
	  END PROCESS;
	  count <= STD_LOGIC_VECTOR(cnt);
  END structure; 