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

    integer i, j, k;
    integer errores = 0;
    reg [4:0] resultado_esperado; 
    reg esperado_Co;

    initial begin
        $display("Iniciando prueba...");
        for (k = 0; k < 2; k = k + 1) begin
            Sel = k;
            for (i = 0; i < 16; i = i + 1) begin
                for (j = 0; j < 16; j = j + 1) begin
                    A = i;
                    B = j;
                    #1; // pequeño delay

                    if (Sel == 0) begin
                        // ---- SUMA normal ----
                        resultado_esperado = A + B;
                        esperado_Co = resultado_esperado[4];
                    end else begin
                        // ---- RESTA en complemento a 2 ----
                        resultado_esperado = A + (~B + 1);
                        esperado_Co = ~resultado_esperado[4]; // <- Co invertido
                    end

                    // Comparar resultado (4 bits) y carry correcto
                    if (s0 !== resultado_esperado[3:0] || Co !== esperado_Co) begin
                        $display("Error: Sel=%b A=%b B=%b | Esperado: s0=%b Co=%b | Obtenido: s0=%b Co=%b",
                                 Sel, A, B, resultado_esperado[3:0], esperado_Co, s0, Co);
                        errores = errores + 1;
                    end
                end
            end
        end

        if (errores == 0)
            $display("No hubo errores");
        else
            $display("Hubo %d errores.", errores); //imprime contador de errores

        $finish;
    end

endmodule
