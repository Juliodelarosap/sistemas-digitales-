`timescale 1ns / 1ps
module botones (
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
			if (k[vcount - posy][hcount - posx][8] == 1'b1)
			begin
				red   <= k[vcount- posy][hcount- posx][7:5];
				green <= k[vcount- posy][hcount- posx][4:2];
            blue 	<= k[vcount- posy][hcount- posx][1:0];
				data  <= 1'b1;
			end
			else
				data <= 0;
			end
		else
		data <= 0;
	end
end

parameter RESOLUCION_X = 140;
parameter RESOLUCION_Y = 20;
wire [8:0] k[RESOLUCION_Y - 1'b1 : 0][RESOLUCION_X - 1'b1 : 0];
assign k[4][8] = 9'b111111111;
assign k[4][9] = 9'b111111111;
assign k[4][10] = 9'b111111111;
assign k[4][11] = 9'b111111111;
assign k[5][7] = 9'b111111111;
assign k[5][8] = 9'b111111111;
assign k[5][9] = 9'b111111111;
assign k[5][10] = 9'b111111111;
assign k[5][11] = 9'b111111111;
assign k[5][12] = 9'b110110110;
assign k[5][19] = 9'b111111111;
assign k[5][20] = 9'b111111111;
assign k[5][22] = 9'b111111111;
assign k[5][23] = 9'b111111111;
assign k[5][102] = 9'b111111111;
assign k[5][103] = 9'b111111111;
assign k[5][104] = 9'b111111111;
assign k[5][105] = 9'b111111111;
assign k[5][106] = 9'b111111111;
assign k[5][110] = 9'b111111111;
assign k[5][111] = 9'b111111111;
assign k[5][112] = 9'b111111111;
assign k[5][113] = 9'b111111111;
assign k[5][118] = 9'b111111111;
assign k[5][119] = 9'b111111111;
assign k[5][120] = 9'b111111111;
assign k[5][124] = 9'b111111111;
assign k[5][125] = 9'b111111111;
assign k[5][126] = 9'b111111111;
assign k[5][127] = 9'b111111111;
assign k[5][128] = 9'b111111111;
assign k[5][130] = 9'b111111111;
assign k[5][131] = 9'b111111111;
assign k[5][132] = 9'b111111111;
assign k[5][133] = 9'b111111111;
assign k[5][134] = 9'b111111111;
assign k[5][135] = 9'b111111111;
assign k[5][136] = 9'b111111111;
assign k[6][7] = 9'b111111111;
assign k[6][8] = 9'b111111111;
assign k[6][22] = 9'b111111111;
assign k[6][23] = 9'b111111111;
assign k[6][101] = 9'b111111111;
assign k[6][102] = 9'b111111111;
assign k[6][103] = 9'b111111111;
assign k[6][104] = 9'b111111111;
assign k[6][105] = 9'b111111111;
assign k[6][106] = 9'b111111111;
assign k[6][109] = 9'b111111111;
assign k[6][110] = 9'b111111111;
assign k[6][111] = 9'b111111111;
assign k[6][112] = 9'b111111111;
assign k[6][113] = 9'b111111111;
assign k[6][117] = 9'b110010010;
assign k[6][118] = 9'b111111111;
assign k[6][119] = 9'b111111111;
assign k[6][120] = 9'b111111111;
assign k[6][124] = 9'b111111111;
assign k[6][125] = 9'b111111111;
assign k[6][126] = 9'b111111111;
assign k[6][127] = 9'b111111111;
assign k[6][128] = 9'b111111111;
assign k[6][130] = 9'b110110110;
assign k[6][131] = 9'b111111111;
assign k[6][132] = 9'b111111111;
assign k[6][133] = 9'b111111111;
assign k[6][134] = 9'b111111111;
assign k[6][135] = 9'b111111111;
assign k[6][136] = 9'b110110110;
assign k[7][7] = 9'b111111111;
assign k[7][13] = 9'b111111111;
assign k[7][14] = 9'b110110110;
assign k[7][17] = 9'b110110110;
assign k[7][19] = 9'b110110110;
assign k[7][21] = 9'b110010010;
assign k[7][22] = 9'b111111111;
assign k[7][23] = 9'b111111111;
assign k[7][24] = 9'b110010010;
assign k[7][101] = 9'b111111111;
assign k[7][102] = 9'b111111111;
assign k[7][107] = 9'b111111111;
assign k[7][109] = 9'b111111111;
assign k[7][110] = 9'b111111111;
assign k[7][116] = 9'b111111111;
assign k[7][124] = 9'b111111111;
assign k[7][132] = 9'b110110110;
assign k[7][133] = 9'b111111111;
assign k[8][7] = 9'b111111111;
assign k[8][8] = 9'b111111111;
assign k[8][9] = 9'b111111111;
assign k[8][10] = 9'b111111111;
assign k[8][13] = 9'b111111111;
assign k[8][14] = 9'b111111111;
assign k[8][17] = 9'b111111111;
assign k[8][19] = 9'b111111111;
assign k[8][20] = 9'b111111111;
assign k[8][21] = 9'b111111111;
assign k[8][22] = 9'b111111111;
assign k[8][23] = 9'b111111111;
assign k[8][24] = 9'b111111111;
assign k[8][101] = 9'b111111111;
assign k[8][102] = 9'b111111111;
assign k[8][106] = 9'b111111111;
assign k[8][107] = 9'b111111111;
assign k[8][109] = 9'b111111111;
assign k[8][110] = 9'b111111111;
assign k[8][116] = 9'b111111111;
assign k[8][124] = 9'b111111111;
assign k[8][132] = 9'b111111111;
assign k[8][133] = 9'b111111111;
assign k[9][7] = 9'b111111111;
assign k[9][8] = 9'b111111111;
assign k[9][9] = 9'b111111111;
assign k[9][10] = 9'b111111111;
assign k[9][11] = 9'b110110110;
assign k[9][13] = 9'b111111111;
assign k[9][14] = 9'b111111111;
assign k[9][15] = 9'b111111111;
assign k[9][16] = 9'b111111111;
assign k[9][17] = 9'b111111111;
assign k[9][19] = 9'b111111111;
assign k[9][20] = 9'b111111111;
assign k[9][22] = 9'b111111111;
assign k[9][23] = 9'b111111111;
assign k[9][101] = 9'b111111111;
assign k[9][102] = 9'b111111111;
assign k[9][103] = 9'b111111111;
assign k[9][104] = 9'b111111111;
assign k[9][105] = 9'b111111111;
assign k[9][106] = 9'b111111111;
assign k[9][109] = 9'b111111111;
assign k[9][110] = 9'b111111111;
assign k[9][111] = 9'b111111111;
assign k[9][112] = 9'b111111111;
assign k[9][113] = 9'b111111111;
assign k[9][117] = 9'b110110110;
assign k[9][118] = 9'b111111111;
assign k[9][119] = 9'b111111111;
assign k[9][120] = 9'b111111111;
assign k[9][124] = 9'b111111111;
assign k[9][125] = 9'b111111111;
assign k[9][126] = 9'b111111111;
assign k[9][127] = 9'b111111111;
assign k[9][128] = 9'b111111111;
assign k[9][132] = 9'b111111111;
assign k[9][133] = 9'b111111111;
assign k[10][7] = 9'b111111111;
assign k[10][8] = 9'b110110110;
assign k[10][14] = 9'b110010001;
assign k[10][15] = 9'b111111111;
assign k[10][16] = 9'b111111111;
assign k[10][19] = 9'b111111111;
assign k[10][20] = 9'b111111111;
assign k[10][22] = 9'b111111111;
assign k[10][23] = 9'b111111111;
assign k[10][101] = 9'b111111111;
assign k[10][102] = 9'b111111111;
assign k[10][107] = 9'b111111111;
assign k[10][109] = 9'b111111111;
assign k[10][110] = 9'b111111111;
assign k[10][121] = 9'b111111111;
assign k[10][122] = 9'b111111111;
assign k[10][124] = 9'b111111111;
assign k[10][132] = 9'b111111111;
assign k[10][133] = 9'b111111111;
assign k[11][7] = 9'b111111111;
assign k[11][13] = 9'b111111111;
assign k[11][14] = 9'b111111111;
assign k[11][17] = 9'b111111111;
assign k[11][19] = 9'b111111111;
assign k[11][20] = 9'b111111111;
assign k[11][22] = 9'b111111111;
assign k[11][23] = 9'b111111111;
assign k[11][101] = 9'b111111111;
assign k[11][102] = 9'b111111111;
assign k[11][107] = 9'b111111111;
assign k[11][109] = 9'b111111111;
assign k[11][110] = 9'b111111111;
assign k[11][121] = 9'b111111111;
assign k[11][124] = 9'b111111111;
assign k[11][132] = 9'b111111111;
assign k[11][133] = 9'b111111111;
assign k[12][7] = 9'b111111111;
assign k[12][8] = 9'b111111111;
assign k[12][9] = 9'b111111111;
assign k[12][10] = 9'b111111111;
assign k[12][11] = 9'b111111111;
assign k[12][13] = 9'b111111111;
assign k[12][14] = 9'b111111111;
assign k[12][17] = 9'b111111111;
assign k[12][19] = 9'b111111111;
assign k[12][20] = 9'b111111111;
assign k[12][23] = 9'b111111111;
assign k[12][24] = 9'b111111111;
assign k[12][101] = 9'b111111111;
assign k[12][102] = 9'b111111111;
assign k[12][107] = 9'b111111111;
assign k[12][110] = 9'b111111111;
assign k[12][111] = 9'b111111111;
assign k[12][112] = 9'b111111111;
assign k[12][113] = 9'b111111111;
assign k[12][116] = 9'b111111111;
assign k[12][117] = 9'b111111111;
assign k[12][118] = 9'b111111111;
assign k[12][119] = 9'b111111111;
assign k[12][120] = 9'b111111111;
assign k[12][124] = 9'b111111111;
assign k[12][125] = 9'b111111111;
assign k[12][126] = 9'b111111111;
assign k[12][127] = 9'b111111111;
assign k[12][128] = 9'b111111111;
assign k[12][133] = 9'b111111111;
assign k[13][7] = 9'b111111111;
assign k[13][8] = 9'b111111111;
assign k[13][9] = 9'b111111111;
assign k[13][10] = 9'b111111111;
assign k[13][11] = 9'b111111111;
assign k[13][14] = 9'b110110110;
assign k[13][17] = 9'b110110110;
assign k[13][19] = 9'b110110110;
assign k[13][24] = 9'b110110110;
//Total de Lineas = 221
endmodule

