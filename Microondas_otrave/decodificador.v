`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:17 04/02/2023 
// Design Name: 
// Module Name:    decodificador 
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
module decodificador
	(
    input [3:0] in,
    output reg [6:0] out
    );
    
always @(*)
    case(in)         //   GFEDCBA
        4'b0000: out = 7'b1000000; // 0
        4'b0001: out = 7'b1111001; // 1
        4'b0010: out = 7'b0100100; // 2
        4'b0011: out = 7'b0110000; // 3
        4'b0100: out = 7'b0011001; // 4
        4'b0101: out = 7'b0010010; // 5
        4'b0110: out = 7'b0000010; // 6
        4'b0111: out = 7'b1111000; // 7
        4'b1000: out = 7'b0000000; // 8
        4'b1001: out = 7'b0010000; // 9
		  4'b1010: out = 7'b0001110; // 10//F
		  4'b1011: out = 7'b1001111; // 11//I
        4'b1100: out = 7'b0101011; // 12//N
        4'b1101: out = 7'b0001100; // 13//P
        4'b1110: out = 7'b0001000; // 14//A
        default: out = 7'b1111111; // Turn off all segments
    endcase
	endmodule 
	