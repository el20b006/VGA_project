onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib VGA_ctrl_top_struc_cfg_opt

do {wave.do}

view wave
view structure
view signals

do {VGA_ctrl_top_struc_cfg.udo}

run -all

quit -force
