onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /timer_tb/clk
add wave -noupdate /timer_tb/reset_n
add wave -noupdate -radix hexadecimal -childformat {{{/timer_tb/timer_out[31]} -radix hexadecimal} {{/timer_tb/timer_out[30]} -radix hexadecimal} {{/timer_tb/timer_out[29]} -radix hexadecimal} {{/timer_tb/timer_out[28]} -radix hexadecimal} {{/timer_tb/timer_out[27]} -radix hexadecimal} {{/timer_tb/timer_out[26]} -radix hexadecimal} {{/timer_tb/timer_out[25]} -radix hexadecimal} {{/timer_tb/timer_out[24]} -radix hexadecimal} {{/timer_tb/timer_out[23]} -radix hexadecimal} {{/timer_tb/timer_out[22]} -radix hexadecimal} {{/timer_tb/timer_out[21]} -radix hexadecimal} {{/timer_tb/timer_out[20]} -radix hexadecimal} {{/timer_tb/timer_out[19]} -radix hexadecimal} {{/timer_tb/timer_out[18]} -radix hexadecimal} {{/timer_tb/timer_out[17]} -radix hexadecimal} {{/timer_tb/timer_out[16]} -radix hexadecimal} {{/timer_tb/timer_out[15]} -radix hexadecimal} {{/timer_tb/timer_out[14]} -radix hexadecimal} {{/timer_tb/timer_out[13]} -radix hexadecimal} {{/timer_tb/timer_out[12]} -radix hexadecimal} {{/timer_tb/timer_out[11]} -radix hexadecimal} {{/timer_tb/timer_out[10]} -radix hexadecimal} {{/timer_tb/timer_out[9]} -radix hexadecimal} {{/timer_tb/timer_out[8]} -radix hexadecimal} {{/timer_tb/timer_out[7]} -radix hexadecimal} {{/timer_tb/timer_out[6]} -radix hexadecimal} {{/timer_tb/timer_out[5]} -radix hexadecimal} {{/timer_tb/timer_out[4]} -radix hexadecimal} {{/timer_tb/timer_out[3]} -radix hexadecimal} {{/timer_tb/timer_out[2]} -radix hexadecimal} {{/timer_tb/timer_out[1]} -radix hexadecimal} {{/timer_tb/timer_out[0]} -radix hexadecimal}} -subitemconfig {{/timer_tb/timer_out[31]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[30]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[29]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[28]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[27]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[26]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[25]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[24]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[23]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[22]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[21]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[20]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[19]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[18]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[17]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[16]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[15]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[14]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[13]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[12]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[11]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[10]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[9]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[8]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[7]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[6]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[5]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[4]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[3]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[2]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[1]} {-height 15 -radix hexadecimal} {/timer_tb/timer_out[0]} {-height 15 -radix hexadecimal}} /timer_tb/timer_out
add wave -noupdate /timer_tb/dut_timer/simple_timer_0/srst_n_i
add wave -noupdate -radix hexadecimal /timer_tb/dut_timer/simple_timer_0/count_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {578 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 179
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {956 ps}
