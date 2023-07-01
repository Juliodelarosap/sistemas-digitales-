`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:57:10 03/11/2023 
// Design Name: 
// Module Name:    modulo_principal 
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
module modulo_principal(clock, led, rev
    );
input clock;
input rev;
output led[3:0];

contador_h_j contador (.clk(clock), .out(led), .rev(rev));


endmodule
