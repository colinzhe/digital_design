transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/home/Downloads/digital_design/q_6_43_shift_reg_w_ctrl {C:/Users/home/Downloads/digital_design/q_6_43_shift_reg_w_ctrl/q_6_43.v}

