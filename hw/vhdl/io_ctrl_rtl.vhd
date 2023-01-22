-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         io_ctrl
--
-- FILENAME:       io_ctrl_rtl.vhd
-- 
-- ARCHITECTURE:   rtl
-- 
-- ENGINEER:       Sarah Fröler
--
-- DATE:           21. November 2022
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the architecture rtl of the io_ctrl submodule
--                 of the VGA Controller VHDL project.
--
--
-------------------------------------------------------------------------------
--
-- REFERENCES:     (none)
--
-------------------------------------------------------------------------------
--                                                                      
-- PACKAGES:       std_logic_1164 (IEEE library)
--				   numeric_std (IEE library)
--
-------------------------------------------------------------------------------
--                                                                      
-- CHANGES:        Version 1.0
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rtl of io_ctrl is

  signal s_pb_count : integer  := 1;                 -- counter for buttons
  signal s_sw_count : integer  := 1;                 -- counter for switches
  signal s_pb_buff  : std_logic_vector(3 downto 0);  -- buffer for buttons
  signal s_sw_buff  : std_logic_vector(15 downto 0); -- buffer for switches

begin

  p_sw : process(reset_i, clk_i)           
  -- debounce signal from sw_i and send it to swsync_o
  begin
    if reset_i = '1' then
      swsync_o  <=	"0000000000000000";    -- no switches
	  s_sw_count  <=	0;
    elsif clk_i 'event and clk_i = '1' then
      if s_sw_count = 1 then
        s_sw_buff   <= sw_i;
        s_sw_count  <= s_sw_count + 1;
      elsif s_sw_count = 1000000 then
        s_sw_count  <= 1;
        if s_sw_buff = sw_i then
          swsync_o  <= sw_i;
        end if;
      else
        s_sw_count  <= s_sw_count + 1;
      end if;
    end if;
   end process p_sw;

  p_pb : process(reset_i, clk_i)     -- debounce signal of pb
  begin
    if reset_i = '1' then
      pbsync_o	<=	"0000";          -- no buttons pressed 
      s_pb_count	<=	0;
    elsif clk_i 'event and clk_i = '1' then
      if s_pb_count = 1 then
        s_pb_buff   <= pb_i;
        s_pb_count  <= s_pb_count + 1;
      elsif s_pb_count = 1000000 then
        s_pb_count  <= 1;
        if s_pb_buff = pb_i then
          pbsync_o  <= pb_i;
        end if;
      else
        s_pb_count  <= s_pb_count + 1;
      end if;
    end if;
  end process p_pb;
  
end rtl;
