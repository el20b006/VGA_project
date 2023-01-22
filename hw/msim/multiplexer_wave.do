onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_source_multiplexer/s_reset
add wave -noupdate -format Logic /tb_source_multiplexer/s_clk
add wave -noupdate -format Logic /tb_source_multiplexer/s_swsync
add wave -noupdate -format Logic /tb_source_multiplexer/s_pbsync
add wave -noupdate -format Logic /tb_source_multiplexer/s_line
add wave -noupdate -format Logic /tb_source_multiplexer/s_pixel
add wave -noupdate -format Logic /tb_source_multiplexer/s_pat1_rgb
add wave -noupdate -format Logic /tb_source_multiplexer/s_pat2_rgb
add wave -noupdate -format Logic /tb_source_multiplexer/s_mem1_rgb
add wave -noupdate -format Logic /tb_source_multiplexer/s_mem2_rgb
add wave -noupdate -format Logic /tb_source_multiplexer/s_rgb
add wave -noupdate -format Logic /tb_source_multiplexer/s_line_beg
add wave -noupdate -format Logic /tb_source_multiplexer/s_line_end
add wave -noupdate -format Logic /tb_source_multiplexer/s_pixel_beg
add wave -noupdate -format Logic /tb_source_multiplexer/s_pixel_end

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
