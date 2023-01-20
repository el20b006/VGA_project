# copy .mif file (which holds content of ROM2) into ModelSim simulation directory
file copy -force ..\impl\VGA_controller_project\VGA_controller_project.ip_user_files\mem_init_files\rom1.mif ./

# compile simulation model of generated ROM2
vlog ..\impl\VGA_controller_project\VGA_controller_project.srcs\sources_1\ip\rom1\blk_mem_gen_v8_3_2\simulationblk_mem_gen_v8_3.v
vcom ..\impl\VGA_controller_project\VGA_controller_project.srcs\sources_1\ip\rom1\synth\rom1.vhd

# compile Xilinx GLBL module (required for proper initialization
# of all generated  Xilinx macros during simulation)
vlog ../generate/glbl.v


vcom ../vhdl/vga_monitor_top_.vhd
vcom ../vhdl/vga_monitor_top_struc.vhd
vcom ../vhdl/vga_monitor_top_struc_cfg.vhd

vcom ../vhdl/vga_monitor_.vhd

vcom ../tb/vga_monitor_sim.vhd

vcom ../vhdl/VGA_ctrl_.vhd
vcom ../vhdl/VGA_ctrl_rtl.vhd
vcom ../vhdl/VGA_ctrl_rtl_cfg.vhd

vcom ../vhdl/mem_ctrl_1_.vhd
vcom ../vhdl/mem_ctrl_1_rtl.vhd
vcom ../vhdl/mem_ctrl_1_rtl_cfg.vhd