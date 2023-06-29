`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:18:52 03/09/2023 
// Design Name: 
// Module Name:    Contador 
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
module Contador_notas (clk,activado, out);
   
input clk,activado;
output reg [7:0]out = 8'd0;
wire clock_out;

Tiempo tiempo (.clock_in(clk), .clock_out(clock_out));

reg control;
	 
always @ (posedge clock_out)
begin
	if (activado ==1)
		begin
			if (control == 0)
			begin
				if(out < 148)
				out <= out + 1;
				else 
				out <= 8'd0;
			end
		end
	else
			out <= 8'd7;
		end


endmodule

/*#(parameter m = 146, n = 8)
(
input reset, 
input CLK_100MHz,
output wire complete_tick,
output wire [n-1:0] count
);

wire clk, reset_1;

assign reset_1=~reset;

Tiempo ck (CLK_100MHz, clk);

reg [n-1:0] count_reg;
wire [n-1:0] count_next;

always @(posedge clk, posedge reset_1)
begin
	if(reset_1 == 1)
	count_reg <=0;
	else
	count_reg<=count_next;
end

assign count_next = (count_reg == m-1) ? 0 : count_reg + 1;
assign complete_tick = (count_reg == m-1) ? 1 : 0;
assign count= count_reg;


endmodule*/
