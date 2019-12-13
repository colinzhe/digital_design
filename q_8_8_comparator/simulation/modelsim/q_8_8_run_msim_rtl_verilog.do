transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_8_comparator {C:/Users/home/Downloads/digital_design/q_8_8_comparator/q_8_8_pkg.sv}
vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_8_comparator {C:/Users/home/Downloads/digital_design/q_8_8_comparator/q_8_8.sv}

