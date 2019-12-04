transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/ex_8_7_alg {C:/Users/home/Downloads/digital_design/ex_8_7_alg/ex_8_7_alg.sv}

