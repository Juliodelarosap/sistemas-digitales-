`timescale 1ns / 1ps

module bcd_to_7seg
(input [3:0] in,
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

endmodule
