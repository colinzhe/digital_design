transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/czhe/Downloads/digital_design/q_8_34d_oneh_cntlr {C:/Users/czhe/Downloads/digital_design/q_8_34d_oneh_cntlr/q_8_34d.sv}
