onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_pattern_gen_2/reset_i
add wave -noupdate -format Logic /tb_pattern_gen_2/clk_i
add wave -noupdate -format Logic /tb_pattern_gen_2/pixel_i
add wave -noupdate -format Logic /tb_pattern_gen_2/line_i
add wave -noupdate -format Logic /tb_pattern_gen_2/rgb_o


TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
