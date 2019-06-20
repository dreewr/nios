    
-- Andre Luiz Rodrigues dos Santos RA1500759
-- Luis Henrique Beltrao Santana RA906867
-- 20190314

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity StateController2_tb is
end entity;

architecture behave of StateController2_tb is

--Declaração dos componentes --
	component StateController2 is 
				port
				(
					rst: in std_logic;
					cnt: in std_logic_vector(8 downto 0);
					wr_en, rd_en: out std_logic;
					wr_w, wr_f: out std_logic;
					rd_w, rd_f: out std_logic;
					bp: out std_logic
				);
			end component;
	
--Início declaração dos sinais

	signal rst_tb: std_logic:='1'; 
	signal wr_en_tb, rd_en_tb: std_logic:='0'; 
	signal wr_wait_tb, rd_wait_tb: std_logic:='0'; 
	signal wr_fifo_tb, rd_fifo_tb: std_logic:='0'; 
	signal cnt_tb:  std_logic_vector(8 downto 0):= "000000000"; 
	signal bp_tb: std_logic:='0'; 
--Término declaração dos sinais	
	begin
	
--PortMap dos componentes

	uut: StateController2
		port map(
		wr_en => wr_en_tb,
		rd_en => rd_en_tb,
		cnt => cnt_tb, 
		rst => rst_tb,
		wr_w => wr_wait_tb,
		wr_f => wr_fifo_tb,
		rd_w => rd_wait_tb,
		rd_f => rd_fifo_tb,
		bp => bp_tb
		); 
	
	process
	variable var_cnt_tb:  std_logic_vector(8 downto 0):= "000000000";
	begin 

	rst_tb <= '1';
	wait for 1ns;
	rst_tb <= '0';
	
	cnt_tb <= "000000000";
	for I in 0 to 1000 loop	
		
		cnt_tb <= var_cnt_tb;
		var_cnt_tb := std_logic_vector( unsigned(var_cnt_tb) + 10); 
		wait for 1ns;
		
	end loop;
	
	wait;
	end process;
	
end architecture;