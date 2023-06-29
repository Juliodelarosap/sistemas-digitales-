`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:43:21 03/29/2023 
// Design Name: 
// Module Name:    mux 
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
module mux(

output [7:0] sel, output reg nota, output [13:0] h, input clk,activado,updown 
    );


Contado contador (.clk(clk),.out(sel),.activado(activado),.updown(updown));


doo  (.clock_in(clk), .clock_out(h[0]));
do_grande  (.clock_in(clk), .clock_out(h[1]));
do_sos  (.clock_in(clk), .clock_out(h[2]));
fa_sos  (.clock_in(clk), .clock_out(h[3]));
la  (.clock_in(clk), .clock_out(h[4]));
la_sos  (.clock_in(clk), .clock_out(h[5]));
mi  (.clock_in(clk), .clock_out(h[6]));
mi_grande  (.clock_in(clk), .clock_out(h[7]));
re  (.clock_in(clk), .clock_out(h[8]));
re_sos  (.clock_in(clk), .clock_out(h[9]));
re_sos_grande  (.clock_in(clk), .clock_out(h[10]));
si  (.clock_in(clk), .clock_out(h[11]));
sol  (.clock_in(clk), .clock_out(h[12]));
silencio  (.clock_in(clk), .clock_out(h[13]));

always @ (*)

begin
case (sel)

			8'd0:
				begin
					nota = h[13];  //mi*8
				end

			8'd1:
				begin
					nota = h[4];  //mi*8
				end
				
			8'd2:
				begin
					nota = h[4];  
				end
				
			8'd3:
				begin
					nota = h[4];  
				end
				
			8'd4:
				begin
					nota = h[13];  
				end
				
			8'd5:
				begin
					nota = h[13];  
				end
				
			8'd6:
				begin
					nota = h[4];  
				end
				
			8'd7:
				begin
					nota = h[4];  
				end
				
			8'd8:
				begin
					nota = h[4];  //silencio
				end
				
			8'd9:
				begin
					nota = h[13]; //do#  
				end
				
			8'd10:
				begin
					nota = h[13];  //re
				end
				
			8'd11:
				begin
					nota = h[6];  //re#
				end
			8'd12:
				begin
					nota = h[6];  //re#
				end
			8'd13:
				begin
					nota = h[5];  //re#
				end
			8'd14:
				begin
					nota = h[3];  //re#
				end
			8'd15:
				begin
					nota = h[12];  //re#
				end
			8'd16:
				begin
					nota = h[2];  //re#
				end			
			8'd17:
				begin
					nota = h[6];  //re#
				end
			8'd18:
				begin
					nota = h[6];  //re#
				end
			8'd19:
				begin
					nota = h[6];  //re#
				end
			8'd20:
				begin
					nota = h[6];  //re#
				end
endcase 
end
endmodule 