# Probe util_ds_buf (IBUFDS_GTE2 mode) ports for the refclk buffer.
set part xc7z015clg485-2
create_project -in_memory -part $part dsbuf
create_bd_design tmp
set c [create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf util_ds_buf_0]
puts "VLNV = [get_property VLNV $c]"
set_property -dict [list CONFIG.C_BUF_TYPE {IBUFDSGTE}] $c
puts "\n#### CONFIG ####"
foreach p {CONFIG.C_BUF_TYPE CONFIG.C_SIZE} { catch { puts "  $p = [get_property $p $c]" } }
puts "\n#### INTERFACE PINS ####"
foreach ip [get_bd_intf_pins -of_objects $c] { puts "  [get_property MODE $ip] [get_property VLNV $ip] $ip" }
puts "\n#### PINS ####"
foreach p [get_bd_pins -of_objects $c] { puts "  [get_property DIR $p] $p (L=[get_property LEFT $p] R=[get_property RIGHT $p])" }
puts "DONE"
