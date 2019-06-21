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
		clk, rst: in std_logic;
		nios_cs, nios_wr, nios_rd: in std_logic;  
		nios_write_data: in std_logic_vector(7 downto 0);
		nios_read_data: out std_logic_vector(7 downto 0)
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

	component counter8b is
		port(
		clk, rst, en: in std_logic;
		output: out std_logic_vector(7 downto 0);
		carry: out std_logic
	);
	end component;
	
	component counter_01 is
		port(
		input: in std_logic_vector(7 downto 0);
		output_0: out std_logic_vector(7 downto 0); 
		output_1: out std_logic_vector(7 downto 0) 
	);
	end component;

---------------------------------------------------------  Início declaração dos sinais

	--Sinais cont_9bits
	--signal fifo_clk: std_logic; -- saída 1 do divisor

	
	--Sinais cont_reg
	signal gnd: std_logic:='X'; -- saída 1 do divisor
	signal gnd8: std_logic_vector(7 downto 0); -- saída 1 do divisor
	signal gnd16: std_logic_vector(15 downto 0); -- saída 1 do divisor
	
	begin
	
--------------------------------------------------------  PortMap dos componentes
---------	Adicionar counter_8bits e counter_01

		cont_reg: control_register
		port map(
		clk			=> clk,
		rst			=> rst,
		rd				=> gnd,    -- 10bits
		wr				=> gnd,
		cs				=> gnd, --posso mapear direto pra saida do top-level
		write_data	=> gnd16,
		read_data	=> gnd16, --test_output
		q 				=> gnd16
		);
	
		cont_8b: counter8b
		port map(
		clk				=> clk,
		rst				=> rst,
		en					=> gnd,    -- 10bits
		output			=> gnd8,
		carry				=> gnd
		);
	
		cont_01: counter_01
		port map(
		input				=> gnd8,
		output_0			=> gnd8,
		output_1				=> gnd8    -- 10bits
		);
	
	process (rst, clk)
	
	begin --Process code
	
	if rst = '1' then
	--Código de reset
	
	elsif clk' event and clk = '1' then
		
	end if;
	
	
	end process;
	
end architecture;