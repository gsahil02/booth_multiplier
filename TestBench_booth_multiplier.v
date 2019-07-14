`timescale 1ns / 1ps

module TB_booth;

parameter multiplier_width=8;
parameter multiplicand_width=8;
wire [multiplicand_width-1 : 0] AC;
wire [multiplier_width-1 : 0] QR;
reg [multiplicand_width-1 : 0] multiplicand;
reg [multiplier_width-1 : 0] multiplier;

booth_algo booth(AC,QR,multiplicand,multiplier);
initial
begin
multiplicand=8'd16; multiplier=8'd32;
#40 multiplicand=8'd100; multiplier=8'd15;
#40 $finish;
end
endmodule

