/** Crearemos en este módulo el sistema de direccionamiento de los píxeles de la imagen
    En concreto, utilizaremos el modo de direccionamiento "X-Y". Donde los píxeles se encuentran ubicados 
    cuasi-consecutivamente y entre fila y fila se encuentran "log2(X)" equiespaciados.
**/
module direcc(Filas, Columnas, Address);
// Declaramos entradas -->
input [9:0] Filas;
input [10:0] Columnas;
// Declaramos única salida -->
output reg [15:0] Address; // Como son 16 bits --> "[15:0]"
// Declaramos registros para parametrizarlos según modo de direccionamiento usado.
reg [8:0]n;
reg [7:0]m;
// Iniciamos bloque procedural "always" con entradas como lista de sensibilidad.
always@(Columnas,Filas) 
begin 
      m=(Filas-35)/2; // Renderización de las filas.
      n=(Columnas-216)/2; // Renderización de las columnas.
	   Address={m,n}; // Parametrizamos la dirección donde buscar en la ROM.
end

endmodule 