## ADC clock output
set_property PACKAGE_PIN W18 [get_ports adc_clk_out_0]
set_property IOSTANDARD LVCMOS33 [get_ports adc_clk_out_0]

## DAC clock output
set_property PACKAGE_PIN Y13 [get_ports dac_clk_out_0]
set_property IOSTANDARD LVCMOS33 [get_ports dac_clk_out_0]

## ADC 8-bit data bus
set_property PACKAGE_PIN U14 [get_ports {adc_in_0[0]}]
set_property PACKAGE_PIN U13 [get_ports {adc_in_0[1]}]
set_property PACKAGE_PIN AB14 [get_ports {adc_in_0[2]}]
set_property PACKAGE_PIN AB13 [get_ports {adc_in_0[3]}]
set_property PACKAGE_PIN W15 [get_ports {adc_in_0[4]}]
set_property PACKAGE_PIN V15 [get_ports {adc_in_0[5]}]
set_property PACKAGE_PIN Y17 [get_ports {adc_in_0[6]}]
set_property PACKAGE_PIN W17 [get_ports {adc_in_0[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {adc_in_0[*]}]

## DAC 8-bit data bus
set_property PACKAGE_PIN Y12 [get_ports {dac_out_0[7]}]
set_property PACKAGE_PIN P2  [get_ports {dac_out_0[6]}]
set_property PACKAGE_PIN P3  [get_ports {dac_out_0[5]}]
set_property PACKAGE_PIN R7  [get_ports {dac_out_0[4]}]
set_property PACKAGE_PIN P7  [get_ports {dac_out_0[3]}]
set_property PACKAGE_PIN P8  [get_ports {dac_out_0[2]}]
set_property PACKAGE_PIN N8  [get_ports {dac_out_0[1]}]
set_property PACKAGE_PIN R2  [get_ports {dac_out_0[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {dac_out_0[*]}]