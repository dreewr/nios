-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- LuÃ­s Henrique BeltrÃ£o Santana
-- RA906867-UTFPR
-- 20190404

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--           ┌───────┐
--    clk ───┤   c   │
--           │   o   │
--           │   u   ├─── carry
--           │   n   │
--    rst ───┤   t   │
--           │   e   │
--           │   r   ▐███ output
--           │   8   │
--  carry ───┤   b   │
--           └───────┘

entity counter8b is
	port(
		clk, rst, en: in std_logic;
		output: out std_logic_vector(7 downto 0);
		carry: out std_logic
	);
end entity;

architecture behave of counter8b is
	signal aux: integer range 0 to 255 := 0;
	signal n: std_logic_vector(7 downto 0);
	begin
	process(clk, rst)
	begin
		if rst = '1' then
			aux <= 0;
			carry <= '0';
		elsif clk' event and clk = '1' and  en = '1' then
			if aux = 255 then
				aux <= 0;
				carry <= '1';
			else
				carry <= '0';
				aux <= aux + 1;
			end if;
		end if;
		n <= std_logic_vector(to_unsigned(aux,8));
		output <= n;
	end process;
end architecture;