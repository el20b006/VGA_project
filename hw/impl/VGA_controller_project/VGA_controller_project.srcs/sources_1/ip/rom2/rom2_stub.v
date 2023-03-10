// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
// Date        : Sat Jan 21 16:09:20 2023
// Host        : DESKTOP-7DLC06A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {C:/Users/sarah/OneDrive/Dokumente/FH/5.
//               Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom2/rom2_stub.v}
// Design      : rom2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_2,Vivado 2016.1" *)
module rom2(clka, ena, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,addra[13:0],douta[11:0]" */;
  input clka;
  input ena;
  input [13:0]addra;
  output [11:0]douta;
endmodule
