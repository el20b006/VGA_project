-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         io_ctrl
--
-- FILENAME:       io_ctrl_rtl.vhd
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
-- DESCRIPTION:    This is the architecture rtl of the source_multiplexer 
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

architecture rtl of source_multiplexer is
  type   t_state is (IDLE_S, PATTERN1_S, PATTERN2_S, MEMORY1_S, MEMORY2_S);
  signal s_state : t_state;      
	  
begin
  p_muliplex : process(reset_i, clk_i)
    begin
      if reset_i = '1' then
        rgb_o    <= "000000000000";
        s_state  <= IDLE_S;
      elsif clk_i 'event and clk_i = '1' then
        case s_state is
          when IDLE_S =>
            if swsync_i(2) = '1' then
              s_state  <= MEMORY2_S;
            elsif swsync_i(0) = '1' then
              s_state  <= MEMORY1_S;
			elsif swsync_i(2 downto 0) = "000" then
              s_state  <= PATTERN1_S;
            elsif swsync_i(2 downto 0) = "010" then
              s_state <= PATTERN2_S;
            end if;
					
          when PATTERN1_S =>
            rgb_o  <= pat1_rgb_i;
            if swsync_i(2) = '1' then
              s_state  <= MEMORY2_S;
            elsif swsync_i(0) = '1' then
              s_state  <= MEMORY1_S;
			elsif swsync_i(2 downto 0) = "000" then
              s_state  <= PATTERN1_S;
            elsif swsync_i(2 downto 0) = "010" then
              s_state <= PATTERN2_S;
            end if;
				
          when PATTERN2_S =>
            rgb_o  <= pat2_rgb_i;
            if swsync_i(2) = '1' then
              s_state  <= MEMORY2_S;
            elsif swsync_i(0) = '1' then
              s_state  <= MEMORY1_S;
			elsif swsync_i(2 downto 0) = "000" then
              s_state  <= PATTERN1_S;
            elsif swsync_i(2 downto 0) = "010" then
              s_state <= PATTERN2_S;
			end if;
				
          when MEMORY1_S =>
            rgb_o  <= mem1_rgb_i;
            if swsync_i(2) = '1' then
              s_state  <= MEMORY2_S;
            elsif swsync_i(0) = '1' then
              s_state  <= MEMORY1_S;
			elsif swsync_i(2 downto 0) = "000" then
              s_state  <= PATTERN1_S;
            elsif swsync_i(2 downto 0) = "010" then
              s_state <= PATTERN2_S;
			end if;
				
          when MEMORY2_S =>
			-- movable object???
							
            if swsync_i(2) = '1' then
              s_state  <= MEMORY2_S;
            elsif swsync_i(0) = '1' then
              s_state  <= MEMORY1_S;
			elsif swsync_i(2 downto 0) = "000" then
              s_state  <= PATTERN1_S;
            elsif swsync_i(2 downto 0) = "010" then
              s_state <= PATTERN2_S;
            end if;
					
        end case;
      end if;
	end process;
end rtl;