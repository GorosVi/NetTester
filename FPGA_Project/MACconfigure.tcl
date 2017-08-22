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
       master_write_32  $m_path  [getAddr $MACbase $reg_tx_almost_full]   3
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
# // with crc_fwd 0x168
        master_write_32  $m_path  [getAddr $MACbase $reg_command_config]  0x00000128
puts [ master_read_32   $m_path  [getAddr $MACbase $reg_command_config]  1  ]


puts "RX/TX ena"
# // with crc_fwd 0x16B
        master_write_32  $m_path  [getAddr $MACbase $reg_command_config]  0x0000012B
puts [ master_read_32   $m_path  [getAddr $MACbase $reg_command_config]  1  ]

# close_service master $m_path

# Command line hint
# source "D:/MTK_2/FPGA_Project/MACconfigure.tcl"
# source "D:/MTK_2/FPGA_Project/MACreadNclear.tcl"
