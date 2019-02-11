`timescale 10 ps / 10 ps
module transmitter_tb;

localparam WIDTH = 32;
localparam CLK_HALF_PERIOD = 5;

logic clk;
logic reset_n;
logic [WIDTH-1:0] timer_in;

logic amm_rd;
logic amm_wr;
logic [31:0] amm_address;
logic [31:0] amm_wrdata;
logic [31:0] amm_rddata;

logic [31:0] ast_data;
logic [1:0] ast_empty;
logic ast_ready;
logic ast_sop;
logic ast_eop;
logic ast_val;

transmitter dut_transmitter (
      .clk_clk                                                    (clk),//                                          clk.clk
      .reset_reset_n                                              (reset_n),                                              //                                        reset.reset_n
      .packet_transmitter_0_avalon_slave_write                    (amm_wr),                    //            packet_transmitter_0_avalon_slave.write
      .packet_transmitter_0_avalon_slave_readdata                 (amm_rddata),                 //                                             .readdata      .packet_transmitter_0_avalon_slave_readdatavalid            (amm_rddatavalid),            //                                             .readdatavalid
      .packet_transmitter_0_avalon_slave_read                     (amm_rd),                     //                                             .read
      .packet_transmitter_0_avalon_slave_address                  (amm_address),                  //                                             .address
      .packet_transmitter_0_avalon_slave_writedata                (amm_wrdata),                //                                             .writedata

      .packet_transmitter_0_conduit_end_export                    (timer_in),                    //             packet_transmitter_0_conduit_end.export

      .packet_transmitter_0_avalon_streaming_source_data          (ast_data),          // packet_transmitter_0_avalon_streaming_source.data
      .packet_transmitter_0_avalon_streaming_source_empty         (ast_empty),         //                                             .empty
      .packet_transmitter_0_avalon_streaming_source_ready         (ast_ready),         //                                             .ready
      .packet_transmitter_0_avalon_streaming_source_endofpacket   (ast_eop),   //                                             .endofpacket
      .packet_transmitter_0_avalon_streaming_source_startofpacket (ast_sop), //                                             .startofpacket
      .packet_transmitter_0_avalon_streaming_source_valid         (ast_val)          //                                             .valid
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


localparam CSR_COUNT = 4;
localparam AMM_RD_LATENCY = 1;
localparam AMM_WR_LATENCY = 0;
initial
	begin : test_sequence_generator
		amm_address <= '0;
		amm_rd <= 1'b0;

		repeat (5) @( posedge clk );

		// Test 1: Read all registers after reset and check initial value == 0x00
		@( posedge clk );
		amm_address <= '0;
		repeat( CSR_COUNT )
			begin
				amm_rd <= 1'b1;
				@( posedge clk );
				amm_rd <= 1'b0;
				if ( AMM_RD_LATENCY - 1 > 0)
					repeat( AMM_RD_LATENCY - 1 ) @( posedge clk )
				assert( amm_rddata == 'b0 );
				amm_address <= amm_address + 1'b1;
			end


		// Write to all registers
		amm_address <= '0;
		amm_wrdata    <= 32'hFEEBDAED;
		repeat(CSR_COUNT)
			begin
				amm_wr <= 1'b1;
				@( posedge clk );
				amm_wr <= 1'b0;
				amm_address <= amm_address + 1'b1;
				amm_wrdata    <= amm_wrdata - 32'h11111111;
				@( posedge clk );
			end

		@( posedge clk );
		amm_address <= '0;
		repeat( CSR_COUNT )
			begin
				amm_rd <= 1'b1;
				@( posedge clk );
				amm_rd <= 1'b0;
				if ( AMM_RD_LATENCY - 1 > 0)
					repeat( AMM_RD_LATENCY - 1 ) @( posedge clk );
				assert( amm_rddata == 'b0 );
				amm_address <= amm_address + 1'b1;
			end

		repeat (20) @( posedge clk );
		$stop;
	end

endmodule