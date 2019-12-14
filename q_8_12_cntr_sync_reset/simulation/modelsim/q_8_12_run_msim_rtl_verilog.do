transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_12_cntr_sync_reset {C:/Users/home/Downloads/digital_design/q_8_12_cntr_sync_reset/q_8_12.sv}

