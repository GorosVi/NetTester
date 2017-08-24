onerror {resume}
quietly WaveActivateNextPane {} 0
delete wave *

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib altera_reserved_qsys_timer
vmap altera_reserved_qsys_timer altera_reserved_qsys_timer
vlog -vlog01compat -work altera_reserved_qsys_timer +incdir+D:/MTK_2/FPGA_Project/rtl/ip/Timer/db/ip/timer/submodules {D:/MTK_2/FPGA_Project/rtl/ip/Timer/db/ip/timer/submodules/altera_reset_controller.v}
vlog -vlog01compat -work altera_reserved_qsys_timer +incdir+D:/MTK_2/FPGA_Project/rtl/ip/Timer/db/ip/timer/submodules {D:/MTK_2/FPGA_Project/rtl/ip/Timer/db/ip/timer/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work altera_reserved_qsys_timer +incdir+D:/MTK_2/FPGA_Project/rtl/ip/Timer/db/ip/timer {D:/MTK_2/FPGA_Project/rtl/ip/Timer/db/ip/timer/timer.v}
vlog -sv -work work +incdir+D:/MTK_2/FPGA_Project/rtl/ip/Timer {D:/MTK_2/FPGA_Project/rtl/ip/Timer/top_timer.sv}
vlog -sv -work altera_reserved_qsys_timer +incdir+D:/MTK_2/FPGA_Project/rtl/ip/Timer/db/ip/timer/submodules {D:/MTK_2/FPGA_Project/rtl/ip/Timer/db/ip/timer/submodules/timer_module.sv}

vlog -sv -work work +incdir+D:/MTK_2/FPGA_Project/rtl/ip/Timer {D:/MTK_2/FPGA_Project/rtl/ip/Timer/timer_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -L altera_reserved_qsys_timer -voptargs="+acc"  timer_tb

do wave.do


update
view structure
view signals
run -all

