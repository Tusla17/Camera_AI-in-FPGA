
open_project D:/VIVADO_PROJECTS/zcu106_hdmi_tx/v_hdmi_tx_ss_0_ex/v_hdmi_tx_ss_0_ex.xpr
open_bd_design [get_files exdes.bd]

puts "=== EXDES ALL CELLS ==="
foreach c [get_bd_cells *] {
    puts "CELL: $c ([get_property VLNV $c])"
}

puts "=== EXDES ALL PORTS ==="
foreach p [get_bd_ports *] {
    puts "PORT: $p"
}

close_project
exit
