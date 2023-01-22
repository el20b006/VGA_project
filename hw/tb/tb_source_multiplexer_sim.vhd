-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         tb_source_multiplexer
--
-- FILENAME:       tb_source_multiplexer_sim.vhd
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
-- DESCRIPTION:    This is the architecture of the source_multiplexer
--                 testbench for the VGA Controller VHDL Project.
--
-------------------------------------------------------------------------------
--                                                                      
-- PACKAGES:       std_logic_1164 (IEEE library)
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture sim of tb_source_multiplexer is

  component source_multiplexer
  port (clk_i       : in  std_logic;                      -- system clock
        reset_i	    : in  std_logic;                      -- reset
        swsync_i    : in  std_logic_vector(15 downto 0);  -- switches
        pbsync_i    : in  std_logic_vector(3 downto 0);   -- buttons
		pixel_i     : in  std_logic_vector(9 downto 0);   -- pixel counter
        line_i      : in  std_logic_vector(9 downto 0);   -- line counter
        pat1_rgb_i  : in  std_logic_vector(11 downto 0);  -- rgb values
        pat2_rgb_i  : in  std_logic_vector(11 downto 0);  -- rgb values
        mem1_rgb_i  : in  std_logic_vector(11 downto 0);  -- rgb values
        mem2_rgb_i  : in  std_logic_vector(11 downto 0);  -- rgb values
        rgb_o       : out std_logic_vector(11 downto 0);  -- rgb output
		line_beg_o  : out std_logic_vector(9 downto 0);   -- 1st line move
		line_end_o  : out std_logic_vector(9 downto 0);   -- last line move	
        pixel_beg_o : out std_logic_vector(9 downto 0);   -- 1st pixel move
        pixel_end_o : out std_logic_vector(9 downto 0)    -- last pixel move  
	    );
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
    signal s_clk       : std_logic;                      -- system clock
    signal s_reset	   : std_logic;                      -- reset
    signal s_swsync    : std_logic_vector(15 downto 0);  -- switches
    signal s_pbsync    : std_logic_vector(3 downto 0);   -- buttons
	signal s_pixel     : std_logic_vector(9 downto 0);   -- pixel counter
    signal s_line      : std_logic_vector(9 downto 0);   -- line counter
    signal s_pat1_rgb  : std_logic_vector(11 downto 0);  -- rgb values
    signal s_pat2_rgb  : std_logic_vector(11 downto 0);  -- rgb values
    signal s_mem1_rgb  : std_logic_vector(11 downto 0);  -- rgb values
    signal s_mem2_rgb  : std_logic_vector(11 downto 0);  -- rgb values
    signal s_rgb       : std_logic_vector(11 downto 0);  -- rgb output
	signal s_line_beg  : std_logic_vector(9 downto 0);   -- 1st line move
	signal s_line_end  : std_logic_vector(9 downto 0);   -- last line move	
    signal s_pixel_beg : std_logic_vector(9 downto 0);   -- 1st pixel move
    signal s_pixel_end : std_logic_vector(9 downto 0);   -- last pixel move  
  
begin

  -- Instantiate the soucre multiplexer design for testing
  i_source_multiplexer : source_multiplexer
  port map
    (clk_i       => s_clk,
	 reset_i     => s_reset,
	 swsync_i    => s_swsync,
	 pbsync_i    => s_pbsync,
	 pixel_i     => s_pixel,
	 line_i      => s_line,
	 pat1_rgb_i  => s_pat1_rgb,
	 pat2_rgb_i  => s_pat2_rgb,
	 mem1_rgb_i  => s_mem1_rgb,
	 mem2_rgb_i  => s_mem2_rgb,
	 rgb_o       => s_rgb,
	 line_beg_o  => s_line_beg,
	 line_end_o  => s_line_end,
	 pixel_beg_o => s_pixel_beg,
	 pixel_end_o => s_pixel_end
	);

  p_clk : process
  begin
    s_clk <= '0';
	wait for 5 ns;
	s_clk <= '1';
	wait for 5 ns;
  end process p_clk;

  p_reset : process
  begin
	s_reset <= '0';
	wait for 950 ns;
	s_reset <= '1';
	wait for 10 ns;
	s_reset <= '0';
	wait;
  end process p_reset;
  
  p_pb : process
  begin
    s_pbsync <= "0000";
	wait for 800ns;
	s_pbsync <= "1000";  -- pixel counts - 30
	wait for 30 ns;
	s_pbsync <= "0000";
	wait for 10 ns;
	s_pbsync <= "0100";  -- line counts - 30
	wait for 30 ns;
	s_pbsync <= "0000";
	wait for 10 ns;
	s_pbsync <= "0001";  -- pixel counts + 30
	wait for 30 ns;
	s_pbsync <= "0000";
	wait for 10 ns;
	s_pbsync <= "0010";  -- line counts + 30
	wait for 30 ns;
	s_pbsync <= "0000";
	wait;
  end process p_pb;
  
  p_rgbs : process
  begin
    s_pat1_rgb <= "000000111111";
	s_pat2_rgb <= "111111000000";
	s_mem1_rgb <= "101010101010";
	s_mem2_rgb <= "010101010101";
	wait;
  end process p_rgbs;
  
  p_multiplex : process
  begin
    s_swsync <= "0000000000000000";  -- pattern 1
	wait for 40 ns;
	s_swsync <= "0000000000000010";  -- pattern 2
	wait for 40 ns;
	s_swsync <= "0000000000000011";  -- memory 1
	wait for 40 ns;
	s_swsync <= "0000000000000001";  -- memory 1
	wait for 40 ns;
	s_swsync <= "0000000000000100";  -- pattern 1 + memory 2
	wait for 160 ns;
	s_swsync <= "0000000000000110";  -- pattern 2 + memory 2
	wait for 160 ns;
	s_swsync <= "0000000000000101";  -- memory 1 + memory 2
	wait for 160 ns;
	s_swsync <= "0000000000000111";  -- memory 1 + memory 2
	wait;
  end process p_multiplex;
  
  p_pixel_line : process
  begin
    s_pixel <= "0000000000";  -- till pattern 1 + memory 2
	s_line  <= "0000000000";  -- till pattern 1 + memory 2
	wait for 160 ns;
	-- pattern 1 shall be displayed
	s_pixel <= "0110011101";  -- last pixel before memory 2
	s_line  <= "0011100001";  -- 1st line of memory 2  
	wait for 40 ns;
	-- memory 2 shall be displayed
	s_pixel <= "0110011110";  -- 1st pixel of memory 2  
	s_line  <= "0011100001";  -- 1st line of memory 2  
	wait for 40 ns;
	-- memory 2 shall be displayed
	s_pixel <= "1000000001";  -- last pixel of memory 2  
	s_line  <= "0011100001";  -- 1st line of memory 2  
	wait for 40 ns;
	-- pattern 1 shall be displayed
	s_pixel <= "1000000010";  -- 1st pixel after memory 2 
	s_line  <= "0011100001";  -- 1st line of memory 2 
	wait for 40 ns;
	
	-- pattern 2 shall be displayed
	s_pixel <= "0110011101";  -- last pixel before memory 2
	s_line  <= "0101000100";  -- last line of memory 2  
	wait for 40 ns;
	-- memory 2 shall be displayed
	s_pixel <= "0110011110";  -- 1st pixel of memory 2
	s_line  <= "0101000100";  -- last line of memory 2  
	wait for 40 ns;
	-- memory 2 shall be displayed
	s_pixel <= "1000000001";  -- last pixel of memory 2
	s_line  <= "0101000100";  -- last line of memory 2  
	wait for 40 ns;
	-- pattern 2 shall be displayed
	s_pixel <= "1000000010";  -- 1st pixel after memory 2
	s_line  <= "0101000100";  -- last line of memory 2 
	wait for 40 ns;
	
	-- memory 1 shall be displayed
	s_pixel <= "0110011110";  -- 1st pixel of memory 2
	s_line  <= "0011100000";  -- last line before memory 2  
	wait for 40 ns;
	-- memory 2 shall be displayed
	s_pixel <= "0110011110";  -- 1st pixel of memory 2
	s_line  <= "0011100001";  -- 1st line of memory 2  
	wait for 40 ns;
	-- memory 2 shall be displayed
	s_pixel <= "0110011110";  -- 1st pixel of memory 2
	s_line  <= "0101000100";  -- last line of memory 2  
	wait for 40 ns;
	-- memory 1 shall be displayed
	s_pixel <= "0110011110";  -- 1st pixel of memory 2
	s_line  <= "0101000101";  -- 1st line after memory 2 
	wait for 40 ns;
	
	-- memory 1 shall be displayed
	s_pixel <= "1000000001";  -- last pixel of memory 2
	s_line  <= "0011100000";  -- last line before memory 2  
	wait for 40 ns;
	-- memory 2 shall be displayed
	s_pixel <= "1000000001";  -- last pixel of memory 2
	s_line  <= "0011100001";  -- 1st line of memory 2  
	wait for 40 ns;
	-- memory 2 shall be displayed
	s_pixel <= "1000000001";  -- last pixel of memory 2
	s_line  <= "0101000100";  -- last line of memory 2  
	wait for 40 ns;
	-- memory 1 shall be displayed
	s_pixel <= "1000000001";  -- last pixel of memory 2
	s_line  <= "0101000101";  -- 1st line after memory 2 
	wait for 40 ns;
	
	-- move picture 30 pixel to the left
	s_pixel <= "0110011101";  -- last pixel before memory 2
	s_line  <= "0011100000";  -- last line before memory 2
	wait for 40 ns;
	-- move picture 30 lines up
	s_pixel <= "0101111111";  -- last pixel before memory 2
	s_line  <= "0011100000";  -- last line before memory 2
	wait for 40 ns;
	-- move picture 30 pixel to the right
	s_pixel <= "0101111111";  -- last pixel before memory 2
	s_line  <= "0011000010";  -- last line before memory 2
	wait for 40 ns;
	-- move picture 30 lines down
	s_pixel <= "0110011101";  -- last pixel before memory 2
	s_line  <= "0011000010";  -- last line before memory 2
	wait;
  end process p_pixel_line;
end sim;