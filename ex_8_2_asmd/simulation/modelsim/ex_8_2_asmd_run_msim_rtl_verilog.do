transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/czhe/Downloads/digital_design/ex_8_2_asmd {C:/Users/czhe/Downloads/digital_design/ex_8_2_asmd/ex_8_2_asmd.sv}

