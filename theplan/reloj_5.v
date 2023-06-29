`timescale 1ns / 1ps

module reloj_5(clk, q,on); 
input clk,on;//entrada reloj principal del constrain  file
output reg q; //salida del reloj 

reg [31:0] z;
parameter y = 32'd1500000;//aqui de ajusta la frecuencia

always @(posedge clk)
begin
if(on )
z <= z + 1;
if (z == y)
begin 
z <=0;
q <= ~q;
end
end 


endmodule
