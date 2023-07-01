`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:02 04/10/2023 
// Design Name: 
// Module Name:    memoria 
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
module memoria(
	input clk,
	output [7:0] valor
    );

	reg [7:0] ex1_memory [3:0];
	
	reg [7:0] rmemory_d;
	reg [7:0] rmemory_q;

	reg [1:0] rcounter_d;
	reg [1:0] rcounter_q;

	assign valor = rmemory_q;
	
	initial
	begin 
		$readmemh(" ex1.mem.txt ",ex1_memory);
	end
	
	always @ (posedge clk)
		begin
			rmemory_q <= rmemory_d;
			rcounter_q <= rcounter_d;
		end
	always @ (*)
		begin
			rmemory_d = ex1_memory[rcounter_q];
			rcounter_d = rcounter_q + 2'd1;
		end

endmodule
