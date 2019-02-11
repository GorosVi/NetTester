module timer_module #(
	parameter WIDTH = 32
)(
	input  wire  srst_n_i,
	input  wire  clk_i,

	output logic [WIDTH-1:0] count_o
);

logic [WIDTH-1:0] count_val;

always_ff @(posedge clk_i)
	begin
		if ( ~srst_n_i )
			count_val <= 'b0;
		else
			count_val <= count_val + 1'b1;
	end

assign count_o = count_val;

endmodule