`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:18:37 03/09/2023 
// Design Name: 
// Module Name:    Pantera_rosa 
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
module Pantera_rosa(input clock, output audio);


mux mux (.sel(sel), .nota(audio),.h(h),.clk(clock));



endmodule
