onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_io_ctrl/s_reset
add wave -noupdate -format Logic /tb_io_ctrl/s_clk
add wave -noupdate -format Logic /tb_io_ctrl/s_sw
add wave -noupdate -format Logic /tb_io_ctrl/s_swsync
add wave -noupdate -format Logic /tb_io_ctrl/s_pb
add wave -noupdate -format Logic /tb_io_ctrl/s_pbsync
add wave -noupdate -format Logic /tb_io_ctrl/i_io_ctrl/s_pb_count

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
