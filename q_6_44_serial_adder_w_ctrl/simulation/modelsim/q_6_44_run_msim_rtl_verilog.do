transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_6_44_serial_adder_w_ctrl {C:/Users/czhe/Downloads/digital_design/q_6_44_serial_adder_w_ctrl/q_6_44.v}
vlog -vlog01compat -work work +incdir+C:/Users/czhe/Downloads/digital_design/common {C:/Users/czhe/Downloads/digital_design/common/four_bit_shift_reg.v}
vlog -vlog01compat -work work +incdir+C:/Users/czhe/Downloads/digital_design/common {C:/Users/czhe/Downloads/digital_design/common/full_adder.v}

