-------------------------------------------------------------------------------
-- Peter Le 
-- 10/6/2021
-- This VHDL projects is a four function calculator that Full_calculators the result on ssd
-- Prelab 7 VHDL code
-------------------------------------------------------------------------------
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
USE ieee.std_logic_unsigned.all; 

-- @input A the signed binary number A
-- @input B the signed binary number B
-- @input Op selects mathematical operation
--    "00" -> addition: A+B
-- @output hex3 the sign ssd
-- @output hex2 the 100ths place ssd
-- @output hex1 the 10ths place ssd
-- @output hex0 the 1ths place ssd
ENTITY Full_calculator IS  
   PORT(A                      : in   STD_LOGIC_VECTOR(3 downto 0); --A input
        B                      : in   STD_LOGIC_VECTOR(3 downto 0); --B input
        Op                     : in   STD_LOGIC_VECTOR(1 downto 0); --Selects operation
        hex0,hex1, hex2, hex3  : out  STD_LOGIC_VECTOR(6 downto 0) --hex displays    
        );
END Full_calculator;
ARCHITECTURE structure OF Full_calculator IS -- ARCHITECTURE
  -- Component declaration
  COMPONENT calculator IS -- Entity
    PORT(in_A : in STD_LOGIC_VECTOR(3 downto 0); 
         in_B : in STD_LOGIC_VECTOR(3 downto 0);    
         Op   : in STD_LOGIC_VECTOR(1 downto 0);                                   
         Result : out  STD_LOGIC_VECTOR(7 downto 0));
    END COMPONENT;

  COMPONENT display IS -- Entity
    PORT(In_num : in   STD_LOGIC_VECTOR(7 downto 0); 
         HEX0, HEX1, HEX2, HEX3 : out  STD_LOGIC_VECTOR(6 downto 0));
    END COMPONENT;
	
  SIGNAL in_num : STD_LOGIC_VECTOR(7 DOWNTO 0); -- this internal signal connects the calculator to the LEDconverter
  
  BEGIN
    -- Reference logic diagram for complete picture
    inst1 : calculator
    PORT MAP(in_A => A, in_B=> B, Op=>Op, result => in_num);	
	
	inst2 : display
	PORT MAP(in_num => in_num, HEX0 => HEX0, HEX1 => HEX1, HEX2 => HEX2, HEX3 => HEX3);
	
  END structure; 