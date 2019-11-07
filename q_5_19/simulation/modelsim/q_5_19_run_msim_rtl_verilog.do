transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/home/Documents/Fpga_proj/q_5_19 {C:/Users/home/Documents/Fpga_proj/q_5_19/q_5_19.v}

