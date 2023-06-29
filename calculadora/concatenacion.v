`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:47 02/10/2023 
// Design Name: 
// Module Name:    concatenacion 
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
module concatenacion(a,b,c);

input [4:0] a,b;
output [9:0]c;

assign c={a,b};

endmodule
