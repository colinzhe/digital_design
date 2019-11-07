transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/czhe/Documents/fpga_proj/q_6_7_beh {C:/Users/czhe/Documents/fpga_proj/q_6_7_beh/q_6_7_beh.v}

