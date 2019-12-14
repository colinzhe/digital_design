transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_10_fig_p_8_10 {C:/Users/home/Downloads/digital_design/q_8_10_fig_p_8_10/q_8_10_pkg.sv}
vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_10_fig_p_8_10 {C:/Users/home/Downloads/digital_design/q_8_10_fig_p_8_10/q_8_10.sv}

