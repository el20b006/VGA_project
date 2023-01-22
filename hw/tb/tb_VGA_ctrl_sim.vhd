-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         tb_VGA_ctrl
--
-- FILENAME:       tb_VGA_ctrl_sim.vhd
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
-- DESCRIPTION:    This is the architecture of the VGA_ctrl testbench
--                  for the VGA Controller VHDL Project.
--
-------------------------------------------------------------------------------
--                                                                      
-- PACKAGES:       std_logic_1164 (IEEE library)
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


architecture sim of tb_VGA_ctrl is

  component VGA_ctrl is
  port (reset_i      : in   std_logic;                      -- reset
        enable_25M_i : in   std_logic;                      -- 25MHz enable 
        rgb_i        : in   std_logic_vector(11 downto 0);  -- input rgb 
        v_sync_o     : out  std_logic;                      -- vertical sync
        h_sync_o     : out  std_logic;                      -- horizontal sync
        pixel_o      : out  std_logic_vector(9 downto 0);   -- pixel output
        line_o       : out  std_logic_vector(9 downto 0);   -- pixel line  
		rgb_o        : out  std_logic_vector(11 downto 0)   -- output rgb 
		);
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal  s_reset      : std_logic;                      -- reset
  signal  s_enable_25M : std_logic;                      -- 25MHz enable 
  signal  s_rgb        : std_logic_vector(11 downto 0);  -- input rgb 
  signal  s_v_sync     : std_logic;                      -- vertical sync
  signal  s_h_sync     : std_logic;                      -- horizontal sync
  signal  s_pixel      : std_logic_vector(9 downto 0);   -- pixel output
  signal  s_line       : std_logic_vector(9 downto 0);   -- pixel line  
  signal  s_rgb_o     : std_logic_vector(11 downto 0);  -- output rgb 
  

begin
  -- Instatiate the VGA_ctrl design for testing
  i_VGA_ctrl : VGA_ctrl
  port map
    (reset_i       => s_reset,
	 enable_25M_i  => s_enable_25M,
	 rgb_i         => s_rgb,
     v_sync_o      => s_v_sync,
     h_sync_o      => s_h_sync,
	 pixel_o       => s_pixel,
	 line_o        => s_line,
	 rgb_o         => s_rgb_o
	);
	 
  p_reset : process
  begin
    s_reset <= '0';
    wait for 18 ms;
    s_reset <= '1';
    wait for 1 ms;
    s_reset <= '0';
    wait;
  end process p_reset;
  
  p_enable : process
  begin
    s_enable_25M <= '0';
    wait for 30 ns;
    s_enable_25M <= '1';
    wait for 10 ns;
  end process p_enable;
  
  p_rgb : process
  begin
    s_rgb <= "000000000001";
	wait for 40 ns;
	s_rgb <= "000000000010";
	wait for 40 ns;
	s_rgb <= "000000000100";
	wait for 40 ns;
	s_rgb <= "000000001000";
	wait for 40 ns;
	s_rgb <= "000000010000";
	wait for 40 ns;
	s_rgb <= "000000100000";
	wait for 40 ns;
	s_rgb <= "000001000000";
	wait for 40 ns;
	s_rgb <= "000010000000";
	wait for 40 ns;
	s_rgb <= "000100000000";
	wait for 40 ns;
	s_rgb <= "001000000000";
	wait for 40 ns;
	s_rgb <= "010000000000";
	wait for 40 ns;
	s_rgb <= "100000000000";
	wait for 40 ns;
  end process p_rgb;
  
end sim;
  
  