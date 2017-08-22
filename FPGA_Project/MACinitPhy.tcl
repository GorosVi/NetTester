# PHY configuration - not used because 88e1512 starts with correct settings by default

# open_service master $m_path
# puts "Testing MAC register readability"
# puts [ master_read_32   $m_path  [getAddr $MACbase $reg_phy0_base]  10  ]

# # PHY starts in RGMII mode by default
# set phy_page_reg   22

# # Page 2 registers
# set phy_scr_page   2
# set phy_scr_reg    21
# set phy_rx_delay   [ expr ( 1 << 5 ) ]
# set phy_tx_delay   [ expr ( 1 << 4 ) ]

# puts "Configuring RX and TX delay"
#        # master_write_32  $m_path  [getAddr $MACbase [getAddr $reg_phy0_base $phy_page_reg ]]  1
# puts [ master_read_32   $m_path  [getAddr $MACbase 0x96]  1  ]
# puts "Changing page and checking"
#        master_write_32  $m_path  [getAddr $MACbase 0x96]  $phy_scr_page
# puts [ master_read_32   $m_path  [getAddr $MACbase 0x96]  1  ]

# #       master_write_32  $m_path  [getAddr $MACbase 0x95]  $phy_scr_page
# set reg [ master_read_32   $m_path  [getAddr $MACbase 0x95]  1  ]
# puts $reg
# set reg [ expr ( $reg | phy_rx_delay | phy_tx_delay ) ]
# puts $reg
#        master_write_32  $m_path  [getAddr $MACbase 0x96]  $phy_scr_page
# # PHY RESET!