#################################################################
# compile simulation models of generated PLL, ROM and RAM
#################################################################
vlog ../generate/artix7_xc7a35tcpg263_1/prescaler/prescaler/prescaler_clk_wiz.v
vlog ../generate/artix7_xc7a35tcpg263_1/prescaler/prescaler/prescaler.v
vlog ../generate/artix7_xc7a35tcpg263_1/mc8051_rom/mc8051_rom/blk_mem_gen_v8_3_2/simulation/blk_mem_gen_v8_3.v
vcom ../generate/artix7_xc7a35tcpg263_1/mc8051_rom/mc8051_rom/synth/mc8051_rom.vhd
vcom ../generate/artix7_xc7a35tcpg263_1/mc8051_ram/mc8051_ram/synth/mc8051_ram.vhd

#################################################################
# compile mc8051
#################################################################
vcom ../vhdl/mc8051/mc8051_p.vhd
     
vcom ../vhdl/mc8051/control_mem_.vhd
vcom ../vhdl/mc8051/control_mem_rtl.vhd
vcom ../vhdl/mc8051/control_mem_rtl_cfg.vhd
     
vcom ../vhdl/mc8051/control_fsm_.vhd
vcom ../vhdl/mc8051/control_fsm_rtl.vhd
vcom ../vhdl/mc8051/control_fsm_rtl_cfg.vhd
     
vcom ../vhdl/mc8051/mc8051_control_.vhd
vcom ../vhdl/mc8051/mc8051_control_struc.vhd
vcom ../vhdl/mc8051/mc8051_control_struc_cfg.vhd
     
vcom ../vhdl/mc8051/alucore_.vhd
vcom ../vhdl/mc8051/alucore_rtl.vhd
vcom ../vhdl/mc8051/alucore_rtl_cfg.vhd
     
vcom ../vhdl/mc8051/alumux_.vhd
vcom ../vhdl/mc8051/alumux_rtl.vhd
vcom ../vhdl/mc8051/alumux_rtl_cfg.vhd
     
vcom ../vhdl/mc8051/addsub_cy_.vhd
vcom ../vhdl/mc8051/addsub_cy_rtl.vhd
vcom ../vhdl/mc8051/addsub_cy_rtl_cfg.vhd
     
vcom ../vhdl/mc8051/addsub_ovcy_.vhd
vcom ../vhdl/mc8051/addsub_ovcy_rtl.vhd
vcom ../vhdl/mc8051/addsub_ovcy_rtl_cfg.vhd
     
vcom ../vhdl/mc8051/addsub_core_.vhd
vcom ../vhdl/mc8051/addsub_core_struc.vhd
vcom ../vhdl/mc8051/addsub_core_struc_cfg.vhd
     
vcom ../vhdl/mc8051/comb_divider_.vhd
vcom ../vhdl/mc8051/comb_divider_rtl.vhd
vcom ../vhdl/mc8051/comb_divider_rtl_cfg.vhd
     
vcom ../vhdl/mc8051/comb_mltplr_.vhd
vcom ../vhdl/mc8051/comb_mltplr_rtl.vhd
vcom ../vhdl/mc8051/comb_mltplr_rtl_cfg.vhd
     
vcom ../vhdl/mc8051/dcml_adjust_.vhd
vcom ../vhdl/mc8051/dcml_adjust_rtl.vhd
vcom ../vhdl/mc8051/dcml_adjust_rtl_cfg.vhd
     
vcom ../vhdl/mc8051/mc8051_alu_.vhd
vcom ../vhdl/mc8051/mc8051_alu_struc.vhd
vcom ../vhdl/mc8051/mc8051_alu_struc_cfg.vhd
     
vcom ../vhdl/mc8051/mc8051_siu_.vhd
vcom ../vhdl/mc8051/mc8051_siu_rtl.vhd
vcom ../vhdl/mc8051/mc8051_siu_rtl_cfg.vhd
     
vcom ../vhdl/mc8051/mc8051_tmrctr_.vhd
vcom ../vhdl/mc8051/mc8051_tmrctr_rtl.vhd
vcom ../vhdl/mc8051/mc8051_tmrctr_rtl_cfg.vhd
     
vcom ../vhdl/mc8051/mc8051_core_.vhd
vcom ../vhdl/mc8051/mc8051_core_struc.vhd
vcom ../vhdl/mc8051/mc8051_core_struc_cfg.vhd
  
vcom ../vhdl/mc8051/mc8051_top_.vhd
vcom ../vhdl/mc8051/mc8051_top_struc.vhd
vcom ../vhdl/mc8051/mc8051_top_struc_cfg.vhd


#################################################################
# compile simulation model of generated PLL
#################################################################
vlog ../impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v
vlog ../impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.v

#################################################################
# copy .mif file (which holds content of ROM1) into ModelSim simulation directory
#################################################################
file copy -force ../impl/VGA_controller_project/VGA_controller_project.ip_user_files/mem_init_files/rom1.mif ./

#################################################################
# compile simulation model of generated ROM1
#################################################################
vlog ../impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom1/blk_mem_gen_v8_3_2/simulation/blk_mem_gen_v8_3.v
vcom ../impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom1/synth/rom1.vhd

#################################################################
# copy .mif file (which holds content of ROM2) into ModelSim simulation directory
#################################################################
file copy -force ../impl/VGA_controller_project/VGA_controller_project.ip_user_files/mem_init_files/rom2.mif ./

#################################################################
# compile simulation model of generated ROM2
#################################################################
vlog ../impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom2/blk_mem_gen_v8_3_2/simulation/blk_mem_gen_v8_3.v
vcom ../impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom2/synth/rom2.vhd

#################################################################
# compile Xilinx GLBL module (required for proper initialization
# of all generated  Xilinx macros during simulation)
#################################################################
vlog ../generate/glbl.v

#################################################################
# compile VGA controller project
#################################################################
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