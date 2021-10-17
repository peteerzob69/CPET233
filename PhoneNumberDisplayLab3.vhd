-------------------------------------------------------------------------------
-- Peter Le 
-- 9/11/2021
-- This VHDL projects displays my phone number to a 7 segment display.
-- It uses IF-THEN-ELSE and CASE statements in a process .
-- Prelab 3 VHDL code
-------------------------------------------------------------------------------
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;

-- PhoneNumberDisplayLab3 Enitity 
-- @casecaseinput W, X, Y, Z are inputs
-- @output_case the 7 segment output using CASE statements
-- @output_if the 7 segment output using IF-THEN-ELSE statements

-- I mistakenly named the project Lab 3 but this implementaiton is for lab 4. 
ENTITY PhoneNumberDisplayLab3 IS -- Entity
  PORT(W, X, Y, Z   : IN STD_LOGIC;
       output_case, output_if      : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END PhoneNumberDisplayLab3;
ARCHITECTURE structure  OF PhoneNumberDisplayLab3 IS -- ARCHITECTURE
  SIGNAL input : STD_LOGIC_VECTOR(3 DOWNTO 0); -- signal declaration.
  -- constants for the seven segment display.
  CONSTANT ZERO  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1000000";
  CONSTANT ONE   : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111001";
  CONSTANT TWO   : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100100";
  CONSTANT THREE : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0110000";
  CONSTANT FOUR  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0011001";
  
  CONSTANT FIVE  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0010010";
  CONSTANT SIX   : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000010";
  CONSTANT SEVEN : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111000";
  CONSTANT EIGHT : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
  CONSTANT NINE  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0011000";
  
  CONSTANT A     : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001000";
  CONSTANT B     : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000011";
  CONSTANT C     : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1000110";
  CONSTANT D     : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100001";
  CONSTANT E     : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000110"; 
  CONSTANT F     : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001110";
  BEGIN 
   input <= W & X & Y & Z;
	CaseProcess: PROCESS(input) -- Parsing signal input into the 7 segment display using case statements.
	   BEGIN
		  CASE input IS
		     WHEN "0000" => output_case <= FIVE;
			  WHEN "0001" => output_case<= ZERO;
			  WHEN "0010" => output_case <= EIGHT;
			  WHEN "0011" | "0111"  => output_case <= "0111111";
			  WHEN "0100" => output_case <= THREE;
			  WHEN "0101" => output_case <= SIX;
			  WHEN "0110" => output_case <= NINE;
			  WHEN "1000" => output_case <= ONE;
			  WHEN "1001" => output_case <= ZERO;
			  WHEN "1010" => output_case <= ONE;
			  WHEN "1011" => output_case <= ZERO;
			  WHEN OTHERS => output_case <= "1111111"; -- The display is blank for inputs larger 1011.
			END CASE;
		END PROCESS;
	
	IfThenElseProcess : Process(input) -- Parsing signal input into the 7 segment display using if-then-else statements.
	   BEGIN
		  IF input = "0000" THEN
		     output_if <= FIVE;
		  ELSIF input = "0001" THEN
		     output_if <= ZERO;
		  ELSIF input = "0010" THEN
		     output_if <= EIGHT;
		  ELSIF (input = "0011") OR (input = "0111") THEN
		     output_if <= "0111111";
		  ELSIF input = "0100" THEN
		     output_if <= THREE;
		  ELSIF input = "0101" THEN
		     output_if <= SIX;
		  ELSIF input = "0110" THEN
		     output_if <= NINE;
		  ELSIF input = "1000" THEN
		     output_if <= ONE;
		  ELSIF (input = "1001") OR (input = "1011") THEN
		     output_if <= ZERO;
		  ELSIF input = "1010" THEN
		     output_if <= ONE;
		  ELSE 
		     output_if <= "1111111";  -- The display is blank for inputs larger 1011.
		  END IF;
		END PROCESS; 
  END structure; 