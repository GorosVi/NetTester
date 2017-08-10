
module DelayTesterSystem (
	mac_mac_mdio_connection_mdc,
	mac_mac_mdio_connection_mdio_in,
	mac_mac_mdio_connection_mdio_out,
	mac_mac_mdio_connection_mdio_oen,
	mac_mac_rgmii_connection_rgmii_in,
	mac_mac_rgmii_connection_rgmii_out,
	mac_mac_rgmii_connection_rx_control,
	mac_mac_rgmii_connection_tx_control,
	mac_pcs_mac_rx_clock_connection_clk,
	mac_pcs_mac_tx_clock_connection_clk,
	qsys_system_clk_clk,
	qsys_system_reset_reset_n);	

	output		mac_mac_mdio_connection_mdc;
	input		mac_mac_mdio_connection_mdio_in;
	output		mac_mac_mdio_connection_mdio_out;
	output		mac_mac_mdio_connection_mdio_oen;
	input	[3:0]	mac_mac_rgmii_connection_rgmii_in;
	output	[3:0]	mac_mac_rgmii_connection_rgmii_out;
	input		mac_mac_rgmii_connection_rx_control;
	output		mac_mac_rgmii_connection_tx_control;
	input		mac_pcs_mac_rx_clock_connection_clk;
	input		mac_pcs_mac_tx_clock_connection_clk;
	input		qsys_system_clk_clk;
	input		qsys_system_reset_reset_n;
endmodule
