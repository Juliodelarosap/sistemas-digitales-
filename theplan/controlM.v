`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:02 04/16/2023 
// Design Name: 
// Module Name:    controlM 
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
module controlM( 

input clk, 
input [2:0]selector,
output reg out
    );
	 
wire n1, n2, n3, n4;

nivel1 level1 (.clk(clk), .sel(sel), .h(h), .nota(n1));
nivel2 level2 (.clk(clk), .sel(sel), .h(h), .nota(n2));
nivel3 level3 (.clk(clk), .sel(sel), .h(h), .nota(n3));
nivel4 level4 (.clk(clk), .sel(sel), .h(h), .nota(n4));

always @ (*) 
case (selector)
		2'd0: out <= n1; 
		
		2'd1: out <= n2;
		
		2'd2: out <= n3;
		
		2'd3: out <= n4;
		
		
	 endcase 

endmodule
