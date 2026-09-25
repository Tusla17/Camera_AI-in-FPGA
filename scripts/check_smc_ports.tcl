
open_project D:/VIVADO_PROJECTS/zcu106_hdmi_tx/v_hdmi_tx_ss_0_ex/v_hdmi_tx_ss_0_ex.xpr
open_bd_design [get_files exdes.bd]

set smc [get_bd_cells zynq_us_ss_0/axi_interconnect_0]
puts "=== SMARTCONNECT PROPERTIES ==="
puts "NUM_MI = [get_property CONFIG.NUM_MI $smc]"
puts "NUM_SI = [get_property CONFIG.NUM_SI $smc]"

puts "=== MASTER INTERFACES ON SMARTCONNECT ==="
foreach p [get_bd_intf_pins zynq_us_ss_0/axi_interconnect_0/M*] {
    puts "INTF PIN: $p -> [get_bd_intf_nets -of_objects $p]"
}

close_project
exit
