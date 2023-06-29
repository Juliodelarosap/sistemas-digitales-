`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:38:54 03/27/2023 
// Design Name: 
// Module Name:    contador 
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
//////////////////////////////////declaraciones de las variables////////////////////////////////////////////////
module contador( 

input clock_in, pb,puerta, in, pizza_, palomitas_, reset_,carnes_, descongelar_, mas_,menos_,
output reg [8:0] out,
output reg [1:0] out_1,
output reg [4:0] out_2,
output reg [6:0] s3,s4,s5,
output reg [2:0] micro,
output reg encendido, inicio, led, frecu, bombillo, autoap,
output reg final,
output audio,
output [1:0] a,
output reg [7:0] sal = 8'd0,
output reg [6:0] seg,
output reg [2:0] bas,
output reg [2:0 ] red,
output reg [2:0 ] green,
output reg [1:0 ] blue,
output reg hsync,
output reg vsync
);
	 
wire frecuencia;
wire clko;
wire [6:0]s0,s1,s2;
reg registro, registro2, fin;
assign mas = ~mas_;
assign menos = ~menos_;
////////////////////////////////intanciaciones de los demas modulos//////////////////////////////////////////////
frecuencia frec(.clock_in(clock_in), .clock_300(frecuencia) );
mux musica (.sel(sel), .nota(audio), .h(h), .clk(clock_in), .updown(encendido));
Tiempo mini_tiempo (.clock_in(clock_in), .clock_out(clock_out));
doo  (.clock_in(clock_in), .clock_out(a[0]));
silencio  (.clock_in(clock_in), .clock_out(a[1]));
clock_500hz clock(.clock_in(clock_in),.h(clko));
////////////////////////////////intanciacion de decodificador////////////////////////////////////////////////
decodificador d1(BCD[3:0],s0);
decodificador d2(BCD[7:4],s1);
decodificador d3(BCD[11:8],s2);
////////////////////////////////enables de los displays///////////////////////////////////////////////
reg [2:0] selector;

always @(posedge clko )
	begin
	if (encendido == 0)
	bas = 3'b111;
	else if(selector == 3'b000)
	 begin seg = s0; bas = 3'b110;end
	     
	
	else if(selector == 3'b010)
	 begin seg = s1; bas = 3'b101;end
	 
	 
		
	else if(selector == 3'b100)
	 begin seg = s2; bas = 3'b011;end
	 
	 selector = selector + 1'b1;
	 
end
/////////////////////////////doble dable/////////////////////////////////////////////////
wire [11:0]BCD;
dobledable d4({1'b0,out},BCD);
/////////////////////////////enclavamiento de encendido/////////////////////////////////////////////////
always @ (posedge clock_in) begin //encendido y apagado
if (autoap == 0)begin
  if (pb == 1'b0 && registro == 1'b1)begin
  if (encendido == 1'b1) begin
		encendido <= 1'b0;
	end else begin
	encendido <= 1'b1;
	end
	end
	end
else begin
encendido <= 1'b0;
registro <= 1'b0;
end

	registro <= pb;

end	
//////////////////////////////////////////////////////////////////////////

//////////////////////////////enclavamiento de inicio///////////////////////////////////////////	
always @ (posedge clock_in) begin //inicio, es el mismo de pausa
if (puerta)begin
  if (in == 1'b0 && registro2 == 1'b1)begin
	if (inicio == 1'b1) begin
		inicio <= 1'b0;
		end else begin
		inicio <= 1'b1;
	end
	
	end
end
else begin
inicio <= 1'b0;
registro2 <= 1'b0;
end
	registro2 <= in;
end
/////////////////////////////////////////////////////////////////////////////
	
//////////////////////////////contador y sus condiciones//////////////////////////////////////////////	
 always @(posedge frecuencia) begin
      if (encendido) begin
		led = 1;
			if (pizza_ && inicio == 0 && out == 9'd0) begin
			out = 9'd90;
			end
			else if (palomitas_ && inicio == 0 && out == 9'd0)begin
			out = 9'd110;
			end
			else if (carnes_ && inicio == 0 && out == 9'd0) begin
			out = 9'd100;
			end
			else if (descongelar_ && inicio == 0 && out == 9'd0) begin
			out = 9'd300;
			end
			else if (out > 9'd0 && inicio && puerta) begin
         out = out - 1;
			frecu = frecu + 1;
        end 
		  else if (reset_)
		  out = 7'b0;
		  else if (mas && out < 9'd320)
		  out = out + 9'd5;
			else if (menos && out > 9'd0)
			out = out - 9'd5;
		end
    else begin
      out = 9'b0;
		led = 0;
    end
  end
//////////////////////////////puerta led //////////////////////////////////////
always @ (*)
begin 
if ( encendido == 1 && (inicio == 1 || puerta ==0))
begin
bombillo = 1'd1; 
end 
else 
bombillo = 1'd0;
end
///////////////////////////////leds de motor//////////////////////////////////// 
reg control;
  
always @ (posedge frecu)
begin
	if (control == 0)
		begin
			if(out_1 < 3)
			out_1 <= out_1 + 1;
			else 
			out_1 <= 2'd0;
		end
else
	out_1 <= 2'd0;
	end
	
always @(*) 
	 case (out_1) 
	 
		2'd0: micro= 3'b011; 
		
		2'd1: micro = 3'b101;
		
		2'd2: micro = 3'b110;
		
		default micro = 3'b101;
	 endcase 
///////////////////////////////////autoapagado///////////////////////////////////////////////
always @ (posedge frecuencia)
begin
	if (encendido && inicio == 0 && puerta)
		begin
			if(out_2 < 30) begin
			out_2 <= out_2 + 1;
			autoap <= 1'd0;
			end
			else begin
			out_2 <= 5'd0;
			autoap <= 1'd1;
			end
		end
else begin
	out_2 <= 5'd0;
	autoap <= 1'd0;
	end 
	end 
//////////////////////////////////sonido del final////////////////////////////////////////////////

always @(posedge clock_out) 
 begin
   if (inicio && out == 0 && encendido && puerta) 
	begin
	sal = 6'd0;
	end
		
	else
	sal = 6'd1;
end	 

always @ (*)

begin
case (sal)

			6'd0:
				begin
					final = a[0];  
				end

			6'd1:
				begin
					final = a[1];
				end
				

endcase
end
//////////////////////////////display de puerta y fin ///////////////////////////////////////////
always @ (posedge clock_in) begin 
if (out == 9'd0 && inicio && puerta && encendido && sal == 6'd0)
begin 
s3 = 7'b0111000;
s4 = 7'b1111001;
s5 = 7'b1101010;
end 
else if (puerta == 0 && encendido == 1 )begin 
s3 = 7'b1111111;
s4 = 7'b0011000;
s5 = 7'b0001000;
end 
else
begin
s3 = 7'b1111111;
s4 = 7'b1111111;
s5 = 7'b1111111;
end
end
//////////////////////////////////imagenes///////////////////////////////////////

//Este codigo no se modifica
reg [9:0] hcount = 0;
reg [9:0] vcount = 0;
reg [1:0] counter = 0;
reg enable;
//Enable 
always @ (posedge clock_in)
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
always @(posedge clock_in)
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

//Creamos las variables de posicion relativa
reg [9:0] Booh,Boov,BooH,BooV,booh,boov,BOOH,BOOV,bOOh,bOOv;
//Utilizamos Wires para almacenar la salida del modulo
wire [2:0] r[4:0];
wire [2:0] g[4:0];
wire [1:0] b[4:0];
//Utilizamos un Wire para la salida de Data
wire [4:0]Dat;

//Aqui hacemos nuestra instanciacion con nuestras variables
prueba_1 Imagen1(enable,clock_in,Booh,Boov,hcount,vcount,r[2],g[2],b[2],Dat[2]);
prueba_2 Imagen2(enable,clock_in,BooH,BooV,hcount,vcount,r[1],g[1],b[1],Dat[1]);
prueba_3 Imagen3(enable,clock_in,booh,boov,hcount,vcount,r[0],g[0],b[0],Dat[0]);
prueba_4 Imagen4(enable,clock_in,BOOH,BOOV,hcount,vcount,r[3],g[3],b[3],Dat[3]);
prueba_5 Imagen5(enable,clock_in,bOOh,bOOv,hcount,vcount,r[4],g[4],b[4],Dat[4]);

//Codigo Modificable
always @ (posedge clock_in)
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
 if (encendido && (inicio | puerta == 0))
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
		else if(Dat[4] == 1'b1)
		begin
			red	<=	r[4];
			green	<=	g[4];
			blue	<=	b[4];
		end		
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


/////////////////////////////////////////////////////////////////////////
endmodule
