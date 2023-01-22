onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_mem_ctrl_2/s_reset
add wave -noupdate -format Logic /tb_mem_ctrl_2/s_clk
add wave -noupdate -format Logic /tb_mem_ctrl_2/s_enable_25M
add wave -noupdate -format Logic /tb_mem_ctrl_2/s_pixel
add wave -noupdate -format Logic /tb_mem_ctrl_2/s_line
add wave -noupdate -format Logic /tb_mem_ctrl_2/s_pixel_beg
add wave -noupdate -format Logic /tb_mem_ctrl_2/s_pixel_end
add wave -noupdate -format Logic /tb_mem_ctrl_2/s_line_beg
add wave -noupdate -format Logic /tb_mem_ctrl_2/s_line_end
add wave -noupdate -format Logic /tb_mem_ctrl_2/s_rgb
add wave -noupdate -format Logic /tb_mem_ctrl_2/i_mem_ctrl_2/s_rom_addr

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
