transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/czhe/Downloads/digital_design/four_bit_bcd_rip_tff_cntr {C:/Users/czhe/Downloads/digital_design/four_bit_bcd_rip_tff_cntr/four_bit_bcd_rip_tff_cntr.v}

