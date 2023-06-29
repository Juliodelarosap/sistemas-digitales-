`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:16:54 03/15/2023 
// Design Name: 
// Module Name:    multi 
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
module multi(input clock, input [1:0]sel,output reg out);
						 
wire ck_200, ck_300, ck_400, ck_500;

ck01 f0 (clock, ck_200);
ck02 f1 (clock, ck_300);
ck03 f2 (clock, ck_400);
ck04 f3 (clock, ck_500);

				 
	always @(*) 
	 case (sel)
		3'd0: out= {ck_200}; 
		
		3'd1: out = {ck_300};
		
		3'd2: out = {ck_400};
		
		default out = {ck_500};
	 endcase 


endmodule
