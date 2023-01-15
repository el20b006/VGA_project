-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         prescaler_ctrl
--
-- FILENAME:       prescaler_rtl.vhd
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
-- DESCRIPTION:    This is the architecture rtl of the prescaler 
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

architecture rtl of prescaler is 
  signal enable_count  :  integer  := 1;  -- counter for 25MHz enable signal
	
begin
  p_enable : process(reset_i, clk_i)     -- 25MHz enable signal
    begin
      if reset_i = '1' then
        enable_25M_o  <= '0';
        enable_count  <= 1;
      elsif clk_i 'event and clk_i = '1' then
        if enable_count = 4 then
          enable_25M_o  <= '1';
          enable_count  <= 1;
        else
          enable_25M_o  <= '0';
          enable_count  <= enable_count + 1;
        end if;
      end if;
    end process p_enable;
end rtl;