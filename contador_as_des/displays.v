`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:35 03/15/2023 
// Design Name: 
// Module Name:    displays 
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
/* module displays (


input clk_in, reset, activador, updown,
input [1:0] sele, 
output reg [6:0] seg,
output reg [2:0] base
);


reg [2:0] contador;
reg [6:0] D1, D2, D3;


//assign control = 0;

//reg control;

wire clock;
wire [5:0] count_out;

contador concon (.clock(clk_in), .reset(reset), .activador(activador), .updown(updown), .sele(sele), .out(count_out),.audio(audio));
//Contador_as_des cont (.clock(clk_in), .reset(reset), .activador(activador), .updown(updown), .out(count_out));
clock_500hz clock_displays (clk_in, clock);


always @ (posedge clock)

	begin
			contador <= contador + 1;
				if (contador == 3'b001)
					begin
						seg <= ~D1;
						base <= 3'b110;
					end
				else if (contador == 3'b011)
					begin
						seg <= ~D2;
						base <= 3'b101;
					end
				else if (contador == 3'b110)
					begin
						seg <= ~D3;
						base <= 3'b011;
					end
			
	end

always @(*) 
			
			case (count_out)
				6'd1: begin D1 <= 7'b1111111;	D2 <=7'b1111111; D3 <=7'b1111111;end//clear
				6'd2: begin D1 <= 7'b1001000;	D2 <=7'b1111111; D3 <=7'b1111111;end//H
				6'd3: begin D1 <= 7'b0001000;	D2 <=7'b1001000; D3 <=7'b1111111;end//A
				6'd4: begin D1 <= 7'b1111001;	D2 <=7'b0001000; D3 <=7'b1001000;end//I
				6'd5: begin D1 <= 7'b1110001;	D2 <=7'b1111001; D3 <=7'b0001000;end//L
				6'd6: begin D1 <= 7'b1111001;	D2 <=7'b1110001; D3 <=7'b1111001;end//I
				6'd7: begin D1 <= 7'b0110000;	D2 <=7'b1111001; D3 <=7'b1110001;end//E
				6'd8: begin D1 <= 7'b1111110;	D2 <=7'b0110000; D3 <=7'b1111001;end//-
				/*6'd9: D1 <= 7'b0010010;	D2 <=7'b1111110; D3 <=7'b0110000;//2
				6'd10: D1 <= 7'b0000001;D2 <=7'b0010010; D3 <=7'b1111110;//0
				6'd11: D1 <= 7'b0010010;D2 <=7'b0000001; D3 <=7'b0010010;//2
				6'd12: D1 <= 7'b0000001;D2 <=7'b0010010; D3 <=7'b0000001;//0
				6'd13: D1 <= 7'b1111111;	D2 <=7'b1111111; D3 <=7'b1111111;//clear
				6'd14: D1 <= 7'b1111111;	D2 <=7'b1111111; D3 <=7'b1111111;//clear
				6'd15: D1 <= 7'b1111111;	D2 <=7'b1111111; D3 <=7'b1111111;//clear
				
				default: begin D1 <= 7'b1111111;	D2 <=7'b1111111; D3 <=7'b1111111;end//clear
				
			endcase
			
	
endmodule */