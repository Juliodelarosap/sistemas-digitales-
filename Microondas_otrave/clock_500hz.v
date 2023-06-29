`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:06:50 03/29/2023 
// Design Name: 
// Module Name:    clock_500hz 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock_500hz(input clock_in, output reg h);

reg [17:0]z=18'd0;
parameter w=18'd100;

always@(posedge clock_in)
begin
z<=z+18'd1;
if(z>=(w-1))
z<=18'd0;
h<=(z<w/2)?1'b1:1'b0;
end
endmodule
