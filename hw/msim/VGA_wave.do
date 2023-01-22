onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_VGA_ctrl/s_reset
add wave -noupdate -format Logic /tb_VGA_ctrl/s_enable_25M
add wave -noupdate -format Logic /tb_VGA_ctrl/s_rgb
add wave -noupdate -format Logic /tb_VGA_ctrl/s_v_sync
add wave -noupdate -format Logic /tb_VGA_ctrl/s_h_sync
add wave -noupdate -format Logic /tb_VGA_ctrl/s_pixel
add wave -noupdate -format Logic /tb_VGA_ctrl/s_line
add wave -noupdate -format Logic /tb_VGA_ctrl/s_rgb_o


TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
