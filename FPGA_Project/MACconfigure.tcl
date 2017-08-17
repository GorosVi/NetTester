set m_path [lindex [get_service_paths master] 0]
open_service master $m_path

# Get register absolute address
proc getAddr {base reg} {
	expr ( ($base + $reg ) * 4 )
}

# MAC Avalon-MM base address
set MACbase 0x00001000

# MAC Avalon-MM register relative addresses
set reg_rev              0x00
set reg_scratch          0x01
set reg_command_config   0x02
set reg_mac_0            0x03
set reg_mac_1            0x04
set reg_frm_length       0x05
set reg_pause_quant      0x06
set reg_rx_section_empty 0x07
set reg_rx_section_full  0x08
set reg_tx_section_empty 0x09
set reg_tx_section_full  0x0A
set reg_rx_almost_empty  0x0B
set reg_rx_almost_full   0x0C
set reg_tx_almost_empty  0x0D
set reg_tx_almost_full   0x0E
set reg_mdio_addr0       0x0F
set reg_mdio_addr1       0x10
set reg_holdoff_quant    0x11
set reg_tx_ipg_length    0x17
# Base address of PHY registers mapping
set reg_phy0_base        0x80

puts "Reading MAC memory"
puts [ master_read_32   $m_path  [getAddr $MACbase 0x00] 6 ]

puts "Testing write access to scratch register (output should be 0xdeadbeef)"
       master_write_32  $m_path  [getAddr $MACbase $reg_scratch]  0xdeadbeef
puts [ master_read_32   $m_path  [getAddr $MACbase $reg_scratch]  1  ]


puts "Setting up MAC address (00:21:CE:28:00:16)"
# 00:21:CE:28:00:16
set MAC_high 0x28CE2100
set MAC_low  0x00001600
       master_write_32  $m_path  [getAddr $MACbase $reg_mac_0]  $MAC_high
       master_write_32  $m_path  [getAddr $MACbase $reg_mac_1]  $MAC_low
puts [ master_read_32   $m_path  [getAddr $MACbase $reg_mac_0]  2  ]

puts "Reading FRM_Length value (1518 == 0x5ee)"
puts [ master_read_32   $m_path  [getAddr $MACbase $reg_frm_length]  1  ]

puts "Setting rx_section full/empty and tx_section full/empty"
set FIFOdepth 64
       master_write_32  $m_path  [getAddr $MACbase $reg_rx_section_empty]  [expr ( $FIFOdepth - 16 )]
       master_write_32  $m_path  [getAddr $MACbase $reg_rx_section_full]   16
       master_write_32  $m_path  [getAddr $MACbase $reg_tx_section_empty]  [expr ( $FIFOdepth - 16 )]
       master_write_32  $m_path  [getAddr $MACbase $reg_tx_section_full]   16
puts [ master_read_32   $m_path  [getAddr $MACbase $reg_rx_section_empty]  4  ]

puts "Setting rx_almost full/empty and tx_almost full/empty"
       master_write_32  $m_path  [getAddr $MACbase $reg_rx_almost_empty]  8
       master_write_32  $m_path  [getAddr $MACbase $reg_rx_almost_full]   8
       master_write_32  $m_path  [getAddr $MACbase $reg_tx_almost_empty]  8
       master_write_32  $m_path  [getAddr $MACbase $reg_tx_almost_full]   8
puts [ master_read_32   $m_path  [getAddr $MACbase $reg_rx_almost_empty]  4  ]

# This design uses port A of board Ethond 1.0
# MDIO addr of PHY 88E1512 is 0x00000
puts "Setting PHY MDIO address"
set PHYmdioAddr 0x00000
       master_write_32  $m_path  [getAddr $MACbase $reg_mdio_addr0]  $PHYmdioAddr
puts [ master_read_32   $m_path  [getAddr $MACbase $reg_mdio_addr0]  1  ]

puts "Setting inter-packet gap length"
       master_write_32  $m_path  [getAddr $MACbase $reg_tx_ipg_length]  12
puts [ master_read_32   $m_path  [getAddr $MACbase $reg_tx_ipg_length]  1  ]


# check all results!


puts "Enabling MAC network functionality"
        master_write_32  $m_path  [getAddr $MACbase $reg_command_config]  0x00000168
puts [ master_read_32   $m_path  [getAddr $MACbase $reg_command_config]  1  ]


puts "RX/TX ena"
        master_write_32  $m_path  [getAddr $MACbase $reg_command_config]  0x0000016B
puts [ master_read_32   $m_path  [getAddr $MACbase $reg_command_config]  1  ]

close_service master $m_path


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
# # RESET!


open_service master $m_path
# puts [ master_read_32   $m_path  [getAddr $MACbase 0x18]  0x20  ]

set stat_frames_rx_ok 0x1B
puts "Received correct frames (0x1B)"
puts [ master_read_32   $m_path  [getAddr $MACbase $stat_frames_rx_ok]  1  ]

set stat_frames_rx_all 0x2D
puts "Received errored and good frames (0x2D)"
puts [ master_read_32   $m_path  [getAddr $MACbase $stat_frames_rx_all]  1  ]


set stat_frames_tx_ok 0x1A
puts "Transmitted correct frames (0x1A)"
puts [ master_read_32   $m_path  [getAddr $MACbase $stat_frames_tx_ok]  1  ]

set stat_frames_tx_err 0x23
puts "Transmitted error frames (FIFO ovf/uf, user errors) (0x23)"
puts [ master_read_32   $m_path  [getAddr $MACbase $stat_frames_tx_err]  1  ]


puts "Total received bytes (0x3E:0x2C)"
set stat_bytes_rx_all_l 0x2C
set stat_bytes_rx_all_h 0x3E

set reg_low  [ master_read_32   $m_path  [getAddr $MACbase $stat_bytes_rx_all_l]  1  ]
set reg_high [ master_read_32   $m_path  [getAddr $MACbase $stat_bytes_rx_all_h]  1  ]

puts "$reg_high $reg_low"

puts "Correct received bytes (0x1F:0x3D)"
set stat_bytes_rx_ok_l 0x1F
set stat_bytes_rx_ok_h 0x3D

set reg_low  [ master_read_32   $m_path  [getAddr $MACbase $stat_bytes_rx_ok_l]  1  ]
set reg_high [ master_read_32   $m_path  [getAddr $MACbase $stat_bytes_rx_ok_h]  1  ]

puts "$reg_high $reg_low"


puts "Correct transmitted bytes (0x1E:0x3C)"
set stat_bytes_tx_ok_l 0x1E
set stat_bytes_tx_ok_h 0x3C

set reg_low  [ master_read_32   $m_path  [getAddr $MACbase $stat_bytes_tx_ok_l]  1  ]
set reg_high [ master_read_32   $m_path  [getAddr $MACbase $stat_bytes_tx_ok_h]  1  ]

puts "$reg_high $reg_low"

