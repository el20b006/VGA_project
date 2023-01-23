onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+VGA_ctrl_top_struc_cfg -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -O5 xil_defaultlib.VGA_ctrl_top_struc_cfg xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {VGA_ctrl_top_struc_cfg.udo}

run -all

endsim

quit -force
