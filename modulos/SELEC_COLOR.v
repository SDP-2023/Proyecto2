/** Crearemos en este fichero el diseño a realizar para la selección de color en pantalla. 
**/

module SELEC_COLOR(Seleccion_color, R, G, B);
// Entradas -->
input Seleccion_color ;
// Salidas como registros -->
output reg [0:7] R, G, B ;
// Generamos el bloque procedural always con entrada definida arriba como lista de sensibilidad -->
always @(Seleccion_color)
begin
	// Si está la entrada a nivel bajo, entonces se establece de color predeterminado
	if(Seleccion_color==1'b0)
		begin
			R<=8'b00000000 ;
			G<=8'b11111111 ;
			B<=8'b00000000 ;			
		end
		// Si la entrada está  anivel alto tal
	else
		begin
			R<=8'b01111111 ;
			G<=8'b01111111 ;
			B<=8'b00000000 ;			
		end
end

endmodule 