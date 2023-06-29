`timescale 1ns / 1ps
module linea_carro (
input enable,
input clock,
input [9:0] posx, posy,
input [9:0] hcount,
input [9:0] vcount,
output reg[2:0] red,
output reg[2:0] green,
output reg[1:0] blue,
output reg data);

always @(posedge clock)
begin
	if(enable)
	begin
		if(hcount >= posx & hcount < posx + RESOLUCION_X & vcount >= posy & vcount < posy + RESOLUCION_Y)
		begin
			if (F[vcount - posy][hcount - posx][8] == 1'b1)
			begin
				red   <= F[vcount- posy][hcount- posx][7:5];
				green <= F[vcount- posy][hcount- posx][4:2];
            blue 	<= F[vcount- posy][hcount- posx][1:0];
				data  <= 1'b1;
			end
			else
				data <= 0;
			end
		else
		data <= 0;
	end
end

parameter RESOLUCION_X = 30;
parameter RESOLUCION_Y = 100;
wire [8:0] F[RESOLUCION_Y - 1'b1 : 0][RESOLUCION_X - 1'b1 : 0];
assign F[19][12] = 9'b111111111;
assign F[19][13] = 9'b111111111;
assign F[19][14] = 9'b111111111;
assign F[19][15] = 9'b111111111;
assign F[19][16] = 9'b111111111;
assign F[20][12] = 9'b111111111;
assign F[20][13] = 9'b111111111;
assign F[20][14] = 9'b111111111;
assign F[20][15] = 9'b111111111;
assign F[20][16] = 9'b111111111;
assign F[21][12] = 9'b111111111;
assign F[21][13] = 9'b111111111;
assign F[21][14] = 9'b111111111;
assign F[21][15] = 9'b111111111;
assign F[21][16] = 9'b111111111;
assign F[22][12] = 9'b111111111;
assign F[22][13] = 9'b111111111;
assign F[22][14] = 9'b111111111;
assign F[22][15] = 9'b111111111;
assign F[22][16] = 9'b111111111;
assign F[23][12] = 9'b111111111;
assign F[23][13] = 9'b111111111;
assign F[23][14] = 9'b111111111;
assign F[23][15] = 9'b111111111;
assign F[23][16] = 9'b111111111;
assign F[24][12] = 9'b111111111;
assign F[24][13] = 9'b111111111;
assign F[24][14] = 9'b111111111;
assign F[24][15] = 9'b111111111;
assign F[24][16] = 9'b111111111;
assign F[25][12] = 9'b111111111;
assign F[25][13] = 9'b111111111;
assign F[25][14] = 9'b111111111;
assign F[25][15] = 9'b111111111;
assign F[25][16] = 9'b111111111;
assign F[26][12] = 9'b111111111;
assign F[26][13] = 9'b111111111;
assign F[26][14] = 9'b111111111;
assign F[26][15] = 9'b111111111;
assign F[26][16] = 9'b111111111;
assign F[27][12] = 9'b111111111;
assign F[27][13] = 9'b111111111;
assign F[27][14] = 9'b111111111;
assign F[27][15] = 9'b111111111;
assign F[27][16] = 9'b111111111;
assign F[28][12] = 9'b111111111;
assign F[28][13] = 9'b111111111;
assign F[28][14] = 9'b111111111;
assign F[28][15] = 9'b111111111;
assign F[28][16] = 9'b111111111;
assign F[29][12] = 9'b111111111;
assign F[29][13] = 9'b111111111;
assign F[29][14] = 9'b111111111;
assign F[29][15] = 9'b111111111;
assign F[29][16] = 9'b111111111;
assign F[30][12] = 9'b111111111;
assign F[30][13] = 9'b111111111;
assign F[30][14] = 9'b111111111;
assign F[30][15] = 9'b111111111;
assign F[30][16] = 9'b111111111;
assign F[31][12] = 9'b111111111;
assign F[31][13] = 9'b111111111;
assign F[31][14] = 9'b111111111;
assign F[31][15] = 9'b111111111;
assign F[31][16] = 9'b111111111;
assign F[32][12] = 9'b111111111;
assign F[32][13] = 9'b111111111;
assign F[32][14] = 9'b111111111;
assign F[32][15] = 9'b111111111;
assign F[32][16] = 9'b111111111;
assign F[33][12] = 9'b111111111;
assign F[33][13] = 9'b111111111;
assign F[33][14] = 9'b111111111;
assign F[33][15] = 9'b111111111;
assign F[33][16] = 9'b111111111;
assign F[34][12] = 9'b111111111;
assign F[34][13] = 9'b111111111;
assign F[34][14] = 9'b111111111;
assign F[34][15] = 9'b111111111;
assign F[34][16] = 9'b111111111;
assign F[35][12] = 9'b111111111;
assign F[35][13] = 9'b111111111;
assign F[35][14] = 9'b111111111;
assign F[35][15] = 9'b111111111;
assign F[35][16] = 9'b111111111;
assign F[36][12] = 9'b111111111;
assign F[36][13] = 9'b111111111;
assign F[36][14] = 9'b111111111;
assign F[36][15] = 9'b111111111;
assign F[36][16] = 9'b111111111;
assign F[37][12] = 9'b111111111;
assign F[37][13] = 9'b111111111;
assign F[37][14] = 9'b111111111;
assign F[37][15] = 9'b111111111;
assign F[37][16] = 9'b111111111;
assign F[38][12] = 9'b111111111;
assign F[38][13] = 9'b111111111;
assign F[38][14] = 9'b111111111;
assign F[38][15] = 9'b111111111;
assign F[38][16] = 9'b111111111;
assign F[39][12] = 9'b111111111;
assign F[39][13] = 9'b111111111;
assign F[39][14] = 9'b111111111;
assign F[39][15] = 9'b111111111;
assign F[39][16] = 9'b111111111;
assign F[40][12] = 9'b111111111;
assign F[40][13] = 9'b111111111;
assign F[40][14] = 9'b111111111;
assign F[40][15] = 9'b111111111;
assign F[40][16] = 9'b111111111;
assign F[41][12] = 9'b111111111;
assign F[41][13] = 9'b111111111;
assign F[41][14] = 9'b111111111;
assign F[41][15] = 9'b111111111;
assign F[41][16] = 9'b111111111;
assign F[42][12] = 9'b111111111;
assign F[42][13] = 9'b111111111;
assign F[42][14] = 9'b111111111;
assign F[42][15] = 9'b111111111;
assign F[42][16] = 9'b111111111;
assign F[43][12] = 9'b111111111;
assign F[43][13] = 9'b111111111;
assign F[43][14] = 9'b111111111;
assign F[43][15] = 9'b111111111;
assign F[43][16] = 9'b111111111;
assign F[44][12] = 9'b111111111;
assign F[44][13] = 9'b111111111;
assign F[44][14] = 9'b111111111;
assign F[44][15] = 9'b111111111;
assign F[44][16] = 9'b111111111;
assign F[45][12] = 9'b111111111;
assign F[45][13] = 9'b111111111;
assign F[45][14] = 9'b111111111;
assign F[45][15] = 9'b111111111;
assign F[45][16] = 9'b111111111;
assign F[46][12] = 9'b111111111;
assign F[46][13] = 9'b111111111;
assign F[46][14] = 9'b111111111;
assign F[46][15] = 9'b111111111;
assign F[46][16] = 9'b111111111;
assign F[47][12] = 9'b111111111;
assign F[47][13] = 9'b111111111;
assign F[47][14] = 9'b111111111;
assign F[47][15] = 9'b111111111;
assign F[47][16] = 9'b111111111;
assign F[48][12] = 9'b111111111;
assign F[48][13] = 9'b111111111;
assign F[48][14] = 9'b111111111;
assign F[48][15] = 9'b111111111;
assign F[48][16] = 9'b111111111;
assign F[49][12] = 9'b111111111;
assign F[49][13] = 9'b111111111;
assign F[49][14] = 9'b111111111;
assign F[49][15] = 9'b111111111;
assign F[49][16] = 9'b111111111;
assign F[50][12] = 9'b111111111;
assign F[50][13] = 9'b111111111;
assign F[50][14] = 9'b111111111;
assign F[50][15] = 9'b111111111;
assign F[50][16] = 9'b111111111;
assign F[51][12] = 9'b111111111;
assign F[51][13] = 9'b111111111;
assign F[51][14] = 9'b111111111;
assign F[51][15] = 9'b111111111;
assign F[51][16] = 9'b111111111;
assign F[52][12] = 9'b111111111;
assign F[52][13] = 9'b111111111;
assign F[52][14] = 9'b111111111;
assign F[52][15] = 9'b111111111;
assign F[52][16] = 9'b111111111;
assign F[53][12] = 9'b111111111;
assign F[53][13] = 9'b111111111;
assign F[53][14] = 9'b111111111;
assign F[53][15] = 9'b111111111;
assign F[53][16] = 9'b111111111;
assign F[54][12] = 9'b111111111;
assign F[54][13] = 9'b111111111;
assign F[54][14] = 9'b111111111;
assign F[54][15] = 9'b111111111;
assign F[54][16] = 9'b111111111;
assign F[55][12] = 9'b111111111;
assign F[55][13] = 9'b111111111;
assign F[55][14] = 9'b111111111;
assign F[55][15] = 9'b111111111;
assign F[55][16] = 9'b111111111;
assign F[56][12] = 9'b111111111;
assign F[56][13] = 9'b111111111;
assign F[56][14] = 9'b111111111;
assign F[56][15] = 9'b111111111;
assign F[56][16] = 9'b111111111;
assign F[57][12] = 9'b111111111;
assign F[57][13] = 9'b111111111;
assign F[57][14] = 9'b111111111;
assign F[57][15] = 9'b111111111;
assign F[57][16] = 9'b111111111;
assign F[58][12] = 9'b111111111;
assign F[58][13] = 9'b111111111;
assign F[58][14] = 9'b111111111;
assign F[58][15] = 9'b111111111;
assign F[58][16] = 9'b111111111;
assign F[59][12] = 9'b111111111;
assign F[59][13] = 9'b111111111;
assign F[59][14] = 9'b111111111;
assign F[59][15] = 9'b111111111;
assign F[59][16] = 9'b111111111;
assign F[60][12] = 9'b111111111;
assign F[60][13] = 9'b111111111;
assign F[60][14] = 9'b111111111;
assign F[60][15] = 9'b111111111;
assign F[60][16] = 9'b111111111;
assign F[61][12] = 9'b111111111;
assign F[61][13] = 9'b111111111;
assign F[61][14] = 9'b111111111;
assign F[61][15] = 9'b111111111;
assign F[61][16] = 9'b111111111;
assign F[62][12] = 9'b111111111;
assign F[62][13] = 9'b111111111;
assign F[62][14] = 9'b111111111;
assign F[62][15] = 9'b111111111;
assign F[62][16] = 9'b111111111;
assign F[63][12] = 9'b111111111;
assign F[63][13] = 9'b111111111;
assign F[63][14] = 9'b111111111;
assign F[63][15] = 9'b111111111;
assign F[63][16] = 9'b111111111;
assign F[64][12] = 9'b111111111;
assign F[64][13] = 9'b111111111;
assign F[64][14] = 9'b111111111;
assign F[64][15] = 9'b111111111;
assign F[64][16] = 9'b111111111;
assign F[65][12] = 9'b111111111;
assign F[65][13] = 9'b111111111;
assign F[65][14] = 9'b111111111;
assign F[65][15] = 9'b111111111;
assign F[65][16] = 9'b111111111;
assign F[66][12] = 9'b111111111;
assign F[66][13] = 9'b111111111;
assign F[66][14] = 9'b111111111;
assign F[66][15] = 9'b111111111;
assign F[66][16] = 9'b111111111;
assign F[67][12] = 9'b111111111;
assign F[67][13] = 9'b111111111;
assign F[67][14] = 9'b111111111;
assign F[67][15] = 9'b111111111;
assign F[67][16] = 9'b111111111;
assign F[68][12] = 9'b111111111;
assign F[68][13] = 9'b111111111;
assign F[68][14] = 9'b111111111;
assign F[68][15] = 9'b111111111;
assign F[68][16] = 9'b111111111;
//Total de Lineas = 250
endmodule

