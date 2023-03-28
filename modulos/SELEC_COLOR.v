/** Crearemos en este fichero el diseño a realizar para la selección de color en pantalla. 
**/

module SELEC_COLOR #(
	parameter BG_R = 8'b00000000,
	parameter BG_G = 8'b11111111,
	parameter BG_B = 8'b00000000,
	parameter FG_R = 8'b01111111,
	parameter FG_G = 8'b01111111,
	parameter FG_B = 8'b00000000
)(Seleccion_color, R, G, B);
// Entradas -->
input Seleccion_color ;
// Salidas como registros -->
output [0:7] R, G, B ;

// Si la entrada está a nivel alto cambiamos el registro de nivel de color RGB
// Si está la entrada a nivel bajo, entonces se establece de color predeterminado
assign R = Seleccion_color ? FG_R : BG_R;
assign G = Seleccion_color ? FG_G : BG_G;
assign B = Seleccion_color ? FG_B : BG_B;

endmodule 