module UART_TX_FSM (
    input rst,clk,
    input ser_done,data_valid,
    output reg busy,
    output reg [1:0] mux_sel,
    output reg ser_en,
    input parity_en
);

localparam idle_state =3'b000;
localparam start_state=3'b001;
localparam data_state=3'b010;
localparam parity_state=3'b011;
localparam stop_state=3'b100;

reg [2:0] next_state;
reg [2:0] current_state;

always @(posedge clk,negedge rst)
begin
  if(!rst)
  current_state<=idle_state;
  else
  current_state<=next_state;
end
always @(*)
begin
  case(current_state)
  idle_state:
  begin
    if(data_valid)
    next_state=start_state;
    else
    next_state=idle_state;
  end
  start_state:next_state=data_state;
  data_state:begin
    if(ser_done)
    begin
    if(parity_en)
    next_state=parity_state;
    else
    begin
    next_state=stop_state;
    end
    end
    else
    next_state=data_state;
  end
  parity_state:next_state=stop_state;
  stop_state:begin
    if(data_valid)
    next_state=start_state;
else
next_state=idle_state;
  end
  default:next_state=idle_state;
  endcase
end
always@(*)
begin
  case(current_state)
  idle_state:
  begin
  ser_en=1'b0;
  busy=1'b0;
  mux_sel=2'b01;   //to make output equal one 
  end
  start_state:
  begin
    ser_en=1'b1;
    busy=1'b1;
    mux_sel=2'b00;   // start bit output
  end
  data_state:
  begin
    busy=1'b1;
    mux_sel=2'b10;   // serial output 
    if(ser_done)
    ser_en=1'b0;
    else
    ser_en=1'b1;
  end
  parity_state:
  begin
    ser_en=1'b0;
    busy=1'b1;
    mux_sel=2'b11;   //parity bit output 
  end
  stop_state:
  begin
    ser_en=1'b0;
    busy=1'b0;     //////////**********////
    mux_sel=2'b01;   // stop bit output 
  end
  default:begin
    ser_en=1'b0;
    busy=1'b0;
    mux_sel=2'b01;
  end
  endcase
end
endmodule
