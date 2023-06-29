`timescale 1ns / 1ps


module plan(
input clock,up,down,right,left,reset,start,on,
output reg [2:0 ] red,
output reg [2:0 ] green,
output reg [1:0 ] blue,
output reg hsync,
output reg vsync,
output reg [10:0] count,
output reg [6:0] seg,
output reg [2:0] bas,
output reg led, inicio, encendido,
output DOT, audio	 
);


assign DOT = 1'd1;
//Este codigo no se modifica
reg [9:0] hcount = 0;
reg [9:0] vcount = 0;
reg [1:0] counter = 0;
reg enable, st, en;
reg gameover;
reg [2:0] mus;
reg[2:0] con;
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

always @ (posedge clock) begin 
if (gameover == 0) 
begin
  if (start == 1'b0 && st == 1'b1)begin
  if (inicio == 1'b1) begin
		inicio <= 1'b0;
	end else begin
	inicio <= 1'b1;
	end
	
	end
end
else begin
inicio <= 1'b0;
st <= 1'b0;
end
	st <= start;
end
///////////////////////////////////////////////////
always @ (posedge clock) begin
  if (on == 1'b0 && en == 1'b1)begin
  if (encendido == 1'b1) begin
		encendido <= 1'b0;
	end else begin
	encendido <= 1'b1;
	end
	
	end
	en <= on;
	end
	
/////////////////////////////////////////////////////7


controlM musica (.clk(clock), .selector(mus), .out(audio));



always @ (posedge clock)
begin
	if(count < 150 && count > 0)
	 mus <= 2'd0;

	else if (count > 150 && count < 300)
	mus <= 2'd1;
	
	else if (count > 300 && count < 450)
	mus <= 2'd2;
	
	else if (count > 450)
	mus <= 2'd3;
	
	else
	mus <= 3'd4;
end
		
  

//Creamos las variables de posicion relativa
reg [9:0] imagen1h = 10,imagen1v = 430,imagen2h = 305,
imagen2v = 400,imagen3h = 315 ,imagen3v = 0,imagen4h = 260,imagen4v = 0,
imagen5h = 370, imagen5v = 0, imagen6h = 220, imagen6v = 0, imagen7h = 400, imagen7v = 0,
imagen8h = 315 ,imagen8v = 0,imagen9h = 245, imagen9v = 228,imagen10h = 10, imagen10v = 430,
imagen11h = 245, imagen11v = 215, imagen12h = 282, imagen12v = 270, imagen13h = 245, imagen13v = 260;
//Utilizamos Wires para almacenar la salida del modulo
wire [2:0] r [13:0];
wire [2:0] g [13:0];
wire [1:0] b [13:0];
//Utilizamos un Wire para la salida de Data
wire [13:0] Dat;
//Aqui hacemos nuestra instanciacion con nuestras variables
////////////////////////////////////////////////////////////////////////////////////////
reloj clk (clock, m,inicio,encendido);
reloj_1 clk_carrorojovino (clock,e, encendido);
reloj_2 clk_carroamarillo (clock,f, encendido);
reloj_3 clk_carrogris (clock, l, encendido);
reloj_4 clk_carrorosa (clock, p, encendido);
reloj_5 clk_carroazul (clock, q, encendido);
reloj_calle clock_carro (clock, w, inicio, encendido);
/////////////////////////////////////////////////////////////////////////////////////////
estado_alonso Imagen1(enable,clock,imagen1h,imagen1v,hcount,vcount,r[0],g[0],b[0],Dat[0]);
f1_principal Imagen2(enable,clock,imagen2h,imagen2v,hcount,vcount,r[1],g[1],b[1],Dat[1]);
carrorojo_vino Imagen3(enable,clock,imagen3h,imagen3v,hcount,vcount,r[2],g[2],b[2],Dat[2]);
carroamarillo Imagen4(enable,clock,imagen4h,imagen4v,hcount,vcount,r[3],g[3],b[3],Dat[3]); 
carrogris Imagen5(enable,clock,imagen5h,imagen5v,hcount,vcount,r[4],g[4],b[4],Dat[4]);
carrorosa Imagen6(enable,clock,imagen6h,imagen6v,hcount,vcount,r[5],g[5],b[5],Dat[5]); 
carroazul Imagen7(enable,clock,imagen7h,imagen7v,hcount,vcount,r[6],g[6],b[6],Dat[6]);
linea_carro Imagen8 (enable,clock,imagen8h,imagen8v,hcount,vcount,r[7],g[7],b[7],Dat[7]); 
letras Imagen9 (enable,clock,imagen9h,imagen9v,hcount,vcount,r[8],g[8],b[8],Dat[8]);
cpo Imagen10 (enable,clock,imagen10h,imagen10v,hcount,vcount,r[9],g[9],b[9],Dat[9]); 
nombre Imagen11 (enable,clock,imagen11h,imagen11v,hcount,vcount,r[10],g[10],b[10],Dat[10]); 
boton Imagen12  (enable,clock,imagen12h,imagen12v,hcount,vcount,r[11],g[11],b[11],Dat[11]);
botones Imagen13 (enable,clock,imagen13h,imagen13v,hcount,vcount,r[12],g[12],b[12],Dat[12]);
/////////////////////////////////////////////////////////////////
//Codigo Modificable
always @ (posedge m)
begin
	if(up)
		begin
			if (imagen2v > 360)
				imagen2v <= imagen2v - 1'd1;
		end
	else if (down)
		begin 
	if (imagen2v + 50 < 450)
	imagen2v <= imagen2v + 1'd1;
	end
	else 
	imagen2v <= imagen2v;
	
if (right)
begin
	if (imagen2h + 50 < 457)
		imagen2h <= imagen2h + 1'd1;
	end
	else if (left)
		begin 
	if (imagen2h > 220)
		imagen2h <= imagen2h - 1'd1;
	end 
	else 
		imagen2h <= imagen2h;
end
////////////////////////////////////////////////////////////
always @ (posedge e)
begin  
	if (imagen3v < 480 && count > 0 && count < 150 && inicio)
		imagen3v <= imagen3v + 4'd1;
	else if (count > 150 && count < 300 && imagen3v < 480 && inicio)
		imagen3v <= imagen3v + 4'd2;
	else if (count > 300 && count < 450 && imagen3v <480 && inicio)
		imagen3v <= imagen3v + 4'd3;
	else if (count > 450 && count < 600 && imagen3v <480 && inicio)
		imagen3v <= imagen3v + 4'd4;
	else if (reset  || imagen3v >= 480 || gameover || count == 0)// cambio se quita encendido == 0 y se agrego count 
		imagen3v <= 0;
end
///////////////////////////////////////////////////////////////
always @ (posedge f)
begin
	if (imagen4v < 480 && count > 0 && count < 150 && inicio)
		imagen4v <= imagen4v + 4'd1;
	else if(count > 150 && count < 300 && imagen4v < 480 && inicio)
		imagen4v <= imagen4v + 4'd2;
		else if (count > 300 && count < 450 && imagen4v <480 && inicio)
		imagen4v <= imagen4v + 4'd3;
	else if (count > 450 && count < 600 && imagen4v <480 && inicio)
		imagen4v <= imagen4v + 4'd4;
	else if (reset || imagen4v >= 480 || gameover || count == 0 )
		imagen4v <= 0;
	
end
////////////////////////////////////////////////////////////////
always @ (posedge l)
begin
	if (imagen5v < 480 && count > 0 && count < 150 && inicio)
		imagen5v <= imagen5v + 4'd1;
	else if(count > 150 && count < 300 && imagen5v < 480 && inicio)
		imagen5v <= imagen5v + 4'd2; 
	else if (count > 300 && count < 450 && imagen5v <480 && inicio)
		imagen5v <= imagen5v + 4'd3;
	else if (count > 450 && count < 600 && imagen5v <480 && inicio)
		imagen5v <= imagen5v + 4'd4;
	else if (reset || imagen5v >= 480 || gameover || count == 0)
		imagen5v <= 0;

end
////////////////////////////////////////////////////////////////
always @ (posedge p)
begin
	if (imagen6v < 480 && count > 0 && count < 150 && inicio)
		imagen6v <= imagen6v + 4'd1;
	else if(count > 150 && count < 300 && imagen6v < 480 && inicio)
		imagen6v <= imagen6v + 4'd2;
	else if (count > 300 && count < 450 && imagen6v <480 && inicio)
		imagen6v <= imagen6v + 4'd3;
	else if (count > 450 && count < 600 && imagen6v <480 && inicio)
		imagen6v <= imagen6v + 4'd4;
	else if (reset || imagen6v >= 480 || gameover || count == 0)
		imagen6v <=0;
	
end
/////////////////////////////////////////////////////////////////
always @ (posedge q)
begin
	if (imagen7v < 480 && count > 0 && count < 150 && inicio)
		imagen7v <= imagen7v + 4'd1;
	else if(count > 150 && count < 300 && imagen7v < 480 && inicio)
		imagen7v <= imagen7v + 4'd2;
	else if (count > 300 && count < 450 && imagen7v <480 && inicio)
		imagen7v <= imagen7v + 4'd3;
	else if (count > 450 && count < 600 && imagen7v <480 && inicio)
		imagen7v <= imagen7v + 4'd4;
	else if (reset || imagen7v >= 480 || gameover || count == 0)	
		imagen7v <= 0;
	
end
///////////////////////////////////////////////////////////////////
always @ (posedge w)//no cambiar velocidad 
begin
	if (imagen8v < 480 && count < 600)
		imagen8v <= imagen8v + 1'd1;
	else 
		imagen8v <= 0;
end
///////////////////////////////////////////////////////////////////

//////////////////////colicion/////////////////////////////////////
always @ (posedge clock)
begin
if (enable)
begin 	 
if (Dat[1] == 1 && (Dat[2]== 1|| Dat[3]== 1 || Dat[4]== 1 || Dat[5]== 1 || Dat[6]== 1))
		begin
			gameover <= 1;
			end
///////////////////////////pantalla de inicio////////////////////////////////////
if (encendido == 0)	// cambio se agrego gameover
begin
if (gameover)
begin 
gameover <=0 ;
end
 
 else if(Dat[10] == 1'b1)
		begin
			red	<=	r[10];
			green	<=	g[10];
			blue	<=	b[10];
		end
		
	else if(Dat[11] == 1'b1)
		begin
			red	<=	r[11];
			green	<=	g[11];
			blue	<=	b[11];
		end

 
 else if (hcount>0 &&hcount<640&&vcount<480&&vcount>0)
		begin 
		red <= 3'b000;
		green <= 3'b000;
		blue <= 2'b00;
		end
	else 
		begin // pantalla
			red	<=	3'd0;
			green	<=	3'd0;
			blue	<=	2'd0; 
			end 
end
//////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////			
else
//////////////////////gameover//////////////////////////
begin
if (gameover == 1 && (reset == 0 || encendido == 0))//cambio
begin 
if(Dat[8] == 1'b1)
		begin
			red	<=	r[8];
			green	<=	g[8];
			blue	<=	b[8];
		end
		
else if (Dat[12] == 1'b1)
		begin
			red	<=	r[12];
			green	<=	g[12];
			blue	<=	b[12];
		end
		
else if(hcount > 0 && hcount < 640 && vcount > 0 && vcount < 480)
		begin
			red	<=	3'b000;
			green	<=	3'b000;
			blue	<=	2'b00;
		end		
		
else                       //condicion para que enciendan la pantalla
			begin
			red	<=	3'd0;
			green	<=	3'd0;
			blue	<=	2'd0;
			end 
end
//////////////////////pantalla de juego////////////////////
else
begin		
 if(Dat[9] == 1'b1 && vcount >= 430 && count == 600)
		begin
			red	<=	r[9];
			green	<=	g[9];
			blue	<=	b[9];
		end	
 else if(Dat[0] == 1'b1 && vcount >= 430 && count < 600)
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
	else if(Dat[4] == 1'b1)
		begin
			red	<=	r[4];
			green	<=	g[4];
			blue	<=	b[4];
		end
	else if(Dat[5] == 1'b1)
		begin
			red	<=	r[5];
			green	<=	g[5];
			blue	<=	b[5];
		end
	else if(Dat[6] == 1'b1)
		begin
			red	<=	r[6];
			green	<=	g[6];
			blue	<=	b[6];
		end
	else if(Dat[7] == 1'b1)
		begin
			red	<=	r[7];
			green	<=	g[7];
			blue	<=	b[7];
		end		
	else if (hcount>219&&hcount<221&&vcount<480&&vcount>0)//linea amarilla izquierda 
		begin
			red 	<= 3'b111;
			green	<= 3'b111;
			blue 	<= 2'b00;
		end 
	else if (hcount>438&&hcount<440&&vcount<480&&vcount>0)//linea amarilla derecha
		begin
			red 	<= 3'b111;
			green	<= 3'b111;
			blue 	<= 2'b00;
		end 
	else if (hcount>220&&hcount<440&&vcount<480&&vcount>0)//cuadro de la pista
		begin
			red 	<= 3'b010;
			green	<= 3'b001;
			blue 	<= 2'b11;
		end 	
	else if(hcount>100&&hcount<540&&vcount<480&&vcount>0 && count < 150)//fondo verde 
		begin
			red 	<= 3'b000;
			green	<= 3'b100;
			blue 	<= 2'b00;
		end		
	else if(hcount>100&&hcount<540&&vcount<480&&vcount>0 && count >150 && count < 300)//fondo rojo 
		begin
			red 	<= 3'b100;
			green	<= 3'b000;
			blue 	<= 2'b00;
		end
	else if(hcount>100&&hcount<540&&vcount<480&&vcount>0 && count >300 && count < 450)//fondo naranja 
		begin
			red 	<= 3'b111;
			green	<= 3'b111;
			blue 	<= 2'b01;
		end		
	else if(hcount>100&&hcount<540&&vcount<480&&vcount>0 && count > 450 && count < 600)//fondo azul 
		begin
			red 	<= 3'b000;
			green	<= 3'b000;
			blue 	<= 2'b10;
		end
	else                       //condicion para que encienda la pantalla
			begin
			red	<=	3'd0;
			green	<=	3'd0;
			blue	<=	2'd0; 
			gameover <= 0;
			end 
end
end
end
end
////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
reloj_displays clock_500hz (.clock_in(clock), .clock_out(v));
	 
always @(posedge v )
 begin
  if (count < 600 && inicio)
	begin
		count <= count + 10'd1;
	end
	else if (reset)
		begin 
			count <= 10'd0;
		end
	else if (encendido == 0)
		begin 
			count <= 10'd0;
		end
	else 
	count <= count;//se agrego esto para que se quede en 600
 end
 
 

//======================================================================================
/////////////////////////////////////////display////////////////////////////////////////

wire [6:0]s0,s1,s2;

decoder d1(n2[3:0],s0);
decoder d2(n2[7:4],s1);
decoder d3(n2[11:8],s2);
//=================================Activacion y desactivar bases===================
reg [2:0] selector;

always @(posedge clk3)
	begin
	if (encendido == 0)
	begin 
		bas = 3'b111;
	end
	 else if(selector == 3'b000)
	 begin seg = s0; bas = 3'b110;end
	     
	
	else if(selector == 3'b010)
	 begin seg = s1; bas = 3'b101;end
	 
	 
		
	else if(selector == 3'b100)
	 begin seg = s2; bas = 3'b011;end
	 
	 selector = selector + 1'b1;
	 
end
wire clk1,clk2,clk3;
reg [11:0] n2;
		
frecuenciaDisplay frecuence(clock,clk3);

wire [11:0]BCD;
algoritmo d4({1'b0,count},BCD);//aqui va salida contador principal de 7 bits.
always @(*)////ultimo agregado///
begin
if (count == 600)//cpo
n2 <= 12'b101010111100;
else if (con > 0 && gameover)//gvr
n2<= 12'b110111101111;
else
n2 <= BCD;
end
//////////////////////////////////condicion////ultimo agragado
pruebacodigo prueba (clock, jj);

always @ (posedge jj)
begin 
	if (gameover)
		begin 
			if (con == 3'd7)
				begin 
					con <= 3'd0;
				end
			else
				con <= con - 1;
		end 
end 
endmodule
