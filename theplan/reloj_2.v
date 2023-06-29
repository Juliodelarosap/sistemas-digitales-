`timescale 1ns / 1ps

module reloj_2(clk, g,on); 
input clk,on;//entrada reloj principal del constrain  file
output reg g; //salida del reloj 

reg [31:0] z;
parameter y = 32'd1000000;//aqui de ajusta la frecuencia

always @(posedge clk)
begin
if( on)
z <= z + 1;
if (z == y)
begin 
z <=0;
g <= ~g;
end
end 


endmodule 
