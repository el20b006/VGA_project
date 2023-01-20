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
  signal s_state      : t_state  := IDLE_S;      
  signal s_line_beg   : unsigned(9 downto 0)  := "0011100000";
  signal s_line_end   : unsigned(9 downto 0)  := "0101000101";
  signal s_pixel_beg  : unsigned(9 downto 0)  := "0110011101";
  signal s_pixel_end  : unsigned(9 downto 0)  := "1000000010";
  signal s_add_sub_30 : unsigned(9 downto 0)  := "0000011110";
  signal s_move_count : unsigned(13 downto 0) := "00000000000000";
  signal s_clk_count  : unsigned(1 downto 0)  := "00";
	  
begin
  p_muliplex : process(reset_i, clk_i)
    begin
      if reset_i = '1' then
        rgb_o         <= "000000000000";
		s_line_beg    <= "0011100000";
		s_line_end    <= "0101000101";
		s_pixel_beg   <= "0110011101";
		s_pixel_end   <= "1000000010";
		s_move_count  <= "00000000000000";
		s_clk_count   <= "00";
        s_state       <= IDLE_S;
		
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
			if line_i > std_logic_vector(s_line_beg) then 
			  if  line_i < std_logic_vector(s_line_end) then
			    if pixel_i > std_logic_vector(s_pixel_beg) then 
			      if pixel_i < std_logic_vector(s_pixel_end) then
			        count_o <= std_logic_vector(s_move_count);
					rgb_o   <= mem2_rgb_i;
					if s_clk_count = "11" then		
					   s_move_count <= s_move_count + "00000000000001";
					   s_clk_count  <= "00";
					else
					   s_clk_count <= s_clk_count + "01";
					end if;
		
				  else
				    if swsync_i(0) = '1' then
                      rgb_o  <= mem1_rgb_i;
			        elsif swsync_i(2 downto 0) = "100" then
                      rgb_o  <= pat1_rgb_i;
                    elsif swsync_i(2 downto 0) = "110" then
                      rgb_o  <= pat2_rgb_i;
				    end if;
				  end if;
	
			    else
				  if swsync_i(0) = '1' then
                    rgb_o  <= mem1_rgb_i;
			      elsif swsync_i(2 downto 0) = "100" then
                    rgb_o  <= pat1_rgb_i;
                  elsif swsync_i(2 downto 0) = "110" then
                    rgb_o  <= pat2_rgb_i;
				  end if;
			    end if;
				
			  else
			    if swsync_i(0) = '1' then
                  rgb_o  <= mem1_rgb_i;
			    elsif swsync_i(2 downto 0) = "100" then
                  rgb_o  <= pat1_rgb_i;
                elsif swsync_i(2 downto 0) = "110" then
                  rgb_o  <= pat2_rgb_i;
				end if;
			  end if;
			  
			else 
			  if swsync_i(0) = '1' then
                  rgb_o  <= mem1_rgb_i;
			    elsif swsync_i(2 downto 0) = "100" then
                  rgb_o  <= pat1_rgb_i;
                elsif swsync_i(2 downto 0) = "110" then
                  rgb_o  <= pat2_rgb_i;
				end if;
			end if;	
			
            if s_move_count > "10011100001111" then
              s_move_count <= "00000000000000";
            end if;	
			
			if pbsync_i = "0111" then
			  s_pixel_beg <= s_pixel_beg - s_add_sub_30;
			  s_pixel_end <= s_pixel_end - s_add_sub_30;
			elsif pbsync_i = "1110" then
			  s_pixel_beg <= s_pixel_beg + s_add_sub_30;
			  s_pixel_end <= s_pixel_end + s_add_sub_30;
			elsif pbsync_i = "1011" then
			  s_line_beg <= s_line_beg - s_add_sub_30;
			  s_line_end <= s_line_end - s_add_sub_30;
			elsif pbsync_i = "1101" then
			  s_line_beg <= s_line_beg - s_add_sub_30;
			  s_line_end <= s_line_end - s_add_sub_30;
			end if;
			
			  
            if swsync_i(2) = '1' then
              s_state  <= MEMORY2_S;
            elsif swsync_i(0) = '1' then
			  s_line_beg   <= "0011100000";
		      s_line_end   <= "0101000101";
		      s_pixel_beg  <= "0110011101";
		      s_pixel_end  <= "1000000010";
			  s_move_count  <= "00000000000000";
		      s_clk_count   <= "00";
              s_state  <= MEMORY1_S;
			elsif swsync_i(2 downto 0) = "000" then
			  s_line_beg   <= "0011100000";
		      s_line_end   <= "0101000101";
		      s_pixel_beg  <= "0110011101";
		      s_pixel_end  <= "1000000010";
			  s_move_count  <= "00000000000000";
		      s_clk_count   <= "00";
              s_state  <= PATTERN1_S;
            elsif swsync_i(2 downto 0) = "010" then
			  s_line_beg   <= "0011100000";
		      s_line_end   <= "0101000101";
		      s_pixel_beg  <= "0110011101";
		      s_pixel_end  <= "1000000010";
			  s_move_count  <= "00000000000000";
		      s_clk_count   <= "00";
              s_state <= PATTERN2_S;
            end if;
					
        end case;
      end if;
	end process p_muliplex;
end rtl;