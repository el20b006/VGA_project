onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_VGA_ctrl/reset_i
add wave -noupdate -format Logic /tb_VGA_ctrl/clk_i
add wave -noupdate -format Logic /tb_VGA_ctrl/enable_25M_i
add wave -noupdate -format Logic /tb_VGA_ctrl/rgb_i
add wave -noupdate -format Logic /tb_VGA_ctrl/v_sync_o
add wave -noupdate -format Logic /tb_VGA_ctrl/h_sync_o
add wave -noupdate -format Logic /tb_VGA_ctrl/pixel_o
add wave -noupdate -format Logic /tb_VGA_ctrl/line_o
add wave -noupdate -format Logic /tb_VGA_ctrl/rgb_o


TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
