`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:47 02/11/2023 
// Design Name: 
// Module Name:    display_7s 
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
module display_7s(input [2:0] data, output [6:0] segments);

  assign segments = (data == 3'b000) ? 7'b1000000 :
                    (data == 3'b001) ? 7'b1111001 :
                    (data == 3'b010) ? 7'b0100100 :
                    (data == 3'b011) ? 7'b0110000 :
                    (data == 3'b100) ? 7'b0011001 :
                    (data == 3'b101) ? 7'b0010010 :
                    (data == 3'b110) ? 7'b0000010 :
                                      7'b1111000;
endmodule
