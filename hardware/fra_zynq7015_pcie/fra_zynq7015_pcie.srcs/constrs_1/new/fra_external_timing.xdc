## Applied during implementation, after the fra_core hierarchy is available.
## The DAC clock is inverted so data changes on its falling edge and meets the
## AD9708 positive-edge setup requirement.
set fra_clk_div_pin [get_pins -quiet system_bd_i/fra_core_0/inst/clk_div_reg/C]
if {[llength $fra_clk_div_pin] != 1} {
    error "Expected one FRA clk_div register clock pin, found [llength $fra_clk_div_pin]"
}

create_generated_clock -name adc_sample_clk -source $fra_clk_div_pin -divide_by 2 [get_ports adc_clk_out_0]
create_generated_clock -name dac_sample_clk -source $fra_clk_div_pin -divide_by 2 -invert [get_ports dac_clk_out_0]

set_input_delay -clock adc_sample_clk -max 5.000 [get_ports {adc_in_0[*]}]
set_input_delay -clock adc_sample_clk -min 0.000 [get_ports {adc_in_0[*]}]
set_output_delay -clock dac_sample_clk -max 5.000 [get_ports {dac_out_0[*]}]
set_output_delay -clock dac_sample_clk -min 0.000 [get_ports {dac_out_0[*]}]
