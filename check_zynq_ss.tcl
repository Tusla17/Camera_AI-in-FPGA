
open_project D:/VIVADO_PROJECTS/zcu106_hdmi_tx/v_hdmi_tx_ss_0_ex/v_hdmi_tx_ss_0_ex.xpr
open_bd_design [get_files exdes.bd]

puts "=== PINS OF zynq_us_ss_0 ==="
foreach p [get_bd_pins zynq_us_ss_0/*] {
    puts "PIN: $p"
}
foreach p [get_bd_intf_pins zynq_us_ss_0/*] {
    puts "INTF PIN: $p"
}

puts "=== CELLS INSIDE zynq_us_ss_0 ==="
foreach c [get_bd_cells zynq_us_ss_0/*] {
    puts "CELL: $c ([get_property VLNV $c])"
}

close_project
exit
