open_project D:/VIVADO_PROJECTS/zcu106_hdmi_tx/v_hdmi_tx_ss_0_ex/v_hdmi_tx_ss_0_ex.xpr
open_bd_design [get_files exdes.bd]
puts "=== IIC CELLS IN EXDES.BD ==="
foreach c [get_bd_cells -filter {VLNV =~ "*iic*"}] {
    puts "CELL: $c ([get_property VLNV $c])"
    foreach p [get_bd_pins $c/*] {
        set net [get_bd_nets -of_objects $p]
        if {$net ne ""} {
            puts "  PIN $p -> NET $net"
        }
    }
}
puts "=== EXTERNAL IIC PORTS ==="
foreach p [get_bd_ports *iic*] {
    puts "PORT: $p"
}
close_project
exit
