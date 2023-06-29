`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:34:10 02/11/2023 
// Design Name: 
// Module Name:    clock_de_500hz 
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
module clock_de_500hz(input clock_in, output reg clock_out);

reg [27:0]  counter = 28'd0;
parameter DIVISOR = 28'd200000;
always @(posedge clock_in)
begin
counter <= counter + 28'd1;
if (counter >=(DIVISOR-1))
counter <= 28'd0;
clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;

end

endmodule



 
/*(clock_in,clock_out);
input clock_in;
output reg clock_out;
reg [21:0]z =22'd0;
parameter w =22'd200000;

always@(posedge clock_in)
begin
z<=z+22'd1;
if(z>=(w-1))
z<=22'd0;
clock_out<=(z<w/2)?1'b1:1'b0;
end
endmodule */