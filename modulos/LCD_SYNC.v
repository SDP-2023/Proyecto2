module LCD_SYNC(
    input CLK, RST_n,
    output reg NCLK, GREST, HD, DEN, VD,
    output reg [10:0] Columna,
    output reg [9:0] Fila
);
    wire HCOUNT_TC;
    wire VCOUNT_TC;

`ifdef TESTBENCH
    // SOLO PARA TESTS:
    assign NCLK = CLK;
`else
    pll_ltm pll_ltm_inst(
        .inclk0(CLK),
        .c0(NCLK)
    );
`endif

    count #(
        .modulo(1056)
    ) HCOUNT (
        .CLK(NCLK),
        .RSTn(RST_n),
        .ENABLE(1'b1),
        .UP_DOWN(1'b1),
        .COUNT(Columna),
        .TC(HCOUNT_TC)
    );

    count #(
        .modulo(525)
    ) VCOUNT (
        .CLK(NCLK),
        .RSTn(RST_n),
        .ENABLE(HCOUNT_TC),
        .UP_DOWN(1'b1),
        .COUNT(Fila),
        .TC(VCOUNT_TC)
    );

    GeneradorDen GEN_DEN (
        .Columna(Columna),
        .Fila(Fila),
        .DEN(DEN)
    );

    assign HD = !HCOUNT_TC;
    assign VD = !VCOUNT_TC;

    assign GREST = RST_n;

endmodule
