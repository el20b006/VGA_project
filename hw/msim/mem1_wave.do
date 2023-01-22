onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_mem_ctrl_1/s_reset
add wave -noupdate -format Logic /tb_mem_ctrl_1/s_enable_25M
add wave -noupdate -format Logic /tb_mem_ctrl_1/s_pixel
add wave -noupdate -format Logic /tb_mem_ctrl_1/s_line
add wave -noupdate -format Logic /tb_mem_ctrl_1/s_rgb
add wave -noupdate -format Logic /tb_mem_ctrl_1/i_mem_ctrl_1/s_rom_addr

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
