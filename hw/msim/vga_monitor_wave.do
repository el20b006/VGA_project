onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /vga_monitor_top/reset
add wave -noupdate -format Logic /vga_monitor_top/clk
add wave -noupdate -format Logic /vga_monitor_top/enable
add wave -noupdate -format Logic /vga_monitor_top/pixel_count
add wave -noupdate -format Logic /vga_monitor_top/line_count
add wave -noupdate -format Logic /vga_monitor_top/rgb
add wave -noupdate -format Logic /vga_monitor_top/h_sync
add wave -noupdate -format Logic /vga_monitor_top/v_sync
add wave -noupdate -format Logic /vga_monitor_top/rgb_output

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
