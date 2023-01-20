-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         VGA_ctrl
--
-- FILENAME:       VGA_ctrl_rtl.vhd
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
-- DESCRIPTION:    This is the architecture rtl of the VGA_ctrl 
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
																			
architecture rtl of VGA_ctrl is 
  signal s_line_count   :  unsigned(9 downto 0)  := "0000000001";
  signal s_pixel_count  :  unsigned(9 downto 0)  := "0000000001";
  signal s_to_count     :  unsigned(9 downto 0)  := "0000000001";
	
begin
  p_sync : process(reset_i, clk_i)
    begin
      if reset_i = '1' then
        v_sync_o     <= '0';
		h_sync_o     <= '0';
		pixel_o      <= "0000000001";
		line_o       <= "0000000001";
		s_line_count   <= "0000000001";
		s_pixel_count  <= "0000000001";
		rgb_o        <= "000000000000";
	
      elsif clk_i 'event and clk_i = '1' then
        if enable_25M_i = '1' then 
		  rgb_o   <= rgb_i;
		  pixel_o <= std_logic_vector(s_pixel_count);
		  line_o  <= std_logic_vector(s_line_count);
		  
		  if s_line_count < "0000000010" then
		    v_sync_o <= '1';
		  elsif s_line_count > "1000001101" then
			s_line_count  <= "0000000001";
			v_sync_o <= '1';
		  else
		    v_sync_o <= '0';
		  end if;
		  
		  if s_pixel_count < "0001100001" then
		    h_sync_o <= '1';
			s_pixel_count  <= s_pixel_count + s_to_count;
		  elsif s_pixel_count > "1100011111" then
		    h_sync_o <= '0';
			s_pixel_count <= "0000000001";
			s_line_count  <= s_line_count + s_to_count;
		  else
		    h_sync_o <= '0';
			s_pixel_count  <= s_pixel_count + s_to_count;
		  end if;
		  
		end if;
      end if;
    end process p_sync;
end rtl;