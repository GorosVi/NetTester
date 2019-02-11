// DelayTesterSystem_MAC.v

// This file was auto-generated from altera_eth_tse_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module DelayTesterSystem_MAC (
		input  wire        clk,           // control_port_clock_connection.clk
		input  wire        reset,         //              reset_connection.reset
		input  wire [7:0]  reg_addr,      //                  control_port.address
		output wire [31:0] reg_data_out,  //                              .readdata
		input  wire        reg_rd,        //                              .read
		input  wire [31:0] reg_data_in,   //                              .writedata
		input  wire        reg_wr,        //                              .write
		output wire        reg_busy,      //                              .waitrequest
		input  wire        tx_clk,        //   pcs_mac_tx_clock_connection.clk
		input  wire        rx_clk,        //   pcs_mac_rx_clock_connection.clk
		input  wire        set_10,        //         mac_status_connection.set_10
		input  wire        set_1000,      //                              .set_1000
		output wire        eth_mode,      //                              .eth_mode
		output wire        ena_10,        //                              .ena_10
		input  wire [3:0]  rgmii_in,      //          mac_rgmii_connection.rgmii_in
		output wire [3:0]  rgmii_out,     //                              .rgmii_out
		input  wire        rx_control,    //                              .rx_control
		output wire        tx_control,    //                              .tx_control
		input  wire        ff_rx_clk,     //      receive_clock_connection.clk
		input  wire        ff_tx_clk,     //     transmit_clock_connection.clk
		output wire [31:0] ff_rx_data,    //                       receive.data
		output wire        ff_rx_eop,     //                              .endofpacket
		output wire [5:0]  rx_err,        //                              .error
		output wire [1:0]  ff_rx_mod,     //                              .empty
		input  wire        ff_rx_rdy,     //                              .ready
		output wire        ff_rx_sop,     //                              .startofpacket
		output wire        ff_rx_dval,    //                              .valid
		input  wire [31:0] ff_tx_data,    //                      transmit.data
		input  wire        ff_tx_eop,     //                              .endofpacket
		input  wire        ff_tx_err,     //                              .error
		input  wire [1:0]  ff_tx_mod,     //                              .empty
		output wire        ff_tx_rdy,     //                              .ready
		input  wire        ff_tx_sop,     //                              .startofpacket
		input  wire        ff_tx_wren,    //                              .valid
		output wire        mdc,           //           mac_mdio_connection.mdc
		input  wire        mdio_in,       //                              .mdio_in
		output wire        mdio_out,      //                              .mdio_out
		output wire        mdio_oen,      //                              .mdio_oen
		input  wire        ff_tx_crc_fwd, //           mac_misc_connection.ff_tx_crc_fwd
		output wire        ff_tx_septy,   //                              .ff_tx_septy
		output wire        tx_ff_uflow,   //                              .tx_ff_uflow
		output wire        ff_tx_a_full,  //                              .ff_tx_a_full
		output wire        ff_tx_a_empty, //                              .ff_tx_a_empty
		output wire [17:0] rx_err_stat,   //                              .rx_err_stat
		output wire [3:0]  rx_frm_type,   //                              .rx_frm_type
		output wire        ff_rx_dsav,    //                              .ff_rx_dsav
		output wire        ff_rx_a_full,  //                              .ff_rx_a_full
		output wire        ff_rx_a_empty  //                              .ff_rx_a_empty
	);

	altera_eth_tse_mac #(
		.ING_ADDR                 (6),
		.ENABLE_MAC_RX_VLAN       (0),
		.ENABLE_SUP_ADDR          (0),
		.DEVICE_FAMILY            ("CYCLONEV"),
		.INSERT_TA                (0),
		.ING_FIFO                 (64),
		.ENABLE_ECC               (0),
		.CRC32DWIDTH              (8),
		.ENABLE_ENA               (32),
		.SYNCHRONIZER_DEPTH       (3),
		.ENABLE_MAC_TX_VLAN       (0),
		.RESET_LEVEL              (1),
		.STAT_CNT_ENA             (1),
		.CUST_VERSION             (0),
		.CRC32S1L2_EXTERN         (0),
		.MBIT_ONLY                (1),
		.EG_ADDR                  (6),
		.CORE_VERSION             (4097),
		.CRC32GENDELAY            (6),
		.EG_FIFO                  (64),
		.REDUCED_INTERFACE_ENA    (1),
		.ENABLE_MAGIC_DETECT      (0),
		.ENABLE_MDIO              (1),
		.ENABLE_MAC_TXADDR_SET    (1),
		.RAM_TYPE                 ("AUTO"),
		.CRC32CHECK16BIT          (0),
		.ENABLE_LGTH_CHECK        (1),
		.ENABLE_MAC_FLOW_CTRL     (0),
		.ENABLE_SHIFT16           (1),
		.USE_SYNC_RESET           (1),
		.REDUCED_CONTROL          (0),
		.MDIO_CLK_DIV             (40),
		.ENABLE_PADDING           (1),
		.ENABLE_GMII_LOOPBACK     (1),
		.GBIT_ONLY                (1),
		.ENA_HASH                 (0),
		.ENABLE_EXTENDED_STAT_REG (1),
		.ENABLE_HD_LOGIC          (0)
	) i_tse_mac (
		.clk             (clk),           // control_port_clock_connection.clk
		.reset           (reset),         //              reset_connection.reset
		.reg_addr        (reg_addr),      //                  control_port.address
		.reg_data_out    (reg_data_out),  //                              .readdata
		.reg_rd          (reg_rd),        //                              .read
		.reg_data_in     (reg_data_in),   //                              .writedata
		.reg_wr          (reg_wr),        //                              .write
		.reg_busy        (reg_busy),      //                              .waitrequest
		.ff_tx_clk       (ff_tx_clk),     //     transmit_clock_connection.clk
		.ff_rx_clk       (ff_rx_clk),     //      receive_clock_connection.clk
		.ff_rx_data      (ff_rx_data),    //                       receive.data
		.ff_rx_eop       (ff_rx_eop),     //                              .endofpacket
		.rx_err          (rx_err),        //                              .error
		.ff_rx_mod       (ff_rx_mod),     //                              .empty
		.ff_rx_rdy       (ff_rx_rdy),     //                              .ready
		.ff_rx_sop       (ff_rx_sop),     //                              .startofpacket
		.ff_rx_dval      (ff_rx_dval),    //                              .valid
		.ff_tx_data      (ff_tx_data),    //                      transmit.data
		.ff_tx_eop       (ff_tx_eop),     //                              .endofpacket
		.ff_tx_err       (ff_tx_err),     //                              .error
		.ff_tx_mod       (ff_tx_mod),     //                              .empty
		.ff_tx_rdy       (ff_tx_rdy),     //                              .ready
		.ff_tx_sop       (ff_tx_sop),     //                              .startofpacket
		.ff_tx_wren      (ff_tx_wren),    //                              .valid
		.ff_tx_crc_fwd   (ff_tx_crc_fwd), //           mac_misc_connection.export
		.ff_tx_septy     (ff_tx_septy),   //                              .export
		.tx_ff_uflow     (tx_ff_uflow),   //                              .export
		.ff_tx_a_full    (ff_tx_a_full),  //                              .export
		.ff_tx_a_empty   (ff_tx_a_empty), //                              .export
		.rx_err_stat     (rx_err_stat),   //                              .export
		.rx_frm_type     (rx_frm_type),   //                              .export
		.ff_rx_dsav      (ff_rx_dsav),    //                              .export
		.ff_rx_a_full    (ff_rx_a_full),  //                              .export
		.ff_rx_a_empty   (ff_rx_a_empty), //                              .export
		.mdc             (mdc),           //           mac_mdio_connection.mdc
		.mdio_in         (mdio_in),       //                              .mdio_in
		.mdio_out        (mdio_out),      //                              .mdio_out
		.mdio_oen        (mdio_oen),      //                              .mdio_oen
		.rgmii_in        (rgmii_in),      //          mac_rgmii_connection.rgmii_in
		.rgmii_out       (rgmii_out),     //                              .rgmii_out
		.rx_control      (rx_control),    //                              .rx_control
		.tx_control      (tx_control),    //                              .tx_control
		.set_10          (set_10),        //         mac_status_connection.set_10
		.set_1000        (set_1000),      //                              .set_1000
		.eth_mode        (eth_mode),      //                              .eth_mode
		.ena_10          (ena_10),        //                              .ena_10
		.tx_clk          (tx_clk),        //   pcs_mac_tx_clock_connection.clk
		.rx_clk          (rx_clk),        //   pcs_mac_rx_clock_connection.clk
		.magic_sleep_n   (1'b1),          //                   (terminated)
		.rx_clkena       (1'b1),          //                   (terminated)
		.tx_clkena       (1'b1),          //                   (terminated)
		.xon_gen         (1'b0),          //                   (terminated)
		.xoff_gen        (1'b0),          //                   (terminated)
		.magic_wakeup    (),              //                   (terminated)
		.mac_eccstatus   (),              //                   (terminated)
		.gm_rx_d         (8'b00000000),   //                   (terminated)
		.gm_rx_dv        (1'b0),          //                   (terminated)
		.gm_rx_err       (1'b0),          //                   (terminated)
		.gm_tx_d         (),              //                   (terminated)
		.gm_tx_en        (),              //                   (terminated)
		.gm_tx_err       (),              //                   (terminated)
		.rgmii_out1_aclr (),              //                   (terminated)
		.rgmii_out1_din  (),              //                   (terminated)
		.rgmii_in1_dout  (2'b00),         //                   (terminated)
		.rgmii_in1_ck    (),              //                   (terminated)
		.rgmii_out4_din  (),              //                   (terminated)
		.rgmii_out4_ck   (),              //                   (terminated)
		.rgmii_in1_pad   (),              //                   (terminated)
		.rgmii_out4_aclr (),              //                   (terminated)
		.rgmii_out1_pad  (1'b0),          //                   (terminated)
		.rgmii_out1_ck   (),              //                   (terminated)
		.rgmii_in4_dout  (8'b00000000),   //                   (terminated)
		.rgmii_in4_pad   (),              //                   (terminated)
		.rgmii_out4_pad  (4'b0000),       //                   (terminated)
		.rgmii_in4_ck    (),              //                   (terminated)
		.m_rx_d          (4'b0000),       //                   (terminated)
		.m_rx_en         (1'b0),          //                   (terminated)
		.m_rx_err        (1'b0),          //                   (terminated)
		.m_tx_d          (),              //                   (terminated)
		.m_tx_en         (),              //                   (terminated)
		.m_tx_err        (),              //                   (terminated)
		.m_rx_crs        (1'b0),          //                   (terminated)
		.m_rx_col        (1'b0)           //                   (terminated)
	);

endmodule
