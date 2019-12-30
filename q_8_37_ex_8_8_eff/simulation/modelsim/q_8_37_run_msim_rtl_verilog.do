transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_8_37_ex_8_8_eff {C:/Users/czhe/Downloads/digital_design/q_8_37_ex_8_8_eff/q_8_37_pkg.sv}
vlog -sv -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_8_37_ex_8_8_eff {C:/Users/czhe/Downloads/digital_design/q_8_37_ex_8_8_eff/q_8_37.sv}

