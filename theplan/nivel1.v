`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:27 04/16/2023 
// Design Name: 
// Module Name:    nivel1 
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
module nivel1(input clk, output [7:0] sel, output [13:0] h, output reg nota
    );
	 
contador_mux contador(.clk(clk), .out(sel), .control(control));
do2 d2 (.clock_in(clk), .clock_out(h[0]));
do3 d3(.clock_in(clk), .clock_out(h[1]));
fa2 f2 (.clock_in(clk), .clock_out(h[2]));
la1 l1 (.clock_in(clk), .clock_out(h[3]));
la2 l2 (.clock_in(clk), .clock_out(h[4]));
mi2 m2 (.clock_in(clk), .clock_out(h[5]));
re2 r2 (.clock_in(clk), .clock_out(h[6]));
reb2 rb2 (.clock_in(clk), .clock_out(h[7]));
reb3 rb3 (.clock_in(clk), .clock_out(h[8]));
sib2 sb2 (.clock_in(clk), .clock_out(h[9]));
sol2 s2(.clock_in(clk), .clock_out(h[10]));
mute m (.clock_in(clk), .clock_out(h[11]));
re1 r1 (.clock_in(clk), .clock_out(h[12]));
re3 r3 (.clock_in(clk), .clock_out(h[13]));

always @ (*)

begin
case (sel)


			8'd0:
				begin
					nota = h[6];  //mute
				end
				
			8'd1:
				begin
					nota = h[2];  
				end
				
			8'd2:
				begin
					nota = h[6];   
				end
				
			8'd3:
				begin
					nota = h[3];  // la1
				end
				
			8'd4:
				begin
					nota = h[6];  
				end
				
			8'd5:
				begin
					nota = h[2];  
				end
				
			8'd6:
				begin
					nota = h[6];  
				end
				
			8'd7:
				begin
					nota = h[3];  //la1
				end
				
			8'd8:
				begin
					nota = h[6]; //re2 
				end
				
			8'd9:
				begin
					nota = h[2];  //fa2
				end
				
			8'd10:
				begin
					nota = h[0];  //do2
				end

			8'd11:
				begin
					nota = h[3];  //la1
				end
			8'd12:
			
				begin
					nota = h[0];  
				end
				
			8'd13:
				begin
					nota = h[2];  
				end
				
			8'd14:
				begin
					nota = h[0];  
				end
				
			8'd15:
				begin
					nota = h[3];  
				end
				
			8'd16:
				begin
					nota = h[0];  
				end
				
			8'd17:
				begin
					nota = h[5];  
				end
				
			8'd18:
				begin
					nota = h[7]; 	//reb2			
				end
				
			8'd19:
				begin
					nota = h[3];  //la1
				end
				
			8'd20:
				begin
					nota = h[7];  //reb2
				end
				
			8'd21:
				begin
					nota = h[5];  //mi2
				end
				
			8'd22:
				begin
					nota = h[7]; //reb2				
				end
				
			8'd23:
				begin
					nota = h[3];//la1 					
				end
	
			8'd24:
				begin
					nota = h[7];//reb2 					
				end
				
			8'd25:
				begin
					nota = h[5];  //mi2
				end
endcase 
end
				

endmodule
