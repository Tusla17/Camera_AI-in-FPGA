# update_bd_gpio.tcl
open_project ./bnn_bd/bnn_bd.xpr
open_bd_design [get_files bd.bd]

# Remove any old ports
if {[get_bd_ports -quiet ctrl_gpio_out] ne ""} {
    delete_bd_objs [get_bd_ports ctrl_gpio_out]
}
if {[get_bd_ports -quiet hdmi_tx_en] ne ""} {
    delete_bd_objs [get_bd_ports hdmi_tx_en]
}
if {[get_bd_ports -quiet gpio_io_o] ne ""} {
    delete_bd_objs [get_bd_ports gpio_io_o]
}
if {[get_bd_ports -quiet gpio_io_o_0] ne ""} {
    delete_bd_objs [get_bd_ports gpio_io_o_0]
}

# Configure ctrl_gpio Channel 1 to 1 bit (hdmi_tx_en)
set_property -dict [list CONFIG.C_GPIO_WIDTH {1}] [get_bd_cells ctrl_gpio]

# Create external port hdmi_tx_en and connect
create_bd_port -dir O -from 0 -to 0 hdmi_tx_en
connect_bd_net [get_bd_pins ctrl_gpio/gpio_io_o] [get_bd_ports hdmi_tx_en]

# Clean up any bad XDC files
foreach f [get_files -quiet *.xdc] {
    if {[string match "*scratch*" $f] || [string match "*periph*" $f]} {
        remove_files -quiet $f
    }
}

# Add local constraint file
add_files -fileset constrs_1 -norecurse "D:/CodeWSL/Camera_AI/zcu106_periph.xdc"

# Validate and Save
assign_bd_address
validate_bd_design
save_bd_design

# Regenerate wrapper
set wrapper [make_wrapper -files [get_files bd.bd] -top -force]
add_files -norecurse $wrapper
set_property top bd_wrapper [current_fileset]
update_compile_order -fileset sources_1

puts "=== BD UPDATE COMPLETED SUCCESSFULLY! ==="
close_project
exit
