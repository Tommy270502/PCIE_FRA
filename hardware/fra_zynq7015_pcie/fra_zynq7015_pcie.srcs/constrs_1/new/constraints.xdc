## ADC clock output
set_property PACKAGE_PIN W18 [get_ports adc_clk_out_0]
set_property IOSTANDARD LVCMOS33 [get_ports adc_clk_out_0]

## DAC clock output
set_property PACKAGE_PIN Y13 [get_ports dac_clk_out_0]
set_property IOSTANDARD LVCMOS33 [get_ports dac_clk_out_0]

## The functional FRA core keeps all internal logic on the 50 MHz PS FCLK and
## exports a 25 MHz ADC/DAC clock from the clk_div register.
set fra_clk_div_pin [get_pins -quiet system_bd_i/fra_core_0/inst/clk_div_reg/C]
if {[llength $fra_clk_div_pin] > 0} {
    create_generated_clock -name adc_sample_clk -source $fra_clk_div_pin -divide_by 2 [get_ports adc_clk_out_0]
    create_generated_clock -name dac_sample_clk -source $fra_clk_div_pin -divide_by 2 [get_ports dac_clk_out_0]
}

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
if {[llength [get_clocks -quiet adc_sample_clk]] > 0} {
    set_input_delay -clock adc_sample_clk -max 5.000 [get_ports {adc_in_0[*]}]
    set_input_delay -clock adc_sample_clk -min 0.000 [get_ports {adc_in_0[*]}]
}

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
if {[llength [get_clocks -quiet dac_sample_clk]] > 0} {
    set_output_delay -clock dac_sample_clk -max 5.000 [get_ports {dac_out_0[*]}]
    set_output_delay -clock dac_sample_clk -min 0.000 [get_ports {dac_out_0[*]}]
}
