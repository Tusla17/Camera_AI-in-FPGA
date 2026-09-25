open_project D:/VIVADO_PROJECTS/bnn_bd/bnn_bd.xpr
reset_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

set status [get_property STATUS [get_runs impl_1]]
puts "=== IMPLEMENTATION RUN STATUS: $status ==="

if {$status == "write_bitstream Complete!"} {
    puts "Bitstream generated successfully!"
    file copy -force D:/VIVADO_PROJECTS/bnn_bd/bnn_bd.runs/impl_1/bd_wrapper.bit D:/VIVADO_PROJECTS/bnn_bd/bnn_hdmi_top.bit
    write_hw_platform -fixed -include_bit -force -file D:/VIVADO_PROJECTS/bnn_bd/bnn_hdmi_top.xsa
    puts "Hardware XSA exported: D:/VIVADO_PROJECTS/bnn_bd/bnn_hdmi_top.xsa"
} else {
    puts "Error: Implementation failed."
}
close_project
exit
