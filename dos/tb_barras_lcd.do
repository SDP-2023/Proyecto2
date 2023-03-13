vlog -reportprogress 300 -work work ./testbench/tb_barras_lcd.sv

vsim work.tb_barras_lcd

# Añadimos todas las waves
add wave -divider "Señales de control:"
add wave -position insertpoint -color yellow -label "CLK" sim:/tb_barras_lcd/CLK
add wave -position insertpoint -color yellow -label "RST_n" sim:/tb_barras_lcd/RST_n
add wave -position insertpoint -color yellow -label "NCLK" sim:/tb_barras_lcd/NCLK
add wave -position insertpoint -color yellow -label "GREST" sim:/tb_barras_lcd/GREST
add wave -position insertpoint -color yellow -label "HD" sim:/tb_barras_lcd/HD
add wave -position insertpoint -color yellow -label "VD" sim:/tb_barras_lcd/VD
add wave -position insertpoint -color yellow -label "DEN" sim:/tb_barras_lcd/DEN

add wave -divider "Colores:"
add wave -position insertpoint -color red -label "R" sim:/tb_barras_lcd/R
add wave -position insertpoint -color green -label "G" sim:/tb_barras_lcd/G
add wave -position insertpoint -color blue -label "B" sim:/tb_barras_lcd/B

run -all
