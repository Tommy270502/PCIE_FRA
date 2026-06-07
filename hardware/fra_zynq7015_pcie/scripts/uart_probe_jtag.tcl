# Probe the Zynq PS UART0/UART1 controller registers over JTAG to determine which
# UART the firmware is driving and at what baud. PS register space (0xE000_xxxx) is
# in the default memory map, so no loadhw is needed.

proc rd {a} { return [lindex [mrd -value $a] 0] }

connect
targets -set -nocase -filter {name =~ "*Cortex-A9*#0*"}

foreach {name base} {UART0 0xE0000000 UART1 0xE0001000} {
    set cr   [rd [expr {$base + 0x00}]]
    set mr   [rd [expr {$base + 0x04}]]
    set sr   [rd [expr {$base + 0x2C}]]
    set cd   [rd [expr {$base + 0x18}]]
    set bdiv [rd [expr {$base + 0x34}]]
    puts [format "%s CR=0x%08x MR=0x%08x SR=0x%08x CD=%d BDIV=%d" $name $cr $mr $sr $cd $bdiv]
    if {$cd != 0 && $bdiv != 0} {
        set b100 [expr {100000000 / ($cd * ($bdiv + 1))}]
        set b50  [expr {50000000  / ($cd * ($bdiv + 1))}]
        puts [format "  %s baud @100MHz_ref=%d  @50MHz_ref=%d" $name $b100 $b50]
    }
}
puts "UART_PROBE_DONE"
con
disconnect
exit
