-------------------------------------------------------------------------------
-- Peter Le 
-- 10/05/2021
-- This VHDL project functions as a four function calculator to numbers A and B
-- Prelab 7 VHDL code
-------------------------------------------------------------------------------
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

-- @input in_num the signed number to be displayed 
-- @output HEX0, HEX1, HEX2, HEX3, the 4 seven segment displays.
ENTITY display IS -- Entity
  PORT(In_num : in   STD_LOGIC_VECTOR(7 downto 0); 
       HEX0, HEX1, HEX2, HEX3 : out  STD_LOGIC_VECTOR(6 downto 0));
END display;

ARCHITECTURE structure  OF display IS -- ARCHITECTURE

  -- COMPONENT declaration
  COMPONENT absval IS 
     PORT(In_num : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
          abs_In_num : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;
  
  COMPONENT getDecimalPlace IS 
  PORT(abs_In_num : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
       Op : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
       decimal_place : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;
  
  COMPONENT sign_mux IS 
     PORT(In_num : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
          HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
  END COMPONENT;
  
  COMPONENT LEDconverter IS 
  PORT(decimal_place : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       HEX_n : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)); 
  END COMPONENT;
  
  -- internal signals to connect components
  signal abs_num, s1, s2, s3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  
  BEGIN 
     	 inst1 : sign_mux
	 PORT MAP(In_num => In_num, HEX3 => HEX3); -- inst1 determines the sign of the output
	 
	 inst2 : absval
	 PORT MAP(In_num => In_num, abs_In_num => abs_num); -- returns the unsigned positive number of @input In_num
	 
	 inst4 : getDecimalPlace
	 PORT MAP(abs_In_num => abs_num, Op => "10", decimal_place => s1); -- returns 100ths place
	 
	 inst5 : getDecimalPlace
	 PORT MAP(abs_In_num => abs_num, Op => "01", decimal_place => s2); -- returns the 10ths place
	 
	 inst6 : getDecimalPlace
	 PORT MAP(abs_In_num => abs_num, Op => "00", decimal_place => s3); -- returns the 1ths place
	 
	 -- binary digit to ssd converter
	 inst7 : LEDconverter
	 PORT MAP(decimal_place => s1, HEX_n => HEX2);
	 
	 inst8 : LEDconverter
	 PORT MAP(decimal_place => s2, HEX_n => HEX1);
	 
	 inst9 : LEDconverter
	 PORT MAP(decimal_place => s3, HEX_n => HEX0);
  END structure; 