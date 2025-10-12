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

    // 📁 archivo de salida
    integer file;

    initial begin
        file = $fopen("resultados.txt", "w"); // crea el archivo
        if (file == 0) begin
            $display("❌ Error al abrir el archivo resultados.txt");
            $finish;
        end

        $display("Iniciando prueba...");
        $fwrite(file, "==============================================\n");
        $fwrite(file, "     RESULTADOS SUMADOR / RESTADOR 4 BIT\n");
        $fwrite(file, "==============================================\n");
        $fwrite(file, "Sel |  A  |  B  |  s0 (resultado) | Co | Esperado | OK?\n");
        $fwrite(file, "------------------------------------------------------\n");

        for (k = 0; k < 2; k = k + 1) begin
            Sel = k;
            for (i = 0; i < 16; i = i + 1) begin
                for (j = 0; j < 16; j = j + 1) begin
                    A = i;
                    B = j;
                    #1;

                    if (Sel == 0) begin
                        // ---- SUMA ----
                        resultado_esperado = A + B;
                        esperado_Co = resultado_esperado[4];
                    end else begin
                        // ---- RESTA ----
                        resultado_esperado = A + (~B + 1);
                        esperado_Co = ~resultado_esperado[4];
                    end

                    // Verificar resultado
                    if (s0 !== resultado_esperado[3:0] || Co !== esperado_Co) begin
                        errores = errores + 1;
                        $fwrite(file, "%b   | %b | %b | %b | %b | %b_%b | ERROR\n",
                                Sel, A, B, s0, Co, resultado_esperado[3:0], esperado_Co);
                    end else begin
                        $fwrite(file, "%b   | %b | %b | %b | %b | %b_%b | OK\n",
                                Sel, A, B, s0, Co, resultado_esperado[3:0], esperado_Co);
                    end
                end
            end
        end

        $fwrite(file, "------------------------------------------------------\n");
        if (errores == 0)
            $fwrite(file, "✅ No hubo errores.\n");
        else
            $fwrite(file, "⚠️  Hubo %0d errores.\n", errores);

        $fclose(file);
        $display("Simulación finalizada. Resultados guardados en resultados.txt");
        $finish;
    end

endmodule
