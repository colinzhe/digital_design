transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/czhe/Documents/fpga_proj/four_bit_shift_ring_cntr {C:/Users/czhe/Documents/fpga_proj/four_bit_shift_ring_cntr/four_bit_shift_ring_cntr.v}

