transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/czhe/Downloads/digital_design/common {C:/Users/czhe/Downloads/digital_design/common/four_bit_sync_par_cntr.v}
vlog -vlog01compat -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_6_20 {C:/Users/czhe/Downloads/digital_design/q_6_20/q_6_20.v}

