vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../VGA_controller_project.ip_user_files/ipstatic/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/hw/impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_v5_3_0" "+incdir+../../VGA_controller_project.ip_user_files/ipstatic/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/hw/impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_v5_3_0" \
"C:/Xilinx/Vivado/2016.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
"C:/Xilinx/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
"C:/Xilinx/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
"C:/Xilinx/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
"C:/Xilinx/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
"C:/Xilinx/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
"C:/Xilinx/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2016.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../vhdl/mc8051/addsub_cy_.vhd" \
"../../../../vhdl/mc8051/mc8051_p.vhd" \
"../../../../vhdl/mc8051/addsub_ovcy_.vhd" \
"../../../../vhdl/mc8051/comb_mltplr_.vhd" \
"../../../../vhdl/mc8051/addsub_core_.vhd" \
"../../../../vhdl/mc8051/alumux_.vhd" \
"../../../../vhdl/mc8051/alucore_.vhd" \
"../../../../vhdl/mc8051/comb_divider_.vhd" \
"../../../../vhdl/mc8051/addsub_cy_rtl.vhd" \
"../../../../vhdl/mc8051/control_mem_.vhd" \
"../../../../vhdl/mc8051/control_fsm_.vhd" \
"../../../../vhdl/mc8051/addsub_ovcy_rtl.vhd" \
"../../../../vhdl/mc8051/dcml_adjust_.vhd" \
"../../../../vhdl/mc8051/addsub_core_struc.vhd" \
"../../../../vhdl/mc8051/control_mem_rtl.vhd" \
"../../../../vhdl/mc8051/comb_divider_rtl.vhd" \
"../../../../vhdl/mc8051/alumux_rtl.vhd" \
"../../../../vhdl/mc8051/alucore_rtl.vhd" \
"../../../../vhdl/mc8051/comb_mltplr_rtl.vhd" \
"../../../../vhdl/mc8051/dcml_adjust_rtl.vhd" \
"../../../../vhdl/mc8051/mc8051_tmrctr_.vhd" \
"../../../../vhdl/mc8051/control_fsm_rtl.vhd" \
"../../../../vhdl/mc8051/mc8051_control_.vhd" \
"../../../../vhdl/mc8051/mc8051_alu_.vhd" \
"../../../../vhdl/mc8051/mc8051_siu_.vhd" \
"../../../../vhdl/mc8051/mc8051_tmrctr_rtl.vhd" \
"../../../../vhdl/mc8051/mc8051_alu_struc.vhd" \
"../../../../vhdl/mc8051/mc8051_siu_rtl.vhd" \
"../../../../vhdl/mc8051/mc8051_control_struc.vhd" \
"../../../../vhdl/mc8051/mc8051_core_.vhd" \
"../../VGA_controller_project.srcs/sources_1/ip/rom2/rom2_sim_netlist.vhdl" \
"../../VGA_controller_project.srcs/sources_1/ip/rom1/rom1_sim_netlist.vhdl" \
"../../../../vhdl/VGA_ctrl_.vhd" \
"../../../../vhdl/source_multiplexer_.vhd" \
"../../../../vhdl/pattern_gen_2_.vhd" \
"../../../../vhdl/pattern_gen_1_.vhd" \
"../../../../vhdl/mem_ctrl_2_.vhd" \
"../../../../vhdl/mem_ctrl_1_.vhd" \
"../../../../vhdl/io_ctrl_.vhd" \
"../../../../vhdl/mc8051/mc8051_top_.vhd" \
"../../../../vhdl/mc8051/mc8051_core_struc.vhd" \
"../../../../generate/artix7_xc7a35tcpg263_1/mc8051_ram/mc8051_ram/mc8051_ram_sim_netlist.vhdl" \
"../../../../generate/artix7_xc7a35tcpg263_1/mc8051_rom/mc8051_rom/mc8051_rom_sim_netlist.vhdl" \
"../../VGA_controller_project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_sim_netlist.vhdl" \
"../../../../vhdl/VGA_ctrl_top_.vhd" \
"../../../../vhdl/VGA_ctrl_rtl.vhd" \
"../../../../vhdl/source_multiplexer_rtl.vhd" \
"../../../../vhdl/pattern_gen_2_rtl.vhd" \
"../../../../vhdl/pattern_gen_1_rtl.vhd" \
"../../../../vhdl/mem_ctrl_2_rtl.vhd" \
"../../../../vhdl/mem_ctrl_1_rtl.vhd" \
"../../../../vhdl/io_ctrl_rtl.vhd" \
"../../../../vhdl/mc8051/mc8051_top_struc.vhd" \
"../../../../vhdl/VGA_ctrl_top_struc.vhd" \
"../../../../vhdl/VGA_ctrl_top_struc_cfg.vhd" \

vlog -work xil_defaultlib "glbl.v"

