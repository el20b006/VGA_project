-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         mem_ctrl_1
--
-- FILENAME:       mem_ctrl_1_rtl.vhd
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
-- DESCRIPTION:    This is the architecture rtl of the mem_ctrl_1 
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

architecture rtl of mem_ctrl_1 is


begin
  p_memory : process(clk_i, reset_i)
    begin
      if reset_i = '1' then
        rgb_o  <= "000000000000";   -- all colors 0
	
	  elsif clk_i 'event and clk_i = '1' then
	    if line_i < "0000100011" or line_i > "1000000010" then
		  rgb_o   <= "000000000000";
		  
	    elsif pixel_i < "0010010000" or pixel_i > "1100001111" then
		  rgb_o   <= "000000000000"; 
		  
		elsif line_i > "0000100010" and line_i < "0100010001" 
		  -- pictures on top half
		  if pixel_i > "0010001111" and pixel_i < "0111001111" then
		    -- picture 1
		  elsif pixel_i > "0111001110" and pixel_i < "1100001110" then
		    -- picture 2
		  end if;
		
		elsif line_i > "0100010010" and line_i < "1100001110" then
		  -- pictures on bottom half
		  if pixel_i > "0010001111" and pixel_i < "0111001111" then
		    -- picture 1
		  elsif pixel_i > "0111001110" and pixel_i < "1100001110" then
		    -- picture 2
		  end if;
		end if;
	  end if;
	end process;
end rtl;