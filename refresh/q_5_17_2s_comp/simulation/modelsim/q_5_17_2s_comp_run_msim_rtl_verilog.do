transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/colin/Downloads/digital_design/refresh/q_5_17_2s_comp {C:/Users/colin/Downloads/digital_design/refresh/q_5_17_2s_comp/q5_17_2s_comp_pkg.sv}
vlog -sv -work work +incdir+C:/Users/colin/Downloads/digital_design/refresh/q_5_17_2s_comp {C:/Users/colin/Downloads/digital_design/refresh/q_5_17_2s_comp/q5_17_2s_comp_2.sv}
