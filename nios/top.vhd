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
		leds: out std_logic_vector(7 downto 0)
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
				pio_0_external_connection_export : in  std_logic_vector(7 downto 0) := (others => 'X')  -- export
        );
    end component nios;

---------------------------------------------------------  Início declaração dos sinais

	--Sinais cont_9bits
	--signal fifo_clk: std_logic; -- saída 1 do divisor

	
	--Sinais counter_01
	signal test: std_logic_vector(7 downto 0); -- saída 1 do divisor
	
	begin
	
--------------------------------------------------------  PortMap dos componentes
---------	Adicionar counter_8bits e counter_01
  u0 :  nios
        port map (
            clk_clk                        => clk,                        --                      clk.clk
            led_external_connection_export => leds, --  led_external_connection.export
            rs232_external_connection_rxd  => rx,  -- rs232_external_connection.rxd
            rs232_external_connection_txd  => tx,   --                          .txd
				pio_0_external_connection_export => test  -- pio_0_external_connection.export
        );
	
process (rst, clk) ------------------------------------------ PROCESSO
	
	begin --Process code
	
	if rst = '1' then
	--Código de reset
	
	elsif clk' event and clk = '1' then
		
	end if;
end process;
end architecture;