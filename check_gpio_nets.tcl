
open_project D:/VIVADO_PROJECTS/bnn_bd/bnn_bd.xpr
open_bd_design [get_files bd.bd]

puts "=== CONNECTIONS OF ctrl_gpio ==="
foreach p [get_bd_pins ctrl_gpio/*] {
    set net [get_bd_nets -of_objects $p]
    if {$net ne ""} {
        puts "PIN $p -> NET $net"
    }
}

puts "=== CONNECTIONS OF SI5324_RST_OUT ==="
puts "SI5324_RST_OUT net: [get_bd_nets -of_objects [get_bd_ports SI5324_RST_OUT]]"

puts "=== CONNECTIONS OF const_vcc_phy ==="
foreach p [get_bd_pins const_vcc_phy/*] {
    puts "PIN $p -> NET [get_bd_nets -of_objects $p]"
}

close_project
exit
