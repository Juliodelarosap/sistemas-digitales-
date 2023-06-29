`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:48:37 01/29/2023 
// Design Name: 
// Module Name:    implementacion1 
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
module implementacion1(a,b,c,d,e,f,g,A,B,C,D,led1,led2,led3);
input a,b,c,d,e,f,g,A,B,C,D;
output led1,led2,led3;

assign led1 = a||b||c;
assign led2 = !d||!e||!f||!g;
assign led3 = !A&&D||!A&&C||B&&D||A&&!B&&!D;

endmodule
