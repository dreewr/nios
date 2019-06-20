-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- Luís Henrique Beltrão Santana
-- RA906867-UTFPR
-- 20190328

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_01_tb is
end;

architecture test of counter_01_tb is
	component counter_01
	port(
		--clk, rst, en: in std_logic;
		input: in std_logic_vector(7 downto 0);
		output_0: out std_logic_vector(7 downto 0); --
		output_1: out std_logic_vector(7 downto 0) --
	);
	end component;
	
	signal input_tb, output_0_tb, output_1_tb: std_logic_vector(7 downto 0):= "00000000";

	begin
		dect: counter_01 port map(
		input => input_tb,
		output_0 => output_0_tb,
		output_1 => output_1_tb
		);
	process
	begin
	
		for I in 0 to 100 loop	
		input_tb <= std_logic_vector( unsigned(input_tb) + 1 ); 
		wait for 1ns;
	
	end loop;
	end process;
end architecture;