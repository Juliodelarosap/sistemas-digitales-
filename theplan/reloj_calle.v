`timescale 1ns / 1ps

module reloj_calle(clk, w,pausa,on); 
input clk,pausa,on;//entrada reloj principal del constrain  file
output reg w; //salida del reloj 

reg [31:0] z;
parameter y = 32'd1000;//aqui de ajusta la frecuencia

always @(posedge clk)
begin
if(pausa && on )
z <= z + 1;
if (z == y)
begin 
z <=0;
w <= ~w;
end
end 


endmodule