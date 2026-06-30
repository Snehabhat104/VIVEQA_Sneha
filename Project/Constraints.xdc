create_clock -period 41.667 -name sys_clk [get_ports clk_24mhz]

set_property PACKAGE_PIN D13 [get_ports clk_24mhz]
set_property IOSTANDARD LVCMOS33 [get_ports clk_24mhz]

set_property PACKAGE_PIN T2 [get_ports servo_pwm]
set_property IOSTANDARD LVCMOS33 [get_ports servo_pwm]



set_property PACKAGE_PIN T3 [get_ports trig]
set_property IOSTANDARD LVCMOS33 [get_ports trig]

set_property PACKAGE_PIN R3 [get_ports echo]
set_property IOSTANDARD LVCMOS33 [get_ports echo]

set_property PACKAGE_PIN T4 [get_ports uart_tx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]

set_property PACKAGE_PIN D5  [get_ports {led[0]}]
set_property PACKAGE_PIN A3  [get_ports {led[1]}]
set_property PACKAGE_PIN B4  [get_ports {led[2]}]
set_property PACKAGE_PIN A4  [get_ports {led[3]}]
set_property PACKAGE_PIN E6  [get_ports {led[4]}]
set_property PACKAGE_PIN C13 [get_ports {led[5]}]
set_property PACKAGE_PIN C14 [get_ports {led[6]}]
set_property PACKAGE_PIN D14 [get_ports {led[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]