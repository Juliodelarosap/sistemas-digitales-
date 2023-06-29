`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:17 02/07/2023 
// Design Name: 
// Module Name:    sumador_5bits 
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
module sumador_5bits(input [4:0]a,input[4:0]b, output [5:0]x );
wire [3:0]cout; 

suma_0 suma_0 (a[0],b[0],1'b0,x[0],cout[0]);

suma_0 suma_1 (a[1],b[1],cout[0],x[1],cout[1]);

suma_0 suma_2 (a[2],b[2],cout[1],x[2],cout[2]);

suma_0 suma_3 (a[3],b[3],cout[2],x[3],cout[3]);

suma_0 suma_4 (a[4],b[4],cout[3],x[4],x[5]);


endmodule
