-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         tb_io_ctrl
--
-- FILENAME:       tb_io_ctrl_sim.vhd
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
-- DESCRIPTION:    This is the architecture of the io_ctrl testbench
--                 for the VGA Controller VHDL Project.
--
-------------------------------------------------------------------------------
--                                                                      
-- PACKAGES:       std_logic_1164 (IEEE library)
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


architecture sim of tb_io_ctrl is

  component io_ctrl
  port (clk_i     :  in   std_logic;                      -- clock
        reset_i   :  in   std_logic;                      -- reset
        sw_i      :  in   std_logic_vector(15 downto 0);  --  witch 0-15
        pb_i      :  in   std_logic_vector(3 downto 0);   -- button 0-3
		swsync_o  :  out  std_logic_vector(15 downto 0);  -- debounced switches 
		pbsync_o  :  out  std_logic_vector(3 downto 0)    -- debounced button
		);
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal clk_i     :  std_logic;                      -- system clock 100MHz
  signal reset_i   :  std_logic;                      -- reset
  signal sw_i      :  std_logic_vector(15 downto 0);  -- switch 0-15
  signal pb_i      :  std_logic_vector(3 downto 0);   -- button 0-3
  signal swsync_o  :  std_logic_vector(15 downto 0);  --  debounced switches
  signal pbsync_o  :  std_logic_vector(3 downto 0);   -- debounced button
  
  
begin

  -- Instantiate the io_ctrl design for testing
  i_io_ctrl : io_ctrl
  port map              
    (clk_i     => clk_i,
     reset_i   => reset_i,
     sw_i      => sw_i,
	 pb_i      => pb_i,
	 swsync_o  => swsync_o,
	 pbsync_o  => pbsync_o
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
    wait for 15 ms;
    reset_i <= '1';
    wait for 1 ms;
    reset_i <= '0';
    wait;
  end process p_reset;

  p_pb : process
  begin
    pb_i <= "0101";
    wait for 25 ms;
    pb_i <= "1001";
    wait for 1 ms;
    pb_i <= "0101";
    wait for 1 ms;
    pb_i <= "1001";
    wait for 1 ms;
    pb_i <= "0101";
    wait for 1 ms;
    pb_i <= "1001";
    wait for 1 ms;
    pb_i <= "0101";
    wait for 1 ms;
    pb_i <= "1001";
    wait for 1 ms;
    pb_i <= "0010";
    wait for 20 ms;
    pb_i <= "0000";
    wait;
  end process p_pb;

  p_sw : process
  begin
    sw_i <= "1000000000000001";
    wait for 25 ms;
    sw_i <= "0101010101010101";
    wait for 1 ms;
    sw_i <= "1000000000000001";
    wait for 1 ms;
    sw_i <= "0101010101010101";
    wait for 1 ms;
    sw_i <= "0101010101010101";
    sw_i <= "0101010101010101";
    wait for 1 ms;
    sw_i <= "1000000000000001";
    wait for 1 ms;
    sw_i <= "0101010101010101";
    wait for 20 ms;
    sw_i <= "1000000000000001";
    wait;
  end process p_sw;

end sim;

