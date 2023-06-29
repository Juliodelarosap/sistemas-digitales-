`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:42 02/20/2023 
// Design Name: 
// Module Name:    clock_13hz 
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
module clock_13hz(input clock_in, output reg clock_13);

reg [27:0]  counter = 28'd0;
parameter DIVISOR = 28'd7692307;
always @(posedge clock_in)
begin
counter <= counter + 28'd1;
if (counter >=(DIVISOR-1))
counter <= 28'd0;
clock_13 <= (counter<DIVISOR/2)?1'b1:1'b0;

end



endmodule
