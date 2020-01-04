transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/bday {C:/Users/home/Downloads/digital_design/bday/bday_pkg.sv}
vlog -sv -work work +incdir+C:/Users/home/Downloads/digital_design/bday {C:/Users/home/Downloads/digital_design/bday/bday.sv}

