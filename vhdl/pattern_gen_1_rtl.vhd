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
        if line_i < "0000001101" or line_i > "0111101100" then
		  rgb_o <= "000000000000";
		elsif pixel_i < "0000111001" or pixel_i > "1011110000" then
		  rgb_o <= "000000000000";
		  
		elsif pixel_i > "0011101000" and pixel_i < "0100010001" then
		  rgb_o <= "000000000000";   -- all colors 0
		elsif pixel_i > "0110001000" and pixel_i < "0110110001" then
		  rgb_o <= "000000000000";   -- all colors 0
		elsif pixel_i > "1000101000" and pixel_i < "1001010001" then
		  rgb_o <= "000000000000";   -- all colors 0
		elsif pixel_i > "1011001000" and pixel_i < "1011110001" then
		  rgb_o <= "000000000000";   -- all colors 0 
			   
		elsif pixel_i > "0001110000" and pixel_i < "0010011001" then
          rgb_o <= "111100000000";   -- red 1, others 0 
		elsif pixel_i > "0100010000" and pixel_i < "0100111001" then 
		  rgb_o <= "111100000000";   -- red 1, others 0 
		elsif pixel_i > "0110110000" and pixel_i < "0111011001" then
		  rgb_o <= "111100000000";   -- red 1, others 0 
		elsif pixel_i > "1001010000" and pixel_i < "1001111001" then
		  rgb_o <= "111100000000";   -- red 1, others 0 
			  
		elsif pixel_i > "0010011000" and pixel_i < "0011000001" then
		  rgb_o <= "000011110000";   -- green 1, others 0 
		elsif pixel_i > "0100111000" and pixel_i < "0101100001" then
		  rgb_o <= "000011110000";   -- green 1, others 0 
		elsif pixel_i > "0111011000" and pixel_i < "1000000001" then
		  rgb_o <= "000011110000";   -- green 1, others 0 
		elsif pixel_i > "1001111000" and pixel_i < "1010100001" then
		  rgb_o <= "000011110000";   -- green 1, others 0 
			  
		elsif pixel_i > "0011000000" and pixel_i < "0011101001" then		
          rgb_o <= "000000001111";   -- blue 1, others 0
		elsif pixel_i > "0101100000" and pixel_i < "0110001001" then
		  rgb_o <= "000000001111";   -- blue 1, others 0
		elsif pixel_i > "1000000000" and pixel_i < "1000101001" then		
          rgb_o <= "000000001111";   -- blue 1, others 0
		elsif pixel_i > "1010100000" and pixel_i < "1011001001" then
		  rgb_o <= "000000001111";   -- blue 1, others 0   
		end if;				
	  end if;
    end process;
end rtl;