-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         tb_pattern_gen_2
--
-- FILENAME:       tb_pattern_gen_2_sim.vhd
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
-- DESCRIPTION:    This is the architecture of the tb_pattern_gen_2 testbench
--                 for the VGA Controller VHDL Project.
--
-------------------------------------------------------------------------------
--                                                                      
-- PACKAGES:       std_logic_1164 (IEEE library)
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture sim of tb_pattern_gen_2 is

  component pattern_gen_2
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
  i_pattern_gen_2 : pattern_gen_2
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
	wait for 18 ms;
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
	
	pixel_i <= "0001110001";   -- pixel 64
	wait for 880 ns;     
	pixel_i <= "0010110000";   -- pixel 176
	wait for 880 ns;
	pixel_i <= "0010110001";   -- pixel 177
	wait for 880 ns;
	pixel_i <= "0011110000";   -- pixel 240
	wait for 880 ns;
	pixel_i <= "0011110001";   -- pixel 241
	wait for 880 ns;
	pixel_i <= "0100110000";   -- pixel 304
	wait for 880 ns;
	pixel_i <= "0100110001";   -- pixel 305
	wait for 880 ns;
	pixel_i <= "0101110000";   -- pixel 368
	wait for 880 ns;
	pixel_i <= "0101110001";   -- pixel 369
	wait for 800 ns;
	pixel_i <= "0110110000";   -- pixel 432
	wait for 880 ns;
	pixel_i <= "0110110001";   -- pixel 433
	wait for 880 ns;
	pixel_i <= "0111110000";   -- pixel 496
	wait for 880 ns;
	pixel_i <= "0111110001";   -- pixel 497
	wait for 880 ns;
	pixel_i <= "1000110000";   -- pixel 560
	wait for 880 ns;
	pixel_i <= "1000110001";   -- pixel 561
	wait for 880 ns;
	pixel_i <= "1001110000";   -- pixel 624
	wait for 880 ns;
	pixel_i <= "1001110001";   -- pixel 625
	wait for 880 ns;
	pixel_i <= "1010110000";   -- pixel 688
	wait for 880 ns;
	pixel_i <= "1010110001";   -- pixel 689
	wait for 880 ns;
	pixel_i <= "1011110000";   -- pixel 752
	wait for 880 ns;
	
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
	
    line_i <= "0000001100";   -- black (boundary) pixel 113, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- red (boundary) pixel 113, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- red (boundary) pixel 113, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- green (boundary) pixel 113, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- green (boundary) pixel 113, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- blue (boundary) pixel 113, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- blue (boundary) pixel 113, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- red (boundary) pixel 113, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- red (boundary) pixel 113, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- green (boundary) pixel 113, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- green (boundary) pixel 113, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- blue (boundary) pixel 113, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- blue (boundary) pixel 113, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- red (boundary) pixel 113, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- red (boundary) pixel 113, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- green (boundary) pixel 113, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- green (boundary) pixel 113, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- blue (boundary) pixel 113, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- blue (boundary) pixel 113, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- red (boundary) pixel 113, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- red (boundary) pixel 113, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 113, line 493
	wait for 40 ns;
	
	line_i <= "0000001100";   -- black (boundary) pixel 176, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- red (boundary) pixel 176, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- red (boundary) pixel 176, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- green (boundary) pixel 176, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- green (boundary) pixel 176, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- blue (boundary) pixel 176, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- blue (boundary) pixel 176, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- red (boundary) pixel 176, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- red (boundary) pixel 176, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- green (boundary) pixel 176, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- green (boundary) pixel 176, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- blue (boundary) pixel 176, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- blue (boundary) pixel 176, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- red (boundary) pixel 176, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- red (boundary) pixel 176, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- green (boundary) pixel 176, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- green (boundary) pixel 176, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- blue (boundary) pixel 176, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- blue (boundary) pixel 176, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- red (boundary) pixel 176, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- red (boundary) pixel 176, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 176, line 493
	wait for 40 ns;
	
	line_i <= "0000001100";   -- black (boundary) pixel 177, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- green (boundary) pixel 177, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- green (boundary) pixel 177, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- blue (boundary) pixel 177, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- blue (boundary) pixel 177, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- red (boundary) pixel 177, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- red (boundary) pixel 177, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- green (boundary) pixel 177, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- green (boundary) pixel 177, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- blue (boundary) pixel 177, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- blue (boundary) pixel 177, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- red (boundary) pixel 177, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- red (boundary) pixel 177, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- green (boundary) pixel 177, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- green (boundary) pixel 177, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- blue (boundary) pixel 177, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- blue (boundary) pixel 177, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- red (boundary) pixel 177, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- red (boundary) pixel 177, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- green (boundary) pixel 177, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- green (boundary) pixel 177, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 177, line 493
	wait for 40 ns;	
	
	line_i <= "0000001100";   -- black (boundary) pixel 240, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- green (boundary) pixel 240, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- green (boundary) pixel 240, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- blue (boundary) pixel 240, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- blue (boundary) pixel 240, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- red (boundary) pixel 240, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- red (boundary) pixel 240, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- green (boundary) pixel 240, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- green (boundary) pixel 240, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- blue (boundary) pixel 240, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- blue (boundary) pixel 240, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- red (boundary) pixel 240, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- red (boundary) pixel 240, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- green (boundary) pixel 240, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- green (boundary) pixel 240, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- blue (boundary) pixel 240, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- blue (boundary) pixel 240, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- red (boundary) pixel 240, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- red (boundary) pixel 240, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- green (boundary) pixel 240, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- green (boundary) pixel 240, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 240, line 493
	wait for 40 ns;	
	
	line_i <= "0000001100";   -- black (boundary) pixel 241, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- blue (boundary) pixel 241, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- blue (boundary) pixel 241, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- red (boundary) pixel 241, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- red (boundary) pixel 241, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- green (boundary) pixel 241, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- green (boundary) pixel 241, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- blue (boundary) pixel 241, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- blue (boundary) pixel 241, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- red (boundary) pixel 241, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- red (boundary) pixel 241, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- green (boundary) pixel 241, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- green (boundary) pixel 241, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- blue (boundary) pixel 241, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- blue (boundary) pixel 241, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- red (boundary) pixel 241, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- red (boundary) pixel 241, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- green (boundary) pixel 241, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- green (boundary) pixel 241, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- blue (boundary) pixel 241, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- blue (boundary) pixel 241, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 241, line 493
	wait for 40 ns;	
	
	line_i <= "0000001100";   -- black (boundary) pixel 304, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- blue (boundary) pixel 304, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- blue (boundary) pixel 304, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- red (boundary) pixel 304, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- red (boundary) pixel 304, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- green (boundary) pixel 304, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- green (boundary) pixel 304, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- blue (boundary) pixel 304, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- blue (boundary) pixel 304, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- red (boundary) pixel 304, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- red (boundary) pixel 304, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- green (boundary) pixel 304, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- green (boundary) pixel 304, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- blue (boundary) pixel 304, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- blue (boundary) pixel 304, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- red (boundary) pixel 304, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- red (boundary) pixel 304, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- green (boundary) pixel 304, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- green (boundary) pixel 304, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- blue (boundary) pixel 304, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- blue (boundary) pixel 304, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 304, line 493
	wait for 40 ns;
	
	line_i <= "0000001100";   -- black (boundary) pixel 305, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- red (boundary) pixel 305, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- red (boundary) pixel 305, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- green (boundary) pixel 305, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- green (boundary) pixel 305, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- blue (boundary) pixel 305, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- blue (boundary) pixel 305, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- red (boundary) pixel 305, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- red (boundary) pixel 305, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- green (boundary) pixel 305, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- green (boundary) pixel 305, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- blue (boundary) pixel 305, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- blue (boundary) pixel 305, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- red (boundary) pixel 305, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- red (boundary) pixel 305, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- green (boundary) pixel 305, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- green (boundary) pixel 305, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- blue (boundary) pixel 305, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- blue (boundary) pixel 305, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- red (boundary) pixel 305, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- red (boundary) pixel 305, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 305, line 493
	wait for 40 ns;
	
	line_i <= "0000001100";   -- black (boundary) pixel 368, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- red (boundary) pixel 368, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- red (boundary) pixel 368, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- green (boundary) pixel 368, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- green (boundary) pixel 368, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- blue (boundary) pixel 368, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- blue (boundary) pixel 368, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- red (boundary) pixel 368, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- red (boundary) pixel 368, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- green (boundary) pixel 368, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- green (boundary) pixel 368, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- blue (boundary) pixel 368, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- blue (boundary) pixel 368, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- red (boundary) pixel 368, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- red (boundary) pixel 368, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- green (boundary) pixel 368, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- green (boundary) pixel 368, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- blue (boundary) pixel 368, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- blue (boundary) pixel 368, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- red (boundary) pixel 368, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- red (boundary) pixel 368, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 368, line 493
	wait for 40 ns;
	
	line_i <= "0000001100";   -- black (boundary) pixel 369, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- green (boundary) pixel 369, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- green (boundary) pixel 369, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- blue (boundary) pixel 369, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- blue (boundary) pixel 369, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- red (boundary) pixel 369, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- red (boundary) pixel 369, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- green (boundary) pixel 369, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- green (boundary) pixel 369, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- blue (boundary) pixel 369, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- blue (boundary) pixel 369, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- red (boundary) pixel 369, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- red (boundary) pixel 369, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- green (boundary) pixel 369, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- green (boundary) pixel 369, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- blue (boundary) pixel 369, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- blue (boundary) pixel 369, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- red (boundary) pixel 369, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- red (boundary) pixel 369, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- green (boundary) pixel 369, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- green (boundary) pixel 369, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 369, line 493
	wait for 40 ns;	
	
	line_i <= "0000001100";   -- black (boundary) pixel 432, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- green (boundary) pixel 432, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- green (boundary) pixel 432, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- blue (boundary) pixel 432, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- blue (boundary) pixel 432, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- red (boundary) pixel 432, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- red (boundary) pixel 432, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- green (boundary) pixel 432, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- green (boundary) pixel 432, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- blue (boundary) pixel 432, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- blue (boundary) pixel 432, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- red (boundary) pixel 432, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- red (boundary) pixel 432, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- green (boundary) pixel 432, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- green (boundary) pixel 432, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- blue (boundary) pixel 432, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- blue (boundary) pixel 432, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- red (boundary) pixel 432, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- red (boundary) pixel 432, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- green (boundary) pixel 432, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- green (boundary) pixel 432, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 432, line 493
	wait for 40 ns;	
	
	line_i <= "0000001100";   -- black (boundary) pixel 433, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- blue (boundary) pixel 433, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- blue (boundary) pixel 433, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- red (boundary) pixel 433, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- red (boundary) pixel 433, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- green (boundary) pixel 433, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- green (boundary) pixel 433, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- blue (boundary) pixel 433, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- blue (boundary) pixel 433, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- red (boundary) pixel 433, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- red (boundary) pixel 433, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- green (boundary) pixel 433, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- green (boundary) pixel 433, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- blue (boundary) pixel 433, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- blue (boundary) pixel 433, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- red (boundary) pixel 433, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- red (boundary) pixel 433, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- green (boundary) pixel 433, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- green (boundary) pixel 433, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- blue (boundary) pixel 433, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- blue (boundary) pixel 433, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 433, line 493
	wait for 40 ns;	
	
	line_i <= "0000001100";   -- black (boundary) pixel 496, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- blue (boundary) pixel 496, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- blue (boundary) pixel 496, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- red (boundary) pixel 496, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- red (boundary) pixel 496, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- green (boundary) pixel 496, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- green (boundary) pixel 496, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- blue (boundary) pixel 496, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- blue (boundary) pixel 496, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- red (boundary) pixel 496, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- red (boundary) pixel 496, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- green (boundary) pixel 496, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- green (boundary) pixel 496, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- blue (boundary) pixel 496, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- blue (boundary) pixel 496, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- red (boundary) pixel 496, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- red (boundary) pixel 496, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- green (boundary) pixel 496, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- green (boundary) pixel 496, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- blue (boundary) pixel 496, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- blue (boundary) pixel 496, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 496, line 493
	wait for 40 ns;
	
	line_i <= "0000001100";   -- black (boundary) pixel 497, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- red (boundary) pixel 497, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- red (boundary) pixel 497, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- green (boundary) pixel 497, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- green (boundary) pixel 497, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- blue (boundary) pixel 497, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- blue (boundary) pixel 497, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- red (boundary) pixel 497, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- red (boundary) pixel 497, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- green (boundary) pixel 497, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- green (boundary) pixel 497, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- blue (boundary) pixel 497, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- blue (boundary) pixel 497, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- red (boundary) pixel 497, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- red (boundary) pixel 497, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- green (boundary) pixel 497, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- green (boundary) pixel 497, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- blue (boundary) pixel 497, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- blue (boundary) pixel 497, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- red (boundary) pixel 497, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- red (boundary) pixel 497, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 497, line 493
	wait for 40 ns;
	
	line_i <= "0000001100";   -- black (boundary) pixel 560, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- red (boundary) pixel 560, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- red (boundary) pixel 560, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- green (boundary) pixel 560, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- green (boundary) pixel 560, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- blue (boundary) pixel 560, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- blue (boundary) pixel 560, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- red (boundary) pixel 560, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- red (boundary) pixel 560, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- green (boundary) pixel 560, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- green (boundary) pixel 560, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- blue (boundary) pixel 560, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- blue (boundary) pixel 560, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- red (boundary) pixel 560, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- red (boundary) pixel 560, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- green (boundary) pixel 560, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- green (boundary) pixel 560, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- blue (boundary) pixel 560, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- blue (boundary) pixel 560, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- red (boundary) pixel 560, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- red (boundary) pixel 560, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 560, line 493
	wait for 40 ns;
	
	line_i <= "0000001100";   -- black (boundary) pixel 561, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- green (boundary) pixel 561, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- green (boundary) pixel 561, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- blue (boundary) pixel 561, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- blue (boundary) pixel 561, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- red (boundary) pixel 561, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- red (boundary) pixel 561, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- green (boundary) pixel 561, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- green (boundary) pixel 561, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- blue (boundary) pixel 561, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- blue (boundary) pixel 561, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- red (boundary) pixel 561, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- red (boundary) pixel 561, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- green (boundary) pixel 561, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- green (boundary) pixel 561, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- blue (boundary) pixel 561, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- blue (boundary) pixel 561, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- red (boundary) pixel 561, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- red (boundary) pixel 561, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- green (boundary) pixel 561, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- green (boundary) pixel 561, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 561, line 493
	wait for 40 ns;	
	
	line_i <= "0000001100";   -- black (boundary) pixel 624, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- green (boundary) pixel 624, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- green (boundary) pixel 624, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- blue (boundary) pixel 624, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- blue (boundary) pixel 624, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- red (boundary) pixel 624, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- red (boundary) pixel 624, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- green (boundary) pixel 624, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- green (boundary) pixel 624, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- blue (boundary) pixel 624, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- blue (boundary) pixel 624, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- red (boundary) pixel 624, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- red (boundary) pixel 624, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- green (boundary) pixel 624, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- green (boundary) pixel 624, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- blue (boundary) pixel 624, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- blue (boundary) pixel 624, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- red (boundary) pixel 624, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- red (boundary) pixel 624, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- green (boundary) pixel 624, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- green (boundary) pixel 624, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 624, line 493
	wait for 40 ns;	
	
	line_i <= "0000001100";   -- black (boundary) pixel 625, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- blue (boundary) pixel 625, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- blue (boundary) pixel 625, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- red (boundary) pixel 625, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- red (boundary) pixel 625, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- green (boundary) pixel 625, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- green (boundary) pixel 625, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- blue (boundary) pixel 625, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- blue (boundary) pixel 625, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- red (boundary) pixel 625, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- red (boundary) pixel 625, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- green (boundary) pixel 625, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- green (boundary) pixel 625, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- blue (boundary) pixel 625, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- blue (boundary) pixel 625, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- red (boundary) pixel 625, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- red (boundary) pixel 625, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- green (boundary) pixel 625, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- green (boundary) pixel 625, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- blue (boundary) pixel 625, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- blue (boundary) pixel 625, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 625, line 493
	wait for 40 ns;	
	
	line_i <= "0000001100";   -- black (boundary) pixel 688, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- blue (boundary) pixel 688, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- blue (boundary) pixel 688, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- red (boundary) pixel 688, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- red (boundary) pixel 688, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- green (boundary) pixel 688, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- green (boundary) pixel 688, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- blue (boundary) pixel 688, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- blue (boundary) pixel 688, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- red (boundary) pixel 688, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- red (boundary) pixel 688, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- green (boundary) pixel 688, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- green (boundary) pixel 688, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- blue (boundary) pixel 688, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- blue (boundary) pixel 688, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- red (boundary) pixel 688, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- red (boundary) pixel 688, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- green (boundary) pixel 688, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- green (boundary) pixel 688, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- blue (boundary) pixel 688, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- blue (boundary) pixel 688, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 688, line 493
	wait for 40 ns;
	
	
	line_i <= "0000001100";   -- black (boundary) pixel 689, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- red (boundary) pixel 689, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- red (boundary) pixel 689, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- green (boundary) pixel 689, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- green (boundary) pixel 689, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- blue (boundary) pixel 689, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- blue (boundary) pixel 689, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- red (boundary) pixel 689, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- red (boundary) pixel 689, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- green (boundary) pixel 689, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- green (boundary) pixel 689, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- blue (boundary) pixel 689, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- blue (boundary) pixel 689, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- red (boundary) pixel 689, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- red (boundary) pixel 689, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- green (boundary) pixel 689, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- green (boundary) pixel 689, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- blue (boundary) pixel 689, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- blue (boundary) pixel 689, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- red (boundary) pixel 689, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- red (boundary) pixel 689, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 689, line 493
	wait for 40 ns;
	
	line_i <= "0000001100";   -- black (boundary) pixel 752, line 12
	wait for 40 ns;
	line_i <= "0000001101";   -- red (boundary) pixel 752, line 13
	wait for 40 ns;
	line_i <= "0000111100";   -- red (boundary) pixel 752, line 60
	wait for 40 ns;
	line_i <= "0000111101";   -- green (boundary) pixel 752, line 61
	wait for 40 ns;
	line_i <= "0001101100";   -- green (boundary) pixel 752, line 108
	wait for 40 ns;
	line_i <= "0001101101";   -- blue (boundary) pixel 752, line 109
	wait for 40 ns;
	line_i <= "0010011100";   -- blue (boundary) pixel 752, line 156
	wait for 40 ns;
	line_i <= "0010011101";   -- red (boundary) pixel 752, line 157
	wait for 40 ns;
	line_i <= "0011001100";   -- red (boundary) pixel 752, line 204
	wait for 40 ns;
	line_i <= "0011001101";   -- green (boundary) pixel 752, line 205
	wait for 40 ns;
	line_i <= "0011111100";   -- green (boundary) pixel 752, line 252
	wait for 40 ns;
	line_i <= "0011111101";   -- blue (boundary) pixel 752, line 253
	wait for 40 ns;
	line_i <= "0100101100";   -- blue (boundary) pixel 752, line 300
	wait for 40 ns;
	line_i <= "0100101101";   -- red (boundary) pixel 752, line 301
	wait for 40 ns;
	line_i <= "0101011100";   -- red (boundary) pixel 752, line 348
	wait for 40 ns;
	line_i <= "0101011101";   -- green (boundary) pixel 752, line 349
	wait for 40 ns;
	line_i <= "0110001100";   -- green (boundary) pixel 752, line 396
	wait for 40 ns;
	line_i <= "0110001101";   -- blue (boundary) pixel 752, line 397
	wait for 40 ns;
	line_i <= "0110111100";   -- blue (boundary) pixel 752, line 444
	wait for 40 ns;
	line_i <= "0110111101";   -- red (boundary) pixel 752, line 445
	wait for 40 ns;
	line_i <= "0111101100";   -- red (boundary) pixel 752, line 492
	wait for 40 ns;
	line_i <= "0111101101";   -- black (boundary) pixel 752, line 493
	wait;
  end process;
end sim;