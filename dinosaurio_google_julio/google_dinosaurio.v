`timescale 1ns / 1ps
/*
corre 
salta
agacha
pausa 
pierde 
boton de inicio
*/
module google_dinosaurio(clk, out,seg,bas,dot,centena,decena,unidad, out_2, out_3,salto,agacho,dino,stop,bp,
 reset  );

input clk;
output reg [3:0]out = 4'd0;
reg a1 = 4'd0;
reg a2 = 4'd0;
wire clock_out;
wire[6:0] d0,d1,d2;
output dot;
output reg [6:0] seg;
output reg [2:0] bas;
output reg stop;

assign dot = 1'd1; 
wire [11:0] bcd;

input bp;
input reset;

output reg [3:0] centena,decena,unidad;
output reg [3:0] out_2 = 4'd0;
output reg [3:0] out_3 = 4'd0;

Tiempo tiempo (.clock_in(clk), .clock_out(clock_out));///////////////

display7s c (.in(out_3),.out(d2));
display7s d (.in(out_2),.out(d1));
display7s u (.in(out),.out(d0));

assign Rst = ~reset;
reg control;
input salto,agacho;
output reg [6:0] dino;
wire Salto,Agacho;

assign Salto = ~salto;
assign Agacho = ~agacho;
assign bcd[11:8] = centena;
assign bcd[7:4] = decena;
assign bcd[3:0] = unidad;

////////////////////////////////////////
	
////////////////////////////////////////
always @ (*)
begin
if(stop == 1)begin 
dino <= 7'b0101000;
end
else if (Salto == 1)
dino <= 7'b0011101;
else if (Agacho == 1)
dino <= 7'b1110111;
else
dino <= 7'b0101000;
end

reg st;//////////////////////////////////
always @ (posedge clk) begin
  if (bp == 1'b1 && st == 1'b0)begin
  if (stop == 1'b1) begin
		stop <= 1'b0;
	end else begin
	stop <= 1'b1;
	end
	
	end
	st <= bp;
	end
////////////////////////////////////////

//////////////////////////////////////// 
always @ (negedge clock_out)
		begin
		if (Rst && stop == 1)//
		begin
		out <= 4'd0;
		a1<= a1 - 1;
		end
			else if (stop == 0)
			begin
				if(out < 9)
				begin
				out <= out + 1;
				a1 <= 4'd0;
				end
				else 
				begin
				out <= 4'd0;
				a1 <= a1 + 1;
				end
				
			end
			end

/////////////////////////////////////////////
always @ (posedge a1)
		begin
		if (Rst && stop == 1)//
		begin
		out_2 <= 4'd0;
		a2 <= a2 - 1;
		end
			else if (control == 0)
			begin
				if(out_2 < 9)
				begin
				out_2 <= out_2 + 1;
				a2 <= 4'd0;
				end
				else 
				begin
				out_2 <= 4'd0;
				a2 <= a2 + 1;
				end
				
			end
			end
/////////////////////////////////	
always @ (posedge a2)
		begin
		if(Rst && stop == 1)//
		begin 
		out_3 <= 4'd0;
		end
		 else if (control == 0)
			begin
				if(out_3 < 9)
				out_3 <= out_3 + 1;
				else 
			out_3 <= 4'd0;				
			end
			end
	
clock_500hz clkdis (.clock_in(clk), .g(g));
	 
reg [2:0] contador;///////////////////////////////

always @ (posedge g)

	begin
contador <= contador + 1;
				if (contador == 3'b000)
					begin
						seg <= d0;
						bas <= 3'b110;
					end
				else if (contador == 3'b010)
					begin
						seg <= d1;
						bas <= 3'b101;
					end
				else if (contador == 3'b100)
					begin
						seg <= d2;
						bas <= 3'b011;
					end
			
	end
endmodule

