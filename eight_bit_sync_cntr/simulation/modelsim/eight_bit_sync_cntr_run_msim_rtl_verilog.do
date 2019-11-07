transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/home/Documents/Fpga_proj/eight_bit_sync_cntr {C:/Users/home/Documents/Fpga_proj/eight_bit_sync_cntr/eight_bit_sync_cntr.v}
vlog -vlog01compat -work work +incdir+C:/Users/home/Documents/Fpga_proj/common {C:/Users/home/Documents/Fpga_proj/common/four_bit_sync_cntr.v}

