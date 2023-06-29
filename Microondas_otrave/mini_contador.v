`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:10 04/01/2023 
// Design Name: 
// Module Name:    mini_contador 
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
module mini_contador( input fin, clock_in, output reg out
    );

Tiempo mini_tiempo (.clock_in(clock_in), .clock_out(frecuencia));

always @(posedge frecuencia) 
 begin
   if (fin && out < 3) 
	begin
	out = out + 1;
	end 
	else
	out = 1'd0;
end

endmodule
