`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:42:41 02/08/2023 
// Design Name: 
// Module Name:    restador_5bits 
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
module restador_5bits(input [4:0]a,b, output [5:0] x
    );
wire [3:0] cout;

resta_0 resta_0 (a[0],b[0],1'b0,x[0],cout[0]);

resta_0 resta_1 (a[1],b[1],cout[0],x[1],cout[1]);

resta_0 resta_2 (a[2],b[2],cout[1],x[2],cout[2]);

resta_0 resta_3 (a[3],b[3],cout[2],x[3],cout[3]);

resta_0 resta_4 (a[4],b[4],cout[3],x[4],x[5]);

endmodule
