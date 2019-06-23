-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- Luís Henrique Beltrão Santana
-- RA906867-UTFPR
-- 20190404

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
	port(	
		clk,rst: in std_logic;
		rx: in std_logic;
		tx: out std_logic;
		leds: out std_logic_vector(7 downto 0);
		test_led: out std_logic
	);
end entity;

architecture behave of top is
-------------------------------------------------------- Declaração dos componentes 
	 component nios is
        port (
            clk_clk                        : in  std_logic                   ; -- clk
            led_external_connection_export : out std_logic_vector(7 downto 0);        -- export
            rs232_external_connection_rxd  : in  std_logic                    := 'X'; -- rxd
            rs232_external_connection_txd  : out std_logic                          ;  -- txd
				writedata_external_connection_in_port   : in  std_logic_vector(7 downto 0) := (others => 'X'); -- in_port
            writedata_external_connection_out_port  : out std_logic_vector(7 downto 0);                    -- out_port
            readdata_external_connection_1_in_port  : in  std_logic_vector(7 downto 0) := (others => 'X'); -- in_port
            readdata_external_connection_1_out_port : out std_logic_vector(7 downto 0);                    -- out_port
            command_external_connection_in_port     : in  std_logic_vector(2 downto 0) := (others => 'X'); -- in_port
            command_external_connection_out_port    : out std_logic_vector(2 downto 0)                     -- out_port
        );
    end component nios;

---------------------------------------------------------  Início declaração dos sinais

	--Sinais cont_9bits
	--signal fifo_clk: std_logic; -- saída 1 do divisor

	
	--Sinais counter_01
	signal command_in: std_logic_vector(2 downto 0); -- saída 1 do divisor
	signal command_out: std_logic_vector(2 downto 0); -- saída 1 do divisor
	signal writedata_in: std_logic_vector(7 downto 0); -- saída 1 do divisor
	signal writedata_out: std_logic_vector(7 downto 0); -- saída 1 do divisor
	signal readdata_in: std_logic_vector(7 downto 0); -- saída 1 do divisor
	signal readdata_out: std_logic_vector(7 downto 0); -- saída 1 do divisor
	
	begin
	
--------------------------------------------------------  PortMap dos componentes
---------	Adicionar counter_8bits e counter_01
  u0 :  nios
        port map (
            clk_clk                        => clk,                        --                      clk.clk
            led_external_connection_export => leds, --  led_external_connection.export
            rs232_external_connection_rxd  => rx,  -- rs232_external_connection.rxd
            rs232_external_connection_txd  => tx,   --                          .txd
				writedata_external_connection_in_port   => writedata_in,   --  writedata_external_connection.in_port
            writedata_external_connection_out_port  => writedata_out,  --                               .out_port
            readdata_external_connection_1_in_port  => readdata_in,  -- readdata_external_connection_1.in_port
            readdata_external_connection_1_out_port => readdata_out, --                               .out_port
            command_external_connection_in_port     => command_in,     --    command_external_connection.in_port
            command_external_connection_out_port    => command_out     --                               .out_port
        );
	
process (rst, clk) ------------------------------------------ PROCESSO
	
	begin --Process code
	
	--if rst = '1' then
	
	if clk' event and clk = '1' then
		
		--test_led <= writedata_out(1); -- 7 ok
		
		--Teste: Envia ReadData
		
		
		if command_out > "000" then
		
			test_led <= '0';
			
			readdata_in <= "11001100";
		
		end if;
		
	end if;
end process;
end architecture;