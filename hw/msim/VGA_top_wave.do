onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_VGA_ctrl_top/s_reset
add wave -noupdate -format Logic /tb_VGA_ctrl_top/s_clk
add wave -noupdate -format Logic /tb_VGA_ctrl_top/s_pb
add wave -noupdate -format Logic /tb_VGA_ctrl_top/s_sw
add wave -noupdate -format Logic /tb_VGA_ctrl_top/s_h_sync
add wave -noupdate -format Logic /tb_VGA_ctrl_top/s_v_sync
add wave -noupdate -format Logic /tb_VGA_ctrl_top/s_rgb
add wave -noupdate -format Logic /tb_VGA_ctrl_top/i_VGA_ctrl_top/i_source_multiplexer/line_beg_o
add wave -noupdate -format Logic /tb_VGA_ctrl_top/i_VGA_ctrl_top/source_multiplexer/pixel_beg_o


TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
