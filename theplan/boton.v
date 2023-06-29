`timescale 1ns / 1ps
module boton (
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
			if (no[vcount - posy][hcount - posx][8] == 1'b1)
			begin
				red   <= no[vcount- posy][hcount- posx][7:5];
				green <= no[vcount- posy][hcount- posx][4:2];
            blue 	<= no[vcount- posy][hcount- posx][1:0];
				data  <= 1'b1;
			end
			else
				data <= 0;
			end
		else
		data <= 0;
	end
end

parameter RESOLUCION_X = 75;
parameter RESOLUCION_Y = 25;
wire [8:0] no[RESOLUCION_Y - 1'b1 : 0][RESOLUCION_X - 1'b1 : 0];
assign no[5][14] = 9'b111111111;
assign no[5][15] = 9'b111111111;
assign no[5][16] = 9'b111111111;
assign no[5][17] = 9'b111111111;
assign no[5][18] = 9'b111111111;
assign no[5][19] = 9'b111111111;
assign no[5][24] = 9'b111111111;
assign no[5][25] = 9'b111111111;
assign no[5][26] = 9'b111111111;
assign no[5][27] = 9'b111111111;
assign no[5][28] = 9'b111111111;
assign no[5][29] = 9'b111111111;
assign no[5][30] = 9'b111111111;
assign no[5][31] = 9'b111111111;
assign no[5][32] = 9'b111111111;
assign no[5][37] = 9'b111111111;
assign no[5][38] = 9'b111111111;
assign no[5][39] = 9'b111111111;
assign no[5][40] = 9'b111111111;
assign no[5][41] = 9'b111111111;
assign no[5][47] = 9'b111111111;
assign no[5][48] = 9'b111111111;
assign no[5][49] = 9'b111111111;
assign no[5][50] = 9'b111111111;
assign no[5][51] = 9'b111111111;
assign no[5][52] = 9'b111111111;
assign no[5][53] = 9'b111111111;
assign no[5][54] = 9'b111111111;
assign no[5][56] = 9'b111111111;
assign no[5][57] = 9'b111111111;
assign no[5][58] = 9'b111111111;
assign no[5][59] = 9'b111111111;
assign no[5][60] = 9'b111111111;
assign no[5][61] = 9'b111111111;
assign no[5][62] = 9'b111111111;
assign no[5][63] = 9'b111111111;
assign no[5][64] = 9'b111111111;
assign no[6][12] = 9'b111111111;
assign no[6][13] = 9'b111111111;
assign no[6][14] = 9'b111111111;
assign no[6][15] = 9'b111111111;
assign no[6][16] = 9'b111111111;
assign no[6][17] = 9'b111111111;
assign no[6][18] = 9'b111111111;
assign no[6][19] = 9'b111111111;
assign no[6][20] = 9'b111111111;
assign no[6][21] = 9'b111111111;
assign no[6][24] = 9'b111111111;
assign no[6][25] = 9'b111111111;
assign no[6][26] = 9'b111111111;
assign no[6][27] = 9'b111111111;
assign no[6][28] = 9'b111111111;
assign no[6][29] = 9'b111111111;
assign no[6][30] = 9'b111111111;
assign no[6][31] = 9'b111111111;
assign no[6][32] = 9'b111111111;
assign no[6][35] = 9'b111111111;
assign no[6][36] = 9'b111111111;
assign no[6][37] = 9'b111111111;
assign no[6][38] = 9'b111111111;
assign no[6][39] = 9'b111111111;
assign no[6][40] = 9'b111111111;
assign no[6][41] = 9'b111111111;
assign no[6][42] = 9'b111111111;
assign no[6][43] = 9'b111111111;
assign no[6][46] = 9'b111111111;
assign no[6][47] = 9'b111111111;
assign no[6][48] = 9'b111111111;
assign no[6][49] = 9'b111111111;
assign no[6][50] = 9'b111111111;
assign no[6][51] = 9'b111111111;
assign no[6][52] = 9'b111111111;
assign no[6][53] = 9'b111111111;
assign no[6][54] = 9'b111111111;
assign no[6][56] = 9'b111111111;
assign no[6][57] = 9'b111111111;
assign no[6][58] = 9'b111111111;
assign no[6][59] = 9'b111111111;
assign no[6][60] = 9'b111111111;
assign no[6][61] = 9'b111111111;
assign no[6][62] = 9'b111111111;
assign no[6][63] = 9'b111111111;
assign no[6][64] = 9'b111111111;
assign no[6][65] = 9'b111111111;
assign no[7][12] = 9'b111111111;
assign no[7][13] = 9'b111111111;
assign no[7][20] = 9'b111111111;
assign no[7][21] = 9'b111111111;
assign no[7][22] = 9'b111111111;
assign no[7][27] = 9'b111111111;
assign no[7][28] = 9'b111111111;
assign no[7][29] = 9'b111111111;
assign no[7][34] = 9'b111111111;
assign no[7][35] = 9'b111111111;
assign no[7][36] = 9'b111111111;
assign no[7][42] = 9'b111111111;
assign no[7][43] = 9'b111111111;
assign no[7][45] = 9'b111111111;
assign no[7][46] = 9'b111111111;
assign no[7][47] = 9'b111111111;
assign no[7][52] = 9'b111111111;
assign no[7][53] = 9'b111111111;
assign no[7][54] = 9'b111111111;
assign no[7][59] = 9'b111111111;
assign no[7][60] = 9'b111111111;
assign no[7][61] = 9'b111111111;
assign no[8][12] = 9'b111111111;
assign no[8][13] = 9'b111111111;
assign no[8][14] = 9'b111111111;
assign no[8][27] = 9'b111111111;
assign no[8][28] = 9'b111111111;
assign no[8][29] = 9'b111111111;
assign no[8][34] = 9'b111111111;
assign no[8][35] = 9'b111111111;
assign no[8][36] = 9'b111111111;
assign no[8][41] = 9'b111111111;
assign no[8][42] = 9'b111111111;
assign no[8][43] = 9'b111111111;
assign no[8][45] = 9'b111111111;
assign no[8][46] = 9'b111111111;
assign no[8][47] = 9'b111111111;
assign no[8][52] = 9'b111111111;
assign no[8][53] = 9'b111111111;
assign no[8][54] = 9'b111111111;
assign no[8][59] = 9'b111111111;
assign no[8][60] = 9'b111111111;
assign no[8][61] = 9'b111111111;
assign no[9][14] = 9'b111111111;
assign no[9][15] = 9'b111111111;
assign no[9][16] = 9'b111111111;
assign no[9][17] = 9'b111111111;
assign no[9][18] = 9'b111111111;
assign no[9][19] = 9'b111111111;
assign no[9][27] = 9'b111111111;
assign no[9][28] = 9'b111111111;
assign no[9][29] = 9'b111111111;
assign no[9][34] = 9'b111111111;
assign no[9][35] = 9'b111111111;
assign no[9][36] = 9'b111111111;
assign no[9][37] = 9'b111111111;
assign no[9][38] = 9'b111111111;
assign no[9][39] = 9'b111111111;
assign no[9][40] = 9'b111111111;
assign no[9][41] = 9'b111111111;
assign no[9][42] = 9'b111111111;
assign no[9][43] = 9'b111111111;
assign no[9][45] = 9'b111111111;
assign no[9][46] = 9'b111111111;
assign no[9][47] = 9'b111111111;
assign no[9][48] = 9'b111111111;
assign no[9][49] = 9'b111111111;
assign no[9][50] = 9'b111111111;
assign no[9][51] = 9'b111111111;
assign no[9][52] = 9'b111111111;
assign no[9][53] = 9'b111111111;
assign no[9][54] = 9'b111111111;
assign no[9][59] = 9'b111111111;
assign no[9][60] = 9'b111111111;
assign no[9][61] = 9'b111111111;
assign no[10][20] = 9'b111111111;
assign no[10][21] = 9'b111111111;
assign no[10][22] = 9'b111111111;
assign no[10][27] = 9'b111111111;
assign no[10][28] = 9'b111111111;
assign no[10][29] = 9'b111111111;
assign no[10][34] = 9'b111111111;
assign no[10][35] = 9'b111111111;
assign no[10][36] = 9'b111111111;
assign no[10][41] = 9'b111111111;
assign no[10][42] = 9'b111111111;
assign no[10][43] = 9'b111111111;
assign no[10][45] = 9'b111111111;
assign no[10][46] = 9'b111111111;
assign no[10][47] = 9'b111111111;
assign no[10][49] = 9'b111111111;
assign no[10][50] = 9'b111111111;
assign no[10][59] = 9'b111111111;
assign no[10][60] = 9'b111111111;
assign no[10][61] = 9'b111111111;
assign no[11][12] = 9'b111111111;
assign no[11][13] = 9'b111111111;
assign no[11][20] = 9'b111111111;
assign no[11][21] = 9'b111111111;
assign no[11][22] = 9'b111111111;
assign no[11][27] = 9'b111111111;
assign no[11][28] = 9'b111111111;
assign no[11][29] = 9'b111111111;
assign no[11][34] = 9'b111111111;
assign no[11][35] = 9'b111111111;
assign no[11][36] = 9'b111111111;
assign no[11][41] = 9'b111111111;
assign no[11][42] = 9'b111111111;
assign no[11][43] = 9'b111111111;
assign no[11][45] = 9'b111111111;
assign no[11][46] = 9'b111111111;
assign no[11][47] = 9'b111111111;
assign no[11][51] = 9'b111111111;
assign no[11][52] = 9'b111111111;
assign no[11][53] = 9'b111111111;
assign no[11][59] = 9'b111111111;
assign no[11][60] = 9'b111111111;
assign no[11][61] = 9'b111111111;
assign no[12][14] = 9'b111111111;
assign no[12][15] = 9'b111111111;
assign no[12][16] = 9'b111111111;
assign no[12][17] = 9'b111111111;
assign no[12][18] = 9'b111111111;
assign no[12][19] = 9'b111111111;
assign no[12][20] = 9'b111111111;
assign no[12][27] = 9'b111111111;
assign no[12][28] = 9'b111111111;
assign no[12][29] = 9'b111111111;
assign no[12][34] = 9'b111111111;
assign no[12][35] = 9'b111111111;
assign no[12][36] = 9'b111111111;
assign no[12][41] = 9'b111111111;
assign no[12][42] = 9'b111111111;
assign no[12][43] = 9'b111111111;
assign no[12][45] = 9'b111111111;
assign no[12][46] = 9'b111111111;
assign no[12][47] = 9'b111111111;
assign no[12][52] = 9'b111111111;
assign no[12][53] = 9'b111111111;
assign no[12][54] = 9'b111111111;
assign no[12][59] = 9'b111111111;
assign no[12][60] = 9'b111111111;
assign no[12][61] = 9'b111111111;
assign no[13][15] = 9'b111111111;
assign no[13][16] = 9'b111111111;
assign no[13][17] = 9'b111111111;
assign no[13][18] = 9'b111111111;
assign no[13][19] = 9'b111111111;
assign no[13][28] = 9'b111111111;
assign no[13][35] = 9'b111111111;
assign no[13][42] = 9'b111111111;
assign no[13][43] = 9'b111111111;
assign no[13][46] = 9'b111111111;
assign no[13][53] = 9'b111111111;
assign no[13][60] = 9'b111111111;
//Total de Lineas = 239
endmodule

