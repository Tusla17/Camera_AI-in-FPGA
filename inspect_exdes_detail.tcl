
open_project D:/VIVADO_PROJECTS/zcu106_hdmi_tx/v_hdmi_tx_ss_0_ex/v_hdmi_tx_ss_0_ex.xpr
open_bd_design [get_files exdes.bd]

puts "=== EXDES HIERARCHICAL CELLS ==="
foreach c [get_bd_cells -hierarchical *] {
    puts "HIER CELL: $c ([get_property VLNV $c])"
}

puts "=== EXDES ADDRESS SEGS ==="
foreach seg [get_bd_addr_segs] {
    puts "SEG: $seg (OFFSET: [get_property OFFSET $seg], RANGE: [get_property RANGE $seg])"
}

close_project
exit
