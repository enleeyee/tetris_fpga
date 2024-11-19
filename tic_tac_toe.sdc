# Create a clock constraint for the main clock (adjust the frequency as needed)
create_clock -name clk -period 20.000 [get_ports clk]

# Define input delay for push_buttons
set_input_delay -clock clk 2.000 [get_ports push_buttons*]

# Define output delay for VGA signals
set_output_delay -clock clk 2.000 [get_ports {vga_r vga_g vga_b h_sync v_sync}]
