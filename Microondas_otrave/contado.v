`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:54 03/29/2023 
// Design Name: 
// Module Name:    contador 
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
module Contado (clk, out,updown);
   
input clk,updown;
output reg [7:0]out = 8'd0;
wire clock_out;
//////////////////////////////////////////

Tiempo (.clock_in(clk),.clock_out(clock_out));

//////////////////////////////////////////

////////////////////////////////////////// 
 always @(posedge clock_out) 
 begin
   if (updown) 
	begin
		if (out < 6'd21) 
		begin
      out = out + 1;
		end		
    end 
	
	else 
	begin
		if (out > 6'd0) 
		begin
		out = out - 1;
      end 
    end
 end
 
 
 
endmodule   
  