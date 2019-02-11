module transmitter_module #(
	parameter HEADERLEN = 48, // Header buffer length
	parameter TIMEIN_WIDTH = 32
)(
	input  wire  srst_n_i,
	input  wire  clk_i,

	// Avalon-ST frame source port
	input  logic        frame_ready_i,
	output logic [31:0] frame_data_o,
	output logic        frame_valid_o,
	output logic        frame_sop_o,
	output logic        frame_eop_o,
	output logic [1:0]  frame_empty_o,

	// Avalon-MM control port
	input  logic [31:0] control_address_i,
	input  logic        control_read_i,
	output logic [31:0] control_readdata_o,
	input  logic        control_write_i,
	input  logic [31:0] control_writedata_i,

	input  wire [TIMEIN_WIDTH-1:0] time_count_i

);

// Control registers always placed from 0 address
localparam CSR_COUNT = 4;
logic [CSR_COUNT-1 : 0][31:0] csr_reg;


always_ff @(posedge clk_i)
	begin: CSR_reg_read
		if ( ~srst_n_i )
			csr_reg <= 'b0;
		else
			if ( control_write_i && (control_address_i < CSR_COUNT) )
				csr_reg[control_address_i] <= control_writedata_i;
	end

logic [31:0] csr_reg_readdata;
always_ff @(posedge clk_i)
	begin: CSR_reg_write
		if ( ~srst_n_i )
			begin
				csr_reg_readdata <= 'b0;
			end
		else
			if ( control_read_i && (control_address_i < CSR_COUNT) )
				begin
					csr_reg_readdata <= csr_reg[control_address_i];
				end
			else
				csr_reg_readdata <= csr_reg_readdata;
	end


reg [31:0] pkt_header_mem [HEADERLEN-1:0];
localparam HEADER_BUFFER_OFFSET = 'h10;
logic buffer_selected, buffer_addr;
assign buffer_selected =  (control_address_i >= HEADER_BUFFER_OFFSET )
				                  && ( control_address_i < HEADER_BUFFER_OFFSET + HEADERLEN );
assign buffer_addr = control_address_i - HEADER_BUFFER_OFFSET;

always_ff @(posedge clk_i)
	begin: CSR_buffer_read
		if ( ~srst_n_i )
		;
		else
			if ( control_write_i && buffer_selected )
				pkt_header_mem[buffer_addr] <= control_writedata_i;
			else if ( control_read_i && buffer_selected )
				control_readdata_o <= pkt_header_mem[buffer_addr];
	end




endmodule