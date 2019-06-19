   module top(
	input clk,
	input rx,
	output tx,
	output [7:0]led
	);
	nios u0 (
        .clk_clk                           (clk),                           //                           clk.clk
        .led_external_connection_export    (led),    //       led_external_connection.export
        .rs232_external_connection_rxd (rx), // rs232uart_external_connection.rxd
        .rs232_external_connection_txd (tx)  //                              .txd
    );

endmodule 