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
  port (clk_i   : in  std_logic;                     -- 100MHz clock
        reset_i : in  std_logic;                     -- reset
        pixel_i : in  std_logic_vector(9 downto 0);  -- current pixel
        line_i  : in  std_logic_vector(9 downto 0);  -- current line 
        rgb_o   : out std_logic_vector(11 downto 0)  -- rgb value output
        );
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal s_clk   : std_logic;                      -- 100MHz clock
  signal s_reset : std_logic;                      -- reset
  signal s_pixel : std_logic_vector(9 downto 0);   -- current pixel
  signal s_line  : std_logic_vector(9 downto 0);   -- current line
  signal s_rgb   : std_logic_vector(11 downto 0);  -- rgb value output
  
begin

  -- Instantiate the pattern generator 1 design for testing
  i_pattern_gen_1 : pattern_gen_1
  port map
    (clk_i   => s_clk,
	 reset_i => s_reset,
	 pixel_i => s_pixel,
	 line_i  => s_line,
	 rgb_o   => s_rgb
	);
	
  p_clk : process
  begin
    s_clk <= '0';
	wait for 5 ns;
	s_clk <= '1';
	wait for 5 ns;
  end process p_clk;
  
  p_reset: process
  begin
	s_reset <= '0';
	wait for 1600 ns;
	s_reset <= '1';
	wait for 100 ns;
	s_reset <= '0';
	wait;
  end process;
  
  p_pixel : process
  begin
    s_pixel <= "0000000000";   -- black (lines)
	wait for 40 ns;
	s_pixel <= "0010100111";   -- black (lines)
	wait for 40 ns;
	s_pixel <= "0101010101";   -- black (lines)
	wait for 40 ns;
	s_pixel <= "0001101001";   -- black (lines)
	wait for 40 ns;
	s_pixel <= "0100101110";   -- black (lines)
	wait for 40 ns;
	s_pixel <= "0010010000";   -- red (boundary)
	wait for 40 ns;
	s_pixel <= "0010111000";   -- green (boundary)
	wait for 40 ns;
	s_pixel <= "0011100000";   -- blue (boundary)
	wait for 40 ns;
	s_pixel <= "0010001111";   -- black (boundary)
	wait for 40 ns;
	s_pixel <= "0010110111";   -- red (boundary)
	wait for 40 ns;
	s_pixel <= "0011011111";   -- green (boundary)
	wait for 40 ns;
	s_pixel <= "0100000111";   -- blue (boundary)
	wait for 40 ns;
	s_pixel <= "0100001000";   -- black (boundary)
	wait for 40 ns;
	s_pixel <= "0100110000";   -- red (boundary)
	wait for 40 ns;
	s_pixel <= "0101011000";   -- green (boundary)
	wait for 40 ns;
	s_pixel <= "0110000000";   -- blue (boundary)
	wait for 40 ns;
	s_pixel <= "0100101111";   -- black (boundary)
	wait for 40 ns;
	s_pixel <= "0101010111";   -- red (boundary)
	wait for 40 ns;
	s_pixel <= "0101111111";   -- green (boundary)
	wait for 40 ns;
	s_pixel <= "0110100111";   -- blue (boundary)
	wait for 40 ns;
	s_pixel <= "0110101000";   -- black (boundary)
	wait for 40 ns;
	s_pixel <= "0111010000";   -- red (boundary)
	wait for 40 ns;
	s_pixel <= "0111111000";   -- green (boundary)
	wait for 40 ns;
	s_pixel <= "1000100000";   -- blue (boundary)
	wait for 40 ns;
	s_pixel <= "0111001111";   -- black (boundary)
	wait for 40 ns;
	s_pixel <= "0111110111";   -- red (boundary)
	wait for 40 ns;
	s_pixel <= "1000011111";   -- green (boundary)
	wait for 40 ns;
	s_pixel <= "1001000111";   -- blue (boundary)
	wait for 40 ns;
	s_pixel <= "1001001000";   -- black (boundary)
	wait for 40 ns;
	s_pixel <= "1001110000";   -- red (boundary)
	wait for 40 ns;
	s_pixel <= "1010011000";   -- green (boundary)
	wait for 40 ns;
	s_pixel <= "1011000000";   -- blue (boundary)
	wait for 40 ns;
	s_pixel <= "1001101111";   -- black (boundary)
	wait for 40 ns;
	s_pixel <= "1010010111";   -- red (boundary)
	wait for 40 ns;
	s_pixel <= "1010111111";   -- green (boundary)
	wait for 40 ns;
	s_pixel <= "1011100111";   -- blue (boundary)
	wait for 40 ns;
	s_pixel <= "1011101000";   -- black (boundary)
	wait for 40 ns;
	s_pixel <= "1011000000";   -- blue then black (reset)
	wait;
  end process p_pixel;
  
  p_lines : process
  begin
    s_line <= "0000000000";   -- black
	wait for 40 ns;
	s_line <= "0000000110";   -- black
	wait for 40 ns;
    s_line <= "1000010011";   -- black
	wait for 40 ns;
	s_line <= "1111101101";   -- black
	wait for 40 ns;
	s_line <= "0010100011";   -- rgb pixels
	wait;
  end process p_lines;
 
 end sim;