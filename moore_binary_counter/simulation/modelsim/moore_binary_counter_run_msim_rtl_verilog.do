transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/home/Documents/Fpga_proj/moore_binary_counter {C:/Users/home/Documents/Fpga_proj/moore_binary_counter/moore_binary_counter_str.v}

