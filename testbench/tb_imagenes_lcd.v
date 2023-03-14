/** Creación del testbench del módulo final de subtarea 3 (IMAGENES_LCD.v) en donde se propone el diseño
    para su testeo mediante ModelSim ó GateLevel.
    Simplemente y como en las demás tareas de la asignatura, lo que haremos es la asignación de valroes
    a las señales de entrada para que verifiquemos si se producen las salidas tales y como debería de originarse.
**/

// Asignamo la escalas de tiempo predeterminada
`timescale 1ns/1ps

module tb_imagenes_lcd (); 
// Declaramos el parámetro de tiempo (T) -->
parameter T = 20 ;
// Declaramos los registros de Reloj y Reset -->
reg CLK, RST_n ;
// Declaramos los cables que irán enlazados con la instanciación del módulo final -->
wire NCLK, GREST, HD, VD, DEN ;
wire [7:0] R, G, B ;
// Declaramos al señal fd (filer display)
integer fd ;
// Declaramos un evento el cual actuará como lista de sensibilidad
event cierraFichero ;

// Instanciamos el DUV (IMAGENES_LCD.v)
IMAGENES_LCD DUV(
	.CLK(CLK),	
	.RST_n(RST_n),	
	.NCLK(NCLK),	
	.GREST(GREST),	
	.HD(HD),	
	.VD(VD),
	.DEN(DEN),	
	.R(R),	
	.G(G),
	.B(B)
) ;

// Declaramos la señal de RELOJ -->
always
begin
 #(T/2)CLK <= ~CLK ;
end

// Declaramos un primer initial en donde pondremos las señales de forma inicial
initial
   begin
	CLK = 1'b0 ;
	RST_n = 1'b0 ;
	#(T*20) ;
	RST_n = 1'b1 ;
	#(T*1050000) ; // Le damos tiempo suficiente con esos datos para que tenga tiempo a recorrerse toda la pantalla.
	@(negedge VD) ; // Cuando el desplazamiento vertical decaiga, es decir, haya terminado de reccorer la pantalla, 
	begin           // se cierra acaba la simulación.
	$display("Fin de la simulacion\n") ;
	-> cierraFichero ;
	#10 ;
	$stop ;
	end
   end 	

// Declaramos "initial"  en donde se abre el archivo y se cierra dependiendo de los saltos que se hagan.
initial begin
	fd = $fopen("vga.txt","w") ;
	@(cierraFichero) ;
	disable guardaFichero ;
	$display("Cierro Fichero") ;
	$fclose(fd) ;
end

// Declaramos el initial para que se muestre en modelSim tods los datos mínimos que queremos saber.
initial forever begin: guardaFichero
	@(posedge NCLK) // Siempre que el fichero ya haya acabado de visualizarse, entonces presentamos el tiempo
                    // tardado en ello y los datos mínimos para entender como ha salido tod.
	$fwrite(fd,"%0t ps: %b %b %b %b %b %b\n",$time,HD,VD,DEN,R,G,B) ;
end


endmodule