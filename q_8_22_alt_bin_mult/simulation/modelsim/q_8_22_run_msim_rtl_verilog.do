transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_8_22_alt_bin_mult {C:/Users/czhe/Downloads/digital_design/q_8_22_alt_bin_mult/q_8_22_pkg.sv}
vlog -sv -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_8_22_alt_bin_mult {C:/Users/czhe/Downloads/digital_design/q_8_22_alt_bin_mult/q_8_22.sv}

