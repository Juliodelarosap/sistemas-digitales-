`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:20:06 02/20/2023 
// Design Name: 
// Module Name:    bcd_7seg 
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
module bcd_7seg(input[3:0] in, output[6:0]out 
    );
	 
wire A,B,C,D;

assign A = in[3];
assign B = in[2];
assign C = in[1];
assign D = in[0];

assign out[0] = B & (~C) & (~D) | (~A) & (~B) & (~C) & D;
assign out[1] = B & (~C) & (D) | B & C & (~D);
assign out[2] = (~B) & (C) & (~D);
assign out[3] = B & (~C) & (~D) |B & C & D | (~A) & (~B) & (~C) & D;
assign out[4] = D | B & (~C);
assign out[5] = (~B) & C | C & D | (~A) & (~B) & D;
assign out[6] = (~A) & (~B) & (~C) | B & C & D;


endmodule
