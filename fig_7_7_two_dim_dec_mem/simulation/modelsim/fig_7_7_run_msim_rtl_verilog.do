transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/home/Downloads/digital_design/fig_7_7_two_dim_dec_mem {C:/Users/home/Downloads/digital_design/fig_7_7_two_dim_dec_mem/fig_7_7.v}
vlog -vlog01compat -work work +incdir+C:/Users/home/Downloads/digital_design/common {C:/Users/home/Downloads/digital_design/common/binary_cell.v}

