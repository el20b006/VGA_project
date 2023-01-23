# Windows console script

# compile software application for mc8051 using SDCC compiler
# and generate Intel HEX file using packihx_tcl.exe 
sdcc ../../sw/VGA_controller/src/main.c -o ../../sw/VGA_controller/build/
echo "sdcc: main.c sucessfully compiled"
../../tools/packihx_tcl/win/packihx_tcl.exe ../../sw/VGA_controller/build/main.ihx ../../sw/VGA_controller/build/mc8051_rom.hex

# generate MIF and COE files out of Intel HEX file
../../tools/convhex/win/convhex.exe ../../sw/VGA_controller/build/mc8051_rom.hex

# copy MIF file (required for simulation only) to ModelSim simulation directory
file copy -force ../../sw/VGA_controller/build/mc8051_rom.mif ../../hw/msim/

echo "mc8051 software application built successfully!"
