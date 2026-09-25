
open_project D:/VIVADO_PROJECTS/zcu106_hdmi_tx/v_hdmi_tx_ss_0_ex/v_hdmi_tx_ss_0_ex.xpr
open_bd_design [get_files exdes.bd]
puts "LED0 net: [get_bd_nets -of_objects [get_bd_ports LED0]]"
close_project
exit
