transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_6_25_six_timing_ring {C:/Users/czhe/Downloads/digital_design/q_6_25_six_timing_ring/q_6_25_ring.v}

