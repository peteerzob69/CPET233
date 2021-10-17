LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;   

ENTITY binary2ssd IS -- Entity
   PORT(In_num : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        HEX0, HEX1, HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END binary2ssd;

ARCHITECTURE structure OF getDecimalPlace IS -- ARCHITECTURE
    COMPONENT IS HW3_constants -- Entity 
    PORT(input : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
       hex   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
    END COMPONENT;
	
  
  SIGNAL ones : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL tens : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL hundreds : STD_LOGIC_VECTOR(3 DOWNTO 0);
	
  BEGIN
    -- this needs work
    ones <= STD_LOGIC_VECTOR(In_num rem "1010"); -- returns 1 place
    tens <= STD_LOGIC_VECTOR((num_sign / "1010") rem "1010" ); --returns 10's place 
    decimal_place <= STD_LOGIC_VECTOR(num_sign / "1100100"); -- returns 100's place
	
	inst0 : HW3_constants
	PORT MAP(input => ones, hex => hex0);
	
	inst1 : HW3_constants
	PORT MAP(input => tens, hex=> hex1);
	
	inst2 : HW3_constants
	PORT MAP(input => hundreds, hex => hex2);
	
  END structure; 