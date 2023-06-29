`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:46:31 04/20/2023 
// Design Name: 
// Module Name:    pruebacodigo 
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
module pruebacodigo(clk, r); 
input clk;//entrada reloj principal del constrain  file
output reg r; //salida del reloj 

reg [31:0] z;
parameter y = 32'd25000000;//aqui de ajusta la frecuencia

always @(posedge clk)
begin
z <= z + 1;
if (z == y)
begin 
z <=0;
r <= ~r;
end
end 


endmodule

