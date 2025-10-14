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
        A = 1;
        B = 1;
        Sel = 0;
        $dumpfile("sumador.vcd");            // crea archivo de ondas
        $dumpvars(0, tb_sumadorRestador4bit); // guarda todas las señales del testbench y submódulos


        #5;
     $finish;
    end

endmodule