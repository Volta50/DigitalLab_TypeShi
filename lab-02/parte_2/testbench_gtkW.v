`timescale 1ns/1ps

module tb_sumadorRestador4bit;

    reg [3:0] A, B;
    reg Sel;
    wire [3:0] s0;
    wire Co;

    sumador_Restador4bit modulo_de_prueba (
        .A(A),
        .B(B),
        .Sel(Sel),
        .s0(s0),
        .Co(Co)
    );

    initial begin
           for (k = 0; k < 2; k = k + 1) begin
                Sel = k;
                for (i = 0; i < 16; i = i + 1) begin
                    for (j = 0; j < 16; j = j + 1) begin
                                A = i;
                                B = j;
                                
        $dumpfile("sumador.vcd");            // crea archivo de ondas
        $dumpvars(0, tb_sumadorRestador4bit); // guarda todas las señales del testbench y submódulos


        #5;
     $finish;
                    
                
           
    end

endmodule