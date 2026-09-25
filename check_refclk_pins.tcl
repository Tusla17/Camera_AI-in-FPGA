open_project D:/VIVADO_PROJECTS/bnn_bd/bnn_bd.xpr
open_bd_design [get_files bd.bd]

set phy [get_bd_cells vid_phy_controller_0]
puts "=== PHY CONFIG PROPERTIES ==="
puts "C_TX_REFCLK_SEL = [get_property CONFIG.C_TX_REFCLK_SEL $phy]"
puts "All REFCLK pins on phy:"
foreach p [get_bd_pins $phy/*refclk*] {
    puts "  PIN: $p ([get_property TYPE $p])"
}
close_project
exit
