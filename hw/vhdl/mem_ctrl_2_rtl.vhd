-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         mem_ctrl_2
--
-- FILENAME:       mem_ctrl_2_rtl.vhd
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
-- DESCRIPTION:    This is the architecture rtl of the mem_ctrl_2 
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

architecture rtl of mem_ctrl_2 is

component rom2 is
  port(
    clka  : in  std_logic;                     -- ROM clock
	ena   : in  std_logic;                     -- ROM enable
    addra : in  std_logic_vector(13 downto 0); -- ROM address
    douta : out std_logic_vector(11 downto 0)  -- ROM data outputs
    );
end component;

  signal s_clk_count : unsigned(1 downto 0);
  signal s_addr_buff : unsigned (13 downto 0);
  signal s_rom_addr  : std_logic_vector(13 downto 0) := "00000000000000"; 
  signal s_rom_dout  : std_logic_vector(11 downto 0);
  signal s_count     : unsigned(13 downto 0)         := "00000000000001";
  signal s_beg_buff  : unsigned(9 downto 0);
  signal s_end_buff  : unsigned(9 downto 0);

begin
  p_memory : process(enable_25M_i, reset_i)
    begin
	  if enable_25M_i 'event and enable_25M_i = '1' then  
        if reset_i = '1' then
          rgb_o      <= "000000000000";   -- all colors 0
		  s_rom_addr <= "00000000000000";
		  s_count    <= "00000000000001";
	  
	    else
		  -- fix timing
		  s_beg_buff <= unsigned(pixel_beg_i) - "0000000001";
		  s_end_buff <= unsigned(pixel_end_i) - "0000000001";
		  
		  if line_i > line_beg_i and line_i < line_end_i then 
		    if pixel_i = std_logic_vector(s_beg_buff) then
			  -- first pixel 
			  s_rom_addr <= "00000000000000";
			end if;
		    if pixel_i > std_logic_vector(s_beg_buff) then
			  if pixel_i < std_logic_vector(s_end_buff) then 
			    s_count <= s_count + "00000000000001";
			    s_rom_addr <= std_logic_vector(s_count);
			    rgb_o      <= s_rom_dout;
			  else
			    rgb_o   <= "000000000000";
		      end if;
		    else 
		      rgb_o   <= "000000000000";
		    end if;
		  else 
		    rgb_o   <= "000000000000";
			s_count <= "00000000000001";
		  end if;		
	    end if;
	  end if;
	end process p_memory;

  -- instantiate ROM2
  i_rom2 : rom2
    port map
	(clka  => clk_i,
	 ena   => enable_25M_i,
     addra => s_rom_addr,
     douta => s_rom_dout
    );

end rtl;