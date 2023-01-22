-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         pattern_gen_1
--
-- FILENAME:       pattern_gen_1_rtl.vhd
-- 
-- ARCHITECTURE:   rtl
-- 
-- ENGINEER:       Sarah Fröler
--
-- DATE:           21. November 2022
--
-- VERSION:        1.0
--
--                                                                      
-- DESCRIPTION:    This is the architecture rtl of the pattern_gen_1 
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

architecture rtl of pattern_gen_1 is 

begin
  p_generate : process (clk_i, reset_i)
    begin
      if reset_i = '1' then
        rgb_o   <= "000000000000";   -- all colors 0

      elsif clk_i 'event and clk_i = '1' then	
        if line_i < "0000100011" or line_i > "1000000010" then  
		  rgb_o <= "000000000000";
		elsif pixel_i < "0010010000" or pixel_i > "1011100111" then 
		  rgb_o <= "000000000000";
		  
		elsif pixel_i > "0100000111" and pixel_i < "0100110000" then
		  rgb_o <= "000000000000";   -- all colors 0
		elsif pixel_i > "0110100111" and pixel_i < "0111010000" then
		  rgb_o <= "000000000000";   -- all colors 0
		elsif pixel_i > "1001000111" and pixel_i < "1001110000" then
		  rgb_o <= "000000000000";   -- all colors 0
			   
		elsif pixel_i > "0010001111" and pixel_i < "0010111000" then
          rgb_o <= "111100000000";   -- red 1, others 0 
		elsif pixel_i > "0100101111" and pixel_i < "0101011000" then 
		  rgb_o <= "111100000000";   -- red 1, others 0 
		elsif pixel_i > "0111001111" and pixel_i < "0111111000" then
		  rgb_o <= "111100000000";   -- red 1, others 0 
		elsif pixel_i > "1001101111" and pixel_i < "1010011000" then
		  rgb_o <= "111100000000";   -- red 1, others 0 
			  
		elsif pixel_i > "0010110111" and pixel_i < "0011100000" then
		  rgb_o <= "000011110000";   -- green 1, others 0 
		elsif pixel_i > "0101010111" and pixel_i < "0110000000" then
		  rgb_o <= "000011110000";   -- green 1, others 0 
		elsif pixel_i > "0111110111" and pixel_i < "1000100000" then
		  rgb_o <= "000011110000";   -- green 1, others 0 
		elsif pixel_i > "1010010111" and pixel_i < "1011000000" then
		  rgb_o <= "000011110000";   -- green 1, others 0 
			  
		elsif pixel_i > "0011011111" and pixel_i < "0100001000" then		
          rgb_o <= "000000001111";   -- blue 1, others 0
		elsif pixel_i > "0101111111" and pixel_i < "0110101000" then
		  rgb_o <= "000000001111";   -- blue 1, others 0
		elsif pixel_i > "1000011111" and pixel_i < "1001001000" then		
          rgb_o <= "000000001111";   -- blue 1, others 0
		elsif pixel_i > "1010111111" and pixel_i < "1011101000" then
		  rgb_o <= "000000001111";   -- blue 1, others 0   
		end if;				
	  end if;
    end process p_generate;
end rtl;