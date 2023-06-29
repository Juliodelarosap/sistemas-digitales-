`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:06:18 02/20/2023 
// Design Name: 
// Module Name:    clock_5hz 
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
module clock_5hz(input clock_in, output reg clock_5);

reg [27:0]  counter = 28'd0;
parameter DIVISOR = 28'd20000000;
always @(posedge clock_in)
begin
counter <= counter + 28'd1;
if (counter >=(DIVISOR-1))
counter <= 28'd0;
clock_5 <= (counter<DIVISOR/2)?1'b1:1'b0;

end

endmodule
