module TOP(
	input  wire clk_25m_i,
	input  wire srst_i,

	input  wire clk_125m_rgmii_rx_i,
	input  wire [3:0] rgmii_rx_i,
	input  wire       rgmii_rx_ctl_i,

	output wire clk_125m_rgmii_tx_o,
	output wire [3:0] rgmii_tx_o,
	output wire       rgmii_tx_ctl_o,

	inout wire phy_mdio_mdio,
	output wire phy_mdio_mdc
);

wire srst_n = ~srst_i;

wire clk_125m_out;
MAC_PLL mac_pll_inst(
		.refclk (clk_25m_i),   //  refclk.clk
		.rst (srst_i),      //   reset.reset
		.outclk_0(clk_125m_out)  // outclk0.clk
	); 
	
wire clk_125m_system, clk_125m_mac_tx;
assign clk_125m_system = clk_125m_out;
assign clk_125m_mac_tx = clk_125m_out;
assign clk_125m_rgmii_tx_o = clk_125m_mac_tx;

DelayTesterSystem u0 (
	.qsys_system_clk_clk                 (clk_125m_system),                 //                 qsys_system_clk.clk
	.qsys_system_reset_reset_n           (srst_n),
	
	.mac_pcs_mac_rx_clock_connection_clk (clk_125m_rgmii_rx_i), // mac_pcs_mac_rx_clock_connection.clk
	.mac_mac_rgmii_connection_rgmii_in   (rgmii_rx_i),   //        mac_mac_rgmii_connection.rgmii_in
	.mac_mac_rgmii_connection_rx_control (rgmii_rx_ctl_i), //                                .rx_control

	.mac_pcs_mac_tx_clock_connection_clk (clk_125m_mac_tx),  // mac_pcs_mac_tx_clock_connection.clk
	.mac_mac_rgmii_connection_rgmii_out  (rgmii_tx_o),  //                                .rgmii_out
	.mac_mac_rgmii_connection_tx_control (rgmii_tx_ctl_o), //                                .tx_control

	.mac_mac_mdio_connection_mdc         (mac_mdio_clk),    //   mac_mac_mdio_connection.mdc
	.mac_mac_mdio_connection_mdio_in     (mac_mdio_in),    //  .mdio_in
	.mac_mac_mdio_connection_mdio_out    (mac_mdio_out),    //  .mdio_out
	.mac_mac_mdio_connection_mdio_oen    (mac_mdio_oen)     //  .mdio_oen
);

logic mac_mdio_in, mac_mdio_out, mac_mdio_oen, mac_mdio_clk;
assign phy_mdio_mdc = mac_mdio_clk;
assign phy_mdio_mdio = ( mac_mdio_oen ) ? ( mac_mdio_out ) : ( 1'bz ); // Check OEN default value!!!
assign mac_mdio_in = phy_mdio_mdio;


endmodule