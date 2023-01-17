-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         monitor_test_top
--
-- FILENAME:       monitor_test_top_.vhd
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
-- DESCRIPTION:    This is the entity declaration of the monitor_test_top of 
--                 the VGA Controller VHDL project.
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
																				
entity vga_monitor_top is
  port (clk_i       :  in  std_logic;  -- system clock
        reset_i     :  in  std_logic;  -- reset
        enable_25M  :  in  std_logic   -- enable signal 25MHz
		);
end VGA_monitor_top;

