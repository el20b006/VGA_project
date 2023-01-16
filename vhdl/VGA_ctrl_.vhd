-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         VGA_ctrl
--
-- FILENAME:       VGA_ctrl_.vhd
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
-- DESCRIPTION:    This is the entity declaration of the VGA_ctrl
--                 submodule of the VGA Controller VHDL project.
--
--
-------------------------------------------------------------------------------
--
-- REFERENCES:     (none)
--
-------------------------------------------------------------------------------
--                                                                      
-- PACKAGES:       std_logic_1164 (IEEE library)
--
-------------------------------------------------------------------------------
--                                                                      
-- CHANGES:        Version 1.0
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
																				
entity VGA_ctrl is
  port (clk_i         :  in   std_logic;                      -- system clock
        reset_i       :  in   std_logic;                      -- reset_i
        enable_25M_i  :  in   std_logic;                      -- 25M enable 
        rgb_i         :  in   std_logic_vector(11 downto 0);  -- input rgb 
        v_sync_o      :  out  std_logic;                      -- vertical sync
        h_sync_o      :  out  std_logic;                      -- horizontal sync
        pixel_o       :  out  std_logic_vector(9 downto 0);   -- pixel output
        line_o        :  out  std_logic_vector(9 downto 0);   -- pixel line  
		rgb_o         :  out  std_logic_vector(11 downto 0)  -- output rgb 
		);
end VGA_ctrl;
