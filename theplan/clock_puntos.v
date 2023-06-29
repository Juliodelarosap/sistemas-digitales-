`timescale 1ns / 1ps

module clock_puntos(clock, clkout); 
input clock;//entrada reloj principal del constrain  file
output reg clkout; //salida del reloj 

reg [31:0] z;
parameter y = 32'd27777778;//aqui de ajusta la frecuencia

always @(posedge clock)
begin
z <= z + 1;
if (z == y)
begin 
z <=0;
clkout <= ~clkout;
end
end 


endmodule