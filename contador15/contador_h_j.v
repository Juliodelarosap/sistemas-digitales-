`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:32:19 03/11/2023 
// Design Name: 
// Module Name:    contador_h_j 
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
module contador_h_j(clk, out, rev);
   
input clk;
input rev; 
output reg [3:0]out = 4'd0;
wire clock_out;
wire rev_1;
wire led;

assign rev_1 = ~rev;

tiempo tiempo (.clock_in(clk), .clock_out(clock_out));

reg control;
	 
always @ (posedge clock_out)
begin
if (control == 0)
begin
if(rev_1 == 1)
out <= out - 1;
else 
out <= out + 1;
end
end

endmodule
  