transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_6_51_seq_detector {C:/Users/czhe/Downloads/digital_design/q_6_51_seq_detector/q_6_51.v}

