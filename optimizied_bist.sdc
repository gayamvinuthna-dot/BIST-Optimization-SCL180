create_clock -name clk -period 5 [get_ports clk]

set_input_delay 1 -clock clk [all_inputs]

set_output_delay 1 -clock clk [all_outputs]

set_clock_transition -rise 0.10 [get_clocks clk]

set_clock_transition -fall 0.10 [get_clocks clk]

set_clock_latency -source 1.0 [get_clocks clk]

set_clock_latency 0.5 [get_clocks clk]

set_clock_uncertainty -setup 0.2 [get_clocks clk]

set_clock_uncertainty -hold 0.05 [get_clocks clk]

set_max_transition 0.30 [current_design]

set_max_fanout 4 [current_design]

set_load 0.03 [all_outputs]

set_false_path -from [get_ports rst]

set_wire_load_mode top
