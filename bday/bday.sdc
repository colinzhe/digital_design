create_clock -name clk -period "50MHz" [get_ports clk]
set_false_path -from * -to [get_ports rst_b]
set_false_path -from * -to [get_ports start]
