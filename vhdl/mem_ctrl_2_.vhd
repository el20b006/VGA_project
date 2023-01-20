-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         mem_ctrl_2
--
-- FILENAME:       mem_ctrl_2_.vhd
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
-- DESCRIPTION:    This is the entity declaration of the mem_ctrl_2
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

entity mem_ctrl_2 is
  port (clk_i         :  in   std_logic;                     -- system clock
        reset_i       :  in   std_logic;                     -- reset
		enable_25M_i  :  in   std_logic;                     -- enable 25 MHz
        pixel_i       :  in   std_logic_vector(9 downto 0);  -- pixel counter
        line_i        :  in   std_logic_vector(9 downto 0);  -- line counter
		pixel_beg_i   :  in   std_logic_vector(9 downto 0);
		pixel_end_i   :  in   std_logic_vector(9 downto 0);
		line_beg_i    :  in   std_logic_vector(9 downto 0);
		line_end_i    :  in   std_logic_vector(9 downto 0);
        rgb_o         :  out  std_logic_vector(11 downto 0)  -- rgb output
       );
end mem_ctrl_2;