
/**
    En esta subtarea 6 se nos pide la realización de la subtarea 3 y 5 de la mano, es decir,
    La implantación del texto de la 5 sobre la imagen de la 3.
**/

module IMAGEN_TEXTO_LCD( CLK, RST_n, NCLK, GREST, HD, VD, DEN, R, G, B);
// Declaramos entradas del módulo final -->
input CLK, RST_n ;
// Declaramos cables utilizados en las instancias -->
wire [16:0] Address ; // 17 btis
wire [15:0] Data ; // 16 bits
wire [10:0] Columna ; // 11 bits
wire [9:0] Fila ; // 10 bits
wire Data ;
// Declaramos salidas finales del módulo las cuales representan el texto -->
output NCLK, GREST, HD, VD, DEN ;
output [7:0] R, G, B ; // 8 bits cada uno
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
// Instanciamos el módulo de direccioinamiento para la Imagen -->
direcc DIR1(
	.Columnas(Columna),
	.Filas(Fila),
	.Address(Address)
) ;
// Cada posición de la memoria tendrá un valor de color de un pixel (De ahí el direccionamiento)
// Instanciamos el módulo de la ROM donde se carga la imagen a monstrar -->
ROM_Image	ROM_Image_inst(
	.address (Address),
	.clock (NCLK),
	.q (Data)
) ;
// Instanciamos el módulo para el cambio de valor de data a valor RGB -->
Datos_a_RGB DataRGB(
	.Data(Data),
	.R(R),
	.G(G),
	.B(B)
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