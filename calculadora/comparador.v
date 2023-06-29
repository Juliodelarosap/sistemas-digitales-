`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:43:54 02/12/2023 
// Design Name: 
// Module Name:    comparador 
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
module comparador(input [4:0]a,b,output reg [2:0]com);

always @(a,b)
	begin 
		com = 0;
			if (a > b)
				com = 3'b001;
			else if (a < b)
				com = 3'b010;
			else 
				 com = 3'b100;
	end 
endmodule                