`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:39:56 02/07/2023 
// Design Name: 
// Module Name:    multiplicar_0 
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
module multiplicar_0(input [4:0]a,b, output reg [9:0]out);

always @(*)
begin 
out = a*b;
end
endmodule
