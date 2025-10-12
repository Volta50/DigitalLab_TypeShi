`timescale 1ns/1ps

module tb_sumador_restador;

    // Entradas
    reg [3:0] A, B;
    reg Sel; // 0 = suma, 1 = resta

    // Salidas
    wire [3:0] s0;
    wire Co;

    // Instancia del módulo bajo prueba (UUT)
    sumador_Restador4bit uut (
        .A(A),
        .B(B),
        .Sel(Sel),
        .s0(s0),
        .Co(Co)
    );

    // Variables para comprobar resultados
    reg [4:0] expected; // un bit extra para el carry

    integer i, j; // iteradores

    initial begin
        $display("Tiempo | Sel |   A   |   B   |  s0  | Co | Resultado esperado");
        $display("-------------------------------------------------------------");

        // Probar todas las combinaciones de A y B
        for (Sel = 0; Sel <= 1; Sel = Sel + 1) begin
            for (i = 0; i < 16; i = i + 1) begin
                for (j = 0; j < 16; j = j + 1) begin
                    A = i;
                    B = j;
                    #5; // esperar un poco
                    if (Sel == 0)
                        expected = A + B;     // suma
                    else
                        expected = A - B;     // resta

                    $display("%4t |  %b  | %4b | %4b | %4b |  %b |  %5b",
                             $time, Sel, A, B, s0, Co, expected);

                    // Verificar si coincide
                    if ({Co, s0} !== expected)
                        $display("❌ Error: A=%d B=%d Sel=%b -> Esperado=%b, Obtenido={Co,s0}=%b",
                                  A, B, Sel, expected, {Co, s0});
                    else
                        $display("✅ Correcto");
                end
            end
        end

        $display("Pruebas completadas.");
        $finish;
    end

endmodule
