transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/home/Documents/Fpga_proj/four_to_two_line_encoder {C:/Users/home/Documents/Fpga_proj/four_to_two_line_encoder/four_to_two_pri_encoder_beh.v}

