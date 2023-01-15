-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         pattern_gen_2
--
-- FILENAME:       pattern_gen_2_rtl.vhd
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
-- DESCRIPTION:    This is the architecture rtl of the pattern_gen_2 
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

architecture rtl of pattern_gen_2 is 


begin
  p_generate : process (clk_i, reset_i)
    begin
      if reset_i = '1' then
        rgb_o   <= "000000000000";

      elsif clk_i 'event and clk_i = '1' then
        if line_i < "0000001101" or line_i > "0111101100" then
		  rgb_o   <= "000000000000";
		  
	    elsif pixel_i < "0000111001" or pixel_i > "1011110000" then
		  rgb_o   <= "000000000000"; 
		  
		-- r-g-b line
		elsif line_i > "0000001100" and line_i < "0000111101" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0100110000" and pixel_i < "0101110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0111110000" and pixel_i < "1000110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "1010110000" and pixel_i < "1011110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0010110000" and pixel_i < "0011110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0101110000" and pixel_i < "0110110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1000110000" and pixel_i < "1001110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0011110000" and pixel_i < "0100110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0110110000" and pixel_i < "0111110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1001110000" and pixel_i < "1010110001" then
            rgb_o  <= "000000001111";   -- blue 1, others 0
		  end if;
		
        -- r-g-b line		
		elsif line_i > "0010011100" and line_i < "0011001101" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0100110000" and pixel_i < "0101110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0111110000" and pixel_i < "1000110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "1010110000" and pixel_i < "1011110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0010110000" and pixel_i < "0011110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0101110000" and pixel_i < "0110110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1000110000" and pixel_i < "1001110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0011110000" and pixel_i < "0100110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0110110000" and pixel_i < "0111110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1001110000" and pixel_i < "1010110001" then
            rgb_o  <= "000000001111";   -- blue 1, others 0
          end if;

		-- r-g-b- line
		elsif line_i > "0100101100" and line_i < "0101011101" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0100110000" and pixel_i < "0101110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0111110000" and pixel_i < "1000110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "1010110000" and pixel_i < "1011110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0010110000" and pixel_i < "0011110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0101110000" and pixel_i < "0110110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1000110000" and pixel_i < "1001110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0011110000" and pixel_i < "0100110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0110110000" and pixel_i < "0111110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1001110000" and pixel_i < "1010110001" then
            rgb_o  <= "000000001111";   -- blue 1, others 0
          end if;
		  
		-- r-g-b line
		elsif line_i > "0110111100" and line_i < "0111101101" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0100110000" and pixel_i < "0101110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0111110000" and pixel_i < "1000110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "1010110000" and pixel_i < "1011110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0010110000" and pixel_i < "0011110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0101110000" and pixel_i < "0110110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1000110000" and pixel_i < "1001110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0011110000" and pixel_i < "0100110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0110110000" and pixel_i < "0111110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1001110000" and pixel_i < "1010110001" then
            rgb_o  <= "000000001111";   -- blue 1, others 0
          end if;
		
		-- g-b-r line
		elsif line_i > "0000111100" and line_i < "0001101101" then 
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "000011110000";   -- green 1, others 0 
		  elsif pixel_i > "0100110000" and pixel_i < "0101110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0 
		  elsif pixel_i > "0111110000" and pixel_i < "1000110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0 
		  elsif pixel_i > "1010110000" and pixel_i < "1011110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0 
		  elsif pixel_i > "0010110000" and pixel_i < "0011110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0101110000" and pixel_i < "0110110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1000110000" and pixel_i < "1001110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0011110000" and pixel_i < "0100110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0110110000" and pixel_i < "0111110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "1001110000" and pixel_i < "1010110001" then
            rgb_o  <= "111100000000";   -- red 1, others 0
		  end if;
		
        -- g-b-r line		
		elsif line_i > "0011001100" and line_i < "0011111101" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "000011110000";   -- green 1, others 0 
		  elsif pixel_i > "0100110000" and pixel_i < "0101110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0 
		  elsif pixel_i > "0111110000" and pixel_i < "1000110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0 
		  elsif pixel_i > "1010110000" and pixel_i < "1011110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0 
		  elsif pixel_i > "0010110000" and pixel_i < "0011110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0101110000" and pixel_i < "0110110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1000110000" and pixel_i < "1001110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0011110000" and pixel_i < "0100110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0110110000" and pixel_i < "0111110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "1001110000" and pixel_i < "1010110001" then
            rgb_o  <= "111100000000";   -- red 1, others 0
		  end if;
		
		-- g-b-r line
		elsif line_i > "0101011100" and line_i < "0110001101" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "000011110000";   -- green 1, others 0 
		  elsif pixel_i > "0100110000" and pixel_i < "0101110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0 
		  elsif pixel_i > "0111110000" and pixel_i < "1000110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0 
		  elsif pixel_i > "1010110000" and pixel_i < "1011110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0 
		  elsif pixel_i > "0010110000" and pixel_i < "0011110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0101110000" and pixel_i < "0110110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1000110000" and pixel_i < "1001110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0011110000" and pixel_i < "0100110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0110110000" and pixel_i < "0111110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "1001110000" and pixel_i < "1010110001" then
            rgb_o  <= "111100000000";   -- red 1, others 0
		  end if;
		
		-- b-r-g line
		elsif line_i > "0001101100" and line_i < "0010011101" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "000000001111";   -- blue 1, others 0 
		  elsif pixel_i > "0100110000" and pixel_i < "0101110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0111110000" and pixel_i < "1000110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1010110000" and pixel_i < "1011110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0010110000" and pixel_i < "0011110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0101110000" and pixel_i < "0110110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "1000110000" and pixel_i < "1001110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0011110000" and pixel_i < "0100110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0110110000" and pixel_i < "0111110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1001110000" and pixel_i < "1010110001" then
            rgb_o  <= "000011110000";   -- green 1, others 0
		  end if;
		
		-- b-r-g line
		elsif line_i > "0011111100" and line_i < "0100101101" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "000000001111";   -- blue 1, others 0 
		  elsif pixel_i > "0100110000" and pixel_i < "0101110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0111110000" and pixel_i < "1000110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1010110000" and pixel_i < "1011110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0010110000" and pixel_i < "0011110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0101110000" and pixel_i < "0110110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "1000110000" and pixel_i < "1001110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0011110000" and pixel_i < "0100110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0110110000" and pixel_i < "0111110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1001110000" and pixel_i < "1010110001" then
            rgb_o  <= "000011110000";   -- green 1, others 0
		  end if;
		
		-- b-r-g line
		elsif line_i > "0110001100" and line_i < "0110111101" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "000000001111";   -- blue 1, others 0 
		  elsif pixel_i > "0100110000" and pixel_i < "0101110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0111110000" and pixel_i < "1000110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1010110000" and pixel_i < "1011110001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0010110000" and pixel_i < "0011110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0101110000" and pixel_i < "0110110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "1000110000" and pixel_i < "1001110001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0011110000" and pixel_i < "0100110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0110110000" and pixel_i < "0111110001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1001110000" and pixel_i < "1010110001" then
            rgb_o  <= "000011110000";   -- green 1, others 0
		  end if;  
		end if;	
	  end if;
	end process;
end rtl;