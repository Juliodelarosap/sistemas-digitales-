`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:24:10 01/27/2023 
// Design Name: 
// Module Name:    clock_divide 
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
module clock_divide(input clock_in, output reg c);

reg [27:0]  counter = 28'd0;
parameter DIVISOR = 28'd14000000;
always @(posedge clock_in)
begin
counter <= counter + 28'd1;
if (counter >=(DIVISOR-1))
counter <= 28'd0;
c <= (counter<DIVISOR/2)?1'b1:1'b0;

end

endmodule
