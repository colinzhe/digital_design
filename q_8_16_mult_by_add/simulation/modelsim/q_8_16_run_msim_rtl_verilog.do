transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_16_mult_by_add {C:/Users/home/Downloads/digital_design/q_8_16_mult_by_add/q_8_16_pkg.sv}
vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_16_mult_by_add {C:/Users/home/Downloads/digital_design/q_8_16_mult_by_add/q_8_16.sv}

