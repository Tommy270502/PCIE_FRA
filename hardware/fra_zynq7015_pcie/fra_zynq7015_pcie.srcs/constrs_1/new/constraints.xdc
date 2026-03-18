## PL clock
set_property PACKAGE_PIN Y14 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -name pl_clk -period 20.000 [get_ports clk]

###############################################################################
# User button (Expansion board)
###############################################################################
# Active-low when pressed
set_property -dict { PACKAGE_PIN AB12 IOSTANDARD LVCMOS33 PULLUP true } [get_ports { reset_n }]

## ADC clock output
set_property PACKAGE_PIN W18 [get_ports adc_clk_out]
set_property IOSTANDARD LVCMOS33 [get_ports adc_clk_out]

## DAC clock output
set_property PACKAGE_PIN Y13 [get_ports dac_clk_out]
set_property IOSTANDARD LVCMOS33 [get_ports dac_clk_out]

## ADC 8-bit data bus
set_property PACKAGE_PIN U14 [get_ports {adc_in[0]}]
set_property PACKAGE_PIN U13 [get_ports {adc_in[1]}]
set_property PACKAGE_PIN AB14 [get_ports {adc_in[2]}]
set_property PACKAGE_PIN AB13 [get_ports {adc_in[3]}]
set_property PACKAGE_PIN W15 [get_ports {adc_in[4]}]
set_property PACKAGE_PIN V15 [get_ports {adc_in[5]}]
set_property PACKAGE_PIN Y17 [get_ports {adc_in[6]}]
set_property PACKAGE_PIN W17 [get_ports {adc_in[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {adc_in[*]}]

## DAC 8-bit data bus
set_property PACKAGE_PIN Y12 [get_ports {dac_out[7]}]
set_property PACKAGE_PIN P2  [get_ports {dac_out[6]}]
set_property PACKAGE_PIN P3  [get_ports {dac_out[5]}]
set_property PACKAGE_PIN R7  [get_ports {dac_out[4]}]
set_property PACKAGE_PIN P7  [get_ports {dac_out[3]}]
set_property PACKAGE_PIN P8  [get_ports {dac_out[2]}]
set_property PACKAGE_PIN N8  [get_ports {dac_out[1]}]
set_property PACKAGE_PIN R2  [get_ports {dac_out[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {dac_out[*]}]