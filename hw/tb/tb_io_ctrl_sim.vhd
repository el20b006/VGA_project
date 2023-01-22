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
  port(clk_i    : in  std_logic;                      -- 100MHz clock
       reset_i  : in  std_logic;                      -- reset
       sw_i     : in  std_logic_vector(15 downto 0);  -- switch 0-15
       pb_i     : in  std_logic_vector(3 downto 0);   -- button 0-3
	   swsync_o : out std_logic_vector(15 downto 0);  -- debounced switches 
	   pbsync_o : out std_logic_vector(3 downto 0)    -- debounced button
	  );
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal s_clk    : std_logic;                      -- 100MHz clock
  signal s_reset  : std_logic;                      -- reset
  signal s_sw     : std_logic_vector(15 downto 0);  -- switch 0-15
  signal s_pb     : std_logic_vector(3 downto 0);   -- button 0-3
  signal s_swsync : std_logic_vector(15 downto 0);  -- debounced switches
  signal s_pbsync : std_logic_vector(3 downto 0);   -- debounced button
  
begin
  -- Instantiate the io_ctrl design for testing
  i_io_ctrl : io_ctrl
  port map              
    (clk_i    => s_clk,
     reset_i  => s_reset,
     sw_i     => s_sw,
	 pb_i     => s_pb,
	 swsync_o => s_swsync,
	 pbsync_o => s_pbsync
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
    wait for 15 ms;
    s_reset <= '1';
    wait for 1 ms;
    s_reset <= '0';
    wait;
  end process p_reset;

  p_pb : process
  begin
    s_pb <= "0101";
    wait for 25 ms;
    s_pb <= "1001";
    wait for 1 ms;
    s_pb <= "0101";
    wait for 1 ms;
    s_pb <= "1001";
    wait for 1 ms;
    s_pb <= "0101";
    wait for 1 ms;
    s_pb <= "1001";
    wait for 1 ms;
    s_pb <= "0101";
    wait for 1 ms;
    s_pb <= "1001";
    wait for 1 ms;
    s_pb <= "0010";
    wait for 20 ms;
    s_pb <= "0000";
    wait;
  end process p_pb;

  p_sw : process
  begin
    s_sw <= "1000000000000001";
    wait for 25 ms;
    s_sw <= "0101010101010101";
    wait for 1 ms;
    s_sw <= "1000000000000001";
    wait for 1 ms;
    s_sw <= "0101010101010101";
    wait for 1 ms;
    s_sw <= "0101010101010101";
    wait for 1 ms;
    s_sw <= "1000000000000001";
    wait for 1 ms;
    s_sw <= "0101010101010101";
    wait for 20 ms;
    s_sw <= "1000000000000001";
    wait;
  end process p_sw;

end sim;

