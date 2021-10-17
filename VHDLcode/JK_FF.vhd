
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

ENTITY JK_FF IS -- Entity
  PORT(J : IN STD_LOGIC;
       K : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 Q : OUT STD_LOGIC);
END JK_FF;

ARCHITECTURE structure OF JK_FF IS -- ARCHITECTURE
  SIGNAL Qin : STD_LOGIC := '0';
  SIGNAL jk : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
  
  BEGIN
  jk <= J&K;
  PROCESS(CLK) -- JK Flip flop with no set/reset
    BEGIN
	   IF (RISING_EDGE(CLK)) THEN
		  CASE(JK) IS
		    WHEN "00" => Qin <= Qin;
			 WHEN "01" => Qin <= '0';
			 WHEN "10" => Qin <= '1';
			 WHEN OTHERS => Qin <= NOT Qin;
			END CASE; 
		END IF;
	END PROCESS;
	Q <= Qin;
  END structure; 