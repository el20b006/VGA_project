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
  signal clk_1k      : std_logic;         -- signal 1kHz clock
  signal clk_count   : integer  := 1;     -- counter for 1kHz clock
  signal digit_count : integer  := 0;     -- counter for digit/display
  signal pb_count    : integer  := 1;     -- counter for press button
  signal sw_count    : integer  := 1;     -- counter for switches
  signal pb_buff     : std_logic_vector(3 downto 0);
  signal sw_buff     : std_logic_vector(15 downto 0);

begin
  p_clk : process(reset_i, clk_i)         -- 1kHz clock
  begin
    if reset_i = '1' then
	  clk_1k     <= '0';
	  clk_count  <= 1;
	elsif clk_i'event and clk_i = '1' then
	  if clk_count = 100000 then
	    clk_1k     <= '1';
		clk_count  <= 1;
      else
	    clk_1k     <= '0';
		clk_count  <= clk_count + 1;
      end if;
    end if;
  end process p_clk;

  p_digit : process(reset_i, clk_1k)  -- send digit vector from di1_i, di2_i, dig3_i and dig4_i to ss_o and and ss_sel_o
  begin                               -- "00000000" "dp g f e d c b a"
    if reset_i = '1' then
      ss_o         <= "00000000";     -- all 7-segments on
      ss_sel_o     <= "0000";         -- all digits selected
      digit_count  <= 0;
    elsif clk_1k 'event and clk_1k = '1' then
      if digit_count = 0 then
	    ss_sel_o     <= "1110";
	    ss_o         <= dig0_i;
	    digit_count  <= digit_count + 1;
      elsif digit_count = 1 then
	    ss_sel_o     <= "1101";
	    ss_o         <= dig1_i;
	    digit_count  <= digit_count + 1;
	  elsif digit_count = 2 then
	    ss_sel_o     <= "1011";
	    ss_o         <= dig2_i;
	    digit_count  <= digit_count + 1;
	  else
	    ss_sel_o     <= "0111";
	    ss_o         <= dig3_i;
	    digit_count  <= 0;
	  end if;
    end if;
  end process p_digit;

  p_sw : process(reset_i, clk_i)           -- debounce signal from sw_i and send it to swsync_o
  begin
    if reset_i = '1' then
      swsync_o  <=	"0000000000000000";    -- no switches
	  sw_count  <=	0;
    elsif clk_i 'event and clk_i = '1' then
      if sw_count = 1 then
        sw_buff   <= sw_i;
        sw_count  <= sw_count + 1;
      elsif sw_count = 1000000 then
        sw_count  <= 1;
        if sw_buff = sw_i then
          swsync_o  <= sw_i;
        end if;
      else
        sw_count  <= sw_count + 1;
      end if;
    end if;
   end process p_sw;

  p_pb : process(reset_i, clk_i)     -- debounce signal from pb_i and send it to pbsync_o
  begin
    if reset_i = '1' then
      pbsync_o	<=	"0000";          -- no buttons pressed 
      pb_count	<=	0;
    elsif clk_i 'event and clk_i = '1' then
      if pb_count = 1 then
        pb_buff   <= pb_i;
        pb_count  <= pb_count + 1;
      elsif pb_count = 1000000 then
        pb_count  <= 1;
        if pb_buff = pb_i then
          pbsync_o  <= pb_i;
        end if;
      else
        pb_count  <= pb_count + 1;
      end if;
    end if;
  end process p_pb;
  
end rtl;
