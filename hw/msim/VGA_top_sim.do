vsim -t ns -novopt -lib work work.tb_VGA_ctrl_top_sim_cfg  
view *
do VGA_ctrl_top_wave.do
run 180 ms
