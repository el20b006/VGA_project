-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         tb_mem_ctrl_1
--
-- FILENAME:       tb_mem_ctrl_sim.vhd
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
-- DESCRIPTION:    This is the architecture of the tb_mem_ctrl_1 testbench
--                 for the VGA Controller VHDL Project.
--
-------------------------------------------------------------------------------
--                                                                      
-- PACKAGES:       std_logic_1164 (IEEE library)
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture sim of tb_mem_ctrl_1 is

  component mem_ctrl_1
  port(clk_i        : in  std_logic;                     -- 100 MHz clk
       reset_i      : in  std_logic;                     -- reset
	   enable_25M_i : in  std_logic;                     -- 25 MHz clk
       pixel_i      : in  std_logic_vector(9 downto 0);  -- pixel counter
       line_i       : in  std_logic_vector(9 downto 0);  -- line counter
       rgb_o        : out std_logic_vector(11 downto 0)  -- rgb output
      );
  end component;
  
  -- Declare the signals used stimulating the design's inputs
  signal s_clk        : std_logic;
  signal s_reset      : std_logic;
  signal s_enable_25M : std_logic;
  signal s_pixel      : std_logic_vector(9 downto 0);
  signal s_line       : std_logic_vector(9 downto 0);
  signal s_rgb        : std_logic_vector(11 downto 0);
  
begin
  -- Instantiate the mem_ctrl_1 design for testing
  i_mem_ctrl_1 : mem_ctrl_1
  port map
    (clk_i        => s_clk,
	 reset_i      => s_reset,
	 enable_25M_i => s_enable_25M,
	 pixel_i      => s_pixel,
	 line_i       => s_line,
	 rgb_o        => s_rgb
	);
	
  p_100clk : process
  begin
    s_clk <= '0';
    wait for 5 ns;
	s_clk <= '1';
	wait for 5 ns;
  end process p_100clk; 
	
	
  p_25Mclk : process
  begin
    s_enable_25M <= '0';
    wait for 20 ns;
	s_enable_25M <= '1';
	wait for 20 ns;
  end process p_25Mclk; 
  
  p_reset : process
  begin
    s_reset <= '0';
    wait for 90 ns;
    s_reset <= '1';
    wait for 10 ns;
    s_reset <= '0';
    wait;
  end process p_reset;
  
  p_pixel_line : process
  begin
    -- out of visible area
    s_line  <= "0000100001";
    s_pixel <= "1100001101";
	wait for 40 ns;
	-- in visible area
	s_line  <= "0010110101";
	s_pixel <= "0100101101";
	wait for 40 ns;
	-- out of visible area
	s_line  <= "1000001010";
	s_pixel <= "1101001111";
	wait;
	
  end process p_pixel_line;
  
end sim;