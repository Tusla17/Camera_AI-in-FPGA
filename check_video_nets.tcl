
open_project D:/VIVADO_PROJECTS/bnn_bd/bnn_bd.xpr
open_bd_design [get_files bd.bd]

puts "=== CONNECTIONS OF v_frmbuf_rd_0 ==="
foreach p [get_bd_pins v_frmbuf_rd_0/*] {
    set net [get_bd_nets -of_objects $p]
    if {$net ne ""} {
        puts "PIN $p -> NET $net"
    }
}
foreach p [get_bd_intf_pins v_frmbuf_rd_0/*] {
    set net [get_bd_intf_nets -of_objects $p]
    if {$net ne ""} {
        puts "INTF PIN $p -> INTF NET $net"
    }
}

puts "=== CONNECTIONS OF v_hdmi_tx_ss_0 ==="
foreach p [get_bd_pins v_hdmi_tx_ss_0/*] {
    set net [get_bd_nets -of_objects $p]
    if {$net ne ""} {
        puts "PIN $p -> NET $net"
    }
}
foreach p [get_bd_intf_pins v_hdmi_tx_ss_0/*] {
    set net [get_bd_intf_nets -of_objects $p]
    if {$net ne ""} {
        puts "INTF PIN $p -> INTF NET $net"
    }
}

puts "=== CONNECTIONS OF tx_video_axis_reg_slice ==="
foreach p [get_bd_pins tx_video_axis_reg_slice/*] {
    set net [get_bd_nets -of_objects $p]
    if {$net ne ""} {
        puts "PIN $p -> NET $net"
    }
}
foreach p [get_bd_intf_pins tx_video_axis_reg_slice/*] {
    set net [get_bd_intf_nets -of_objects $p]
    if {$net ne ""} {
        puts "INTF PIN $p -> INTF NET $net"
    }
}

close_project
exit
