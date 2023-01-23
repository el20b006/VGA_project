onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /vga_monitor_top/s_reset
add wave -noupdate -format Logic /vga_monitor_top/s_enable
add wave -noupdate -format Logic /vga_monitor_top/s_pixel_count
add wave -noupdate -format Logic /vga_monitor_top/s_line_count
add wave -noupdate -format Logic /vga_monitor_top/s_rgb
add wave -noupdate -format Logic /vga_monitor_top/s_h_sync
add wave -noupdate -format Logic /vga_monitor_top/s_v_sync
add wave -noupdate -format Logic /vga_monitor_top/s_rgb_output

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
