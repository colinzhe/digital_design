transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_8_26_bin_mult_add_shift_same_cycle {C:/Users/czhe/Downloads/digital_design/q_8_26_bin_mult_add_shift_same_cycle/q_8_26_pkg.sv}
vlog -sv -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_8_26_bin_mult_add_shift_same_cycle {C:/Users/czhe/Downloads/digital_design/q_8_26_bin_mult_add_shift_same_cycle/q_8_26.sv}

