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

#reset counters
puts "MAC statistics reset"
        master_write_32  $m_path  [getAddr $MACbase $reg_command_config]  0x8000012B
puts [ master_read_32   $m_path  [getAddr $MACbase $reg_command_config]  1  ]
