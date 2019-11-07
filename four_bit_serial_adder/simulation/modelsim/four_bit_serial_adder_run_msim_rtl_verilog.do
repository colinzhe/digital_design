transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/home/Documents/Fpga_proj/common {C:/Users/home/Documents/Fpga_proj/common/full_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/home/Documents/Fpga_proj/common {C:/Users/home/Documents/Fpga_proj/common/four_bit_shift_reg.v}
vlog -vlog01compat -work work +incdir+C:/Users/home/Documents/Fpga_proj/four_bit_serial_adder {C:/Users/home/Documents/Fpga_proj/four_bit_serial_adder/four_bit_serial_adder.v}

