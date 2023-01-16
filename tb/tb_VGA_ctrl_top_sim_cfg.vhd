-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         VGA_ctrl_top_ctrl
--
-- FILENAME:       tb_VGA_ctrl_top_sim_cfg.vhd
-- 
-- ARCHITECTURE:   sim
-- 
-- ENGINEER:       Sarah Fröler
--
-- DATE:           16. January 2022
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the configuration for the VGA_crtl_top testbench
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

configuration tb_VGA_ctrl_top_sim_cfg of tb_VGA_ctrl_top is
  for sim
    for i_VGA_ctrl_top : VGA_ctrl_top
      use configuration work.VGA_ctrl_top_struc_cfg;
    end for;
  end for;
end tb_VGA_ctrl_top_sim_cfg;
