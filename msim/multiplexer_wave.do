onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_source_multiplexer/reset_i
add wave -noupdate -format Logic /tb_source_multiplexer/clk_i
add wave -noupdate -format Logic /tb_source_multiplexer/swsync_i
add wave -noupdate -format Logic /tb_source_multiplexer/pbsync_i
add wave -noupdate -format Logic /tb_source_multiplexer/pat1_rgb_i
add wave -noupdate -format Logic /tb_source_multiplexer/pat2_rgb_i
add wave -noupdate -format Logic /tb_source_multiplexer/mem1_rgb_i
add wave -noupdate -format Logic /tb_source_multiplexer/mem2_rgb_i
add wave -noupdate -format Logic /tb_source_multiplexer/rgb_o


TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
