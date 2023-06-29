`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:31:17 02/07/2023 
// Design Name: 
// Module Name:    suma_de_5bits 
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
module suma_de_5bits(input [4:0]a,b,output [5:0]x 
    );
wire [4:0]cout; 

suma suma_0 (a[0],b[0],x[0],cout[0]);
suma suma_1 (a[1],b[1],x[1],cout[1]);
suma suma_2 (a[2],b[2],x[2],cout[2]);
suma suma_3 (a[3],b[3],x[3],cout[3]);
suma suma_4 (a[4],b[4],x[4],cout[4]);

endmodule
