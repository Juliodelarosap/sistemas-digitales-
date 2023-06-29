//Ejemplo 5
//Generacion de Codigo Con Modulo y Matriz
//Este ejemplo demostrara como utilizar el codigo generado cuando se trate de este caso:
//Matriz: Seleccionada 
//Crear Modulo: Seleccionado

`timescale 1ns / 1ps

module Prueba_VGA(
input clock,select,puerta,
output reg [2:0 ] red,
output reg [2:0 ] green,
output reg [1:0 ] blue,
output reg hsync,
output reg vsync
);

wire sele; 
assign sele = ~select;
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
reg [9:0] Booh,Boov,BooH,BooV,booh,boov,BOOH,BOOV,bOOh,bOOv;
//Utilizamos Wires para almacenar la salida del modulo
wire [2:0] r[4:0];
wire [2:0] g[4:0];
wire [1:0] b[4:0];
//Utilizamos un Wire para la salida de Data
wire [4:0]Dat;

//Aqui hacemos nuestra instanciacion con nuestras variables
prueba_1 Imagen1(enable,clock,Booh,Boov,hcount,vcount,r[2],g[2],b[2],Dat[2]);
prueba_2 Imagen2(enable,clock,BooH,BooV,hcount,vcount,r[1],g[1],b[1],Dat[1]);
prueba_3 Imagen3(enable,clock,booh,boov,hcount,vcount,r[0],g[0],b[0],Dat[0]);
prueba_4 Imagen4(enable,clock,BOOH,BOOV,hcount,vcount,r[3],g[3],b[3],Dat[3]);
//prueba_5 Imagen5(enable,clock,bOOh,bOOv,hcount,vcount,r[4],g[4],b[4],Dat[4]);

//Codigo Modificable
always @ (posedge clock)
begin
 if (enable)
	begin
		Booh <= 270;
		Boov <= 190;
		BooH <= 50;
		BooV <= 220;
		booh <= 500;
		boov <= 220;
		bOOh <= 0;
		bOOv <= 20;
 if (sele | puerta)
 begin
 BOOH <= 270;
 BOOV <= 190;
 Booh <= 0;
 Boov <= 490;
 end
		
 if(Dat[0] == 1'b1)
		begin
			red	<=	r[0];
			green	<=	g[0];
			blue	<=	b[0];
		end
		else if(Dat[1] == 1'b1)
		begin
			red	<=	r[1];
			green	<=	g[1];
			blue	<=	b[1];
		end
		else if(Dat[2] == 1'b1)
		begin
			red	<=	r[2];
			green	<=	g[2];
			blue	<=	b[2];
		end
		else if(Dat[3] == 1'b1)
		begin
			red	<=	r[3];
			green	<=	g[3];
			blue	<=	b[3];
		end	
		/*else if(Dat[4] == 1'b1)
		begin
			red	<=	r[4];
			green	<=	g[4];
			blue	<=	b[4];
		end*/		
	else if(hcount>0&&hcount<640&&vcount<480&&vcount>0)
		begin
			red 	<= 3'b111;
			green	<= 3'b111;
			blue 	<= 2'b11;
		end 
		
			else 
			begin
			red	<=	3'd0;
			green	<=	3'd0;
			blue	<=	2'd0;
			end 
	end
end
endmodule

