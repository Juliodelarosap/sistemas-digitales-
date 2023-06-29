`timescale 1ns / 1ps

module reloj_1(clk, e,on); 
input clk,on;//entrada reloj principal del constrain  file
output reg e; //salida del reloj 

reg [31:0] z;
parameter y = 32'd1200000;//aqui de ajusta la frecuencia

always @(posedge clk)
begin
if(on)
z <= z + 1;
if (z == y)
begin 
z <=0;
e <= ~e;
end
end 


endmodule 