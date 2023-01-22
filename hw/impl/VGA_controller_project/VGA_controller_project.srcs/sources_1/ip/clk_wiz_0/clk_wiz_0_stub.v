// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
// Date        : Sat Jan 21 18:07:02 2023
// Host        : DESKTOP-7DLC06A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/sarah/OneDrive/Dokumente/FH/5.
//               Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v}
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_in1, clk_out1, clk_out2, clk_out3)
/* synthesis syn_black_box black_box_pad_pin="clk_in1,clk_out1,clk_out2,clk_out3" */;
  input clk_in1;
  output clk_out1;
  output clk_out2;
  output clk_out3;
endmodule
