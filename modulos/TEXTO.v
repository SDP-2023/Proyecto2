/**
    
**/


module TEXTO( NCLK, Columna,  Fila,  Data);
// Declaramos las entradas necesarias -->
input NCLK ;
input [10:0] Columna ; // 11 bits
input [9:0] Fila ; // 10 bits
// Declaramos los cables untilizados para la instancia final -->
wire [8:0] vColumna ; // 9 bits
wire [7:0] vFila ; // 8 bits
wire [6:0] iData ; // 7 bits
// Declaramos el registro del módulo en color verde de la memoria -->
reg [5:0] Register ; // Registro de 6 bits ya que son 3 para vfilas y 3 para vcolumnas
// Declaramos la salida como dato utilizada para la generación del color -->
output Data ;
// Declaramos un bloque procedural always con "NCLK" como lista de sensibilidad -->
always @(negedge NCLK)
begin
    // Actualizamos el registro a cada pulso del reloj -->
    // Fila y columna como se observa en diagrama de bloques presentado -->
	Register[5:3]<=vFila[2:0] ; // del bit 4 al bit 6 en el register
	Register[2:0]<=vColumna[2:0] ; // del bit 0 al bit 3 en el register
end
// Instanciamos módulo de direccionamiento (X-Y) con el nuevo métdo de fila y columna presentado -->
direcc_texto DIR(
	.Columnas(Columna),
	.Filas(Fila),
	.Address({vFila,vColumna})
) ;
// Instanciamos la memoria interna con el texto de los nombres de Arnau y Carlos en .mif -->
ROM_text	ROM_text_inst (
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