module sumadorOneBit(
    input A,B,Cin,
    output Co,So);

    wire x_ab;
    wire cout_t;
    wire a_ab;



    xor(x_ab,A,B);
    and(a_ab,A,B);
    and(cout_t,x_ab,Cin);
    or(Co, cout_t,a_ab);
    xor(So,x_ab,Cin);

endmodule