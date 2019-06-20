-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- LuÃ­s Henrique BeltrÃ£o Santana
-- RA906867-UTFPR
-- 20190404

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity user_hardware is
	port(
		--test_led, test_led2: out std_logic;
		load: in std_logic_vector(7 downto 0); 	
		clk, rst: in std_logic;
		reg_0, reg_1: out std_logic_vector(7 downto 0)
	);
end entity;

architecture behave of user_hardware is

-------------------------------------------------------- Declaração dos componentes 

	component control_register is
		generic(n: natural :=16);
		port(
			clk, rst: in std_logic; 
			rd, wr, cs: in std_logic;
			write_data: in std_logic_vector(n-1 downto 0);
			read_data: out std_logic_vector(n-1 downto 0);
			q: out std_logic_vector(n-1 downto 0) 		
		);
	end component;

---------------------------------------------------------  Início declaração dos sinais

	--Sinais cont_9bits
	--signal fifo_clk: std_logic; -- saída 1 do divisor

	
	--Sinais counter_01
	--signal init_ram_clk: std_logic; -- saída 1 do divisor
	
	begin
	
--------------------------------------------------------  PortMap dos componentes
---------	Adicionar counter_8bits e counter_01

		--blank_ram: blankRam
		--port map(
		--clock			=> blank_ram_clk,
		--data			=> blank_ram_input,
		--	rdaddress	=> blank_ram_rdaddress,    -- 10bits
		--rden			=> blank_ram_rden,
		--wraddress	=> blank_ram_wraddress, --posso mapear direto pra saida do top-level
		--wren			=> blank_ram_wren,
		--q				=> blank_ram_output --test_output
		--);
	
	process (rst, clk)
	
	begin --Process code
	
	if rst = '1' then
	--Código de reset
	
	elsif clk' event and clk = '1' then
		
	end if;
	end process;
end architecture;