-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         tb_pattern_gen_1
--
-- FILENAME:       tb_pattern_gen_1_sim.vhd
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
-- DESCRIPTION:    This is the architecture of the tb_pattern_gen_1 testbench
--                 for the VGA Controller VHDL Project.
--
-------------------------------------------------------------------------------
--                                                                      
-- PACKAGES:       std_logic_1164 (IEEE library)
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture sim of tb_pattern_gen_1 is

  component pattern_gen_1
  port (clk_i    :  in   std_logic;
        reset_i  :  in   std_logic;
        pixel_i  :  in   std_logic_vector(9 downto 0);
        line_i   :  in   std_logic_vector(9 downto 0);
        rgb_o    :  out  std_logic_vector(11 downto 0)
        );
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal clk_i    :  std_logic;
  signal reset_i  :  std_logic;
  signal pixel_i  :  std_logic_vector(9 downto 0);
  signal line_i   :  std_logic_vector(9 downto 0);
  signal rgb_o    :  std_logic_vector(11 downto 0);
  
begin

  -- Instantiate the pattern generator design for testing
  i_pattern_gen_1 : pattern_gen_1
  port map
    (clk_i    => clk_i,
	 reset_i  => reset_i,
	 pixel_i  => pixel_i,
	 line_i   => line_i,
	 rgb_o    => rgb_o
	);
	
  p_clk : process
  begin
    clk_i <= '0';
	wait for 5 ns;
	clk_i <= '1';
	wait for 5 ns;
  end process p_clk;
  
  p_reset: process
  begin
	reset_i <= '0';
	wait for 1600 ns;
	reset_i <= '1';
	wait for 100 ns;
	reset_i <= '0';
	wait;
  end process;
  
  p_pixel : process
  begin
    pixel_i <= "0000000000";   -- black (lines)
	wait for 40 ns;
	pixel_i <= "0010100111";   -- black (lines)
	wait for 40 ns;
	pixel_i <= "0101010101";   -- black (lines)
	wait for 40 ns;
	pixel_i <= "0001101001";   -- black (lines)
	wait for 40 ns;
	pixel_i <= "0100101110";   -- black (lines)
	wait for 40 ns;
	pixel_i <= "0001110001";   -- red (boundary)
	wait for 40 ns;
	pixel_i <= "0010011001";   -- green (boundary)
	wait for 40 ns;
	pixel_i <= "0011000001";   -- blue (boundary)
	wait for 40 ns;
	pixel_i <= "0011101001";   -- black (boundary)
	wait for 40 ns;
	pixel_i <= "0010011000";   -- red (boundary)
	wait for 40 ns;
	pixel_i <= "0011000000";   -- green (boundary)
	wait for 40 ns;
	pixel_i <= "0011101000";   -- blue (boundary)
	wait for 40 ns;
	pixel_i <= "0100010000";   -- black (boundary)
	wait for 40 ns;
	pixel_i <= "0100010001";   -- red (boundary)
	wait for 40 ns;
	pixel_i <= "0100111001";   -- green (boundary)
	wait for 40 ns;
	pixel_i <= "0101100001";   -- blue (boundary)
	wait for 40 ns;
	pixel_i <= "0110001001";   -- black (boundary)
	wait for 40 ns;
	pixel_i <= "0100111000";   -- red (boundary)
	wait for 40 ns;
	pixel_i <= "0101100000";   -- green (boundary)
	wait for 40 ns;
	pixel_i <= "0110001000";   -- blue (boundary)
	wait for 40 ns;
	pixel_i <= "0110110000";   -- black (boundary)
	wait for 40 ns;
	pixel_i <= "0110110001";   -- red (boundary)
	wait for 40 ns;
	pixel_i <= "0111011001";   -- green (boundary)
	wait for 40 ns;
	pixel_i <= "1000000001";   -- blue (boundary)
	wait for 40 ns;
	pixel_i <= "1000101001";   -- black (boundary)
	wait for 40 ns;
	pixel_i <= "0111011000";   -- red (boundary)
	wait for 40 ns;
	pixel_i <= "1000000000";   -- green (boundary)
	wait for 40 ns;
	pixel_i <= "1000101000";   -- blue (boundary)
	wait for 40 ns;
	pixel_i <= "1001010000";   -- black (boundary)
	wait for 40 ns;
	pixel_i <= "1001010001";   -- red (boundary)
	wait for 40 ns;
	pixel_i <= "1001111001";   -- green (boundary)
	wait for 40 ns;
	pixel_i <= "1010100001";   -- blue (boundary)
	wait for 40 ns;
	pixel_i <= "1011001001";   -- black (boundary)
	wait for 40 ns;
	pixel_i <= "1001111000";   -- red (boundary)
	wait for 40 ns;
	pixel_i <= "1010100000";   -- green (boundary)
	wait for 40 ns;
	pixel_i <= "1011001000";   -- blue (boundary)
	wait for 40 ns;
	pixel_i <= "1011110000";   -- black (boundary)
	wait for 40 ns;
	pixel_i <= "1010100001";   -- blue then black (reset)
	wait;
  end process;
  
  
  p_lines : process
  begin
    line_i <= "0000000000";   -- black
	wait for 40 ns;
	line_i <= "0000000110";   -- black
	wait for 40 ns;
    line_i <= "0000001100";   -- black
	wait for 40 ns;
	line_i <= "0111101101";   -- black
	wait for 40 ns;
	line_i <= "1000001100";   -- black
	wait for 40 ns;
	
	
	
	wait;
  end process;
 
 end sim;