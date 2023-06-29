`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:51:34 04/02/2023 
// Design Name: 
// Module Name:    dobledable 
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
module dobledable(bin,BCD);
input [8:0] bin;
output reg [11:0] BCD;
reg [3:0] i;

always @(bin)
	
	begin
		BCD =12'b0;
			for (i=0;i<9;i=i+1'b1)
				
				begin
					BCD = {BCD[10:0],bin[8-i]};
					
					if(i<8 && BCD[3:0] > 4)
						BCD[3:0] = BCD[3:0] + 2'b11;
						
					if(i<8 && BCD[7:4] > 4)
						BCD[7:4] = BCD[7:4] + 2'b11;

					if(i<8 && BCD[11:8] > 4)
						BCD[11:8] = BCD[11:8] + 2'b11;										
				end
	end
endmodule
