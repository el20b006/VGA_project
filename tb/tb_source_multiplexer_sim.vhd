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
  port (clk_i       :  in   std_logic;                    
        reset_i	    :  in   std_logic;                    
        swsync_i    :  in   std_logic_vector(15 downto 0); 
        pbsync_i    :  in   std_logic_vector(3 downto 0); 
        pat1_rgb_i  :  in   std_logic_vector(11 downto 0);
        pat2_rgb_i  :  in   std_logic_vector(11 downto 0);
        mem1_rgb_i  :  in   std_logic_vector(11 downto 0); 
        mem2_rgb_i  :  in   std_logic_vector(11 downto 0); 
        rgb_o       :  out  std_logic_vector(11 downto 0)  
	    );
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal clk_i       :  std_logic;                    
  signal reset_i	 :  std_logic;                    
  signal swsync_i    :  std_logic_vector(15 downto 0); 
  signal pbsync_i    :  std_logic_vector(3 downto 0); 
  signal pat1_rgb_i  :  std_logic_vector(11 downto 0);
  signal pat2_rgb_i  :  std_logic_vector(11 downto 0);
  signal mem1_rgb_i  :  std_logic_vector(11 downto 0); 
  signal mem2_rgb_i  :  std_logic_vector(11 downto 0); 
  signal rgb_o       :  std_logic_vector(11 downto 0);
  
begin

  -- Instantiate the soucre multiplexer design for testing
  i_source_multiplexer : source_multiplexer
  port map
    (clk_i       => clk_i,
	 reset_i     => reset_i,
	 swsync_i    => swsync_i,
	 pbsync_i    => pbsync_i,
	 pat1_rgb_i  => pat1_rgb_i,
	 pat2_rgb_i  => pat2_rgb_i,
	 mem1_rgb_i  => mem1_rgb_i,
	 mem2_rgb_i  => mem2_rgb_i,
	 rgb_o       => rgb_o
	);

  p_clk : process
  begin
    clk_i <= '0';
	wait for 5 ns;
	clk_i <= '1';
	wait for 5 ns;
  end process p_clk;

  p_reset : process
  begin
	reset_i <= '0';
	wait for 210 ns;
	reset_i <= '1';
	wait for 50 ns;
	reset_i <= '0';
	wait;
  end process;
  
  p_rgbs : process
  begin
    pat1_rgb_i <= "000000000001";
	pat2_rgb_i <= "100000000000";
	mem1_rgb_i <= "000001100000";
	wait for 40 ns;
	pat1_rgb_i <= "000000000011";
	pat2_rgb_i <= "110000000000";
	mem1_rgb_i <= "000011110000";
	wait for 40 ns;
	pat1_rgb_i <= "000000000111";
	pat2_rgb_i <= "111000000000";
	mem1_rgb_i <= "000111111000";
	wait for 40 ns;
	pat1_rgb_i <= "000000001111";
	pat2_rgb_i <= "111100000000";
	mem1_rgb_i <= "001111111100";
	wait for 40 ns;
	pat1_rgb_i <= "000000011111";
	pat2_rgb_i <= "111110000000";
	mem1_rgb_i <= "011111111110";
	wait for 40 ns;
	pat1_rgb_i <= "000000111111";
	pat2_rgb_i <= "111111000000";
	mem1_rgb_i <= "111111111111";
	wait;
  end process;
  
  p_multiplex : process
  begin
    swsync_i <= "0000000000000000";  -- pattern 1
	wait for 80 ns;
	swsync_i <= "0000000000000010";  -- pattern 2
	wait for 80 ns;
	swsync_i <= "0000000000000011";  -- memory 1
	wait for 40 ns;
	swsync_i <= "0000000000000001";  -- memory 1
	wait;
  end process;

end sim;