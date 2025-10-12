module sumador_Restador4bit(
    input [3:0] A, B, // 2 vectores de 4 bits
    input Sel,        // 0 = suma, 1 = resta
    output [3:0] s0,
    output Co
);

    wire [3:0] Bx;     
    wire [3:0] Cout;   

    // Complemento a 1 si es una resta (Sel = 1)
    assign Bx[0] = B[0] ^ Sel;
    assign Bx[1] = B[1] ^ Sel;
    assign Bx[2] = B[2] ^ Sel;
    assign Bx[3] = B[3] ^ Sel;

    // Cadena de sumadores de 1 bit
    sumadorOneBit sum_n0 (A[0], Bx[0], Sel,     Cout[0], s0[0]);
    sumadorOneBit sum_n1 (A[1], Bx[1], Cout[0], Cout[1], s0[1]);
    sumadorOneBit sum_n2 (A[2], Bx[2], Cout[1], Cout[2], s0[2]);
    sumadorOneBit sum_n3 (A[3], Bx[3], Cout[2], Co,      s0[3]);

endmodule
