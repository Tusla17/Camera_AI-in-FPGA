open_project D:/VIVADO_PROJECTS/bnn_bd/bnn_bd.xpr
open_bd_design [get_files bd.bd]

puts "=== 1. CHECKING LOCKED IPS ==="
set locked_ips [get_ips -filter {IS_LOCKED == 1}]
puts "LOCKED IPS: $locked_ips"

puts "=== 2. REMOVING CORRUPTED INTERCONNECT AND PHY ==="
catch { delete_bd_objs [get_bd_cells zynq_ps_axi_periph] }
catch { delete_bd_objs [get_bd_cells vid_phy_controller_0] }
catch { delete_bd_objs [get_bd_cells hdmi_ctrl_iic] }

puts "=== 3. RE-CREATING AXI INTERCONNECT (6 MASTERS) ==="
set zynq_ps_axi_periph [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 zynq_ps_axi_periph]
set_property CONFIG.NUM_MI {6} $zynq_ps_axi_periph

# S00 from PS
connect_bd_intf_net [get_bd_intf_pins zynq_ps/M_AXI_HPM0_FPD] [get_bd_intf_pins zynq_ps_axi_periph/S00_AXI]

# Clocks and resets for interconnect
connect_bd_net [get_bd_pins zynq_ps/pl_clk0] [get_bd_pins zynq_ps_axi_periph/ACLK]
connect_bd_net [get_bd_pins zynq_ps/pl_clk0] [get_bd_pins zynq_ps_axi_periph/S00_ACLK]
connect_bd_net [get_bd_pins rst_zynq_ps_99M/peripheral_aresetn] [get_bd_pins zynq_ps_axi_periph/ARESETN]
connect_bd_net [get_bd_pins rst_zynq_ps_99M/peripheral_aresetn] [get_bd_pins zynq_ps_axi_periph/S00_ARESETN]

# M00: bnn_0
connect_bd_intf_net [get_bd_intf_pins zynq_ps_axi_periph/M00_AXI] [get_bd_intf_pins bnn_0/S_AXI]
connect_bd_net [get_bd_pins zynq_ps/pl_clk0] [get_bd_pins zynq_ps_axi_periph/M00_ACLK]
connect_bd_net [get_bd_pins rst_zynq_ps_99M/peripheral_aresetn] [get_bd_pins zynq_ps_axi_periph/M00_ARESETN]

# M01: ctrl_gpio
connect_bd_intf_net [get_bd_intf_pins zynq_ps_axi_periph/M01_AXI] [get_bd_intf_pins ctrl_gpio/S_AXI]
connect_bd_net [get_bd_pins zynq_ps/pl_clk0] [get_bd_pins zynq_ps_axi_periph/M01_ACLK]
connect_bd_net [get_bd_pins rst_zynq_ps_99M/peripheral_aresetn] [get_bd_pins zynq_ps_axi_periph/M01_ARESETN]

# M02: v_frmbuf_rd_0
connect_bd_intf_net [get_bd_intf_pins zynq_ps_axi_periph/M02_AXI] [get_bd_intf_pins v_frmbuf_rd_0/s_axi_CTRL]
connect_bd_net [get_bd_pins zynq_ps/pl_clk0] [get_bd_pins zynq_ps_axi_periph/M02_ACLK]
connect_bd_net [get_bd_pins rst_zynq_ps_99M/peripheral_aresetn] [get_bd_pins zynq_ps_axi_periph/M02_ARESETN]

# M03: v_hdmi_tx_ss_0
connect_bd_intf_net [get_bd_intf_pins zynq_ps_axi_periph/M03_AXI] [get_bd_intf_pins v_hdmi_tx_ss_0/S_AXI_CPU_IN]
connect_bd_net [get_bd_pins zynq_ps/pl_clk0] [get_bd_pins zynq_ps_axi_periph/M03_ACLK]
connect_bd_net [get_bd_pins rst_zynq_ps_99M/peripheral_aresetn] [get_bd_pins zynq_ps_axi_periph/M03_ARESETN]

puts "=== 4. RE-CREATING VID_PHY_CONTROLLER (CLEAN) ==="
set vid_phy [create_bd_cell -type ip -vlnv xilinx.com:ip:vid_phy_controller:2.2 vid_phy_controller_0]
set_property -dict [list \
    CONFIG.C_Tx_Protocol {HDMI} \
    CONFIG.C_Rx_Protocol {None} \
    CONFIG.Transceiver {GTHE4} \
    CONFIG.C_TX_PLL_SELECTION {6} \
    CONFIG.C_TX_REFCLK_SEL {0} \
    CONFIG.C_INPUT_PIXELS_PER_CLOCK {2} \
    CONFIG.Transceiver_Width {2} \
    CONFIG.CHANNEL_SITE {X0Y0} \
    CONFIG.C_Txrefclk_Rdy_Invert {1} \
] $vid_phy

# Connect vid_phy AXI-Lite to M04
connect_bd_intf_net [get_bd_intf_pins zynq_ps_axi_periph/M04_AXI] [get_bd_intf_pins vid_phy_controller_0/vid_phy_axi4lite]
connect_bd_net [get_bd_pins zynq_ps/pl_clk0] [get_bd_pins zynq_ps_axi_periph/M04_ACLK]
connect_bd_net [get_bd_pins rst_zynq_ps_99M/peripheral_aresetn] [get_bd_pins zynq_ps_axi_periph/M04_ARESETN]

# Vid_phy clocks and resets
connect_bd_net [get_bd_pins zynq_ps/pl_clk0] [get_bd_pins vid_phy_controller_0/vid_phy_axi4lite_aclk]
connect_bd_net [get_bd_pins rst_zynq_ps_99M/peripheral_aresetn] [get_bd_pins vid_phy_controller_0/vid_phy_axi4lite_aresetn]
connect_bd_net [get_bd_pins zynq_ps/pl_clk0] [get_bd_pins vid_phy_controller_0/vid_phy_sb_aclk]
connect_bd_net [get_bd_pins rst_zynq_ps_99M/peripheral_aresetn] [get_bd_pins vid_phy_controller_0/vid_phy_sb_aresetn]
connect_bd_net [get_bd_pins zynq_ps/pl_clk0] [get_bd_pins vid_phy_controller_0/drpclk]
connect_bd_net [get_bd_pins const_vcc_phy/dout] [get_bd_pins vid_phy_controller_0/vid_phy_tx_axi4s_aresetn]

# Inter-subsystem connections to HDMI TX
connect_bd_intf_net [get_bd_intf_pins v_hdmi_tx_ss_0/LINK_DATA0_OUT] [get_bd_intf_pins vid_phy_controller_0/vid_phy_tx_axi4s_ch0]
connect_bd_intf_net [get_bd_intf_pins v_hdmi_tx_ss_0/LINK_DATA1_OUT] [get_bd_intf_pins vid_phy_controller_0/vid_phy_tx_axi4s_ch1]
connect_bd_intf_net [get_bd_intf_pins v_hdmi_tx_ss_0/LINK_DATA2_OUT] [get_bd_intf_pins vid_phy_controller_0/vid_phy_tx_axi4s_ch2]
connect_bd_intf_net [get_bd_intf_pins vid_phy_controller_0/vid_phy_status_sb_tx] [get_bd_intf_pins v_hdmi_tx_ss_0/SB_STATUS_IN]

# Video PHY clock outputs
connect_bd_net [get_bd_pins vid_phy_controller_0/txoutclk] [get_bd_pins vid_phy_controller_0/vid_phy_tx_axi4s_aclk]
connect_bd_net [get_bd_pins vid_phy_controller_0/txoutclk] [get_bd_pins v_hdmi_tx_ss_0/link_clk]
connect_bd_net [get_bd_pins vid_phy_controller_0/tx_video_clk] [get_bd_pins v_hdmi_tx_ss_0/video_clk]

# External ports for vid_phy
connect_bd_net [get_bd_ports SI5324_LOL_IN] [get_bd_pins vid_phy_controller_0/tx_refclk_rdy]
connect_bd_net [get_bd_ports TX_REFCLK_P_IN] [get_bd_pins vid_phy_controller_0/mgtrefclk0_pad_p_in]
connect_bd_net [get_bd_ports TX_REFCLK_N_IN] [get_bd_pins vid_phy_controller_0/mgtrefclk0_pad_n_in]
connect_bd_net [get_bd_ports HDMI_TX_CLK_P_OUT] [get_bd_pins vid_phy_controller_0/tx_tmds_clk_p]
connect_bd_net [get_bd_ports HDMI_TX_CLK_N_OUT] [get_bd_pins vid_phy_controller_0/tx_tmds_clk_n]
connect_bd_net [get_bd_ports HDMI_TX_DAT_P_OUT] [get_bd_pins vid_phy_controller_0/phy_txp_out]
connect_bd_net [get_bd_ports HDMI_TX_DAT_N_OUT] [get_bd_pins vid_phy_controller_0/phy_txn_out]

puts "=== 5. RE-CREATING AXI_IIC:2.1 (CLEAN) ==="
set hdmi_ctrl_iic [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.1 hdmi_ctrl_iic]
connect_bd_intf_net [get_bd_intf_pins zynq_ps_axi_periph/M05_AXI] [get_bd_intf_pins hdmi_ctrl_iic/S_AXI]
connect_bd_net [get_bd_pins zynq_ps/pl_clk0] [get_bd_pins hdmi_ctrl_iic/s_axi_aclk]
connect_bd_net [get_bd_pins zynq_ps/pl_clk0] [get_bd_pins zynq_ps_axi_periph/M05_ACLK]
connect_bd_net [get_bd_pins rst_zynq_ps_99M/peripheral_aresetn] [get_bd_pins hdmi_ctrl_iic/s_axi_aresetn]
connect_bd_net [get_bd_pins rst_zynq_ps_99M/peripheral_aresetn] [get_bd_pins zynq_ps_axi_periph/M05_ARESETN]

# Connect to external HDMI_CTRL_IIC port
connect_bd_intf_net [get_bd_intf_ports HDMI_CTRL_IIC] [get_bd_intf_pins hdmi_ctrl_iic/IIC]

puts "=== 6. ASSIGNING ADDRESSES ==="
assign_bd_address

puts "=== 7. VALIDATING BLOCK DESIGN ==="
validate_bd_design
save_bd_design

puts "=== 8. RESETTING AND REGENERATING TARGETS CLEANLY ==="
reset_target all [get_files bd.bd]
generate_target all [get_files bd.bd]
export_ip_user_files -of_objects [get_files bd.bd] -no_script -sync -force -quiet

puts "=== 9. REGENERATING TOP WRAPPER ==="
set wrapper_file [make_wrapper -files [get_files bd.bd] -top -force]
puts "WRAPPER_FILE: $wrapper_file"
add_files -norecurse $wrapper_file
set_property top bd_wrapper [current_fileset]
update_compile_order -fileset sources_1

reset_run synth_1
puts "=== COMPLETE CLEAN BD BUILD 100% SUCCEEDED! ==="
close_project
exit
