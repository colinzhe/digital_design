transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/czhe/Downloads/digital_design/fig_7_6_4x4_ram {C:/Users/czhe/Downloads/digital_design/fig_7_6_4x4_ram/four_by_four_ram.v}
vlog -vlog01compat -work work +incdir+C:/Users/czhe/Downloads/digital_design/common {C:/Users/czhe/Downloads/digital_design/common/binary_cell.v}

