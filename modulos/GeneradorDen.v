module GeneradorDen(
    input [10:0] Columna,
    input [9:0] Fila,
    output DEN
);

assign DEN = Columna > 11'd216 && Columna < 11'd1015 && Fila > 10'd35 && Fila < 10'd514;

endmodule
