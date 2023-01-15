vsim -t ns -novopt -lib work work.tb_mem_ctrl_1_sim_cfg  
view *
do mem1_wave.do
run 100 ms