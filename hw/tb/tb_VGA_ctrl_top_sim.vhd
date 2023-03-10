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
-- ENGINEER:       Sarah Fr?ler
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

  component VGA_ctrl_top
  port (clk_i    : in  std_logic;                      -- system clock
        reset_i  : in  std_logic;                      -- reset
        sw_i     : in  std_logic_vector(15 downto 0);  -- connection switches
        pb_i     : in  std_logic_vector(3 downto 0);   -- connection buttons
        h_sync_o : out std_logic;                      -- h_sync for monitor
        v_sync_o : out std_logic;                      -- v_sync for monitor
		rgb_o    : out std_logic_vector(11 downto 0)   -- rgb output
		);
  end component;

  -- Declare the signals used stimulating the design's inputs.
  signal s_clk    : std_logic;                     -- system clock
  signal s_reset  : std_logic;                     -- reset
  signal s_sw     : std_logic_vector(15 downto 0); -- connection switches
  signal s_pb     : std_logic_vector(3 downto 0);  -- connection buttons
  signal s_h_sync : std_logic;                     -- h_sync for monitor
  signal s_v_sync : std_logic;                     -- v_sync for monitor
  signal s_rgb    : std_logic_vector(11 downto 0); -- rgb output	
	
	
begin
  -- Instantiate the calc_top design for testing
  i_VGA_ctrl_top : VGA_ctrl_top
  port map              
    (clk_i    => s_clk,
     reset_i  => s_reset,
     sw_i     => s_sw,
	 pb_i     => s_pb,
	 h_sync_o => s_h_sync,
	 v_sync_o => s_v_sync,
	 rgb_o    => s_rgb
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
	s_reset <= '1';
	wait for 10 ns;
	s_reset <= '0';
	wait;
  end process p_reset;

  p_input : process
  begin
    s_pb <= "0000";
	s_sw <= "0000000000000100";  -- pattern1 + mem2
	wait for 20 ms;
	s_sw <= "0101000000000110";  -- pattern2 + mem2
    wait for 20 ms;
	s_sw <= "0111011101100111";  -- mem1 + mem2
    wait for 20 ms;
	s_sw <= "0010000100100101";  -- mem1 + mem2
	wait for 20 ms;
	s_pb <= "1000";
	wait for 20 ms;
	s_pb <= "0100";
	wait for 20 ms;
	s_pb <= "0010";
	wait for 20 ms;
	s_pb <= "0001";
    wait;
  end process p_input;

end sim;

