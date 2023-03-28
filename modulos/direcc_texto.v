


/** Crearemos en este módulo el sistema de direccionamiento de los píxeles de la imagen
    En concreto, utilizaremos el modo de direccionamiento "X-Y". Donde los píxeles se encuentran ubicados 
    cuasi-consecutivamente y entre fila y fila se encuentran "log2(X)" equiespaciados.
**/
module direcc_texto(Filas, Columnas, Address);
// Declaramos entradas -->
input [9:0] Filas ;
input [10:0] Columnas ;
// Declaramos única salida -->
output reg [16:0] Address ; // Como son 17 bits por la memoria utilizada... --> "[16:0]"
// Declaramos registros para parametrizarlos según modo de direccionamiento usado.
reg [8:0]n ;
reg [7:0]m ;
// Iniciamos bloque procedural "always" con entradas como lista de sensibilidad.
always@(Columnas,Filas) 
begin 
      m = (Filas-35) ; // Renderización de las filas. --> Back Porch_Y = 35
      n = (Columnas-216) ; // Renderización de las columnas. --> Back Porch_X = 216
	  Address = {m,n} ; // Parametrizamos la dirección donde buscar en la ROM.
end

endmodule 