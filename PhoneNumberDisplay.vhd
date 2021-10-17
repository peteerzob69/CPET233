-------------------------------------------------------------------------------
-- Peter Le 
-- This VHDL implementation displays my phone number using different 
-- architecture types.
-- Prelab 3 VHDL code
-------------------------------------------------------------------------------
LIBRARY ieee;  -- Libraries 
USE ieee.std_logic_1164.all;

-- PhoneNumberDisplay Enitity 
-- @input W, X, Y, Z are inputs
-- @output G, F, E, D, C, B, A,                                      -> outputs using simple VHDL concurrent signal assignment
--         A_COND, B_COND, C_COND_ D_COND, E_COND, F_COND, G_COND,   -> outputs using conditional signam assignmetns
--         A_SEL, B_SEL, C_SEL, D_SEL, E_SEL, F_SEL, G_SEL are outputs -> outputs using selected signal assignments

ENTITY PhoneNumberDisplay IS -- Entity 
  PORT(W, X, Y, Z                    : IN STD_LOGIC;
       G, F, E, D, C, B, A,       A_COND, B_COND, C_COND, D_COND, E_COND, F_COND, G_COND,          A_SEL, B_SEL, C_SEL, D_SEL, E_SEL, F_SEL, G_SEL       : OUT STD_LOGIC);
END PhoneNumberDisplay;

ARCHITECTURE structure  OF PhoneNumberDisplay IS -- ARCHITECTURE
  SIGNAL input : STD_LOGIC_VECTOR(3 DOWNTO 0);
  BEGIN 
    -- Structural architecture design
   G <= W OR ((NOT X) AND (NOT Y) AND Z);
	F <= (W AND X) OR (W AND (NOT Z)) OR ((NOT W) AND Y AND Z) OR (X AND (NOT Y) AND (NOT Z));
	E <= ((NOT Y) AND (NOT Z)) OR (W AND X) OR (W AND NOT (Z)) OR (X AND Y) OR ((NOT W) AND Y AND Z);
   D <= (W AND X) OR (W AND (NOT Z)) OR (X AND Y) OR ((NOT W) AND Y AND Z);
	C <= (W AND X) OR ((NOT W) AND Y AND Z);
	B <= (W AND X) OR (X AND Z) OR ((NOT W) AND Y AND Z) OR ((NOT W) AND (NOT X) AND (NOT Y) AND (NOT Z));
	A <= (W AND X) OR (W AND (NOT Z)) OR ((NOT W) AND Y AND Z);
	
	
	input <= W & X & Y & Z; --signal initialization 
	-- conditional signal assignment
	G_COND <= '1' WHEN input = "0001" OR input = "1000" OR input = "1001" OR input = "1010" OR input = "1011" OR input = "1100" OR input = "1101" OR input = "1110" OR input = "1111" 
	     ELSE '0';
	
	F_COND <= '1' WHEN input = "0011" OR input = "0100" OR input = "0111" OR input = "1000" OR input = "1010" OR input = "1100" OR input = "1101" OR  input = "1110" OR input = "1111"
         ELSE '0';
		 
	E_COND <= '1' WHEN input = "0000" OR input = "0011" OR input = "0100" OR input = "0110" OR input = "0111" OR input = "1000" OR input = "1010" OR input = "1100" OR input = "1101" OR input = "1110" OR input = "1111"
	     ELSE '0';
		 
	D_COND <= '1' WHEN input = "0011" OR input = "0110" OR input = "0111" OR input = "1000" OR input = "1010" OR input = "1100" OR input = "1101" OR input = "1110" OR input = "1111"
	     ELSE '0';
	
	C_COND <= '1' WHEN input = "0011" OR input = "0111" OR input = "1100" OR input = "1101" OR input = "1110" OR input = "1111" 
		 ELSE '0';
		 
	B_COND <= '1' WHEN input = "0000" OR input = "0011" OR input = "0101" OR input = "0111" OR input = "1100" OR input = "1101" OR input = "1110" OR input = "1111"
		 ELSE '0';
		 
	A_COND <= '1' WHEN input = "0011" OR input = "0111" OR input = "1000" OR input = "1010" OR input = "1100" OR input = "1101" OR input = "1110" OR input = "1111"
		 ELSE '0';
	
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
	
	WITH input SELECT
	    A_SEL <= '1' WHEN "1111" | "1110" | "1101" | "1100" | "1010" | "1000" | "0111" | "0011",
		         '0' WHEN OTHERS;
		 
	
  END structure; 