/**
 * Módulo que genera 8 barras verticales de distintos colores para comprobar el correcto funcionamiento
 * de la pantalla.
 * @file BARRAS_LCD.sv
 */

module BARRAS_LCD#(
    parameter BACK_PORCH_X = 216,
    parameter BACK_PORCH_Y = 35,
    parameter FRONT_PORCH_X = 40,
    parameter FRONT_PORCH_Y = 10,
    parameter SCREEN_SIZE_X = 800,
    parameter SCREEN_SIZE_Y = 480
)(
    input CLK, RST_n,
    output NCLK, GREST, HD, DEN, VD,
    output reg [7:0] R, G, B
);

// There are 8 columns
localparam PER_COLUMN = SCREEN_SIZE_X / 8;
localparam COLUMN_1 = BACK_PORCH_X + PER_COLUMN;
localparam COLUMN_2 = BACK_PORCH_X + PER_COLUMN * 2;
localparam COLUMN_3 = BACK_PORCH_X + PER_COLUMN * 3;
localparam COLUMN_4 = BACK_PORCH_X + PER_COLUMN * 4;
localparam COLUMN_5 = BACK_PORCH_X + PER_COLUMN * 5;
localparam COLUMN_6 = BACK_PORCH_X + PER_COLUMN * 6;
localparam COLUMN_7 = BACK_PORCH_X + PER_COLUMN * 7;

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
    .Fila(Fila),
    .Columna(Columna)
);

always @(Columna) begin
    if (Columna <= COLUMN_1) begin
        // Blanco
        R <= 255;
        G <= 255;
        B <= 255;
    end else if (Columna > COLUMN_1 && Columna <= COLUMN_2) begin
        // Amarillo
        R <= 255;
        G <= 255;
        B <= 0;
    end else if (Columna > COLUMN_2 && Columna <= COLUMN_3) begin
        // Cyan
        R <= 0;
        G <= 255;
        B <= 255;
    end else if (Columna > COLUMN_3 && Columna <= COLUMN_4) begin
        // Verde
        R <= 0;
        G <= 255;
        B <= 0;
    end else if (Columna > COLUMN_4 && Columna <= COLUMN_5) begin
        // Magenta
        R <= 255;
        G <= 0;
        B <= 255;
    end else if (Columna > COLUMN_5 && Columna <= COLUMN_6) begin
        // Rojo
        R <= 255;
        G <= 0;
        B <= 0;
    end else if (Columna > COLUMN_6 && Columna <= COLUMN_7) begin
        // Azul
        R <= 0;
        G <= 0;
        B <= 255;
    end else begin
        // Negro
        R <= 0;
        G <= 0;
        B <= 0;
    end
end
    
endmodule