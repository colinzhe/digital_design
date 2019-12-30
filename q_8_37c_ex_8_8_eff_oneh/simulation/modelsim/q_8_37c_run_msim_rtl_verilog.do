transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_8_37c_ex_8_8_eff_oneh {C:/Users/czhe/Downloads/digital_design/q_8_37c_ex_8_8_eff_oneh/q_8_37c_pkg.sv}
vlog -sv -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_8_37c_ex_8_8_eff_oneh {C:/Users/czhe/Downloads/digital_design/q_8_37c_ex_8_8_eff_oneh/q_8_37c_oneh_cntlr.sv}
vlog -sv -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_8_37c_ex_8_8_eff_oneh {C:/Users/czhe/Downloads/digital_design/q_8_37c_ex_8_8_eff_oneh/q_8_37c.sv}

