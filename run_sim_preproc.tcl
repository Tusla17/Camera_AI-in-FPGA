# Vivado simulation script for camera_preproc
set_param general.maxThreads 1
set_param synth.maxThreads 1

set work_dir ./sim_preproc_work
file mkdir $work_dir
cd $work_dir

exec xvlog --incr --relax ../rtl/camera_preproc.v ../rtl/tb_camera_preproc.v
exec xelab -debug typical --relax -top tb_camera_preproc -snapshot tb_camera_preproc_sim
puts [exec xsim tb_camera_preproc_sim -R]

cd ..
