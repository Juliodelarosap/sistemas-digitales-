`timescale 1ns / 1ps

module reloj(clk, r,pausa,on); 
input clk,pausa,on;//entrada reloj principal del constrain  file
output reg r; //salida del reloj 

reg [31:0] z;
parameter y = 32'd400000;//aqui de ajusta la frecuencia

always @(posedge clk)
begin
if(pausa && on)
z <= z + 1;
if (z == y)
begin 
z <=0;
r <= ~r;
end
end 


endmodule
