
/**

**/


module TEXTO_LCD( CLK, RST_n, NCLK, GREST, HD, VD, DEN, R, G, B);
// Declaramos entradas del módulo final -->
input CLK, RST_n ;
// Declaramos cables utilizados en las instancias -->
wire [10:0] Columna ;
wire [9:0] Fila ;
wire Data ;
// Declaramos salidas finales del módulo las cuales representan el texto -->
output NCLK, GREST, HD, VD, DEN ;
output [7:0] R, G, B ;
// Instanciamos el módulo de sincronismo de señales -->
LCD_SYNC LCD_SYNC(
            .CLK(CLK),
				.RST_n(RST_n),
				.NCLK(NCLK),
				.GREST(GREST),
				.HD(HD),
		  		.VD(VD),
				.DEN(DEN),											 
				.Fila(Fila),
				.Columna(Columna)
) ;
// Declaramos módulo inicial del texto en donde se incluye direccionamiento, memorias.... -->
TEXTO texto(
	.NCLK(NCLK),
	.Fila(Fila),
	.Columna(Columna),
	.Data(Data)
) ;
// Declaramos módulo para la generación de los colores del texto a presentar -->
SELEC_COLOR COLOR(
	.Seleccion_color(Data),
	.R(R),
	.G(G),
	.B(B)
) ;

endmodule 