// DelayTesterSystem.v

// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module DelayTesterSystem (
		output wire       mac_mac_mdio_connection_mdc,         //         mac_mac_mdio_connection.mdc
		input  wire       mac_mac_mdio_connection_mdio_in,     //                                .mdio_in
		output wire       mac_mac_mdio_connection_mdio_out,    //                                .mdio_out
		output wire       mac_mac_mdio_connection_mdio_oen,    //                                .mdio_oen
		input  wire [3:0] mac_mac_rgmii_connection_rgmii_in,   //        mac_mac_rgmii_connection.rgmii_in
		output wire [3:0] mac_mac_rgmii_connection_rgmii_out,  //                                .rgmii_out
		input  wire       mac_mac_rgmii_connection_rx_control, //                                .rx_control
		output wire       mac_mac_rgmii_connection_tx_control, //                                .tx_control
		input  wire       mac_pcs_mac_rx_clock_connection_clk, // mac_pcs_mac_rx_clock_connection.clk
		input  wire       mac_pcs_mac_tx_clock_connection_clk, // mac_pcs_mac_tx_clock_connection.clk
		input  wire       qsys_system_clk_clk,                 //                 qsys_system_clk.clk
		input  wire       qsys_system_reset_reset_n            //               qsys_system_reset.reset_n
	);

	wire  [31:0] jtag_amm_bridge_master_readdata;                // mm_interconnect_0:JTAG_AMM_Bridge_master_readdata -> JTAG_AMM_Bridge:master_readdata
	wire         jtag_amm_bridge_master_waitrequest;             // mm_interconnect_0:JTAG_AMM_Bridge_master_waitrequest -> JTAG_AMM_Bridge:master_waitrequest
	wire  [31:0] jtag_amm_bridge_master_address;                 // JTAG_AMM_Bridge:master_address -> mm_interconnect_0:JTAG_AMM_Bridge_master_address
	wire         jtag_amm_bridge_master_read;                    // JTAG_AMM_Bridge:master_read -> mm_interconnect_0:JTAG_AMM_Bridge_master_read
	wire   [3:0] jtag_amm_bridge_master_byteenable;              // JTAG_AMM_Bridge:master_byteenable -> mm_interconnect_0:JTAG_AMM_Bridge_master_byteenable
	wire         jtag_amm_bridge_master_readdatavalid;           // mm_interconnect_0:JTAG_AMM_Bridge_master_readdatavalid -> JTAG_AMM_Bridge:master_readdatavalid
	wire         jtag_amm_bridge_master_write;                   // JTAG_AMM_Bridge:master_write -> mm_interconnect_0:JTAG_AMM_Bridge_master_write
	wire  [31:0] jtag_amm_bridge_master_writedata;               // JTAG_AMM_Bridge:master_writedata -> mm_interconnect_0:JTAG_AMM_Bridge_master_writedata
	wire  [31:0] mm_interconnect_0_mac_control_port_readdata;    // MAC:reg_data_out -> mm_interconnect_0:MAC_control_port_readdata
	wire         mm_interconnect_0_mac_control_port_waitrequest; // MAC:reg_busy -> mm_interconnect_0:MAC_control_port_waitrequest
	wire   [7:0] mm_interconnect_0_mac_control_port_address;     // mm_interconnect_0:MAC_control_port_address -> MAC:reg_addr
	wire         mm_interconnect_0_mac_control_port_read;        // mm_interconnect_0:MAC_control_port_read -> MAC:reg_rd
	wire         mm_interconnect_0_mac_control_port_write;       // mm_interconnect_0:MAC_control_port_write -> MAC:reg_wr
	wire  [31:0] mm_interconnect_0_mac_control_port_writedata;   // mm_interconnect_0:MAC_control_port_writedata -> MAC:reg_data_in
	wire  [31:0] mm_interconnect_0_sc_fifo_0_csr_readdata;       // sc_fifo_0:csr_readdata -> mm_interconnect_0:sc_fifo_0_csr_readdata
	wire   [2:0] mm_interconnect_0_sc_fifo_0_csr_address;        // mm_interconnect_0:sc_fifo_0_csr_address -> sc_fifo_0:csr_address
	wire         mm_interconnect_0_sc_fifo_0_csr_read;           // mm_interconnect_0:sc_fifo_0_csr_read -> sc_fifo_0:csr_read
	wire         mm_interconnect_0_sc_fifo_0_csr_write;          // mm_interconnect_0:sc_fifo_0_csr_write -> sc_fifo_0:csr_write
	wire  [31:0] mm_interconnect_0_sc_fifo_0_csr_writedata;      // mm_interconnect_0:sc_fifo_0_csr_writedata -> sc_fifo_0:csr_writedata
	wire         sc_fifo_0_out_valid;                            // sc_fifo_0:out_valid -> avalon_st_adapter:in_0_valid
	wire  [31:0] sc_fifo_0_out_data;                             // sc_fifo_0:out_data -> avalon_st_adapter:in_0_data
	wire         sc_fifo_0_out_ready;                            // avalon_st_adapter:in_0_ready -> sc_fifo_0:out_ready
	wire         sc_fifo_0_out_startofpacket;                    // sc_fifo_0:out_startofpacket -> avalon_st_adapter:in_0_startofpacket
	wire         sc_fifo_0_out_endofpacket;                      // sc_fifo_0:out_endofpacket -> avalon_st_adapter:in_0_endofpacket
	wire   [1:0] sc_fifo_0_out_empty;                            // sc_fifo_0:out_empty -> avalon_st_adapter:in_0_empty
	wire         avalon_st_adapter_out_0_valid;                  // avalon_st_adapter:out_0_valid -> MAC:ff_tx_wren
	wire  [31:0] avalon_st_adapter_out_0_data;                   // avalon_st_adapter:out_0_data -> MAC:ff_tx_data
	wire         avalon_st_adapter_out_0_ready;                  // MAC:ff_tx_rdy -> avalon_st_adapter:out_0_ready
	wire         avalon_st_adapter_out_0_startofpacket;          // avalon_st_adapter:out_0_startofpacket -> MAC:ff_tx_sop
	wire         avalon_st_adapter_out_0_endofpacket;            // avalon_st_adapter:out_0_endofpacket -> MAC:ff_tx_eop
	wire   [0:0] avalon_st_adapter_out_0_error;                  // avalon_st_adapter:out_0_error -> MAC:ff_tx_err
	wire   [1:0] avalon_st_adapter_out_0_empty;                  // avalon_st_adapter:out_0_empty -> MAC:ff_tx_mod
	wire         mac_receive_valid;                              // MAC:ff_rx_dval -> avalon_st_adapter_001:in_0_valid
	wire  [31:0] mac_receive_data;                               // MAC:ff_rx_data -> avalon_st_adapter_001:in_0_data
	wire         mac_receive_ready;                              // avalon_st_adapter_001:in_0_ready -> MAC:ff_rx_rdy
	wire         mac_receive_startofpacket;                      // MAC:ff_rx_sop -> avalon_st_adapter_001:in_0_startofpacket
	wire         mac_receive_endofpacket;                        // MAC:ff_rx_eop -> avalon_st_adapter_001:in_0_endofpacket
	wire   [5:0] mac_receive_error;                              // MAC:rx_err -> avalon_st_adapter_001:in_0_error
	wire   [1:0] mac_receive_empty;                              // MAC:ff_rx_mod -> avalon_st_adapter_001:in_0_empty
	wire         avalon_st_adapter_001_out_0_valid;              // avalon_st_adapter_001:out_0_valid -> sc_fifo_0:in_valid
	wire  [31:0] avalon_st_adapter_001_out_0_data;               // avalon_st_adapter_001:out_0_data -> sc_fifo_0:in_data
	wire         avalon_st_adapter_001_out_0_ready;              // sc_fifo_0:in_ready -> avalon_st_adapter_001:out_0_ready
	wire         avalon_st_adapter_001_out_0_startofpacket;      // avalon_st_adapter_001:out_0_startofpacket -> sc_fifo_0:in_startofpacket
	wire         avalon_st_adapter_001_out_0_endofpacket;        // avalon_st_adapter_001:out_0_endofpacket -> sc_fifo_0:in_endofpacket
	wire   [1:0] avalon_st_adapter_001_out_0_empty;              // avalon_st_adapter_001:out_0_empty -> sc_fifo_0:in_empty
	wire         rst_controller_reset_out_reset;                 // rst_controller:reset_out -> [MAC:reset, avalon_st_adapter:in_rst_0_reset, avalon_st_adapter_001:in_rst_0_reset, mm_interconnect_0:JTAG_AMM_Bridge_clk_reset_reset_bridge_in_reset_reset, mm_interconnect_0:MAC_reset_connection_reset_bridge_in_reset_reset, sc_fifo_0:reset, simple_timer_0:srst_n_i]

	DelayTesterSystem_JTAG_AMM_Bridge #(
		.USE_PLI     (0),
		.PLI_PORT    (50000),
		.FIFO_DEPTHS (2)
	) jtag_amm_bridge (
		.clk_clk              (qsys_system_clk_clk),                  //          clk.clk
		.clk_reset_reset      (~qsys_system_reset_reset_n),           //    clk_reset.reset
		.master_address       (jtag_amm_bridge_master_address),       //       master.address
		.master_readdata      (jtag_amm_bridge_master_readdata),      //             .readdata
		.master_read          (jtag_amm_bridge_master_read),          //             .read
		.master_write         (jtag_amm_bridge_master_write),         //             .write
		.master_writedata     (jtag_amm_bridge_master_writedata),     //             .writedata
		.master_waitrequest   (jtag_amm_bridge_master_waitrequest),   //             .waitrequest
		.master_readdatavalid (jtag_amm_bridge_master_readdatavalid), //             .readdatavalid
		.master_byteenable    (jtag_amm_bridge_master_byteenable),    //             .byteenable
		.master_reset_reset   ()                                      // master_reset.reset
	);

	DelayTesterSystem_MAC mac (
		.clk           (qsys_system_clk_clk),                            // control_port_clock_connection.clk
		.reset         (rst_controller_reset_out_reset),                 //              reset_connection.reset
		.reg_addr      (mm_interconnect_0_mac_control_port_address),     //                  control_port.address
		.reg_data_out  (mm_interconnect_0_mac_control_port_readdata),    //                              .readdata
		.reg_rd        (mm_interconnect_0_mac_control_port_read),        //                              .read
		.reg_data_in   (mm_interconnect_0_mac_control_port_writedata),   //                              .writedata
		.reg_wr        (mm_interconnect_0_mac_control_port_write),       //                              .write
		.reg_busy      (mm_interconnect_0_mac_control_port_waitrequest), //                              .waitrequest
		.tx_clk        (mac_pcs_mac_tx_clock_connection_clk),            //   pcs_mac_tx_clock_connection.clk
		.rx_clk        (mac_pcs_mac_rx_clock_connection_clk),            //   pcs_mac_rx_clock_connection.clk
		.set_10        (),                                               //         mac_status_connection.set_10
		.set_1000      (),                                               //                              .set_1000
		.eth_mode      (),                                               //                              .eth_mode
		.ena_10        (),                                               //                              .ena_10
		.rgmii_in      (mac_mac_rgmii_connection_rgmii_in),              //          mac_rgmii_connection.rgmii_in
		.rgmii_out     (mac_mac_rgmii_connection_rgmii_out),             //                              .rgmii_out
		.rx_control    (mac_mac_rgmii_connection_rx_control),            //                              .rx_control
		.tx_control    (mac_mac_rgmii_connection_tx_control),            //                              .tx_control
		.ff_rx_clk     (qsys_system_clk_clk),                            //      receive_clock_connection.clk
		.ff_tx_clk     (qsys_system_clk_clk),                            //     transmit_clock_connection.clk
		.ff_rx_data    (mac_receive_data),                               //                       receive.data
		.ff_rx_eop     (mac_receive_endofpacket),                        //                              .endofpacket
		.rx_err        (mac_receive_error),                              //                              .error
		.ff_rx_mod     (mac_receive_empty),                              //                              .empty
		.ff_rx_rdy     (mac_receive_ready),                              //                              .ready
		.ff_rx_sop     (mac_receive_startofpacket),                      //                              .startofpacket
		.ff_rx_dval    (mac_receive_valid),                              //                              .valid
		.ff_tx_data    (avalon_st_adapter_out_0_data),                   //                      transmit.data
		.ff_tx_eop     (avalon_st_adapter_out_0_endofpacket),            //                              .endofpacket
		.ff_tx_err     (avalon_st_adapter_out_0_error),                  //                              .error
		.ff_tx_mod     (avalon_st_adapter_out_0_empty),                  //                              .empty
		.ff_tx_rdy     (avalon_st_adapter_out_0_ready),                  //                              .ready
		.ff_tx_sop     (avalon_st_adapter_out_0_startofpacket),          //                              .startofpacket
		.ff_tx_wren    (avalon_st_adapter_out_0_valid),                  //                              .valid
		.mdc           (mac_mac_mdio_connection_mdc),                    //           mac_mdio_connection.mdc
		.mdio_in       (mac_mac_mdio_connection_mdio_in),                //                              .mdio_in
		.mdio_out      (mac_mac_mdio_connection_mdio_out),               //                              .mdio_out
		.mdio_oen      (mac_mac_mdio_connection_mdio_oen),               //                              .mdio_oen
		.ff_tx_crc_fwd (),                                               //           mac_misc_connection.ff_tx_crc_fwd
		.ff_tx_septy   (),                                               //                              .ff_tx_septy
		.tx_ff_uflow   (),                                               //                              .tx_ff_uflow
		.ff_tx_a_full  (),                                               //                              .ff_tx_a_full
		.ff_tx_a_empty (),                                               //                              .ff_tx_a_empty
		.rx_err_stat   (),                                               //                              .rx_err_stat
		.rx_frm_type   (),                                               //                              .rx_frm_type
		.ff_rx_dsav    (),                                               //                              .ff_rx_dsav
		.ff_rx_a_full  (),                                               //                              .ff_rx_a_full
		.ff_rx_a_empty ()                                                //                              .ff_rx_a_empty
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (4),
		.BITS_PER_SYMBOL     (8),
		.FIFO_DEPTH          (512),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (1),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (1),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) sc_fifo_0 (
		.clk               (qsys_system_clk_clk),                       //       clk.clk
		.reset             (rst_controller_reset_out_reset),            // clk_reset.reset
		.csr_address       (mm_interconnect_0_sc_fifo_0_csr_address),   //       csr.address
		.csr_read          (mm_interconnect_0_sc_fifo_0_csr_read),      //          .read
		.csr_write         (mm_interconnect_0_sc_fifo_0_csr_write),     //          .write
		.csr_readdata      (mm_interconnect_0_sc_fifo_0_csr_readdata),  //          .readdata
		.csr_writedata     (mm_interconnect_0_sc_fifo_0_csr_writedata), //          .writedata
		.in_data           (avalon_st_adapter_001_out_0_data),          //        in.data
		.in_valid          (avalon_st_adapter_001_out_0_valid),         //          .valid
		.in_ready          (avalon_st_adapter_001_out_0_ready),         //          .ready
		.in_startofpacket  (avalon_st_adapter_001_out_0_startofpacket), //          .startofpacket
		.in_endofpacket    (avalon_st_adapter_001_out_0_endofpacket),   //          .endofpacket
		.in_empty          (avalon_st_adapter_001_out_0_empty),         //          .empty
		.out_data          (sc_fifo_0_out_data),                        //       out.data
		.out_valid         (sc_fifo_0_out_valid),                       //          .valid
		.out_ready         (sc_fifo_0_out_ready),                       //          .ready
		.out_startofpacket (sc_fifo_0_out_startofpacket),               //          .startofpacket
		.out_endofpacket   (sc_fifo_0_out_endofpacket),                 //          .endofpacket
		.out_empty         (sc_fifo_0_out_empty),                       //          .empty
		.almost_full_data  (),                                          // (terminated)
		.almost_empty_data (),                                          // (terminated)
		.in_error          (1'b0),                                      // (terminated)
		.out_error         (),                                          // (terminated)
		.in_channel        (1'b0),                                      // (terminated)
		.out_channel       ()                                           // (terminated)
	);

	timer_module #(
		.WIDTH (32)
	) simple_timer_0 (
		.clk_i    (qsys_system_clk_clk),             // clock_sink.clk
		.count_o  (),                                //  timer_out.value
		.srst_n_i (~rst_controller_reset_out_reset)  // reset_sink.reset_n
	);

	DelayTesterSystem_mm_interconnect_0 mm_interconnect_0 (
		.clk_125m_system_clk_clk                               (qsys_system_clk_clk),                            //                             clk_125m_system_clk.clk
		.JTAG_AMM_Bridge_clk_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                 // JTAG_AMM_Bridge_clk_reset_reset_bridge_in_reset.reset
		.MAC_reset_connection_reset_bridge_in_reset_reset      (rst_controller_reset_out_reset),                 //      MAC_reset_connection_reset_bridge_in_reset.reset
		.JTAG_AMM_Bridge_master_address                        (jtag_amm_bridge_master_address),                 //                          JTAG_AMM_Bridge_master.address
		.JTAG_AMM_Bridge_master_waitrequest                    (jtag_amm_bridge_master_waitrequest),             //                                                .waitrequest
		.JTAG_AMM_Bridge_master_byteenable                     (jtag_amm_bridge_master_byteenable),              //                                                .byteenable
		.JTAG_AMM_Bridge_master_read                           (jtag_amm_bridge_master_read),                    //                                                .read
		.JTAG_AMM_Bridge_master_readdata                       (jtag_amm_bridge_master_readdata),                //                                                .readdata
		.JTAG_AMM_Bridge_master_readdatavalid                  (jtag_amm_bridge_master_readdatavalid),           //                                                .readdatavalid
		.JTAG_AMM_Bridge_master_write                          (jtag_amm_bridge_master_write),                   //                                                .write
		.JTAG_AMM_Bridge_master_writedata                      (jtag_amm_bridge_master_writedata),               //                                                .writedata
		.MAC_control_port_address                              (mm_interconnect_0_mac_control_port_address),     //                                MAC_control_port.address
		.MAC_control_port_write                                (mm_interconnect_0_mac_control_port_write),       //                                                .write
		.MAC_control_port_read                                 (mm_interconnect_0_mac_control_port_read),        //                                                .read
		.MAC_control_port_readdata                             (mm_interconnect_0_mac_control_port_readdata),    //                                                .readdata
		.MAC_control_port_writedata                            (mm_interconnect_0_mac_control_port_writedata),   //                                                .writedata
		.MAC_control_port_waitrequest                          (mm_interconnect_0_mac_control_port_waitrequest), //                                                .waitrequest
		.sc_fifo_0_csr_address                                 (mm_interconnect_0_sc_fifo_0_csr_address),        //                                   sc_fifo_0_csr.address
		.sc_fifo_0_csr_write                                   (mm_interconnect_0_sc_fifo_0_csr_write),          //                                                .write
		.sc_fifo_0_csr_read                                    (mm_interconnect_0_sc_fifo_0_csr_read),           //                                                .read
		.sc_fifo_0_csr_readdata                                (mm_interconnect_0_sc_fifo_0_csr_readdata),       //                                                .readdata
		.sc_fifo_0_csr_writedata                               (mm_interconnect_0_sc_fifo_0_csr_writedata)       //                                                .writedata
	);

	DelayTesterSystem_avalon_st_adapter #(
		.inBitsPerSymbol (8),
		.inUsePackets    (1),
		.inDataWidth     (32),
		.inChannelWidth  (0),
		.inErrorWidth    (0),
		.inUseEmptyPort  (1),
		.inUseValid      (1),
		.inUseReady      (1),
		.inReadyLatency  (0),
		.outDataWidth    (32),
		.outChannelWidth (0),
		.outErrorWidth   (1),
		.outUseEmptyPort (1),
		.outUseValid     (1),
		.outUseReady     (1),
		.outReadyLatency (0)
	) avalon_st_adapter (
		.in_clk_0_clk        (qsys_system_clk_clk),                   // in_clk_0.clk
		.in_rst_0_reset      (rst_controller_reset_out_reset),        // in_rst_0.reset
		.in_0_data           (sc_fifo_0_out_data),                    //     in_0.data
		.in_0_valid          (sc_fifo_0_out_valid),                   //         .valid
		.in_0_ready          (sc_fifo_0_out_ready),                   //         .ready
		.in_0_startofpacket  (sc_fifo_0_out_startofpacket),           //         .startofpacket
		.in_0_endofpacket    (sc_fifo_0_out_endofpacket),             //         .endofpacket
		.in_0_empty          (sc_fifo_0_out_empty),                   //         .empty
		.out_0_data          (avalon_st_adapter_out_0_data),          //    out_0.data
		.out_0_valid         (avalon_st_adapter_out_0_valid),         //         .valid
		.out_0_ready         (avalon_st_adapter_out_0_ready),         //         .ready
		.out_0_startofpacket (avalon_st_adapter_out_0_startofpacket), //         .startofpacket
		.out_0_endofpacket   (avalon_st_adapter_out_0_endofpacket),   //         .endofpacket
		.out_0_empty         (avalon_st_adapter_out_0_empty),         //         .empty
		.out_0_error         (avalon_st_adapter_out_0_error)          //         .error
	);

	DelayTesterSystem_avalon_st_adapter_001 #(
		.inBitsPerSymbol (8),
		.inUsePackets    (1),
		.inDataWidth     (32),
		.inChannelWidth  (0),
		.inErrorWidth    (6),
		.inUseEmptyPort  (1),
		.inUseValid      (1),
		.inUseReady      (1),
		.inReadyLatency  (2),
		.outDataWidth    (32),
		.outChannelWidth (0),
		.outErrorWidth   (0),
		.outUseEmptyPort (1),
		.outUseValid     (1),
		.outUseReady     (1),
		.outReadyLatency (0)
	) avalon_st_adapter_001 (
		.in_clk_0_clk        (qsys_system_clk_clk),                       // in_clk_0.clk
		.in_rst_0_reset      (rst_controller_reset_out_reset),            // in_rst_0.reset
		.in_0_data           (mac_receive_data),                          //     in_0.data
		.in_0_valid          (mac_receive_valid),                         //         .valid
		.in_0_ready          (mac_receive_ready),                         //         .ready
		.in_0_startofpacket  (mac_receive_startofpacket),                 //         .startofpacket
		.in_0_endofpacket    (mac_receive_endofpacket),                   //         .endofpacket
		.in_0_empty          (mac_receive_empty),                         //         .empty
		.in_0_error          (mac_receive_error),                         //         .error
		.out_0_data          (avalon_st_adapter_001_out_0_data),          //    out_0.data
		.out_0_valid         (avalon_st_adapter_001_out_0_valid),         //         .valid
		.out_0_ready         (avalon_st_adapter_001_out_0_ready),         //         .ready
		.out_0_startofpacket (avalon_st_adapter_001_out_0_startofpacket), //         .startofpacket
		.out_0_endofpacket   (avalon_st_adapter_001_out_0_endofpacket),   //         .endofpacket
		.out_0_empty         (avalon_st_adapter_001_out_0_empty)          //         .empty
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~qsys_system_reset_reset_n),     // reset_in0.reset
		.clk            (qsys_system_clk_clk),            //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule
