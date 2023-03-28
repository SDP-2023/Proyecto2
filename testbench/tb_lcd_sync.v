`define TESTBENCH
/**
`include "modulos/count.v"
`include "modulos/GeneradorDen.sv"
`include "modulos/LCD_SYNC.sv"
**/
`timescale 1ns/100ps // Cuanto es el paso de la simulación (siempre igual)

module tb_lcd_sync();
    
	localparam T = 20;

    reg CLK, RST_n;
    wire NCLK, GREST, HD, DEN, VD;
    wire [10:0] Columna;
    wire [9:0] Fila;

    LCD_SYNC sync(
        .CLK(CLK),
        .RST_n(RST_n),
        .NCLK(NCLK),
        .GREST(GREST),
        .HD(HD),
        .DEN(DEN),
        .VD(VD),
        .Columna(Columna),
        .Fila(Fila)
    );

    // Generamos el clock -->
	always #(T/2) CLK = ~CLK ; // Cada medio periodo cambiamos clk de 1 a 0 y vicev

    // Test procedure (Lo que vamos a hacer para probarlo)
    initial
	begin
        // Empezamos reiniciando
		CLK = 0;
		RST_n = 0;
        // Desconectamos el reset
        #(T*2) RST_n = 1;

        // Esperamos a VD
        @(negedge VD);

        // Finalizamos
        $display("Test finished");
		$stop;
    end

endmodule
