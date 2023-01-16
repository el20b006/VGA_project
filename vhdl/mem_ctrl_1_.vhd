-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         mem_ctrl_1
--
-- FILENAME:       mem_ctrl_1_.vhd
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
-- DESCRIPTION:    This is the entity declaration of the mem_ctrl_1
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

entity mem_ctrl_1 is
  port (clk_i    :  in   std_logic;                     -- system clock
        reset_i  :  in   std_logic;                     -- reset
        pixel_i  :  in   std_logic_vector(9 downto 0);  -- pixel counter
        line_i   :  in   std_logic_vector(9 downto 0);  -- line counter
        rgb_o    :  out  std_logic_vector(11 downto 0)  -- rgb output
       );
end mem_ctrl_1;