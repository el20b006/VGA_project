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
  
  component mem_ctrl_1       -- pattern_gen_1   pattern_gen_2   mem_ctrl_1
    port(clk_i         :  in   std_logic;                     -- system clock
         reset_i       :  in   std_logic;                     -- reset
		 enable_25M_i  :  in   std_logic;                     -- only for mem
         pixel_i       :  in   std_logic_vector(9 downto 0);  -- pixel counter
         line_i        :  in   std_logic_vector(9 downto 0);  -- line counter
         rgb_o         :  out  std_logic_vector(11 downto 0)  -- rgb output
		);
  end component;

  component VGA_ctrl
    port(clk_i         :  in   std_logic;                      -- system clock
         reset_i       :  in   std_logic;                      -- reset
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
  signal h_sync       :  std_logic;
  signal v_sync       :  std_logic;
  signal clk          :  std_logic;
  signal reset        :  std_logic;
  signal enable       :  std_logic;
  signal rgb_output   :  std_logic_vector(11 downto 0);
  signal pixel_count  :  std_logic_vector(9 downto 0);   -- pixel counter
  signal line_count   :  std_logic_vector(9 downto 0);   -- line counter
  signal rgb          :  std_logic_vector(11 downto 0);  -- multiplexed rgb
  
  
begin

  -- Instantiate the pattern_gen_1 unit
  i_mem_ctrl_1 : mem_ctrl_1
  port map
    (clk_i        => clk,
	 reset_i      => reset,
	 enable_25M_i => enable,         -- only for mem
	 pixel_i      => pixel_count,
	 line_i       => line_count,
	 rgb_o        => rgb
    );
	
  -- Instantiate the VGA_ctrl unit
  i_VGA_ctrl  : VGA_ctrl
  port map
    (clk_i         => clk,
	 reset_i       => reset,
	 enable_25M_i  => enable,
	 rgb_i         => rgb,
	 pixel_o       => pixel_count,
	 line_o        => line_count,
	 rgb_o         => rgb_output,
	 h_sync_o      => h_sync,
	 v_sync_o      => v_sync
    );
	
  -- Instantiate the vga_monitor unit
  i_vga_monitor : vga_monitor
  port map
    (s_reset_i      => reset,
	 s_vga_red_i    => rgb_output(11 downto 8),
	 s_vga_green_i  => rgb_output(7 downto 4),
	 s_vga_blue_i   => rgb_output(3 downto 0),
	 s_vga_hsync_i  => h_sync,
	 s_vga_vsync_i  => v_sync
	);

  p_clk : process
  begin
    clk <= '1';
    wait for 5 ns;
	clk <= '0';
	wait for 5 ns;
  end process p_clk; 
  
  p_reset : process
  begin
    reset <= '1';
    wait for 50 ns;
    reset <= '0';
    wait;
  end process p_reset;
  
  p_enable : process
  begin
    enable <= '1';
	wait for 10 ns;
	enable <= '0';
	wait for 30 ns;
  end process;

end struc;
