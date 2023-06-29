`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:26 03/15/2023 
// Design Name: 
// Module Name:    ck01 
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
module ck01 (input clock_in, output reg clock_200);

reg [27:0]  counter = 28'd0;
parameter DIVISOR = 28'd100000000;
always @(posedge clock_in)
begin
counter <= counter + 28'd1;
if (counter >=(DIVISOR-1))
counter <= 28'd0;
clock_200 <= (counter<DIVISOR/2)?1'b1:1'b0;

end


endmodule
