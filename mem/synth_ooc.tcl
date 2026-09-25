# Chay tu thu muc mem/ (de $readmem tim thay cac file .mem)
set PART xczu7ev-ffvc1156-2-e
set RTL  ../rtl

read_verilog [list $RTL/conv1_engine.v $RTL/conv_engine.v \
                   $RTL/fc_engine.v   $RTL/top_clk.v]
read_xdc top_clk_ooc.xdc

synth_design -top top_clk -part $PART -mode out_of_context
opt_design

report_utilization        -file util_top_clk.rpt
report_timing_summary     -file timing_top_clk.rpt -max_paths 10
write_checkpoint -force    top_clk_synth.dcp

puts "=== TONG KET ==="
report_utilization
report_timing_summary -max_paths 1

