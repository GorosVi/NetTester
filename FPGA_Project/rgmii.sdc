# Reference
#	AN 433: Constraining and Analyzing Source-Synchronous Interfaces.pdf


# *************************************************************
# The sdc below is based on the System Approach - Same Edge Capture Center Align
# *************************************************************

#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3

create_clock -name {clk_25} -period 40.000 -waveform { 0.000 20.000 } [get_ports {clk_25m_i}]

#set_false_path -from [get_registers {*ctrl_regs*}]


# 1000MHz: Period = 8ns		|	 100MHz: Period = 40ns	 |	 10MHz: Period = 400ns
set RX_CLK_125M_PERIOD	8
set RX_CLK_25M_PERIOD	40
set RX_CLK_2_5M_PERIOD	400

# 1000MHz: Period = 8ns		|	 100MHz: Period = 40ns	 |	 10MHz: Period = 400ns
set TX_CLK_125M_PERIOD	8
set TX_CLK_25M_PERIOD	40
set TX_CLK_2_5M_PERIOD	400


# Change the other clock name on the top level
set rgmii_rx_125M_virtualclk	"rgmii_rx_125M_virtualclk"
set rgmii_rx_25M_virtualclk	"rgmii_rx_25M_virtualclk"
set rgmii_rx_2_5M_virtualclk	"rgmii_rx_2_5M_virtualclk"

set rgmii_rx_125M_clk           "rgmii_rx_125M_clk"
set rgmii_rx_25M_clk            "rgmii_rx_25M_clk"
set rgmii_rx_2_5M_clk           "rgmii_rx_2_5M_clk"

# Change the name of rgmii interface on the top level
set rgmii_tx_clk_0     "trg_tx_clk_o"
set rgmii_out_0        "trg_txd_o"
set rgmii_tx_control_0 "trg_tx_ctrl_o"

set rgmii_rx_clk_0     "trg_rx_clk_i"
set rgmii_in_0         "trg_rxd_i"
set rgmii_rx_control_0 "trg_rx_ctrl_i"


#**************************************************************
# Board and External PHY
#**************************************************************

# Board Delay
# Assume trace delay, pin capacitance, and rise/fall time differences between data and\
clock are negligible.
set data_delay_max 		0
set data_delay_min		0
set clk_delay_max		0
set clk_delay_min		0

# External PHY Parameter (Refer to MarvelPHY 88EE1111)
# for tx
set tsu -0.9
set th 2.7

# for rx
set tco_max  0.8
set tco_min -0.8


#**************************************************************
# Create Clock
#**************************************************************
# Create clock with 90 degree shift for center align
create_clock -name "rgmii_rx_125M_clk_0" -period $RX_CLK_125M_PERIOD \
-waveform "[expr 0.25*$RX_CLK_125M_PERIOD] [expr 0.75*$RX_CLK_125M_PERIOD]" \
[get_ports "$rgmii_rx_clk_0"]

#**************************************************************
# Virtual Clock
#**************************************************************
# Virtual Clock is the clock outside the FPGA.  It is also used
# to differentiate the clock uncertainty between
# Input to Register, Register to Register and Output to Register


create_clock -name $rgmii_rx_125M_virtualclk 	-period $RX_CLK_125M_PERIOD


#**************************************************************
# Create Generated Clock
#**************************************************************

# Tx PLL
#**************************************************************
#create_clock -name clk_125M_0deg -source [ get_ports {tra_clk125m_i} ]
create_generated_clock -name clk_125M_0deg \
-source [get_ports {clk_25m_i}] \
[get_pins {mac_pll_inst|mac_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] \
-multiply_by 5

#**************************************************************


# RGMII TX CLOCK
#**************************************************************
# It doesn't use virtual clock as to include the delay generated by
# in the timing analysis

# -phase 90:Tells timing analysis that there is a phase-shift externaly.
# It have no effect inside the FPGA

create_generated_clock -name rgmii_125_tx_clk_0 \
-source [get_pins {mac_pll_inst|mac_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] \
-master_clock clk_125M_0deg \
-phase 90 \
[get_ports $rgmii_tx_clk_0]

#**************************************************************


#**************************************************************
# Set Clock Groups / Set False Path
#**************************************************************

#  Each group will be analyzed with its clock domain within the group
set_clock_groups -exclusive \
-group "clk_125M_0deg rgmii_125_tx_clk_0" \
-group "rgmii_rx_125M_clk_0 $rgmii_rx_125M_virtualclk"



#**************************************************************
# Derive Clock Uncertainty
#**************************************************************

derive_clock_uncertainty
derive_pll_clocks

#**************************************************************
# Transmit Side (External PHY Delay is Turn On)
#**************************************************************
# Same Edge Capture Center Align: launch at positive edge and latch at positive edge

# Determine the desired setup and hold relationship in order to
# let TimeQuest analyze only the correct pair of launch-latch setup and hold relationship

set_false_path \
-fall_from [get_clocks "clk_125M_0deg"] \
-rise_to [get_clocks "rgmii_125_tx_clk*"] \
-setup

set_false_path \
-rise_from [get_clocks "clk_125M_0deg"] \
-fall_to [get_clocks "rgmii_125_tx_clk*"] \
-setup

set_false_path \
-fall_from [get_clocks "clk_125M_0deg"] \
-fall_to [get_clocks "rgmii_125_tx_clk*"] \
-hold

set_false_path \
-rise_from [get_clocks "clk_125M_0deg"] \
-rise_to [get_clocks "rgmii_125_tx_clk*"] \
-hold

# --------------------------------------------------------
# Take setup and hold time of External Phy and path delay difference
# between data and clock into timing analysis consideration for 125M clock

# The formula to calculate the output delay is provided in AN433

# Set Output Deday
set_output_delay -clock rgmii_125_tx_clk_0 \
-max [expr  $data_delay_max + $tsu - $clk_delay_min] \
[get_ports "$rgmii_out_0* $rgmii_tx_control_0"] \
-add_delay

set_output_delay -clock rgmii_125_tx_clk_0 \
-max [expr  $data_delay_max + $tsu - $clk_delay_min] \
[get_ports "$rgmii_out_0* $rgmii_tx_control_0"] \
-clock_fall \
-add_delay

set_output_delay -clock rgmii_125_tx_clk_0 \
-min [expr  $data_delay_min - $th - $clk_delay_max] \
[get_ports "$rgmii_out_0* $rgmii_tx_control_0"] \
-add_delay

set_output_delay -clock rgmii_125_tx_clk_0 \
-min [expr  $data_delay_min - $th - $clk_delay_max] \
[get_ports "$rgmii_out_0* $rgmii_tx_control_0"] \
-clock_fall \
-add_delay

#**************************************************************
# Receiver Side (External PHY Delay is Turn On)
#**************************************************************
# Same Edge Capture Center Align: launch at positive edge and latch at positive edge

# Determine the desired setup and hold relationship in order to
# let TimeQuest analyze only the correct pair of launch-latch setup and hold relationship

set_false_path \
-fall_from [get_clocks "$rgmii_rx_125M_virtualclk"] \
-rise_to [get_clocks "rgmii_rx_125M_clk_0"] \
-setup

set_false_path \
-rise_from [get_clocks "$rgmii_rx_125M_virtualclk"] \
-fall_to [get_clocks "rgmii_rx_125M_clk_0"] \
-setup

set_false_path \
-fall_from [get_clocks "$rgmii_rx_125M_virtualclk"] \
-fall_to [get_clocks "rgmii_rx_125M_clk_0"] \
-hold

set_false_path \
-rise_from [get_clocks "$rgmii_rx_125M_virtualclk"] \
-rise_to [get_clocks "rgmii_rx_125M_clk_0"] \
-hold


# --------------------------------------------------------
# Take tco of External Phy and path delay difference between
# data and clock into timing analysis consideration for 125M clock

# The formula to calculate the input delay is provided in AN433

# Set Input Deday
set_input_delay -clock  [get_clocks $rgmii_rx_125M_virtualclk] \
-max [expr  $data_delay_max + $tco_max - $clk_delay_min] \
[get_ports "$rgmii_in_0* $rgmii_rx_control_0"] \
-add_delay

set_input_delay -clock  [get_clocks $rgmii_rx_125M_virtualclk] \
-max [expr  $data_delay_max + $tco_max - $clk_delay_min] \
[get_ports "$rgmii_in_0* $rgmii_rx_control_0"] \
-clock_fall \
-add_delay

set_input_delay -clock  [get_clocks $rgmii_rx_125M_virtualclk] \
-min [expr  $data_delay_min + $tco_min - $clk_delay_max] \
[get_ports "$rgmii_in_0* $rgmii_rx_control_0"] \
-add_delay

set_input_delay -clock  [get_clocks $rgmii_rx_125M_virtualclk] \
-min [expr  $data_delay_min + $tco_min - $clk_delay_max] \
[get_ports "$rgmii_in_0* $rgmii_rx_control_0"] \
-clock_fall \
-add_delay
