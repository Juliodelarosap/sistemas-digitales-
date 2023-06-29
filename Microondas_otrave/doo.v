`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:51:26 03/29/2023 
// Design Name: 
// Module Name:    doo 
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
module doo (input clock_in, output reg clock_out);

reg [27:0]  counter = 28'd0;
parameter DIVISOR = 28'd381679;
always @(posedge clock_in)
begin
counter <= counter + 28'd1;
if (counter >=(DIVISOR-1))
counter <= 28'd0;
clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;

end

endmodule
