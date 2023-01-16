-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         VGA_ctrl_top
--
-- FILENAME:       VGA_ctrl_top_.vhd
-- 
-- ARCHITECTURE:   struc
-- 
-- ENGINEER:       Sarah Fröler
--
-- DATE:           16. January 2023
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the entity declaration of the VGA_ctrl_top of the
--                 VGA Controller VHDL project.
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
																				
entity VGA_ctrl_top is
  port (clk_i     :  in  std_logic;                      -- system clock
        reset_i   :  in  std_logic;                      -- reset
        sw_i      :  in  std_logic_vector(15 downto 0);  -- connection switches
        pb_i      :  in  std_logic_vector(3 downto 0);   -- connection buttons
        h_sync_o  :  out  std_logic;                     -- h_sync for monitor
        v_sync_o  :  out  std_logic;                     -- v_sync for monitor
		rgb_o     :  out  std_logic_vector(11 downto 0)  -- rgb output
		);
end VGA_ctrl_top;

