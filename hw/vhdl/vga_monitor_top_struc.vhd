-------------------------------------------------------------------------------
--                                                                      
--                        Calculator VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         monitor_test_top
--
-- FILENAME:       monitor_test_top_struc.vhd
-- 
-- ARCHITECTURE:   rtl
-- 
-- ENGINEER:       Sarah Fröler
--
-- DATE:           16. January 2023
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the architecture struc of the monitor_test_top of  
--                 the VGA Controller VHDL project.
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

architecture struc of vga_monitor_top is
  
  component pattern_gen_1   -- pattern_gen_2   mem_ctrl_1
    port(clk_i         :  in   std_logic;                     -- system clock
         reset_i       :  in   std_logic;                     -- reset
		 -- enable_25M_i  :  in   std_logic;                     -- only for mem
         pixel_i       :  in   std_logic_vector(9 downto 0);  -- pixel counter
         line_i        :  in   std_logic_vector(9 downto 0);  -- line counter
         rgb_o         :  out  std_logic_vector(11 downto 0)  -- rgb output
		);
  end component;

  component VGA_ctrl
    port(reset_i       :  in   std_logic;                      -- reset
         enable_25M_i  :  in   std_logic;                      -- 25M enable 
         rgb_i         :  in   std_logic_vector(11 downto 0);  -- input rgb 
         v_sync_o      :  out  std_logic;                      -- v-sync
         h_sync_o      :  out  std_logic;                      -- h-sync
         pixel_o       :  out  std_logic_vector(9 downto 0);   -- pixel output
         line_o        :  out  std_logic_vector(9 downto 0);   -- pixel line  
         rgb_o         :  out  std_logic_vector(11 downto 0)   -- rgb output 
		);
  end component;  
  
  component vga_monitor
    port(s_reset_i      :  in  std_logic;
	     s_vga_red_i    :  in  std_logic_vector(3 downto 0);
		 s_vga_green_i  :  in  std_logic_vector(3 downto 0);
		 s_vga_blue_i   :  in  std_logic_vector(3 downto 0);
		 s_vga_hsync_i  :  in  std_logic;
		 s_vga_vsync_i  :  in  std_logic
		);
  end component;
  
  -- Declare the signals used for interconnection of the submodules  
  signal s_h_sync       :  std_logic;
  signal s_v_sync       :  std_logic;
  signal s_clk          :  std_logic;
  signal s_reset        :  std_logic;
  signal s_enable       :  std_logic;
  signal s_rgb_output   :  std_logic_vector(11 downto 0);
  signal s_pixel_count  :  std_logic_vector(9 downto 0);   -- pixel counter
  signal s_line_count   :  std_logic_vector(9 downto 0);   -- line counter
  signal s_rgb          :  std_logic_vector(11 downto 0);  -- multiplexed rgb
  
  
begin

  -- Instantiate the pattern_gen_1 unit
  i_pattern_gen_1 : pattern_gen_1
  port map
    (clk_i        => s_clk,
	 reset_i      => s_reset,
	 -- enable_25M_i => s_enable,         -- only for mem
	 pixel_i      => s_pixel_count,
	 line_i       => s_line_count,
	 rgb_o        => s_rgb
    );
	
  -- Instantiate the VGA_ctrl unit
  i_VGA_ctrl  : VGA_ctrl
  port map
    (reset_i       => s_reset,
	 enable_25M_i  => s_enable,
	 rgb_i         => s_rgb,
	 pixel_o       => s_pixel_count,
	 line_o        => s_line_count,
	 rgb_o         => s_rgb_output,
	 h_sync_o      => s_h_sync,
	 v_sync_o      => s_v_sync
    );
	
  -- Instantiate the vga_monitor unit
  i_vga_monitor : vga_monitor
  port map
    (s_reset_i      => s_reset,
	 s_vga_red_i    => s_rgb_output(11 downto 8),
	 s_vga_green_i  => s_rgb_output(7 downto 4),
	 s_vga_blue_i   => s_rgb_output(3 downto 0),
	 s_vga_hsync_i  => s_h_sync,
	 s_vga_vsync_i  => s_v_sync
	);

  p_clk : process
  begin
    s_clk <= '1';
    wait for 5 ns;
	s_clk <= '0';
	wait for 5 ns;
  end process p_clk; 
  
  p_reset : process
  begin
    s_reset <= '1';
    wait for 50 ns;
    s_reset <= '0';
    wait;
  end process p_reset;
  
  p_enable : process
  begin
    s_enable <= '1';
	wait for 20 ns;
	s_enable <= '0';
	wait for 20 ns;
  end process;

end struc;
