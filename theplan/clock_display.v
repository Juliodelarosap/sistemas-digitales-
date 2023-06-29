`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:34 04/09/2023 
// Design Name: 
// Module Name:    clock_display 
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
module clock_display(clock, clkout_1); 
input clock;//entrada reloj principal del constrain  file
output reg clkout_1; //salida del reloj 

reg [31:0] z;
parameter y = 32'd200000;//aqui de ajusta la frecuencia

always @(posedge clock)
begin
z <= z + 1;
if (z == y)
begin 
z <=0;
clkout_1 <= ~clkout_1;
end
end 


endmodule

