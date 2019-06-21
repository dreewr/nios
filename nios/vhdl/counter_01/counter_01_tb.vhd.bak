-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- Luís Henrique Beltrão Santana
-- RA906867-UTFPR
-- 20190328

library ieee;
use ieee.std_logic_1164.all;

entity counter8b_tb is
end;

architecture test of counter8b_tb is
	component counter8b
		port(
		clk, rst, en: in std_logic;
		output: out std_logic_vector(7 downto 0);
		carry: out std_logic
	);
	end component;
	
	signal clock, reset, enable: std_logic;
	signal s_output, crr: std_logic;
	begin
		dect: counter4b port map(
			clk => clock,
			rst => reset,
			en =>  enable,
			carry => crr,
			output => s_output
		);
	process
	begin
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --1
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --2
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --3
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --4
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --5
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --6
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --7
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --8
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --9
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --0
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --1
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '1';
		wait for 50 ns; --0
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --1
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --2
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --3
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --4
	end process;
end architecture;