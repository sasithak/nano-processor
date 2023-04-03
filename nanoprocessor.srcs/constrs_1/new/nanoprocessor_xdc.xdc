# clock signal
set_property PACKAGE_PIN W5 [get_ports {clk}]
    set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
        create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}]

# mapping LD0 - LD3 to s_led bus (outputs from the AU)
set_property PACKAGE_PIN U16 [get_ports {s_led[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {s_led[0]}]
set_property PACKAGE_PIN E19 [get_ports {s_led[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {s_led[1]}]
set_property PACKAGE_PIN U19 [get_ports {s_led[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {s_led[2]}]
set_property PACKAGE_PIN V19 [get_ports {s_led[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {s_led[3]}]

# mapping CA-CG 7Seg to s_seg
set_property PACKAGE_PIN W7 [get_ports {s_seg[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {s_seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {s_seg[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {s_seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {s_seg[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {s_seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {s_seg[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {s_seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {s_seg[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {s_seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {s_seg[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {s_seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {s_seg[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {s_seg[6]}]

# mapping LD14 to Zero flag
set_property PACKAGE_PIN P1 [get_ports {Zero}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Zero}]

# mapping LD15 to Overflow flag
set_property PACKAGE_PIN L1 [get_ports {Overflow}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Overflow}]

# mapping btnC to clr - reset button
set_property PACKAGE_PIN U18 [get_ports {clr}]
    set_property IOSTANDARD LVCMOS33 [get_ports {clr}]