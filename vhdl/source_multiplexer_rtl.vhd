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
  signal s_button_act : std_logic             := '0';
	  
begin
  p_muliplex : process(reset_i, clk_i)
    begin
      if reset_i = '1' then
        rgb_o         <= "000000000000";
		s_line_beg    <= "0011100000";
		s_line_end    <= "0101000101";
		s_pixel_beg   <= "0110011101";
		s_pixel_end   <= "1000000010";
		s_button_act  <= '0';
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
			pixel_beg_o <= std_logic_vector(s_pixel_beg);
			pixel_end_o <= std_logic_vector(s_pixel_end);
			line_beg_o  <= std_logic_vector(s_line_beg);
			line_end_o  <= std_logic_vector(s_line_end);
			
			if line_i > std_logic_vector(s_line_beg) then 
			  if  line_i < std_logic_vector(s_line_end) then
			    if pixel_i > std_logic_vector(s_pixel_beg) then 
			      if pixel_i < std_logic_vector(s_pixel_end) then
					rgb_o   <= mem2_rgb_i;
					
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
			
			if line_i = std_logic_vector(s_line_beg) then
			  if pixel_i = std_logic_vector(s_pixel_beg) then
			    if s_button_act = '0' then
			      if pbsync_i = "1000" then
			        if s_pixel_beg > "0010101101" then
			          s_pixel_beg  <= s_pixel_beg - s_add_sub_30;
                      s_pixel_end  <= s_pixel_end - s_add_sub_30;
			          s_button_act <= '1';
				    end if;
			      elsif pbsync_i = "0001" then
			        if s_pixel_end < "1011110010" then
			          s_pixel_beg  <= s_pixel_beg + s_add_sub_30;
				      s_pixel_end  <= s_pixel_end + s_add_sub_30;
			          s_button_act <= '1';
				    end if;
			      elsif pbsync_i = "0100" then
			        if s_line_beg > "0000101100" then
			          s_line_beg   <= s_line_beg - s_add_sub_30;
				      s_line_end   <= s_line_end - s_add_sub_30;
			          s_button_act <= '1';
				    end if;
			      elsif pbsync_i = "0010" then
			        if s_line_end < "0111111001" then
			          s_line_beg   <= s_line_beg + s_add_sub_30;
				      s_line_end   <= s_line_end + s_add_sub_30;
			          s_button_act <= '1';
					end if;
				  end if;
			    end if;
			  end if;
			end if;
			
			if pbsync_i = "0000" then
			  s_button_act <= '0';
			end if;
				  
            if swsync_i(2) = '1' then
              s_state  <= MEMORY2_S;
            elsif swsync_i(0) = '1' then
			  s_line_beg    <= "0011100000";
		      s_line_end    <= "0101000101";
		      s_pixel_beg   <= "0110011101";
		      s_pixel_end   <= "1000000010";
              s_state  <= MEMORY1_S;
			elsif swsync_i(2 downto 0) = "000" then
			  s_line_beg    <= "0011100000";
		      s_line_end    <= "0101000101";
		      s_pixel_beg   <= "0110011101";
		      s_pixel_end   <= "1000000010";
              s_state  <= PATTERN1_S;
            elsif swsync_i(2 downto 0) = "010" then
			  s_line_beg    <= "0011100000";
		      s_line_end    <= "0101000101";
		      s_pixel_beg   <= "0110011101";
		      s_pixel_end   <= "1000000010";
              s_state <= PATTERN2_S;
            end if;
					
        end case;
      end if;
	end process p_muliplex;
end rtl;