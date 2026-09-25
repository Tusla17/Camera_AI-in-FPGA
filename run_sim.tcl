# Vivado direct batch simulation script for BNN AXI-Lite
set_param general.maxThreads 1
set_param synth.maxThreads 1

set work_dir ./sim_work
file mkdir $work_dir
cd $work_dir

# Compile all Verilog RTL and TB
exec xvlog --incr --relax \
    ../rtl/ascon_round.v \
    ../rtl/trng.v \
    ../rtl/bnn_axi_lite.v \
    ../rtl/conv1_engine.v \
    ../rtl/conv_engine.v \
    ../rtl/fc_engine.v \
    ../rtl/top_clk.v \
    ../rtl/weight_loader.v \
    ../rtl/tb_bnn_axi_lite.v

# Elaborate
exec xelab -debug typical --relax -top tb_bnn_axi_lite -snapshot tb_bnn_axi_lite_sim

# Copy mem files to sim_work
foreach f [glob ../sim/*.mem] {
    file copy -force $f ./
}
foreach f [glob ../mem/*.mem] {
    file copy -force $f ./
}

# Run simulation and print output
puts [exec xsim tb_bnn_axi_lite_sim -R]

cd ..
