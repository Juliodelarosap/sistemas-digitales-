`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:38:04 03/29/2023 
// Design Name: 
// Module Name:    musica 
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
//////////////////////////////////////////////////////////////////////////////////
module musica(input clock,activador, atr, output audio,output reg musica);


reg registro;
mux mux (.sel(sel),.nota(audio),.h(h),.clk(clock),.activado(activador),.updown(musica));

always @ (posedge clock) begin //encendido y apagado
  if (atr == 1'b0 && registro == 1'b1)begin
  if (musica == 1'b1) begin
		musica <= 1'b0;
	end else begin
	musica <= 1'b1;
	end
	end
	registro <= atr;
	end
endmodule 

