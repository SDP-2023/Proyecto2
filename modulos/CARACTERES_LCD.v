/** Aquí instanciaremos tods y cada uno de los módulos conformados para la realización de la subtarea 4.
	
**/

module CARACTERES_LCD ( CLK, RST_n, NCLK, GREST, HD, VD, DEN, R, G, B);
// Declaramos las entradas -->
input CLK, RST_n ;
// Declaramos las salidas -->
output NCLK, GREST, HD, VD, DEN ;
// Declaramos salidas como registros de colores -->
output [7:0] R, G, B ;
// Declaramos lo 'wires' que irán unidos entre módulos -->
wire [10:0] Columna ;
wire [9:0] Fila ;
wire Data ;
// Declaramos parámetro -->
parameter m=7'h30 ;
// Instanciamos el módulo de sincronización -->
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
);
// Instanciamos el módulo de la memoria de los caracteres -->
CHAR_ROM  #(.Caracter(m)) CHAR(
    .Filas(Fila),
    .Columnas(Columna),
	.NCLK(NCLK),
	.Data(Data)
); 
// Declaramos módulo de la selección de los colores -->
SELEC_COLOR COLOR(
	.Seleccion_color(Data),
	.R(R),
	.G(G),
	.B(B)
);


endmodule