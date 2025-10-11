`timescale 1ns/1ps

module tb_sumador_restador;

    // Entradas como registros
    reg [3:0] A;
    reg [3:0] B;
    reg S;

    // Salidas como cables
    wire [3:0] S;
    wire Cout;

    // Instancia del módulo que quieres probar
    sumador_Restador4bit (
        .A(A),
        .B(B),
        .M(M),
        .S(S),
        .Cout(Cout)
    );

    // Bloque inicial: donde haces las pruebas
    initial begin
        $dumpfile(\"dump.vcd\"); // archivo de simulación para GTKWave
        $dumpvars(0, tb_sumador_restador);

        // Pruebas
        M = 0; A = 4'd3; B = 4'd2; #10;  // Suma
        M = 1; A = 4'd5; B = 4'd2; #10;  // Resta
        M = 1; A = 4'd2; B = 4'd5; #10;  // Resta negativa
        $finish; // Finaliza la simulación
    end

endmodule
