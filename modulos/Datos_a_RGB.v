
/** En este módulo en concreto, crearemos el cambio de datos a sistema de colores RGB.
	Lo conseguiremos con la información proporcionada en la explicación de asignación de bits por rango de color RGB.
	
**/
module Datos_a_RGB(Data, R, G, B);
// Entrada -->
input [15:0] Data ; //16 bits de tamaño.
// Salidas como registros -->
output reg [7:0] R, G, B ; // 8 bits de tamaño cada una.
// Declaración del bloque procedural always con "Data" como lista de sensibilidad --> 
always @(Data)
// En cuanto a la organización de la estructura de posición de color de cada pixel, lo organizamos siguiendo
// La estructura propuesta en el propio guión de prácticas de la subtarea_3 -->
begin
    // Sabiendo que trabajamos con imagen de 16 bits, los 5 primeros para el rojo, lo 5 siguiente en verde y el resto a blue.
	R={Data[15:11],Data[15:13]} ; 
	G={Data[10:5],Data[10:9]} ;
	B={Data[4:0],Data[4:2]} ; 
end	

endmodule 