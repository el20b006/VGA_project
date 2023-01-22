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
        if line_i < "0000100011" or line_i > "1000000011" then
		  rgb_o   <= "000000000000";
		  
	    elsif pixel_i < "0010010000" or pixel_i > "1100001110" then
		  rgb_o   <= "000000000000"; 
		  
		-- r-g-b line 1
		elsif line_i > "0000100010" and line_i < "0001010011" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0101010000" and pixel_i < "0110010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "1000010000" and pixel_i < "1001010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "1011010000" and pixel_i < "1100010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
			
		  elsif pixel_i > "0011010000" and pixel_i < "0100010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0110010000" and pixel_i < "0111010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1001010000" and pixel_i < "1010010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
			
		  elsif pixel_i > "0100010000" and pixel_i < "0101010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0111010000" and pixel_i < "1000010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1010010000" and pixel_i < "1011010001" then
            rgb_o  <= "000000001111";   -- blue 1, others 0
		  end if;
		
        -- r-g-b line 2		
		elsif line_i > "0010110010" and line_i < "0011100011" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0101010000" and pixel_i < "0110010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "1000010000" and pixel_i < "1001010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "1011010000" and pixel_i < "1100010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
			
		  elsif pixel_i > "0011010000" and pixel_i < "0100010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0110010000" and pixel_i < "0111010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1001010000" and pixel_i < "1010010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
			
		  elsif pixel_i > "0100010000" and pixel_i < "0101010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0111010000" and pixel_i < "1000010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1010010000" and pixel_i < "1011010001" then
            rgb_o  <= "000000001111";   -- blue 1, others 0
		  end if;

		-- r-g-b- line 3
		elsif line_i > "0101000010" and line_i < "0101110011" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0101010000" and pixel_i < "0110010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "1000010000" and pixel_i < "1001010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "1011010000" and pixel_i < "1100010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
			
		  elsif pixel_i > "0011010000" and pixel_i < "0100010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0110010000" and pixel_i < "0111010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1001010000" and pixel_i < "1010010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
			
		  elsif pixel_i > "0100010000" and pixel_i < "0101010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0111010000" and pixel_i < "1000010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1010010000" and pixel_i < "1011010001" then
            rgb_o  <= "000000001111";   -- blue 1, others 0
		  end if;
		  
		-- r-g-b line 4
		elsif line_i > "0111010010" and line_i < "1000000011" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "0101010000" and pixel_i < "0110010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "1000010000" and pixel_i < "1001010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
		  elsif pixel_i > "1011010000" and pixel_i < "1100010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0 
			
		  elsif pixel_i > "0011010000" and pixel_i < "0100010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0110010000" and pixel_i < "0111010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1001010000" and pixel_i < "1010010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
			
		  elsif pixel_i > "0100010000" and pixel_i < "0101010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0111010000" and pixel_i < "1000010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1010010000" and pixel_i < "1011010001" then
            rgb_o  <= "000000001111";   -- blue 1, others 0
		  end if;
		
		-- g-b-r line 1 
		  elsif line_i > "0001010010" and line_i < "0010000011" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0101010000" and pixel_i < "0110010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1000010000" and pixel_i < "1001010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1011010000" and pixel_i < "1100010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
			
		  elsif pixel_i > "0011010000" and pixel_i < "0100010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0110010000" and pixel_i < "0111010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1001010000" and pixel_i < "1010010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
			
		  elsif pixel_i > "0100010000" and pixel_i < "0101010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0111010000" and pixel_i < "1000010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "1010010000" and pixel_i < "1011010001" then
            rgb_o  <= "111100000000";   -- red 1, others 0
		  end if;
		
        -- g-b-r line 2		
		elsif line_i > "0011100010" and line_i < "0100010011" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0101010000" and pixel_i < "0110010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1000010000" and pixel_i < "1001010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1011010000" and pixel_i < "1100010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
			
		  elsif pixel_i > "0011010000" and pixel_i < "0100010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0110010000" and pixel_i < "0111010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1001010000" and pixel_i < "1010010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
			
		  elsif pixel_i > "0100010000" and pixel_i < "0101010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0111010000" and pixel_i < "1000010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "1010010000" and pixel_i < "1011010001" then
            rgb_o  <= "111100000000";   -- red 1, others 0
		  end if;
		
		-- g-b-r line 3
        elsif line_i > "0101110010" and line_i < "0110100011" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0101010000" and pixel_i < "0110010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1000010000" and pixel_i < "1001010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1011010000" and pixel_i < "1100010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
			
		  elsif pixel_i > "0011010000" and pixel_i < "0100010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "0110010000" and pixel_i < "0111010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
		  elsif pixel_i > "1001010000" and pixel_i < "1010010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0
			
		  elsif pixel_i > "0100010000" and pixel_i < "0101010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0111010000" and pixel_i < "1000010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "1010010000" and pixel_i < "1011010001" then
            rgb_o  <= "111100000000";   -- red 1, others 0
		  end if;
		
		-- b-r-g line 1
		elsif line_i > "0010000010" and line_i < "0010110011" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "000000001111";   -- blue 1, others 0 
		  elsif pixel_i > "0101010000" and pixel_i < "0110010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0 
		  elsif pixel_i > "1000010000" and pixel_i < "1001010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0 
		  elsif pixel_i > "1011010000" and pixel_i < "1100010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0 
			
		  elsif pixel_i > "0011010000" and pixel_i < "0100010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0110010000" and pixel_i < "0111010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "1001010000" and pixel_i < "1010010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
			
		  elsif pixel_i > "0100010000" and pixel_i < "0101010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0111010000" and pixel_i < "1000010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1010010000" and pixel_i < "1011010001" then
            rgb_o  <= "000011110000";   -- green 1, others 0
		  end if;
		
		-- b-r-g line 2
		elsif line_i > "0100010010" and line_i < "0101000011" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "000000001111";   -- blue 1, others 0 
		  elsif pixel_i > "0101010000" and pixel_i < "0110010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0 
		  elsif pixel_i > "1000010000" and pixel_i < "1001010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0 
		  elsif pixel_i > "1011010000" and pixel_i < "1100010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0 
			
		  elsif pixel_i > "0011010000" and pixel_i < "0100010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0110010000" and pixel_i < "0111010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "1001010000" and pixel_i < "1010010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
			
		  elsif pixel_i > "0100010000" and pixel_i < "0101010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0111010000" and pixel_i < "1000010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1010010000" and pixel_i < "1011010001" then
            rgb_o  <= "000011110000";   -- green 1, others 0
		  end if;
		
		-- b-r-g line 3
		elsif line_i > "0110100010" and line_i < "0111010011" then
		  if pixel_i > "0001110000" and pixel_i < "0010110001" then
		    rgb_o  <= "000000001111";   -- blue 1, others 0 
		  elsif pixel_i > "0101010000" and pixel_i < "0110010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0 
		  elsif pixel_i > "1000010000" and pixel_i < "1001010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0 
		  elsif pixel_i > "1011010000" and pixel_i < "1100010001" then
			rgb_o  <= "000000001111";   -- blue 1, others 0 
			
		  elsif pixel_i > "0011010000" and pixel_i < "0100010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "0110010000" and pixel_i < "0111010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
		  elsif pixel_i > "1001010000" and pixel_i < "1010010001" then
			rgb_o  <= "111100000000";   -- red 1, others 0
			
		  elsif pixel_i > "0100010000" and pixel_i < "0101010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "0111010000" and pixel_i < "1000010001" then
			rgb_o  <= "000011110000";   -- green 1, others 0
		  elsif pixel_i > "1010010000" and pixel_i < "1011010001" then
            rgb_o  <= "000011110000";   -- green 1, others 0
		  end if;
		  
		end if;	
	  end if;
	end process p_generate;
end rtl;