-------------------------------------------------------------------------------
-- Peter Le 
-- 10/6/2021
-- This VHDL projects is a four function calculator that timers the result on ssd
-- Prelab 7 VHDL code
-------------------------------------------------------------------------------
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

ENTITY timer IS
  PORT(clk, reset_n, set_n : IN  STD_LOGIC;
	   S                   : IN  STD_LOGIC;
	   Pre_time            : IN  STD_LOGIC_vector(9 downto 0);
	   HEX0, HEX1, HEX2    : OUT STD_LOGIC_VECTOR(6 downto 0));
END timer;
	
ARCHITECTURE structure OF timer IS -- ARCHITECTURE
  CONSTANT simTau : STD_LOGIC_VECTOR(23 DOWNTO 0) := x"000004";
  CONSTANT hardTau : STD_LOGIC_VECTOR(23 DOWNTO 0) := x"4C4B3F";
  
  SIGNAL max_value : STD_LOGIC_VECTOR(23 DOWNTO 0) := x"000004";
  SIGNAL flag : STD_LOGIC := '0';
  SIGNAL cnt : STD_LOGIC_VECTOR(9 DOWNTO 0);
  
  
	
  END structure; 