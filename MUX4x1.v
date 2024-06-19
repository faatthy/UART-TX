module MUX4x1 (
    input start_bit,stop_bit,ser_data,parity_bit,
    input [1:0] mux_sel,
    output reg TX_OUT
);

always @(*)
begin
  case(mux_sel)
  2'b00:TX_OUT<=start_bit;
  2'b01:TX_OUT<=stop_bit;
  2'b10:TX_OUT<=ser_data;
  2'b11:TX_OUT<=parity_bit;
endcase
end
endmodule
