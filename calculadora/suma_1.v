`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:41:23 02/07/2023 
// Design Name: 
// Module Name:    suma_1 
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
module suma_1(input a,b,cin, output s,cout);

assign s = a ^ b ^ cin;
assign cout = a & b | a & cin | b & cin;

endmodule
