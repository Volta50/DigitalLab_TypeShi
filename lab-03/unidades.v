module BCDtoSSeg (
  input [3:0] BCD,
  output reg [6:0] SSeg,
  output [3:0] an
);
    int integerValue = BCD;
    
  // Activate only the rightmost display
  assign an = 4'b1110;

  always @(*) begin
    case (~BCD)
      4'b0000: SSeg = 7'b1000000; // 0
      4'b0001: SSeg = 7'b1111001; // 1
      4'b0010: SSeg = 7'b0100100; // 2
      4'b0011: SSeg = 7'b0110000; // 3
      4'b0100: SSeg = 7'b0011001; // 4
      4'b0101: SSeg = 7'b0010010; // 5
      4'b0110: SSeg = 7'b0000010; // 6 (fixed)
      4'b0111: SSeg = 7'b1111000; // 7 (fixed)
      4'b1000: SSeg = 7'b0000000; // 8
      4'b1001: SSeg = 7'b0010000; // 9
      4'ha:    SSeg = 7'b0001000; // A
      4'hb:    SSeg = 7'b0000011; // b
      4'hc:    SSeg = 7'b1000110; // C
      4'hd:    SSeg = 7'b0100001; // d
      4'he:    SSeg = 7'b0000110; // E
      4'hf:    SSeg = 7'b0001110; // F
      default: SSeg = 7'b1111111; // all off
    endcase
  end

endmodule