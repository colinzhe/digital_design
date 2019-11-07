transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/home/Documents/Fpga_proj/t_ff_d {C:/Users/home/Documents/Fpga_proj/t_ff_d/t_ff_d.v}
vlog -vlog01compat -work work +incdir+C:/Users/home/Documents/Fpga_proj/common {C:/Users/home/Documents/Fpga_proj/common/d_ff_3_sr_wr.v}

