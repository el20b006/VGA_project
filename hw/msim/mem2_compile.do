# copy .mif file (which holds content of ROM2) into ModelSim simulation directory
file copy -force ../impl/VGA_controller_project/VGA_controller_project.ip_user_files/mem_init_files/rom2.mif ./

# compile simulation model of generated ROM2
vlog ../impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom2/blk_mem_gen_v8_3_2/simulation/blk_mem_gen_v8_3.v
vcom ../impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom2/synth/rom2.vhd

# compile Xilinx GLBL module (required for proper initialization
# of all generated  Xilinx macros during simulation)
vlog ../generate/glbl.v


vcom ../vhdl/mem_ctrl_2_.vhd
vcom ../vhdl/mem_ctrl_2_rtl.vhd 
vcom ../vhdl/mem_ctrl_2_rtl_cfg.vhd 

vcom ../tb/tb_mem_ctrl_2_.vhd 
vcom ../tb/tb_mem_ctrl_2_sim.vhd 
vcom ../tb/tb_mem_ctrl_2_sim_cfg.vhd 