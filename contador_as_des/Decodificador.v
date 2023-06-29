`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:57:10 03/14/2023 
// Design Name: 
// Module Name:    Decodificador 
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
module Decodificador (input clock, output [6:0] out);

wire a,b,c,d,e,f;
wire [5:0] com;

//Contador mc (clock, com);

assign a = com[5];
assign b = com[4];
assign c = com[3];
assign d = com[2];
assign e = com[1];
assign f = com[0];

assign out[6] = (~a & ~b & ~c & f) | (d & f) | (b & ~d & ~f) | (b & c & e) | (~a & ~c & ~d & ~e) | (~b & d & ~e) | (c & d & ~e);
assign out[5] = (~b & ~c & ~e & ~f) | (~a & ~c & e & f) | (~b & ~c & d) | (~b & d & ~e & ~f) | (~c & d & ~e & ~f) | (b & c & ~d & ~e) | (b & d & e & f) | (b & ~d & e & ~f);
assign out[4] = (~a & ~b & ~e & ~f) | (~c & e & f) | (~b & ~c & d) | (c & ~d & ~f) | (b & ~d & e) | (~c & d & ~e & ~f) | (b & e & f);
assign out[3] = (~b & c & d & ~e) | (b & ~c & ~e & ~f) | (b & ~d & ~f) | (c & d & f) | (a & d) | (~a & ~b & ~c & ~d) | (~a & ~b & ~c & f) | (~a & ~c & ~d & e) | (~b & ~c & ~e & f);
assign out[2] = (~a & ~c & ~d & ~e & ~f) | (~b & d & e & f) | (~b & c & d & ~e) | (b & ~c & ~d & e) | (b & ~c & ~e & ~f) | (b & ~d & e & ~f) | (c & d & f) | (a & ~e & f) | (a & d);
assign out[1] = (~b & ~c & d & e & f) | (b & ~d & e) | (b & c & f) | (a & f) | (a & e) | (a & d) | (~a & ~c & ~d & ~e & ~f) | (~b & c & ~d & ~f) | (~b & c & d & ~e) | (b & ~c & d & ~e);
assign out[0] = (~a & ~b & ~d & e & f) | (~b & c & d & e & ~f) | (b & ~c & d & e) | (a & ~e & f) | (~a & ~c & ~d & ~e & ~f) | (~b & ~c & d & ~e) | (~b & c & ~d & f) | (d & ~e & f) | (b & c & ~e & ~f);

endmodule
