module SERIALIZER(
    input rst,clk,
    input [7:0] data,
    input ser_en,
    output wire ser_done,
    output reg ser_out,
    input data_valid,busy
);

reg [7:0] registers;
reg [3:0] counter=4'b0000; //counter i will use it to in every clock i will out one bit
always @(posedge clk,negedge rst)
begin
  if(!rst)
  begin
    counter<=2'b00;
    registers<=8'b00;
    ser_out<=1'b0;
  end
  else if(data_valid&&!busy)
  begin
    registers<=data;
    ser_out<=1'b0;
    counter<=4'b0000;
  end
  else if(ser_en&&counter!=4'b1000)
  begin
    {registers,ser_out}<={1'b0,registers};
    counter<=counter+1;
  end
else
counter<=4'b0000;

end
assign ser_done=(counter==4'b1000)?1'b1:1'b0;
endmodule

