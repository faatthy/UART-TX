module PARITY 
#(parameter parity_type=0)(
    input parity_en,data_valid,rst,clk,busy,
    output reg parity_out,
    input [7:0] parity_data
);
always @(*)
begin
  if(!rst)
  parity_out<=1'b0;
  else if(parity_en&&data_valid&&!busy)
  begin
    if(!parity_type)
    parity_out<=^parity_data;
    else if(parity_type==1'b1)
    parity_out<=~^parity_data;
  end
  //there is no else condition i want to store this value on a latch 
end
endmodule 
