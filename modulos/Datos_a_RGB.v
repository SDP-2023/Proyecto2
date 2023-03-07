
/** En este módulo en concreto, crearemos el cambio de datos a sistema de colores RGB.
	Lo conseguiremos con la información proporcionada en la explicación de asignación de bits por rango de color RGB.
	
**/
module Datos_a_RGB(Data, R, G, B);
// Entrada -->
input [15:0] Data ; //16bits de tamaño.
// Salidas como registros -->
output reg [7:0] R, G, B ; // 8bits de tamaño cada una.
// Declaración del bloque procedural always con "Data" como lista de sensibilidad --> 
always @(Data)
begin
	R={Data[15:11],Data[15:13]} ; 
	G={Data[10:5],Data[10:9]} ;
	B={Data[4:0],Data[4:2]} ; 
end	

endmodule 