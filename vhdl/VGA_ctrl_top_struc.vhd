-------------------------------------------------------------------------------
--                                                                      
--                        Calculator VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         calc_top
--
-- FILENAME:       calc_top_struc.vhd
-- 
-- ARCHITECTURE:   rtl
-- 
-- ENGINEER:       Sarah Fröler
--
-- DATE:           37. April 2022
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the architecture struc of the calc_top of the 
--                 VGA Controller VHDL project.
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

architecture struc of VGA_ctrl_top is
																				
  component io_ctrl
    port(clk_i    :  in   std_logic;                     -- system clock 
        reset_i  :  in   std_logic;                      -- reset
        sw_i     :  in   std_logic_vector(15 downto 0);  -- switch 0-15
        pb_i     :  in   std_logic_vector(3 downto 0);   -- button 0-3
        swsync_o :  out  std_logic_vector(15 downto 0);  -- debounced switches
        pbsync_o :  out  std_logic_vector(3 downto 0)    -- debounced buttons
		);
  end component;
  
  component mem_ctrl_1
    port(clk_i    :  in   std_logic;                     -- system clock
         reset_i  :  in   std_logic;                     -- reset
         pixel_i  :  in   std_logic_vector(9 downto 0);  -- pixel counter
         line_i   :  in   std_logic_vector(9 downto 0);  -- line counter
         rgb_o    :  out  std_logic_vector(11 downto 0)  -- rgb output
	    );
  end component;
  
  component mem_ctrl_2
    port(clk_i    :  in   std_logic;                     -- system clock
         reset_i  :  in   std_logic;                     -- reset
         pixel_i  :  in   std_logic_vector(9 downto 0);  -- pixel counter
         line_i   :  in   std_logic_vector(9 downto 0);  -- line counter
         rgb_o    :  out  std_logic_vector(11 downto 0)  -- rgb output
	    );
  end component;
  
  component pattern_gen_1
    port(clk_i    :  in   std_logic;                     -- system clock
         reset_i  :  in   std_logic;                     -- reset
         pixel_i  :  in   std_logic_vector(9 downto 0);  -- pixel counter
         line_i   :  in   std_logic_vector(9 downto 0);  -- line counter
         rgb_o    :  out  std_logic_vector(11 downto 0)  -- rgb output
		);
  end component;

  component pattern_gen_2
    port(clk_i    :  in   std_logic;                     -- system clock
         reset_i  :  in   std_logic;                     -- reset
         pixel_i  :  in   std_logic_vector(9 downto 0);  -- pixel counter
         line_i   :  in   std_logic_vector(9 downto 0);  -- line counter
         rgb_o    :  out  std_logic_vector(11 downto 0)  -- rgb output
		);
  end component;
  
  component prescaler
    port(clk_i         :  in   std_logic;  -- system clock
         reset_i       :  in   std_logic;  -- reset
         enable_25M_o  :  out  std_logic   -- enable signal 25MHz
        );
  end component;
  
  component source_multiplexer
    port(clk_i       :  in   std_logic;                      -- system clock
         reset_i	 :  in   std_logic;                      -- reset
         swsync_i    :  in   std_logic_vector(15 downto 0);  -- switches
         pbsync_i    :  in   std_logic_vector(3 downto 0);   -- buttons
         pat1_rgb_i  :  in   std_logic_vector(11 downto 0);  -- rgb values
         pat2_rgb_i  :  in   std_logic_vector(11 downto 0);  -- rgb values
         mem1_rgb_i  :  in   std_logic_vector(11 downto 0);  -- rgb values
         mem2_rgb_i  :  in   std_logic_vector(11 downto 0);  -- rgb values
         rgb_o       :  out  std_logic_vector(11 downto 0)   -- rgb output
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
  

  -- Declare the signals used for interconnection of the submodules.
  signal enable_25M   :  std_logic;                      -- enable signal 25MHz  
  signal swsync       :  std_logic_vector(15 downto 0);  -- debounced switches
  signal pbsync       :  std_logic_vector(3 downto 0);   -- debounced button
  signal pat1_rgb     :  std_logic_vector(11 downto 0);  -- rgb pattern gen 1
  signal pat2_rgb     :  std_logic_vector(11 downto 0);  -- rgb pattern gen 2
  signal mem1_rgb     :  std_logic_vector(11 downto 0);  -- rgb memory control 1
  signal mem2_rgb     :  std_logic_vector(11 downto 0);  -- rgb memory control 2
  signal pixel_count  :  std_logic_vector(9 downto 0);   -- pixel counter
  signal line_count   :  std_logic_vector(9 downto 0);   -- line counter
  signal rgb          :  std_logic_vector(11 downto 0);  -- multiplexed rgb
  
  
begin
  -- Instantiate the io_ctrl unit
  i_io_ctrl : io_ctrl
  port map
    (clk_i     => clk_i,
	 reset_i   => reset_i,
	 swsync_o  => swsync,
	 pbsync_o  => pbsync,
	 sw_i      => sw_i,
	 pb_i      => pb_i,
    );
	 
  -- Instantiate the mem_ctrl_1 unit
  i_mem_ctrl_1 : mem_ctrl_1
  port map
    (clk_i    => clk_i,
	 reset_i  => reset_i,
	 pixel_i  => pixel_count,
	 line_i   => line_count,
	 rgb_o    => mem1_rgb
    );
  
  -- Instantiate the mem_ctrl_2 unit
  i_mem_ctrl_2 : mem_ctrl_2
  port map
    (clk_i    => clk_i,
	 reset_i  => reset_i,
	 pixel_i  => pixel_count,
	 line_i   => line_count,
	 rgb_o    => mem2_rgb
    );

  -- Instantiate the pattern_gen_1 unit
  i_pattern_gen_1 : pattern_gen_1
  port map
    (clk_i    => clk_i,
	 reset_i  => reset_i,
	 pixel_i  => pixel_count,
	 line_i   => line_count,
	 rgb_o    => pat1_rgb
    );
	
  -- Instantiate the pattern_gen_2 unit
  i_pattern_gen_2 : pattern_gen_2
  port map
    (clk_i    => clk_i,
	 reset_i  => reset_i,
	 pixel_i  => pixel_count,
	 line_i   => line_count,
	 rgb_o    => pat2_rgb	
    );

  -- Instantiate the prescaler unit
  i_prescaler : prescaler
  port map
    (clk_i         => clk_i,
	 reset_i       => reset_i,
	 enable_25M_o  => enable_25M
    );
	
  -- Instantiate the source_multiplexer unit
  i_source_multiplexer  : source_multiplexer 
  port map
    (clk_i       => clk_i,
	 reset_i     => reset_i,
	 swsync_i    => swsync,
	 pbsync_i    => pbsync,
	 pat1_rgb_i  => pat1_rgb,
	 pat2_rgb_i  => pat2_rgb,
	 mem1_rgb_i  => mem1_rgb,
	 mem2_rgb_i  => mem2_rgb,
	 rgb_o       => rgb
    );
	
  -- Instantiate the VGA_ctrl unit
  i_VGA_ctrl  : VGA_ctrl
  port map
    (clk_i         => clk_i,
	 reset_i       => reset_i,
	 enable_25M_i  => enable_25M,
	 rgb_i         => rgb,
	 pixel_o       => pixel_count,
	 line_o        => line_count,
	 rgb_o         => rgb_o,
	 h_sync_o      => h_sync_o,
	 v_sync_o      => v_sync_o
    );

end struc;
