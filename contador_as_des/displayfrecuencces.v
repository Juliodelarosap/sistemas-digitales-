`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:27:22 03/15/2023 
// Design Name: 
// Module Name:    displayfrecuencces 
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
/*module displayfrecuencces(clock,clko,clko1);
input clock;
output clko ,clko1;
reg [26:0] con = 27'd0;
reg [26:0] con1 = 27'd0;

parameter div = 27'd600000; // frecuencia enables
parameter div1 = 27'd90000000;//frecuencia  de 3 hz displays

always @ (posedge clock)
begin
con <= con + 27'd1;
con1 <= con1 + 27'd1;
		
		if( con>= (div + 1))
		begin
		con <= 27'd0;
		end
		if(con1>=(div1 + 1))
		begin
		con1 <= 27'd0;
		end
		

end

assign clko = (con == div) ? 1'b1: 1'b0;

assign clko1 = (con1 == div1) ? 1'b1: 1'b0;


endmodule*/
