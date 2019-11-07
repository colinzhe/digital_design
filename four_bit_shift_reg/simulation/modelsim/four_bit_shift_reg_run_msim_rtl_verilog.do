transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/home/Documents/Fpga_proj/four_bit_shift_reg {C:/Users/home/Documents/Fpga_proj/four_bit_shift_reg/four_bit_shift_reg.v}

