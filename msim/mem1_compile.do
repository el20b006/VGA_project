# copy .mif file (which holds content of ROM1) into ModelSim simulation directory
..\impl\VGA_controller_project\VGA_controller_project.ip_user_files\mem_init_files\rom1.mif ./

# compile simulation model of generated 1k ROM
vlog ..\impl\VGA_controller_project\VGA_controller_project.srcs\sources_1\ip\rom1\blk_mem_gen_v8_3_2\simulation\blk_mem_gen_v8_3.v
vcom ..\impl\VGA_controller_project\VGA_controller_project.srcs\sources_1\ip\rom1\synth\rom1.vhd

# compile Xilinx GLBL module (required for proper initialization
# of all generated  Xilinx macros during simulation)
vlog ../generate/glbl.v


vcom ../vhdl/mem_ctrl_1_.vhd
vcom ../vhdl/mem_ctrl_1_rtl.vhd 
vcom ../vhdl/mem_ctrl_1_rtl_cfg.vhd 

vcom ../tb/tb_mem_ctrl_1_.vhd 
vcom ../tb/tb_mem_ctrl_1_sim.vhd 
vcom ../tb/tb_mem_ctrl_1_sim_cfg.vhd 
