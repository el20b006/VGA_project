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
  port (clk_i         :  in   std_logic;                      -- system clock
        reset_i       :  in   std_logic;                      -- reset_i
        enable_25M_i  :  in   std_logic;                      -- 25M enable 
        rgb_i         :  in   std_logic_vector(11 downto 0);  -- input rgb 
        v_sync_o      :  out  std_logic;                      -- vertical sync
        h_sync_o      :  out  std_logic;                      -- horizontal sync
        pixel_o       :  out  std_logic_vector(9 downto 0);   -- pixel output
        line_o        :  out  std_logic_vector(9 downto 0);   -- pixel line  
		rgb_o         :  out  std_logic_vector(11 downto 0)  -- output rgb 
		);
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal  clk_i         :  std_logic;                      -- system clock
  signal  reset_i       :  std_logic;                      -- reset_i
  signal  enable_25M_i  :  std_logic;                      -- 25M enable 
  signal  rgb_i         :  std_logic_vector(11 downto 0);  -- input rgb 
  signal  v_sync_o      :  std_logic;                      -- vertical sync
  signal  h_sync_o      :  std_logic;                      -- horizontal sync
  signal  pixel_o       :  std_logic_vector(9 downto 0);   -- pixel output
  signal  line_o        :  std_logic_vector(9 downto 0);   -- pixel line  
  signal  rgb_o         :  std_logic_vector(11 downto 0);  -- output rgb 
  

begin

  -- Instatiate the VGA_ctrl design for testing
  i_VGA_ctrl : VGA_ctrl
  port map
    (clk_i         => clk_i,
	 reset_i       => reset_i,
	 enable_25M_i  => enable_25M_i,
	 rgb_i         => rgb_i,
     v_sync_o      => v_sync_o,
     h_sync_o      => h_sync_o,
	 pixel_o       => pixel_o,
	 line_o        => line_o,
	 rgb_o         => rgb_o
	);
	
	
  p_clk : process
  begin
    clk_i <= '1';
    wait for 5 ns;
	clk_i <= '0';
	wait for 5 ns;
  end process p_clk; 
   
  p_reset : process
  begin
    reset_i <= '0';
    wait for 18 ms;
    reset_i <= '1';
    wait for 1 ms;
    reset_i <= '0';
    wait;
  end process p_reset;
  
  p_enable : process
  begin
    enable_25M_i <= '0';
    wait for 30 ns;
    enable_25M_i <= '1';
    wait for 10 ns;
  end process p_enable;
  
  p_rgb : process
  begin
    rgb_i <= "000000000001";
	wait for 40 ns;
	rgb_i <= "000000000010";
	wait for 40 ns;
	rgb_i <= "000000000100";
	wait for 40 ns;
	rgb_i <= "000000001000";
	wait for 40 ns;
	rgb_i <= "000000010000";
	wait for 40 ns;
	rgb_i <= "000000100000";
	wait for 40 ns;
	rgb_i <= "000001000000";
	wait for 40 ns;
	rgb_i <= "000010000000";
	wait for 40 ns;
	rgb_i <= "000100000000";
	wait for 40 ns;
	rgb_i <= "001000000000";
	wait for 40 ns;
	rgb_i <= "010000000000";
	wait for 40 ns;
	rgb_i <= "100000000000";
	wait for 40 ns;
  end process p_rgb;
  
end sim;
  
  