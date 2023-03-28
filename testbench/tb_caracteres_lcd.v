//`define TESTBENCH
/**
    En este fichero realizamos el testbench del módulo "CARACTERES_LCD.v".
    Lo realizamos mediante la misma estructura desarrollada hasta ahora.
**/

// Declaramos la escala de tiempo. Siempre igual -->
`timescale 1ns/1ps

module tb_caracteres_lcd (); 
// Declaramos registros -->
reg CLK, RST_n;
// Declaramos cables utilizados en las instancias -->
wire NCLK, GREST, HD, VD, DEN;
wire [7:0] R, G, B;
// Declaramos parámetro de tiempo -->
parameter T = 20;
// Declarmos valor entero de de filer descriptor (fd) -->
integer fd;
// Declaramos el evento que indica el cierre mismo del fichero a usar (Estará como lista de sensibilidad) -->
event cierraFichero;
// Instanciamos DUT (Device under test), módulo el cual testeamos aquí -->	
CARACTERES_LCD DUT(
	.CLK(CLK) ,
	.RST_n(RST_n) ,	
	.NCLK(NCLK) ,	
	.GREST(GREST) ,	
	.HD(HD) ,	
	.VD(VD) ,	
	.DEN(DEN) ,	
	.R(R) ,	
	.G(G) ,
	.B(B)
) ;
// Generamos el propio Reloj -->
always
begin
    #(T/2)CLK <= ~CLK;
end
// Generamos cambios de las señales según unos tiempos puestos por nosotros -->
initial
   begin
	CLK = 1'b0;
	RST_n = 1'b0;
	#(T*20);
	RST_n = 1'b1;
	#(T*1050000);
	@(negedge VD);
	begin
	$display("Fin de la simulacion\n");
	-> cierraFichero;
	#10;
	$stop;
	end
   end 
// Generamos la creación del fichero donde aparecen caracteres, se guarda y se cierra -->
initial begin
	fd = $fopen("vga_caracteres_lcd.txt","w");
	@(cierraFichero);
	disable guardaFichero;
	$display("Cierro Fichero");
	$fclose(fd);
end
// Generamos la creación de los valores obtenidos en la simulación y testeo -->
initial forever begin: guardaFichero
	@(posedge NCLK) 
	$fwrite(fd,"%0t ps: %b %b %b %b %b %b\n",$time,HD,VD,DEN,R,G,B);
end

endmodule