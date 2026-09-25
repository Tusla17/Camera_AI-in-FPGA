
open_project D:/VIVADO_PROJECTS/bnn_bd/bnn_bd.xpr
open_bd_design [get_files bd.bd]

puts "=== ALL BD CELLS ==="
foreach c [get_bd_cells *] {
    puts "CELL: $c ([get_property VLNV $c])"
}

puts "=== ALL BD PORTS ==="
foreach p [get_bd_ports *] {
    puts "PORT: $p (DIR: [get_property DIR $p], TYPE: [get_property TYPE $p])"
}

puts "=== ALL BD INTF PORTS ==="
foreach ip [get_bd_intf_ports *] {
    puts "INTF_PORT: $ip (VLNV: [get_property VLNV $ip], MODE: [get_property MODE $ip])"
}

puts "=== ALL BD INTF PINS ON vid_phy_controller_0 ==="
catch {
    foreach ip [get_bd_intf_pins vid_phy_controller_0/*] {
        puts "PHY INTF PIN: $ip (VLNV: [get_property VLNV $ip])"
    }
}

close_project
exit
