-------------------------------------------------------------------------------
-- Peter Le 
-- 9/22/2021
-- This VHDL projects functions as a calculator.
-- Prelab 5 VHDL code
-- This code has never been compiled. 
-------------------------------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;   
ENTITY calculator IS -- Entity
   PORT
   ( 
     in_A : in STD_LOGIC_VECTOR(3 downto 0);      --A input
     in_B : in STD_LOGIC_VECTOR(3 downto 0);      --B input
     Op   : in STD_LOGIC_VECTOR(1 downto 0);                                   
     Result : out  STD_LOGIC_VECTOR(7 downto 0)
   );
END calculator;

ARCHITECTURE oh_behave  OF calculator IS -- ARCHITECTURE
  SIGNAL A, B : SIGNED(3 DOWNTO 0);
  BEGIN 
    A <= SIGNED(in_A);
	B <= SIGNED(in_B);
	  -- need a sequential case statement 
  -- use signed numbers
  
  -- get input 
  -- parse into signed number
  -- determine operation 
  -- If add-> then add
  -- if sub -> the sub
  -- if ..
  -- update result
	operate : PROCESS(Op, A, B)
	   BEGIN
	   CASE Op IS
	      WHEN "00" => Result <= STD_LOGIC_VECTOR((A(3)&A(3)&A(3)&A(3)&A) + (B(3)&B(3)&B(3)&B(3)&B)); -- maybe have to pad // at least one of the addends have to be same size the result
		  WHEN "01" => Result <= STD_LOGIC_VECTOR((A(3)&A(3)&A(3)&A(3)&A) - (B(3)&B(3)&B(3)&B(3)&B));
		  WHEN "10" => Result <= STD_LOGIC_VECTOR(A * B);
		  WHEN OTHERS => Result <= STD_LOGIC_VECTOR((A(3)&A(3)&A(3)&A(3)&A) / B);
	    END CASE; 
    END PROCESS;
  END oh_behave; 