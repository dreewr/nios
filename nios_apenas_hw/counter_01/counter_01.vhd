-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- LuÃ­s Henrique BeltrÃ£o Santana
-- RA906867-UTFPR
-- 20190404

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Contador de 0s e 1s

entity counter_01 is
	port(
		--clk, rst, en: in std_logic;
		input: in std_logic_vector(7 downto 0);
		output_0: out std_logic_vector(7 downto 0); --
		output_1: out std_logic_vector(7 downto 0) --
	);
end entity;

architecture behave of counter_01 is

	begin
	process --(clk, rst)
	begin
		

	end process;
end architecture;


--if rst = '1' then
			
--elsif clk' event and clk = '1' then
			
--end if;