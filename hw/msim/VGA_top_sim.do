vsim -t ps -novopt -L unisims_ver -lib work work.tb_VGA_ctrl_top_sim_cfg work.glbl
view *
do VGA_top_wave.do
run 180 ms
