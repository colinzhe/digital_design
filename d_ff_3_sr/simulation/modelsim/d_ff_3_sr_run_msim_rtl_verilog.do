transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/home/Documents/Fpga_proj/common {C:/Users/home/Documents/Fpga_proj/common/sr_latch.v}
vlog -vlog01compat -work work +incdir+C:/Users/home/Documents/Fpga_proj/d_ff_3_sr {C:/Users/home/Documents/Fpga_proj/d_ff_3_sr/d_ff_3_sr.v}

