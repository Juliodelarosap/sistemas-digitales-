`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:45:17 02/07/2023 
// Design Name: 
// Module Name:    mux_plexor 
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
module mux_plexor(input [5:0]suma,input [5:0]resta,input [9:0]multip,input [5:0] comple,input [5:0]compleb,input [9:0]conca,
						 input [2:0] com, input [2:0]s,output reg [11:0]out);
						 
						 
	always @(*) 
	 case (s)
		3'd0: out= {7'd0,suma}; //agregar al mux de la misma manera que el modulo principal.
		
		3'd1: out = {7'd0,resta};
		
		3'd2: out = {2'd0,multip};
		
		3'd3: out = {7'd0,comple};
		
		3'd4: out = {7'd0,compleb};
		
		3'd5: out = {2'd0,conca};
		
		3'd6: out = {9'd0,com};
		
		default out = 12'd0;
	 endcase 

	
endmodule
