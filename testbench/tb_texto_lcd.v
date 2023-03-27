
/**
    En este diseño se propone la verificación del módulo de "TEXTO_LCD.v" creado previamente mediante las
    especificaciones del guión del proyecto_2_SDP.
    Para el cual será necesario la instanciación de dicho módulo, declaración de parámetros, señales, cables y 
    registros necesarios para llevarloa  cabo.
    Se explica paso a paso como se realiza el siguiente testbench --> 
**/

// Declaramos la escala de tiempo, siempre igual -->
`timescale 1ns/1ps

module tb_texto_lcd (); 
// Declaramos los registros de reset y reloj -->
reg CLK, RST_n ;
// Declaramos los cables utilizados en las instancias cada cual con su respectivo tamaño en bits -->
wire NCLK, GREST, HD, VD, DEN ;
wire [7:0] R, G, B ;
// Declaramos el parámetro de tiempo o periodo (También siempre igual (20)) -->
parameter T = 20 ;
// Declaramos el valor entero de filer descriptor (fd) -->
integer fd ;
// Declaramos el evento que indica el cierre mismo del fichero a usar (Estará como lista de sensibilidad) -->
event cierraFichero ;
// Instanciamos DUT (Device under test), módulo el cual testeamos aquí -->	
TEXTO_LCD DUT(
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
    #(T/2)CLK <= ~CLK ;
end
// Generamos
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
// Generamos 
initial begin
	fd = $fopen("vga_names.txt","w");
	@(cierraFichero);
	disable guardaFichero;
	$display("Cierro Fichero");
	$fclose(fd);
end
// Generamos 
initial forever begin: guardaFichero
	@(posedge NCLK) 
	$fwrite(fd,"%0t ps: %b %b %b %b %b %b\n",$time,HD,VD,DEN,R,G,B);
end


endmodule