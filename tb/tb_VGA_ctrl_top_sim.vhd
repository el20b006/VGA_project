-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         tb_VGA_ctrl_top
--
-- FILENAME:       tb_VGA_ctrl_top_sim.vhd
-- 
-- ARCHITECTURE:   sim
-- 
-- ENGINEER:       Sarah Fröler
--
-- DATE:           16. January 2023
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the architecture of the VGA_ctrl_top testbench
--                 for the VGA Controller VHDLproject.
--
--
-------------------------------------------------------------------------------
--
-- REFERENCES:     (none)
--
-------------------------------------------------------------------------------
--                                                                      
-- PACKAGES:       std_logic_1164 (IEEE library)
--
-------------------------------------------------------------------------------
--                                                                      
-- CHANGES:        Version 1.0
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture sim of tb_VGA_ctrl_top is

  component calc_top
  port (clk_i     :  in   std_logic;                      -- system clock
        reset_i   :  in   std_logic;                      -- reset
        sw_i      :  in   std_logic_vector(15 downto 0);  -- connection switches
        pb_i      :  in   std_logic_vector(3 downto 0);   -- connection buttons
        h_sync_o  :  out  std_logic;                     -- h_sync for monitor
        v_sync_o  :  out  std_logic;                     -- v_sync for monitor
		rgb_o     :  out  std_logic_vector(11 downto 0)  -- rgb output
		);
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal  clk_i     :  std_logic;                     -- system clock
  signal  reset_i   :  std_logic;                     -- reset
  signal  sw_i      :  std_logic_vector(15 downto 0); -- connection switches
  signal  pb_i      :  std_logic_vector(3 downto 0);  -- connection buttons
  signal  h_sync_o  :  std_logic;                     -- h_sync for monitor
  signal  v_sync_o  :  std_logic;                     -- v_sync for monitor
  signal  rgb_o     :  std_logic_vector(11 downto 0)  -- rgb output	
	
	
begin

  -- Instantiate the calc_top design for testing
  i_VGA_ctrl_top : VGA_ctrl_top
  port map              
    (clk_i     => clk_i,
     reset_i   => reset_i,
     sw_i      => sw_i,
	 pb_i      => pb_i,
	 h_sync_o  => h_sync_o,
	 v_sync_o  => v_sync_o,
	 rgb_o     => rgb_o
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
	wait for 150 ms;
	reset_i <= '1';
	wait for 1 ms;
	reset_i <= '0';
	wait;
  end process p_reset;

  p_input : process
  begin
    pb_i  <= "0000";
    sw_i  <= "0000000000000000";  -- pattern1
    wait for 20 ms;
    sw_i  <= "0101000000000010";  -- pattern2
    wait for 20 ms;			
    sw_i  <= "1010000000000001";  -- mem1	
    wait for 20 ms;	
    sw_i  <= "0010000100100011";  -- mem1
    wait for 20 ms;
	sw_i  <= "0000000000000100";  -- pattern1 + mem2
	wait for 20 ms;
	sw_i  <= "0101000000000110";  -- pattern2 + mem2
    wait for 20 ms;
    pw_i  <= "0111011101100111";  -- mem1 + mem2
    wait for 20 ms;
	sw_i  <= "0010000100100101";  -- mem1 + mem2
    wait;
  end process p_input;

end sim;

