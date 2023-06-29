`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:31:49 04/07/2023 
// Design Name: 
// Module Name:    contador_mux 
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
module contador_mux(clk, out, control);
   
input clk, control;
output reg [7:0]out = 8'd0;
wire clock_out;

tiempo tiempo (.clock_in(clk), .clock_out(clock_out));
	 
always @ (posedge clock_out)
begin

if (control == 0)
begin
if(out < 25)
out <= out + 1;
else 
out <= 8'd0;
end
end



endmodule
