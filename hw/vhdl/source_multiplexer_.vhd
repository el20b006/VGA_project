-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         source_multiplexer
--
-- FILENAME:       source_multiplexer_.vhd
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
-- DESCRIPTION:    This is the entity declaration of the source_multiplexer
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
																				
entity source_multiplexer is
  port (clk_i       : in  std_logic;                      -- system clock
        reset_i	    : in  std_logic;                      -- reset
        swsync_i    : in  std_logic_vector(15 downto 0);  -- switches
        pbsync_i    : in  std_logic_vector(3 downto 0);   -- buttons
		pixel_i     : in  std_logic_vector(9 downto 0);   -- pixel counter
        line_i      : in  std_logic_vector(9 downto 0);   -- line counter
        pat1_rgb_i  : in  std_logic_vector(11 downto 0);  -- rgb values
        pat2_rgb_i  : in  std_logic_vector(11 downto 0);  -- rgb values
        mem1_rgb_i  : in  std_logic_vector(11 downto 0);  -- rgb values
        mem2_rgb_i  : in  std_logic_vector(11 downto 0);  -- rgb values
        rgb_o       : out std_logic_vector(11 downto 0);  -- rgb output
		line_beg_o  : out std_logic_vector(9 downto 0);   -- 1st line move
		line_end_o  : out std_logic_vector(9 downto 0);   -- last line move	
        pixel_beg_o : out std_logic_vector(9 downto 0);   -- 1st pixel move
        pixel_end_o : out std_logic_vector(9 downto 0)    -- last pixel move
        );																		
end source_multiplexer;