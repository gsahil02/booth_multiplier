`timescale 1ns / 1ps

module booth_algo(AC,QR,multiplicand,multiplier);
// AC and QR together store the final product
parameter multiplier_width=8;
parameter multiplicand_width=8;
output reg [multiplicand_width-1 : 0] AC;
output reg [multiplier_width-1 : 0] QR;
input [multiplicand_width-1 : 0] multiplicand;
input [multiplier_width-1 : 0] multiplier;
reg [multiplicand_width-1 : 0] BR;  //temporary register to store the multiplicand
reg qnext;    
//{QR[0],qnext} decide whether the divisor would be added or subtracted from the partial product as per the booth's algorithm as shown:
//{01} AC=AC+BR
//{10} AC=AC-BR
//{00} no change
//{11} no change


integer i;

always@(multiplicand,multiplier) 
begin
BR=multiplicand;
QR=multiplier;
AC=0;
qnext=1'b0;
for(i=0; i<multiplier_width; i=i+1)
    begin
    case({QR[0],qnext})
    2'b01:  AC=AC+BR;
    2'b10:  AC=AC-BR;
    default: ;
    endcase
    qnext=QR[0];
    QR={AC[0],QR[multiplier_width-1 : 1]};
    AC={AC[multiplicand_width-1],AC[multiplicand_width-1 : 1]};
    end
end
endmodule
