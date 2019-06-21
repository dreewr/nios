-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- LuÃ­s Henrique BeltrÃ£o Santana
-- RA906867-UTFPR
-- 20190404

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.conv_std_logic_vector;
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
	process (input)
	
	variable cont_1: integer range 0 to 99 := 0;
	variable cont_0: integer range 0 to 99 := 0;
	variable i: integer range 0 to 9 := 0;
	
		begin
		
		for i in 0 to 7 loop
			if input(i) = '1' then
				cont_1 := cont_1 + 1;
			else 
				cont_0 := cont_0 + 1;
			end if;
		end loop;	
		
		--Corrigir isso aqui pra fazer sentido
		output_0 <= conv_std_logic_vector(cont_0, output_0'length);
		output_1 <= conv_std_logic_vector(cont_1, output_1'length);

	end process;
end architecture;

