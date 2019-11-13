transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_6_40_8b_ring_cntr {C:/Users/czhe/Downloads/digital_design/q_6_40_8b_ring_cntr/q_6_40.v}

