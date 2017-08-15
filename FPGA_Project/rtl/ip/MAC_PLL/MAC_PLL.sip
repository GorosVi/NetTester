set_global_assignment -entity "MAC_PLL" -library "lib_MAC_PLL" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "MAC_PLL" -library "lib_MAC_PLL" -name IP_TOOL_VERSION "13.0sp1"
set_global_assignment -entity "MAC_PLL" -library "lib_MAC_PLL" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_MAC_PLL" -name SPD_FILE [file join $::quartus(sip_path) "MAC_PLL.spd"]

set_global_assignment -library "lib_MAC_PLL" -name MISC_FILE [file join $::quartus(sip_path) "MAC_PLL_sim/MAC_PLL.vo"]
