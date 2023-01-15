-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         tb_prescaler
--
-- FILENAME:       tb_prescaler_sim.vhd
-- 
-- ARCHITECTURE:   sim
-- 
-- ENGINEER:       Sarah Fröler
--
-- DATE:           21. November 2022
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the architecture of the prescaler testbench
--                 for the VGA Controller VHDL Project.
--
-------------------------------------------------------------------------------
--                                                                      
-- PACKAGES:       std_logic_1164 (IEEE library)
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


architecture sim of tb_prescaler is

  component prescaler
  port (clk_i         :  in   std_logic;    -- system clock 100MHz
        reset_i       :  in   std_logic;    -- reset
        enable_25M_o  :  out  std_logic	    -- 25MHz enable signal	
        );
end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal clk_i         :	std_logic;      -- system clock 100MHz
  signal reset_i       :	std_logic;      -- reset
  signal enable_25M_o  : 	std_logic;      -- 25MHz enable signal
  
  
begin

  -- Instantiate the prescaler design for testing
  i_prescalter : prescaler
  port map              
    (clk_i         => clk_i,
     reset_i       => reset_i,
     enable_25M_o  => enable_25M_o
	 );
	
	
  p_clk	: process
  begin
    clk_i <= '0';
    wait for 5 ns;
    clk_i <= '1';
    wait for 5 ns;
  end process p_clk; 
  
  p_reset : process
  begin
    reset_i <= '0';
    wait for 100 ns;
    reset_i <= '1';
    wait for 10 ns;
    reset_i <= '0';
    wait;
  end process p_reset;

end sim;

