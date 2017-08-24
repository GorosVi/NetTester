module top_timer(
	input logic clk,
	input logic reset_n,
	output logic [31:0] timer_out
);

timer timer_inst (
	.clk_clk                        (clk),
	.reset_reset_n                  (reset_n),
	.simple_timer_0_timer_out_value (timer_out)
);

endmodule