transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_8_9_fig_8_11 {C:/Users/czhe/Downloads/digital_design/q_8_9_fig_8_11/q_8_9_str.sv}

