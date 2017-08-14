# input clock 25 MHpz
create_clock -name input_clock -period 40 [get_ports {clk_25m_i}]

# Create a 125MHz clock and apply generated clocks to # the PLL outputs 
# pll|clk[0]: TX_CLK
#create_clock -name rgmii_tx_clock -period 8 [get_ports {clk_125m_MAC_tx}]
derive_pll_clocks

# Input clock from MAC_PHY IC
create_clock -name rgmii_rx_clock -period 8 [get_ports {clk_125m_rgmii_rx_i}]