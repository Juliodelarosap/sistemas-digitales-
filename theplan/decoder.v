`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:07:50 04/02/2023 
// Design Name: 
// Module Name:    decoder 
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
/*module decoder(input [3:0] in,
	output [6:0] out);
	
	wire a,b,c,d;
	
	assign a = in[3];
	assign b = in[2];
	assign c = in[1];
	assign d = in[0];
	
	assign out[0] = b & (~c) & (~d) | (~a) & (~b) & (~c) & d;
	assign out[1] = b & (~c) & (d) | b & c & (~d);
	assign out[2] = (~b) & (c) & (~d);
	assign out[3] = b & (~c) & (~d) |b & c & d | (~a) & (~b) & (~c) & d;
	assign out[4] = d | b & (~c);
	assign out[5] = (~b) & c | c & d | (~a) & (~b) & d;
	assign out[6] = (~a) & (~b) & (~c) | b & c & d;



endmodule*/

module decoder
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
		  4'b1010: out = 7'b1000110; // 10//c
		  4'b1011: out = 7'b0001100; // 11//p
        4'b1100: out = 7'b1000000; // 12//o
		  4'b1101: out = 7'b0010000; // 12//g
		  4'b1110: out = 7'b1000001; // 12//v
        4'b1111: out = 7'b0101111; // 12//r
        default: out = 7'b1111111; // Turn off all segments
    endcase
	endmodule 
