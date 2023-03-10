/** Crearemos ahora el módulo de la ROM de los caracteres 
**/

module CHAR_ROM(Filas, Columnas,NCLK,Data );
// Declaramos las entradas -->
input [9:0] Filas ;
input [10:0] Columnas ;
input NCLK ;
// Declaramos salidas -->
output Data ;
// Declaramos un cable el cual será utilizado para las instancias -->
wire [5:0] Address ;
// Declaramos un parámetro -->
parameter Caracter=7'h30 ;
// Instanciamos el módulo de direccionamiento creado en subtarea 3 -->
direcc DIR (
	.Columnas(Columnas),
	.Filas(Filas),
	.Address(Address)
);
// Declaramos la instancia de la propia rom creada mediante el IP_catalog -->
ROM_char	ROM_char_inst(
	.address ( {Caracter,Address}),
	.clock (NCLK),
	.q (Data));
	
endmodule