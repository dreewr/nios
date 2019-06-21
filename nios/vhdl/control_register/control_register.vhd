-- AndrÃ© Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- LuÃƒÂ­s Henrique BeltrÃƒÂ£o Santana
-- RA906867-UTFPR
-- 20190404

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity control_register is
	generic(n: natural :=16);
	port(
		clk, rst: in std_logic;
		rd, wr, cs: in std_logic;
		write_data: in std_logic_vector(n-1 downto 0);
		read_data: out std_logic_vector(n-1 downto 0);   --seria a saída Q do flip_flop
		q: out std_logic_vector(n-1 downto 0)
	);
end entity;


architecture behave of control_register is
	signal d: std_logic_vector(n-1 downto 0);
	signal cs_delay0, cs_delay1: std_logic;
	signal wr_delay0, wr_delay1: std_logic;
	
	begin
	process(clk, rst) 
	begin
		if rst = '1' then
			--resetar o resto das coisas tbm
			d <= (d'range => '0');
			
		elsif clk' event and clk = '1' then --and  en = '1' 
			cs_delay0 <= cs;
			cs_delay1 <= cs_delay0;
			wr_delay0 <= wr;
			wr_delay1 <= wr_delay0;
		
			if cs_delay1 = '1' and wr_delay1 ='1'  then
				q <= d;
			end if;

		end if;	
	end process;
	--d <= write_data;
end architecture;




