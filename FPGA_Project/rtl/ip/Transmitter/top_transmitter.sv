//pks.konstantin@gmail.com
module top_transmitter(
	input logic clk_i,
	input logic reset_n,

	input logic [31:0] timer_in,

	input logic amm_wr,
	input logic amm_rd,
	input logic [31:0] amm_address,
	input logic [31:0] amm_wrdata,
	output logic [31:0] amm_rddata,
	output logic amm_rddatavalid,

	input logic [31:0] ast_data,
	input logic [1:0]  ast_empty,
	input logic ast_ready,
	input logic ast_sop,
	input logic ast_eop,
	input logic ast_val
);

  transmitter u0 (
        .clk_clk                                                    (clk_i),//                                          clk.clk
        .reset_reset_n                                              (reset_n),                                              //                                        reset.reset_n
        .packet_transmitter_0_avalon_slave_write                    (amm_wr),                    //            packet_transmitter_0_avalon_slave.write
        .packet_transmitter_0_avalon_slave_readdata                 (amm_rddata),                 //                                             .readdata
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



endmodule