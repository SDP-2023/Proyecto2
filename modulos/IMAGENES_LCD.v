
/**  Crearemos en este archivo el módulo completo para la representación de la imagen por pantalla de la placa FPGA.
     Este módulo contendrá tods y cada uno de los módulos creados para ello, es decir, instanciamos "LCD_SYNC", junto a 
     "direcc", juntos a "ROM_Image" y finalmente el módulo de "Datos_a_RGB"
**/

module IMAGENES_LCD( CLK, RST_n, NCLK, GREST, HD, VD, DEN, R, G, B);
// Declaramos las entradas del módulo -->
input CLK, RST_n ;
// Declaramos las Salidas del módulo -->
output NCLK, GREST, HD, VD, DEN ;
output [7:0] R, G, B ;
// Declaramos los cable como enlaces a los demás módulos -->
wire [16:0] Address ;
wire [15:0] Data ;
wire [10:0] Columna ;
wire [9:0] Fila ;
// Instanciamos el módulo de sincronización LCD -->
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
// Instanciamos el módulo de direccioinamiento -->
direcc DIR(
	.Columnas(Columna),
	.Filas(Fila),
	.Address(Address)
) ;
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
// Fin del módulo final de la subtarea 3 -->
endmodule 