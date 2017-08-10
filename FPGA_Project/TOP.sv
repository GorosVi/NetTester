module TOP(
	input  wire clk_25m_i,
	input  wire srst_i,

	input  wire clk_125m_rgmii_rx_i,
	output wire clk_125m_rgmii_tx_o,

	input  wire [3:0] rgmii_rx_i,
	input  wire       rgmii_rx_ctl_i,

	output wire [3:0] rgmii_tx_o,
	input  wire       rgmii_tx_ctl_o

);

wire srst_i_n = ~srst_i;


DelayTesterSystem u0 (
	.clk_25m_clk                         (clk_25m_i),                         //                         clk_25m.clk
	.reset_reset_n                       (srst_i_n),                       //                           reset.reset_n
	.clk_125m_out_clk_clk                (clk_125m_rgmii_tx_o),
	

	.mac_pcs_mac_rx_clock_connection_clk (clk_125m_rgmii_rx_i), // mac_pcs_mac_rx_clock_connection.clk
	.mac_pcs_mac_tx_clock_connection_clk (clk_125m_rgmii_tx_o),  // mac_pcs_mac_tx_clock_connection.clk

	.mac_mac_rgmii_connection_rgmii_in   (rgmii_rx_i),   //        mac_mac_rgmii_connection.rgmii_in
	.mac_mac_rgmii_connection_rx_control (rgmii_rx_ctl_i), //                                .rx_control

	.mac_mac_rgmii_connection_rgmii_out  (rgmii_tx_o),  //                                .rgmii_out
	.mac_mac_rgmii_connection_tx_control (rgmii_tx_ctl_o), //                                .tx_control

	.mac_mac_mdio_connection_mdc         (),    //   mac_mac_mdio_connection.mdc
	.mac_mac_mdio_connection_mdio_in     (),    //  .mdio_in
	.mac_mac_mdio_connection_mdio_out    (),    //  .mdio_out
	.mac_mac_mdio_connection_mdio_oen    ()     //  .mdio_oen
);


endmodule