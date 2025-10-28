module bin8_to_bcd(
    input  [7:0] bin,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] ones
);
    integer i;
    reg [19:0] shift; // espacio para 3 nibbles + 8 bits

    always @(*) begin
        shift = {12'd0, bin};  // 0000 0000 0000 + valor binario
        for (i = 0; i < 8; i = i + 1) begin
            if (shift[15:12] >= 5)
                shift[15:12] = shift[15:12] + 3;
            if (shift[11:8] >= 5)
                shift[11:8] = shift[11:8] + 3;
            if (shift[7:4] >= 5)
                shift[7:4] = shift[7:4] + 3;
            shift = shift << 1;  // desplazar todo a la izquierda
        end

        hundreds = shift[15:12];
        tens     = shift[11:8];
        ones     = shift[7:4];
    end

endmodule
