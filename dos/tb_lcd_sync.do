vlog -reportprogress 300 -work work ./modulos/LCD_SYNC.sv
vlog -reportprogress 300 -work work ./testbench/tb_lcd_sync.sv

vsim work.tb_lcd_sync

# Añadimos todas las waves
add wave -divider "Señales de control:"
add wave -position insertpoint -color yellow -label "CLK" sim:/tb_lcd_sync/CLK
add wave -position insertpoint -color yellow -label "RST_n" sim:/tb_lcd_sync/RST_n
add wave -position insertpoint -color yellow -label "NCLK" sim:/tb_lcd_sync/NCLK
add wave -position insertpoint -color yellow -label "GREST" sim:/tb_lcd_sync/GREST
add wave -position insertpoint -color yellow -label "HD" sim:/tb_lcd_sync/HD
add wave -position insertpoint -color yellow -label "VD" sim:/tb_lcd_sync/VD
add wave -position insertpoint -color yellow -label "DEN" sim:/tb_lcd_sync/DEN

add wave -divider "Datos:"
add wave -position insertpoint -color green -label "Columna" sim:/tb_lcd_sync/Columna
add wave -position insertpoint -color green -label "Fila" sim:/tb_lcd_sync/Fila

run -all
