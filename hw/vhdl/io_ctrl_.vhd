-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         io_ctrl
--
-- FILENAME:       io_ctrl_.vhd
-- 
-- ARCHITECTURE:   rtl
-- 
-- ENGINEER:       Sarah Fr�ler
--
-- DATE:           21. November 2022
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the entity declaration of the io_ctrl submodule
--                 of the VGA Controller VHDL project.
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

entity io_ctrl is
  port (clk_i    :  in  std_logic;                      -- system clock
        reset_i  :  in  std_logic;                      -- reset
        sw_i     :  in  std_logic_vector(15 downto 0);  -- switch 0-15
        pb_i     :  in  std_logic_vector(3 downto 0);   -- button 0-3
        swsync_o :  out std_logic_vector(15 downto 0);  -- debounced switches
        pbsync_o :  out std_logic_vector(3 downto 0)    -- debounced buttons
       );
end io_ctrl;

