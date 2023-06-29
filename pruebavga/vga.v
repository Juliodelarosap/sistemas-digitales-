//Ejemplo 5
//Generacion de Codigo Con Modulo y Matriz
//Este ejemplo demostrara como utilizar el codigo generado cuando se trate de este caso:
//Matriz: Seleccionada 
//Crear Modulo: Seleccionado

`timescale 1ns / 1ps

module Prueba_VGA(
input clock,
output reg [2:0 ] red,
output reg [2:0 ] green,
output reg [1:0 ] blue,
output reg hsync,
output reg vsync
);

//Este codigo no se modifica
reg [9:0] hcount = 0;
reg [9:0] vcount = 0;
reg [1:0] counter = 0;
reg enable;
//Enable 
always @ (posedge clock)
begin
if (counter == 3)
begin
counter <= 1'b0;
enable <= 1'b1;
end
else
begin
counter <= counter + 1'b1;
enable <= 1'b0;
end
end

//Vsync y Hsync
always @(posedge clock)
begin
if (enable == 1)
begin
if(hcount == 799)
begin
hcount <= 0;
if(vcount == 524)
vcount <= 0;
else
vcount <= vcount+1'b1;
end
else
hcount <= hcount+1'b1;
if (vcount >= 490 && vcount < 492)
vsync <= 1'b0;
else
vsync <= 1'b1;
if (hcount >= 656 && hcount < 752)
hsync <= 1'b0;
else
hsync <= 1'b1;
end
end
//Fin de codigo no modificable

//Asi seria el modulo generado
//module BooMat (
//input enable,
//input clock,
//input [9:0] posx, posy,
//input [9:0] hcount,
//input [9:0] vcount,
//output reg[2:0] red,
//output reg[2:0] green,
//output reg[1:0] blue,
//output reg data);

//Entonces, siguiendo el orden lo instanciaremos

//Creamos las variables de posicion relativa
reg [9:0] Booh,Boov;
//Utilizamos Wires para almacenar la salida del modulo
wire [2:0] r,g;
wire [1:0] b;
//Utilizamos un Wire para la salida de Data
wire Dat;

//Aqui hacemos nuestra instanciacion con nuestras variables
prueba_1 Imagen1(enable,clock,Booh,Boov,hcount,vcount,r,g,b,Dat);

//Codigo Modificable
always @ (posedge clock)
begin
	if (enable)
	begin
		Booh <= 100;
		Boov <= 100;
		
		if(Dat == 1'b1)
		begin
			red	<=	r;
			green	<=	g;
			blue	<=	b;
		end
		else 
			begin
			red	<=	3'b0;
			green	<=	3'b0;
			blue	<=	2'b0;	
end			
	end
end
endmodule
