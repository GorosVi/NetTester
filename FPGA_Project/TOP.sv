module TOP(
	input  wire clk_25m_i,
//	input  wire srst_i,

	input  wire trg_rx_clk_i,
	input  wire [3:0] trg_rxd_i,
	input  wire trg_rx_ctrl_i,
	output wire trg_tx_clk_o,
	output wire [3:0] trg_txd_o,
	output wire trg_tx_ctrl_o,

	output wire trg_mdc_o,
	inout  wire trg_mdio_io,

	output wire trg_nreset_o
);
wire srst_i;
assign srst_i = 1'b0;

wire srst_n = ~srst_i;

wire clk_125m_out;
MAC_PLL mac_pll_inst(
		.refclk (clk_25m_i),    // refclk.clk
		.rst (srst_i),          // reset.reset
		.outclk_0(clk_125m_out) // outclk0.clk
	);

wire clk_125m_system, clk_125m_mac_tx;
assign clk_125m_system = clk_125m_out;
assign trg_tx_clk_o = clk_125m_out;

DelayTesterSystem u0 (
	.qsys_system_clk_clk                 (clk_125m_system),                 //                 qsys_system_clk.clk
	.qsys_system_reset_reset_n           (srst_n),

	.mac_pcs_mac_rx_clock_connection_clk (trg_rx_clk_i), // mac_pcs_mac_rx_clock_connection.clk
	.mac_mac_rgmii_connection_rgmii_in   (trg_rxd_i),   //        mac_mac_rgmii_connection.rgmii_in
	.mac_mac_rgmii_connection_rx_control (trg_rx_ctrl_i ), //  trg_rx_clk_i                              .rx_control

	.mac_pcs_mac_tx_clock_connection_clk (trg_tx_clk_o),  // mac_pcs_mac_tx_clock_connection.clk
	.mac_mac_rgmii_connection_rgmii_out  (trg_txd_o),  //                                .rgmii_out
	.mac_mac_rgmii_connection_tx_control (trg_tx_ctrl_o), //                                .tx_control

	.mac_mac_mdio_connection_mdc         (mac_mdio_clk),    //   mac_mac_mdio_connection.mdc
	.mac_mac_mdio_connection_mdio_in     (mac_mdio_in),    //  .mdio_in
	.mac_mac_mdio_connection_mdio_out    (mac_mdio_out),    //  .mdio_out
	.mac_mac_mdio_connection_mdio_oen    (mac_mdio_oen)     //  .mdio_oen
);

logic mac_mdio_in, mac_mdio_out, mac_mdio_oen, mac_mdio_clk;
assign trg_mdc_o = mac_mdio_clk;
assign trg_mdio_io = ( !mac_mdio_oen ) ? ( mac_mdio_out ) : ( 1'bz ); // Check OEN default value!!!
assign mac_mdio_in = trg_mdio_io;


endmodule