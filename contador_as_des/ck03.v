`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:19:22 03/15/2023 
// Design Name: 
// Module Name:    ck03 
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
module ck03 (input clock_in, output reg clock_400);

reg [27:0]  counter = 28'd0;
parameter DIVISOR = 28'd333333333;
always @(posedge clock_in)
begin
counter <= counter + 28'd1;
if (counter >=(DIVISOR-1))
counter <= 28'd0;
clock_400 <= (counter<DIVISOR/2)?1'b1:1'b0;

end

endmodule

