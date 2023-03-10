onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+mc8051_rom -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -O5 xil_defaultlib.mc8051_rom xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {mc8051_rom.udo}

run -all

endsim

quit -force
