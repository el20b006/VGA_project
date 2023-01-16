onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_VGA_ctrl_top/reset_i
add wave -noupdate -format Logic /tb_VGA_ctrl_top/clk_i
add wave -noupdate -format Logic /tb_VGA_ctrl_top/pb_i
add wave -noupdate -format Logic /tb_VGA_ctrl_top/sw_i
add wave -noupdate -format Logic /tb_VGA_ctrl_top/h_sync_o
add wave -noupdate -format Logic /tb_VGA_ctrl_top/v_sync_o
add wave -noupdate -format Logic /tb_VGA_ctrl_top/rgb_o


TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
