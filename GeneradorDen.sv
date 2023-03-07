module GeneradorDen(
    input [11:0] Columna,
    input [9:0] Fila,
    output DEN
);

assign DEN = Columna > 11'd514 && Columna < 11'd1015 && Fila > 9'd35 && Fila < 9'd216;
    
endmodule