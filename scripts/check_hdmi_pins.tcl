
open_project D:/VIVADO_PROJECTS/bnn_bd/bnn_bd.xpr
open_bd_design [get_files bd.bd]
puts "=== PINS ON v_hdmi_tx_ss_0 ==="
foreach p [get_bd_pins v_hdmi_tx_ss_0/*] {
    puts "PIN: $p ([get_property TYPE $p], [get_property DIR $p])"
}
puts "=== PINS ON tx_video_axis_reg_slice ==="
foreach p [get_bd_pins tx_video_axis_reg_slice/*] {
    puts "PIN: $p ([get_property TYPE $p], [get_property DIR $p])"
}
close_project
exit
