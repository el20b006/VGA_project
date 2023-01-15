onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_io_ctrl/reset_i
add wave -noupdate -format Logic /tb_io_ctrl/clk_i
add wave -noupdate -format Logic /tb_io_ctrl/i_io_ctrl/clk_1k
add wave -noupdate -format Logic /tb_io_ctrl/sw_i
add wave -noupdate -format Logic /tb_io_ctrl/swsync_o
add wave -noupdate -format Logic /tb_io_ctrl/pb_i
add wave -noupdate -format Logic /tb_io_ctrl/pbsync_o
add wave -noupdate -format Logic /tb_io_ctrl/i_io_ctrl/pb_count

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
