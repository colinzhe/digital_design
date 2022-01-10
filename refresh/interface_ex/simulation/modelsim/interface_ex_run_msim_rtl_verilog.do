transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/colin/Downloads/digital_design/refresh/interface_ex {C:/Users/colin/Downloads/digital_design/refresh/interface_ex/interface_ex.sv}

