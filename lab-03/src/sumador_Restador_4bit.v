`include "sumador4Bits.v"
module sumador_Restador4bit(
    input [3:0] A, B, // 2 vectores de 4 bits
    input Sel,        // 0 = suma, 1 = resta
    output [3:0] So,
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
    sumador4Bits s4b (A,Bx, Sel,So,Co);

endmodule
