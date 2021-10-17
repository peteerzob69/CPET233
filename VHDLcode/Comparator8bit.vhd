LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

ENTITY PlayGround IS -- Entity
  PORT(a, b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       agb, aeb, alb : OUT STD_LOGIC);
END PlayGround;

ARCHITECTURE structure OF PlayGround IS
  SIGNAL result : STD_LOGIC_VECTOR(2 DOWNTO 0);
  
  BEGIN
    PROCESS(a, b)
	  BEGIN
	    IF a < b THEN
		 result <= "001";
		ELSIF a = b THEN
		  result <= "010";
		ELSIF a > b THEN
		  result <= "100";
		ELSE
		  result <= "000";
		END IF;
		agb <= result(2);
		aeb <= result(1);
		alb <= result(0);
	END PROCESS;
  END structure; 