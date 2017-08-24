`timescale 10 ps / 10 ps
module timer_tb;

localparam WIDTH = 32;
localparam CLK_HALF_PERIOD = 5;

logic clk;
logic reset_n;
logic [WIDTH-1:0] timer_out;

timer dut_timer (
	.clk_clk                        (clk),
	.reset_reset_n                  (reset_n),
	.simple_timer_0_timer_out_value (timer_out)
);


initial
	begin : clk_generator
		clk = 1'b0;
		forever #CLK_HALF_PERIOD clk = ~clk;
	end

initial
	begin : sync_reset_generator
		reset_n = 1'b0;
		#( CLK_HALF_PERIOD + 1 ) reset_n = 1'b1;
	end


initial
	begin : test_sequence_generator
		repeat (20) @( posedge clk );
		$stop;
	end

endmodule