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
  port (clk_i        : in  std_logic;  -- 100MHz clock
        reset_i      : in  std_logic;  -- reset
        enable_25M_o : out std_logic   -- 25MHz enable signal	
        );
end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal s_clk        :	std_logic;  -- 100MHz clock
  signal s_reset      :	std_logic;  -- reset
  signal s_enable_25M : std_logic;  -- 25MHz enable signal
    
begin

  -- Instantiate the prescaler design for testing
  i_prescalter : prescaler
  port map              
    (clk_i        => s_clk,
     reset_i      => s_reset,
     enable_25M_o => s_enable_25M
	 );
	
  p_clk	: process
  begin
    s_clk <= '0';
    wait for 5 ns;
    s_clk <= '1';
    wait for 5 ns;
  end process p_clk; 
  
  p_reset : process
  begin
    s_reset <= '0';
    wait for 100 ns;
    s_reset <= '1';
    wait for 10 ns;
    s_reset <= '0';
    wait;
  end process p_reset;

end sim;

