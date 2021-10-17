LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;           -- need for to_unsigned

ENTITY Lab3prelab_tb IS     --this is the test bench entity.
END ENTITY Lab3prelab_tb;   --It has a different name than the module you are testing

ARCHITECTURE test OF Lab3prelab_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT PhoneNumberDisplay      --the component name must match your lab4 entity name
        PORT (
            X           : IN  std_logic;  --these port names must match your
            Y           : IN  std_logic;  --entity port names exactly
            Z           : IN  std_logic;
            W           : IN  std_logic;
            ----------------------------  
            G, F, E, D, C, B, A : OUT STD_LOGIC;
			A_COND, B_COND, C_COND, D_COND, E_COND, F_COND, G_COND : OUT STD_LOGIC;
			A_SEL, B_SEL, C_SEL, D_SEL, E_SEL, F_SEL, G_SEL : OUT STD_LOGIC			
            ); 
    END COMPONENT;


    --Inputs
    SIGNAL inputs : std_logic_vector(3 DOWNTO 0);       --this vector will drive the inputs

    --Outputs
	G_tb, F_tb, E_tb, D_tb, C_tb, B_tb, A_tb : OUT STD_LOGIC;
	A_COND_tb, B_COND_tb, C_COND_tb, D_COND_tb, E_COND_tb, F_COND_tb, G_COND_tb : OUT STD_LOGIC;
	A_SEL_tb, B_SEL_tb, C_SEL_tb, D_SEL_tb, E_SEL_tb, F_SEL_tb, G_SEL_tb : OUT STD_LOGIC;
    
BEGIN
    uut : PhoneNumberDisplay PORT MAP(

        W           => inputs(3),       
        X           => inputs(2),
        Y           => inputs(1),
        Z           => inputs(0),
        --
		G => G_tb,
		F => F_tb,
		E => E_tb,
		D => D_tb,
		C => C_tb,
		B => B_tb,
		A => A_tb,
		
		A_COND => A_COND_tb,
		B_cond => B_COND_tb,
		C_COND => C_COND_tb,
		D_COND => D_COND_tb,
		E_COND => E_COND_tb,
		F_COND => F_COND_tb,
		G_COND => G_COND_tb,
		
		A_SEL => A_SEL_tb,
		B_SEL => B_SEL_tb,
		C_SEL => C_SEL_tb,
		D_SEL => D_SEL_tb,
		E_SEL => E_SEL_tb,
		F_SEL => F_SEL_tb,
		G_SEL => G_SEL_tb
		
        );


    ---------------------------------------------------------------------------
    -- NAME: Stimulus
    --
    -- DESCRIPTION:
    --    This process will apply the  stimulus to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
    BEGIN
        FOR i IN 0 TO 15 LOOP
            inputs <= std_logic_vector(to_unsigned(i,4));
            WAIT FOR 10 ns;
        END LOOP;

        -----------------------------------------------------------------------
        -- This last WAIT statement needs to be here to prevent the PROCESS
        -- sequence from restarting.
        -----------------------------------------------------------------------
        WAIT;
        
    END PROCESS stimulus;

END ARCHITECTURE test;
