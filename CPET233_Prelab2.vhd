-------------------------------------------------------------------------------
-- Peter Le 
-- This VHDL implementation displays phone number
-- Prelab 2 VHDL code
-------------------------------------------------------------------------------
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;
-- PhoneNumberDisplay Enitity 
-- @input W, X, Y, Z are inputs
-- @output A_SEL, B_SEL, C_SEL, D_SEL, E_SEL, F_SEL, G_SEL are outputs 
ENTITY PhoneNumberDisplay IS -- Entity 
  PORT(W, X, Y, Z,                    : IN STD_LOGIC;
       A_SEL, B_SEL, C_SEL, D_SEL, E_SEL, F_SEL, G_SEL : OUT STD_LOGIC);
END PhoneNumberDisplay;
ARCHITECTURE structure  OF PhoneNumberDisplay IS -- ARCHITECTURE
  SIGNAL input : STD_LOGIC_VECTOR(3 DOWNTO 0);
  BEGIN 
	input <= W & X & Y & Z; --signal initialization 
	-- selected signal assginment
	WITH input SELECT
		G_SEL <= '1' WHEN "1111" | "1110" | "1101" | "1100" | "1011" | "1010" | "1001" | "1000" | "0001",
		         '0' WHEN OTHERS;
	WITH input SELECT
		F_SEL <= '1' WHEN "1111" | "1110" | "1101" | "1100" | "1010" | "1000" | "0111" | "0100" | "0011", 
		         '0' WHEN OTHERS;
	WITH input SELECT
	    E_SEL <= '1' WHEN "1111" | "1110" | "1101" | "1100" | "1010" | "1000" | "0111" | "0110" | "0100" | "0011" | "0000",
		         '0' WHEN OTHERS;
	WITH input SELECT
	    D_SEL <= '1' WHEN "1111" | "1110" | "1101" | "1100" | "1010" | "1000" | "0111" | "0110" | "0011",
		         '0' WHEN OTHERS;
	WITH input SELECT
	    C_SEL <= '1' WHEN "1111" | "1110" | "1101" | "1100" | "0111" | "0011",
		         '0' WHEN OTHERS;
	WITH input SELECT 
	    B_SEL <= '1' WHEN "1111" | "1110" | "1101" | "1100" | "0111" | "0101" | "0011" | "0000",
		         '0' WHEN OTHERS;
	WITH input <= SELECT
	    A_SEL <= '1' WHEN "1111" | "1110" | "1101" | "1100" | "1010" | "1000" | "0111" | "0011",
		         '0' WHEN OTHERS;
  END structure; 