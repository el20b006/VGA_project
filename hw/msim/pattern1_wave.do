onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_pattern_gen_1/s_reset
add wave -noupdate -format Logic /tb_pattern_gen_1/s_clk
add wave -noupdate -format Logic /tb_pattern_gen_1/s_pixel
add wave -noupdate -format Logic /tb_pattern_gen_1/s_line
add wave -noupdate -format Logic /tb_pattern_gen_1/s_rgb


TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
