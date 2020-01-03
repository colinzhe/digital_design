transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_42_count_ones_latency {C:/Users/home/Downloads/digital_design/q_8_42_count_ones_latency/q_8_42_pkg.sv}
vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_42_count_ones_latency {C:/Users/home/Downloads/digital_design/q_8_42_count_ones_latency/q_8_42_datapath.sv}
vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_42_count_ones_latency {C:/Users/home/Downloads/digital_design/q_8_42_count_ones_latency/q_8_42_cntlr.sv}
vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/q_8_42_count_ones_latency {C:/Users/home/Downloads/digital_design/q_8_42_count_ones_latency/q_8_42.sv}

