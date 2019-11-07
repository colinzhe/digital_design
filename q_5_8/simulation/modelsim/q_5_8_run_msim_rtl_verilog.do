transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/home/Documents/Fpga_proj/q_5_8 {C:/Users/home/Documents/Fpga_proj/q_5_8/q_5_8.v}

