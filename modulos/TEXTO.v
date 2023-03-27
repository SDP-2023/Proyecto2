/**
    
**/


module TEXTO( NCLK, Columna,  Fila,  Data);
// Declaramos las entradas necesarias -->
input NCLK ;
input [10:0] Columna ;
input [9:0] Fila ;
// Declaramos los cables untilizados para la instancia final -->
wire [8:0] vColumna ;
wire [7:0] vFila ;
wire [6:0] iData ;
// Declaramos el registro del módulo en color verde de la memoria -->
reg [5:0] Register ;
// Declaramos la salida como dato utilizada para la generación del color -->
output Data ;
// Declaramos un bloque procedural always con "NCLK" como lista de sensibilidad -->
always @(negedge NCLK)
begin
    // Actualizamos el registro a cada pulso del reloj -->
    // Fila y columna como se observa en diagrama de bloques presentado -->
	Register[5:3]<=vFila[2:0] ;
	Register[2:0]<=vColumna[2:0] ;
end
// Instanciamos módulo de direccionamiento (X-Y) con el nuevo métdo de fila y columna presentado -->
direcc DIR(
	.Columnas(Columna),
	.Filas(Fila),
	.Address({vFila,vColumna})
) ;
// Instanciamos la memoria interna con el texto de los nombres de Arnau y Carlos en .mif -->
ROM_texto	ROM_texto_inst (
	.address ({vFila[7:3],vColumna[8:3]}),
	.clock (NCLK),
	.q (iData)
) ;
// Instanciamos la memoria interna de caracteres antes realizada con los nuevos datos y valores -->
ROM_char	ROM_char_inst(
	.address ({iData,Register}),
	.clock (NCLK),
	.q (Data)
) ;

endmodule