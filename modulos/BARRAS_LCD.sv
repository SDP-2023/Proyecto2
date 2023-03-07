module BARRAS_LCD(
    input [10:0] Columna,
    output reg [7:0] R, G, B
);

always @(Columna) begin
    // TODO: Ajust colors
    if (Columna <= 132) begin
        R <= 255;
        G <= 255;
        B <= 255;
    end else if (Columna > 132 && Columna <= 264) begin
        R <= 255;
        G <= 255;
        B <= 255;
    end else if (Columna > 264 && Columna <= 396) begin
        R <= 255;
        G <= 255;
        B <= 255;
    end else if (Columna > 396 && Columna <= 528) begin
        R <= 255;
        G <= 255;
        B <= 255;
    end else if (Columna > 528 && Columna <= 660) begin
        R <= 255;
        G <= 255;
        B <= 255;
    end else if (Columna > 660 && Columna <= 792) begin
        R <= 255;
        G <= 255;
        B <= 255;
    end else if (Columna > 792 && Columna <= 924) begin
        R <= 255;
        G <= 255;
        B <= 255;
    end else begin
        R <= 255;
        G <= 255;
        B <= 255;
    end
end
    
endmodule