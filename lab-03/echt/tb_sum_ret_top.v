`timescale 1ns/1ps
`include "sum_rest_top.v"
module sum_rest_top_tb;

// Entradas
reg [3:0] A;
reg [3:0] B;
reg Sel; // 0 = suma, 1 = resta

// Salidas
wire [4:0] So_final;
wire signo;

// Instancia del módulo bajo prueba (UUT)
sum_rest_top uut (
    .A(A),
    .B(B),
    .Sel(Sel),
    .So_final(So_final),
    .signo(signo)
);

integer i, j;

// Encabezado
initial begin
    $display("============================================================");
    $display("     Testbench para sum_rest_top (4-bit adder/subtractor)   ");
    $display("============================================================");
    $display("  Tiempo | Sel |   A   |   B   | So_final | Signo ");
    $display("------------------------------------------------------------");
end

// Bloque de estímulos
initial begin
    // Recorre todas las combinaciones posibles de A y B
    for (Sel = 0; Sel <= 1; Sel = Sel + 1) begin
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i;
                B = j;
                #5; // pequeño retardo
                $display("%8t |  %b  | %4b | %4b |   %5b  |   %b",
                         $time, Sel, A, B, So_final, signo);
            end
        end
    end

    $display("------------------------------------------------------------");
    $finish;
end

// Opción: volcado de señales para GTKWave
initial begin
    $dumpfile("sum_rest_top_tb.vcd");
    $dumpvars(0, sum_rest_top_tb);
end

endmodule
