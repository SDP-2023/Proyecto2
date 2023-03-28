`define TESTBENCH
/**
`include "modulos/count.v"
`include "modulos/GeneradorDen.sv"
`include "modulos/LCD_SYNC.sv"
`include "modulos/BARRAS_LCD.sv"
**/
`timescale 1ps/1ps // Cuanto es el paso de la simulación (siempre igual)

module tb_barras_lcd();
    
	localparam T = 40000;

    reg CLK, RST_n;
    wire NCLK, GREST, HD, DEN, VD;
    wire [7:0] R, G, B;

    BARRAS_LCD sync(
        .CLK(CLK),
        .RST_n(RST_n),
        .NCLK(NCLK),
        .GREST(GREST),
        .HD(HD),
        .DEN(DEN),
        .VD(VD),
        .R(R),
        .G(G),
        .B(B)
    );

    integer fd; // File Descriptor para manipular el archivo
    event cierraFichero; // Ordena que se cierre el archivo

    // Generamos el clock -->
	always #(T/2) CLK = ~CLK ; // Cada medio periodo cambiamos clk de 1 a 0 y vicev

    // Test procedure (Lo que vamos a hacer para probarlo)
    initial begin
        // Empezamos reiniciando
		CLK = 0;
		RST_n = 0;
        // Desconectamos el reset
        #(T*2) RST_n = 1;

        // Esperamos a VD
        @(negedge VD);

        // Finalizamos
        $display("Test finished");
        -> cierraFichero;
        #10;
		$stop;
    end

    initial begin
        fd = $fopen("vga.txt", "w");
        @(cierraFichero);
        disable guardaFichero;
        $display("Cierro fichero");
        $fclose(fd);
    end

    initial forever begin: guardaFichero
        @(posedge CLK)
        $fwrite(fd, "%0t ps: %b %b %b %b %b %b\n", $time, HD, VD, DEN, R, G, B);
    end

endmodule
