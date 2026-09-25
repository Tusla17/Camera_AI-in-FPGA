open_project D:/VIVADO_PROJECTS/zcu106_hdmi_tx/v_hdmi_tx_ss_0_ex/v_hdmi_tx_ss_0_ex.xpr
open_bd_design [get_files exdes.bd]
puts "=== ALL ADDRESS SEGMENTS IN EXDES.BD ==="
foreach seg [get_bd_addr_segs] {
    set offset [get_property OFFSET $seg]
    set range  [get_property RANGE $seg]
    puts [format "SEG: %-50s OFFSET: 0x%08X RANGE: %s" $seg $offset $range]
}
close_project
exit
