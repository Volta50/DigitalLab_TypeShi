module sumador_Restador4bit(
    input [3:0] A, B, //2 vectores de 4 
    input Sel,           // 0 = suma, 1 = resta
    output [3:0] sum,
    output Co
);

    wire [3:0] Bx;     
    wire [3:0] Cout;   

    // saca el complemento a 1 si es una resta (sel = 1)
    assign Bx[0] = xor(B[0], Sel);
    assign Bx[1] = xor(B[1], Sel);
    assign Bx[2] = xor(B[2], Sel);
    assign Bx[3] = xor(B[3], Sel);

    // cadena de sumaodres de 1 bit
    sumadorOneBit sum_n0 (A[0], Bx[0], Sel, Cout[0], sum[0]);
    sumadorOneBit sum_n1 (A[1], Bx[1], Cout[0], Cout[1], sum[1]);
    sumadorOneBit sum_n2 (A[2], Bx[2], Cout[1], Cout[2], sum[2]);
    sumadorOneBit sum_n3 (A[3], Bx[3], Cout[2], Co, sum[3]);
endmodule

