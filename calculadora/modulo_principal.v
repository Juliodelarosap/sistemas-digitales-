`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:58 02/07/2023 
// Design Name: 
// Module Name:    modulo_principal 
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
module modulo_principal(input [4:0]a,b,input [2:0]sel0,input CLK_100MHz,output [11:0]led,
								output[6:0]SevenSegment,output [2:0]SevenSegmentEnable, output[6:0]s3);

wire [5:0]suma, comple,compleb,resta;
wire [6:0]s0,s1,s2;
wire [9:0]multip,conca;
wire [2:0]com;
wire clk;

sumador_5bits suma_0 (a,b, suma);
multiplicar_0 multi (a,b,multip);
concatenacion con (a,b,conca);
restador_5bits resta_0 (a,b,resta);
sumador_5bits complemento_a2(~a,5'd1,comple); 
sumador_5bits complemento_b2 (~b, 5'd1, compleb);
comparador compa (a,b,com);
mux_plexor Mux(suma,resta,multip,comple,compleb,conca,com,~sel0,led);

clock_de_500hz clock_freq (CLK_100MHz,clk);
display pantalla (clk,SevenSegment,s0,s1,s2,SevenSegmentEnable);
display_7s unidad (led[2:0],s0);
display_7s decena (led[5:3],s1);
display_7s centena  (led[8:6],s2);
display_7s unidad_mil (led[11:9],s3);


endmodule//tener en cuanta el orden de los parametros para multiplexar
