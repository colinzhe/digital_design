transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_41_decimator {C:/Users/home/Downloads/digital_design/q_8_41_decimator/q_8_41_datapath.sv}
vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_41_decimator {C:/Users/home/Downloads/digital_design/q_8_41_decimator/q_8_41_pkg.sv}
vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_41_decimator {C:/Users/home/Downloads/digital_design/q_8_41_decimator/q_8_41_controller.sv}
vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_41_decimator {C:/Users/home/Downloads/digital_design/q_8_41_decimator/q_8_41.sv}
