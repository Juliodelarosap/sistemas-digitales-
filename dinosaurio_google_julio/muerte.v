`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:25:15 03/23/2023 
// Design Name: 
// Module Name:    muerte 
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
module muerte(
    );
	 
	 
always @ (negedge clock_out)
		begin
		if (Rst)
		begin
		out <= 4'd0;
		a1<= a1 - 1;
		end
			else if (stop == 0)
			begin
				if(out < 9)
				begin
				out <= out + 1;
				a1 <= 4'd0;
				end
				else 
				begin
				out <= 4'd0;
				a1 <= a1 + 1;
				end
				
			end

endmodule
