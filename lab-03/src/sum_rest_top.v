
`include "sumador_Restador_4bit.v"

module sum_rest_top(
    input [3:0] A, B, // 2 vectores de 4 bits
    input Sel,        // 0 = suma, 1 = resta
    output [4:0] So_final,
    output signo
);


wire [3:0] So;
wire Co_aux;
wire Co;

wire [3:0] So_inter;



sumador_Restador4bit sr4 (
    .A(A),
    .B(B),
    .Sel(Sel),
    .So(So),
    .Co(Co)
);


assign Co_aux = Sel & ~Co; 
//and(Co_aux,Sel,~Co);//Define Co_aux

sumador_Restador4bit sr2(
    .A(4'b0000),
    .B(So),
    .Sel(Co_aux),
    .So(So_inter),
    .Co()
);

assign So_final = {(Sel)?1'b0 : Co, So_inter};
assign signo = Co_aux;

endmodule