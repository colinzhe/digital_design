transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/czhe/Documents/fpga_proj/four_bit_sync_cntr_beh {C:/Users/czhe/Documents/fpga_proj/four_bit_sync_cntr_beh/four_bit_sync_cntr_beh.v}

