module bit_to_int_explicit_cast;
  bit [5:0] eight_bit_unsigned = 8'b11111111; // Unsigned 4-bit value
  int signed_int;
  int unsigned_int;
  int unidades;
  int decenas;
  int centenas;

  initial begin
    signed_int = int'(eight_bit_unsigned); // Explicitly cast to signed int
    $display("Unsigned 4-bit: %b", eight_bit_unsigned);
    $display("Signed int from unsigned 4-bit: %d", signed_int); // Output: 15

    unidades = signed_int%10;
    $display("Unidades 4-bit: %d", unidades);

    decenas = ((signed_int%100)/10);
    $display("Decenas 4-bit: %d", decenas);

    centenas = signed_int/100;
    $display("Centenas 4-bit: %d", centenas);
  end
endmodule