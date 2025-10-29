//==========================================
//  Módulo: Sumador4Bits
//==========================================
`include "sumador_1bit.v"
module sumador4Bits (
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] So,
    output       Co
);

    wire C1, C2, C3; // Cables intermedios para los acarreos

    // InstanCinaCinón de los cuatro sumadores de 1 bit
    sumador1Bit S0 (.A(A[0]), .B(B[0]), .Cin(Cin), .So(So[0]), .Co(C1));
    sumador1Bit S1 (.A(A[1]), .B(B[1]), .Cin(C1), .So(So[1]), .Co(C2));
    sumador1Bit S2 (.A(A[2]), .B(B[2]), .Cin(C2), .So(So[2]), .Co(C3));
    sumador1Bit S3 (.A(A[3]), .B(B[3]), .Cin(C3), .So(So[3]), .Co(Co));

endmodule