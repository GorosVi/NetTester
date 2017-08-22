open_service master $m_path
puts "Enabling MAC network functionality"
# // with crc_fwd 0x168
        master_write_32  $m_path  [getAddr $MACbase $reg_command_config]  0x00002128
puts [ master_read_32   $m_path  [getAddr $MACbase $reg_command_config]  1  ]


puts "RX/TX ena"
# // with crc_fwd 0x16B
        master_write_32  $m_path  [getAddr $MACbase $reg_command_config]  0x0000012B
puts [ 	  ]

# close_service master $m_path
master_read_32 $m_path 0x2000 5