-- AndrÃ© Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- LuÃƒÂ­s Henrique BeltrÃƒÂ£o Santana
-- RA906867-UTFPR
-- 20190404

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade que o professor desenhou quinta e que tem aquele comportamento 'gambiarrado'

entity control_register is
	port(
		clk, rst, rd, wr: in std_logic;
		write_data: in std_logic_vector(7 downto 0);
		read_data: out std_logic_vector(7 downto 0)   --seria a saída Q do flip_flop
	);
end entity;

architecture behave of control_register is
	--signal aux: integer range 0 to 255 := 0;
	--signal n: std_logic_vector(7 downto 0);
	begin
	process(clk, rst)
	begin
		if rst = '1' then
			--Código
		elsif clk' event and clk = '1' then --and  en = '1' 
			
			--Código a cada pulso de clock

		end if;
		
	end process;
end architecture;