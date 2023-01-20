-------------------------------------------------------------------------------
--                                                                      
--                        VGA Controller VHDL Project
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         mem_ctrl_1
--
-- FILENAME:       mem_ctrl_1_rtl.vhd
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
-- DESCRIPTION:    This is the architecture rtl of the mem_ctrl_1 
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

architecture rtl of mem_ctrl_1 is

component rom1 is
  port(
    clka  : in  std_logic; -- ROM clock
    addra : in  std_logic_vector(16 downto 0);  -- ROM address
    douta : out std_logic_vector(11 downto 0)    -- ROM data outputs
    );
end component;

  signal s_clk_50M    : std_logic;
  signal s_clk_count  : unsigned(1 downto 0);
  signal s_rom_addr   : std_logic_vector(16 downto 0); 
  signal s_rom_dout   : std_logic_vector(11 downto 0);
  signal s_count1     : unsigned(16 downto 0)  := "00000000000000000";  
  signal s_count2     : unsigned(16 downto 0)  := "00000000000000000";
  signal s_count3     : unsigned(16 downto 0)  := "00000000000000000";
  signal s_count4     : unsigned(16 downto 0)  := "00000000000000000";
  signal s_pic_add_1  : unsigned(16 downto 0)  := "00000000000000001";

begin
  
  p_mem_clk : process(clk_i, reset_i)
    begin
	  if reset_i = '1' then
	    s_clk_50M <= '0';
	  elsif clk_i 'event and clk_i = '1' then
	    if s_clk_count = "00" or s_clk_count = "01" then
		  s_clk_50M   <= '1';
		  s_clk_count <= s_clk_count + "01";
		elsif s_clk_count = "10" then
		  s_clk_50M   <= '0';
		  s_clk_count <= s_clk_count + "01";
		elsif s_clk_count = "11" then
		  s_clk_50M   <= '0';
		  s_clk_count <= "00";
		end if;
	  end if;
	end process;
		
  p_memory : process(clk_i, reset_i)
    begin
      if reset_i = '1' then
        rgb_o       <= "000000000000";   -- all colors 0
		s_rom_addr  <= "00000000000000000";
		s_count1    <= "00000000000000000";
		s_count2    <= "00000000000000000";
		s_count3    <= "00000000000000000";
		s_count4    <= "00000000000000000";
	
	  elsif clk_i 'event and clk_i = '1' then
		if enable_25M_i = '1' then
		  if line_i > "0000100010" and line_i < "0100010011" then
		  -- pictures on top half
		    if pixel_i > "0010001111" and pixel_i < "0111010000" then 
			  -- picture 1
		      s_rom_addr <= std_logic_vector(s_count1); 
			  s_count1   <= s_count1 + s_pic_add_1;
		    elsif pixel_i > "0111001111" and pixel_i < "1100010000" then
			  -- picture 2
		      s_rom_addr <= std_logic_vector(s_count2);
			  s_count2   <= s_count2 + s_pic_add_1;
		    end if;
	
		  elsif line_i > "0100010010" and line_i < "1000000011" then
		    -- pictures on bottom half
		    if pixel_i > "0010001111" and pixel_i < "0111010000" then
			  -- picture 3
		      s_rom_addr <= std_logic_vector(s_count3);
			  s_count3   <= s_count3 + s_pic_add_1;
		    elsif pixel_i > "0111001111" and pixel_i < "1100010000" then
		      -- picture 4
			  s_rom_addr <= std_logic_vector(s_count4);
			  s_count4   <= s_count4 + s_pic_add_1;
            end if;
		  end if;
		end if;
		
		if s_count1 > "10010101111111111" then
		  s_count1 <= "00000000000000000";
		end if;
		  
		if s_count2 > "10010101111111111" then
		  s_count2 <= "00000000000000000";
		end if;
		  
		if s_count3 > "10010101111111111" then
		  s_count3 <= "00000000000000000";
		end if;
		  
		if s_count4 > "10010101111111111" then
		  s_count4 <= "00000000000000000";
		end if;
		
		if line_i < "0000100011" or line_i > "1000000010" then 
		  rgb_o   <= "000000000000";
	    elsif pixel_i < "0010010000" or pixel_i > "1100001111" then
		  rgb_o   <= "000000000000"; 
		else 
          rgb_o <= s_rom_dout; 		
		end if;
		
	  end if;
	end process p_memory;
	
  -- instantiate ROM1
  i_rom1 : rom1
    port map
	(clka  => s_clk_50M,
     addra => s_rom_addr,
     douta => s_rom_dout
    );
	
end rtl;