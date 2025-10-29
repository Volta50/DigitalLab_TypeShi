`timescale 1ns/1ps
`include "bin8_to_bcd.v" 

module tb_bin8_to_bcd;
    reg [7:0] bin;
    wire [3:0] hundreds, tens, ones;

    // Instanciar el módulo que convierte
    bin8_to_bcd uut (
        .bin(bin),
        .hundreds(hundreds),
        .tens(tens),
        .ones(ones)
    );

    initial begin
        // Encabezado
        $display("BIN | H T U (Decimal)");
        $display("--------------------");

        // Probar algunos valores
        bin = 8'd0;    #5;  $display("%3d -> %d %d %d", bin, hundreds, tens, ones);
        bin = 8'd5;    #5;  $display("%3d -> %d %d %d", bin, hundreds, tens, ones);
        bin = 8'd9;    #5;  $display("%3d -> %d %d %d", bin, hundreds, tens, ones);
        bin = 8'd10;   #5;  $display("%3d -> %d %d %d", bin, hundreds, tens, ones);
        bin = 8'd42;   #5;  $display("%3d -> %d %d %d", bin, hundreds, tens, ones);
        bin = 8'd99;   #5;  $display("%3d -> %d %d %d", bin, hundreds, tens, ones);
        bin = 8'd100;  #5;  $display("%3d -> %d %d %d", bin, hundreds, tens, ones);
        bin = 8'd173;  #5;  $display("%3d -> %d %d %d", bin, hundreds, tens, ones);
        bin = 8'd255;  #5;  $display("%3d -> %d %d %d", bin, hundreds, tens, ones);

        $finish;
    end
endmodule
