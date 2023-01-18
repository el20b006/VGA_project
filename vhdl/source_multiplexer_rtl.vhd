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
-- DESCRIPTION:    This is the architecture rtl of the source_multiplexer 
--                 submodul of the VGA Controller VHDL project.
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

architecture rtl of source_multiplexer is
  type   t_state is (IDLE_S, PATTERN1_S, PATTERN2_S, MEMORY1_S, MEMORY2_S);
  signal s_state    : t_state  := IDLE_S;      
  signal line_move  : std_logic_vector(9 downto 0)  := "0011100000";
  signal pixel_move : std_logic_vector(9 downto 0)  := "0110011101";
  signal add_101    : std_logic_vector(9 downto 0)  := "0001100101";
  signal add_sub_30 : std_logic_vector(9 downto 0)  := "0000011110";
	  
begin
  p_muliplex : process(reset_i, clk_i)
    begin
      if reset_i = '1' then
        rgb_o      <= "000000000000";
		line_move  <= "0011100000";
		pixel_move <= "0110011101";
        s_state    <= IDLE_S;
      elsif clk_i 'event and clk_i = '1' then
        case s_state is
          when IDLE_S =>
            if swsync_i(2) = '1' then
              s_state  <= MEMORY2_S;
            elsif swsync_i(0) = '1' then
              s_state  <= MEMORY1_S;
			elsif swsync_i(2 downto 0) = "000" then
              s_state  <= PATTERN1_S;
            elsif swsync_i(2 downto 0) = "010" then
              s_state <= PATTERN2_S;
            end if;
					
          when PATTERN1_S =>
            rgb_o  <= pat1_rgb_i;
            if swsync_i(2) = '1' then
              s_state  <= MEMORY2_S;
            elsif swsync_i(0) = '1' then
              s_state  <= MEMORY1_S;
			elsif swsync_i(2 downto 0) = "000" then
              s_state  <= PATTERN1_S;
            elsif swsync_i(2 downto 0) = "010" then
              s_state <= PATTERN2_S;
            end if;
				
          when PATTERN2_S =>
            rgb_o  <= pat2_rgb_i;
            if swsync_i(2) = '1' then
              s_state  <= MEMORY2_S;
            elsif swsync_i(0) = '1' then
              s_state  <= MEMORY1_S;
			elsif swsync_i(2 downto 0) = "000" then
              s_state  <= PATTERN1_S;
            elsif swsync_i(2 downto 0) = "010" then
              s_state <= PATTERN2_S;
			end if;
				
          when MEMORY1_S =>
            rgb_o  <= mem1_rgb_i;
            if swsync_i(2) = '1' then
              s_state  <= MEMORY2_S;
            elsif swsync_i(0) = '1' then
              s_state  <= MEMORY1_S;
			elsif swsync_i(2 downto 0) = "000" then
              s_state  <= PATTERN1_S;
            elsif swsync_i(2 downto 0) = "010" then
              s_state <= PATTERN2_S;
			end if;
				
          when MEMORY2_S =>
		    -- movable object???
			if line_i > line_move and line < (line_move + add_101) then
			  if pixel_i > pixel_move and pixel_i < (pixel_move + add_101) then
			    -- display move object
				
			  else 
			    elsif swsync_i(0) = '1' then
                  rgb_o  <= mem1_rgb_i;
			    elsif swsync_i(2 downto 0) = "000" then
                  rgb_o  <= pat1_rgb_i;
                elsif swsync_i(2 downto 0) = "010" then
                  rgb_o  <= pat1_rgb_i;
				end if;
			  
			else 
			  elsif swsync_i(0) = '1' then
                rgb_o  <= mem1_rgb_i;
			  elsif swsync_i(2 downto 0) = "000" then
                rgb_o  <= pat1_rgb_i;
              elsif swsync_i(2 downto 0) = "010" then
                rgb_o  <= pat1_rgb_i;
			  end if;
			end if;
			
			if pbsync_i = "0000" then  -- BTNU !!!
			  line_move <= line_move - add_sub_30;
			elsif pbsync = "0000" then -- BTND !!!
			  line_move <= line_move + add_sub_30;
			elsif pbsync = "0000" then -- BTNL !!!
			  pixel_move <= pixel_move - add_sub_30;
			elsif pbsync = "0000" then -- BTNR !!!
			  pixel_move <= pixel_move + add_sub_30;
			end if;
			  
            if swsync_i(2) = '1' then
              s_state  <= MEMORY2_S;
            elsif swsync_i(0) = '1' then
			  line_move  <= "0011100000";
		      pixel_move <= "0110011101";
              s_state  <= MEMORY1_S;
			elsif swsync_i(2 downto 0) = "000" then
			  line_move  <= "0011100000";
		      pixel_move <= "0110011101";
              s_state  <= PATTERN1_S;
            elsif swsync_i(2 downto 0) = "010" then
			  line_move  <= "0011100000";
		      pixel_move <= "0110011101";
              s_state <= PATTERN2_S;
            end if;
					
        end case;
      end if;
	end process;
end rtl;