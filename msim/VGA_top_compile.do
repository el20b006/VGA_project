# copy .mif file (which holds content of ROM1) into ModelSim simulation directory
..\impl\VGA_controller_project\VGA_controller_project.ip_user_files\mem_init_files\rom1.mif ./

# compile simulation model of generated ROM2
vlog ..\impl\VGA_controller_project\VGA_controller_project.srcs\sources_1\ip\rom1\blk_mem_gen_v8_3_2\simulation\blk_mem_gen_v8_3.v
vcom ..\impl\VGA_controller_project\VGA_controller_project.srcs\sources_1\ip\rom1\synth\rom1.vhd

# compile Xilinx GLBL module (required for proper initialization
# of all generated  Xilinx macros during simulation)
vlog ../generate/glbl.v


vcom ../vhdl/VGA_ctrl_top_.vhd
vcom ../vhdl/VGA_ctrl_top_struc.vhd
vcom ../vhdl/VGA_ctrl_top_struc_cfg.vhd

vcom ../tb/tb_VGA_ctrl_top_.vhd
vcom ../tb/tb_VGA_ctrl_top_sim.vhd
vcom ../tb/tb_VGA_ctrl_top_sim_cfg.vhd

vcom ../vhdl/io_ctrl_.vhd
vcom ../vhdl/io_ctrl_rtl.vhd
vcom ../vhdl/io_ctrl_rtl_cfg.vhd

vcom ../vhdl/mem_ctrl_1_.vhd
vcom ../vhdl/mem_ctrl_1_rtl.vhd
vcom ../vhdl/mem_ctrl_1_rtl_cfg.vhd

vcom ../vhdl/mem_ctrl_2_.vhd
vcom ../vhdl/mem_ctrl_2_rtl.vhd
vcom ../vhdl/mem_ctrl_2_rtl_cfg.vhd

vcom ../vhdl/pattern_gen_1_.vhd
vcom ../vhdl/pattern_gen_1_rtl.vhd
vcom ../vhdl/pattern_gen_1_rtl_cfg.vhd

vcom ../vhdl/pattern_gen_2_.vhd
vcom ../vhdl/pattern_gen_2_rtl.vhd
vcom ../vhdl/pattern_gen_2_rtl_cfg.vhd

vcom ../vhdl/prescaler_.vhd
vcom ../vhdl/prescaler_rtl.vhd
vcom ../vhdl/prescaler_rtl_cfg.vhd

vcom ../vhdl/source_multiplexer_.vhd
vcom ../vhdl/source_multiplexer_rtl.vhd
vcom ../vhdl/source_multiplexer_rtl_cfg.vhd

vcom ../vhdl/VGA_ctrl_.vhd
vcom ../vhdl/VGA_ctrl_rtl.vhd
vcom ../vhdl/VGA_ctrl_rtl_cfg.vhd