# Vivado direct batch simulation script for TRNG
set_param general.maxThreads 1
set_param synth.maxThreads 1

set work_dir ./sim_trng_work
file mkdir $work_dir
cd $work_dir

# Compile Verilog RTL and TB
exec xvlog --incr --relax \
    ../rtl/trng.v \
    ../rtl/tb_trng.v

# Elaborate
exec xelab -debug typical --relax -top tb_trng -snapshot tb_trng_sim

# Run simulation and print output
puts [exec xsim tb_trng_sim -R]

cd ..
