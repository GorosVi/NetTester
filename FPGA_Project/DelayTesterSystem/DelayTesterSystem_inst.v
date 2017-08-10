	DelayTesterSystem u0 (
		.mac_mac_mdio_connection_mdc         (<connected-to-mac_mac_mdio_connection_mdc>),         //         mac_mac_mdio_connection.mdc
		.mac_mac_mdio_connection_mdio_in     (<connected-to-mac_mac_mdio_connection_mdio_in>),     //                                .mdio_in
		.mac_mac_mdio_connection_mdio_out    (<connected-to-mac_mac_mdio_connection_mdio_out>),    //                                .mdio_out
		.mac_mac_mdio_connection_mdio_oen    (<connected-to-mac_mac_mdio_connection_mdio_oen>),    //                                .mdio_oen
		.mac_mac_rgmii_connection_rgmii_in   (<connected-to-mac_mac_rgmii_connection_rgmii_in>),   //        mac_mac_rgmii_connection.rgmii_in
		.mac_mac_rgmii_connection_rgmii_out  (<connected-to-mac_mac_rgmii_connection_rgmii_out>),  //                                .rgmii_out
		.mac_mac_rgmii_connection_rx_control (<connected-to-mac_mac_rgmii_connection_rx_control>), //                                .rx_control
		.mac_mac_rgmii_connection_tx_control (<connected-to-mac_mac_rgmii_connection_tx_control>), //                                .tx_control
		.mac_pcs_mac_rx_clock_connection_clk (<connected-to-mac_pcs_mac_rx_clock_connection_clk>), // mac_pcs_mac_rx_clock_connection.clk
		.mac_pcs_mac_tx_clock_connection_clk (<connected-to-mac_pcs_mac_tx_clock_connection_clk>), // mac_pcs_mac_tx_clock_connection.clk
		.qsys_system_clk_clk                 (<connected-to-qsys_system_clk_clk>),                 //                 qsys_system_clk.clk
		.qsys_system_reset_reset_n           (<connected-to-qsys_system_reset_reset_n>)            //               qsys_system_reset.reset_n
	);

