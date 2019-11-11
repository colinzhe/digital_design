transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_6_27_jk_7_state_counter {C:/Users/czhe/Downloads/digital_design/q_6_27_jk_7_state_counter/q_6_27.v}

