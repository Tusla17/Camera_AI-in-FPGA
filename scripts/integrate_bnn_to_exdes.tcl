
open_project D:/VIVADO_PROJECTS/zcu106_hdmi_tx/v_hdmi_tx_ss_0_ex/v_hdmi_tx_ss_0_ex.xpr

puts "=== 1. ADDING BNN RTL SOURCES ==="
set rtl_files [list \
    D:/CodeWSL/Camera_AI/rtl/ascon_round.v \
    D:/CodeWSL/Camera_AI/rtl/binmac.v \
    D:/CodeWSL/Camera_AI/rtl/conv1.v \
    D:/CodeWSL/Camera_AI/rtl/conv1_engine.v \
    D:/CodeWSL/Camera_AI/rtl/conv2.v \
    D:/CodeWSL/Camera_AI/rtl/conv3.v \
    D:/CodeWSL/Camera_AI/rtl/conv_engine.v \
    D:/CodeWSL/Camera_AI/rtl/fc1.v \
    D:/CodeWSL/Camera_AI/rtl/fc2.v \
    D:/CodeWSL/Camera_AI/rtl/fc_engine.v \
    D:/CodeWSL/Camera_AI/rtl/head.v \
    D:/CodeWSL/Camera_AI/rtl/maxpool2x2.v \
    D:/CodeWSL/Camera_AI/rtl/threshold.v \
    D:/CodeWSL/Camera_AI/rtl/top.v \
    D:/CodeWSL/Camera_AI/rtl/top_clk.v \
    D:/CodeWSL/Camera_AI/rtl/trng.v \
    D:/CodeWSL/Camera_AI/rtl/weight_loader.v \
    D:/CodeWSL/Camera_AI/rtl/bnn_axi_lite.v \
]
add_files -norecurse $rtl_files
update_compile_order -fileset sources_1

puts "=== 2. OPENING BD DESIGN ==="
open_bd_design [get_files exdes.bd]

puts "=== 3. CREATING BNN_0 MODULE REF ==="
set bnn_0 [create_bd_cell -type module -reference bnn_axi_lite bnn_0]

# Connect BNN clocks and reset
connect_bd_net [get_bd_pins zynq_us_ss_0/s_axi_aclk] [get_bd_pins bnn_0/S_AXI_ACLK]
connect_bd_net [get_bd_pins zynq_us_ss_0/peripheral_aresetn] [get_bd_pins bnn_0/S_AXI_ARESETN]

# Connect BNN to SmartConnect M07_AXI inside zynq_us_ss_0
connect_bd_intf_net [get_bd_intf_pins zynq_us_ss_0/axi_interconnect_0/M07_AXI] [get_bd_intf_pins bnn_0/S_AXI]

puts "=== 4. CREATING PMOD ALERTS GPIO ==="
set ctrl_gpio [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 ctrl_gpio]
set_property -dict [list \
    CONFIG.C_GPIO_WIDTH {4} \
    CONFIG.C_ALL_OUTPUTS {1} \
    CONFIG.C_IS_DUAL {1} \
    CONFIG.C_GPIO2_WIDTH {1} \
    CONFIG.C_ALL_OUTPUTS_2 {1} \
] $ctrl_gpio

connect_bd_net [get_bd_pins zynq_us_ss_0/s_axi_aclk] [get_bd_pins ctrl_gpio/s_axi_aclk]
connect_bd_net [get_bd_pins zynq_us_ss_0/peripheral_aresetn] [get_bd_pins ctrl_gpio/s_axi_aresetn]
connect_bd_intf_net [get_bd_intf_pins zynq_us_ss_0/axi_interconnect_0/M03_AXI] [get_bd_intf_pins ctrl_gpio/S_AXI]

# Create external PMOD alerts port
make_bd_pins_external [get_bd_pins ctrl_gpio/gpio_io_o] -name pmod_alerts_out

puts "=== 5. ASSIGNING ADDRESSES ==="
assign_bd_address
set_property offset 0x00800A0000 [get_bd_addr_segs {zynq_us_ss_0/zynq_us/Data/SEG_bnn_0_reg0}]
set_property offset 0x00800B0000 [get_bd_addr_segs {zynq_us_ss_0/zynq_us/Data/SEG_ctrl_gpio_Reg}]

puts "=== 6. VALIDATING BD DESIGN ==="
validate_bd_design
save_bd_design

puts "=== 7. GENERATING TARGET PRODUCTS ==="
generate_target all [get_files exdes.bd]
export_ip_user_files -of_objects [get_files exdes.bd] -no_script -sync -force -quiet

puts "=== 8. REGENERATING WRAPPER ==="
set wrapper_file [make_wrapper -files [get_files exdes.bd] -top -force]
add_files -norecurse $wrapper_file
set_property top exdes_wrapper [current_fileset]
update_compile_order -fileset sources_1

puts "=== BNN INTEGRATION INTO EXDES BD COMPLETED SUCCESSFULLY! ==="
close_project
exit
