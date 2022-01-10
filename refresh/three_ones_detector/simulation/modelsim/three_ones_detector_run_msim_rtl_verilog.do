transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/colin/Downloads/digital_design/refresh/three_ones_detector {C:/Users/colin/Downloads/digital_design/refresh/three_ones_detector/three_ones_detector_pkg.sv}
vlog -sv -work work +incdir+C:/Users/colin/Downloads/digital_design/refresh/three_ones_detector {C:/Users/colin/Downloads/digital_design/refresh/three_ones_detector/three_ones_detector.sv}

