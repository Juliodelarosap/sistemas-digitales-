`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:01:40 01/28/2023 
// Design Name: 
// Module Name:    comparador 
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
module comparador(a0,a1,a2,a3,b0,b1,b2,b3,E,G,L);

  input a0,a1,a2,a3,b0,b1,b2,b3;
  output E,G,L;//E=,G>,L< 
  wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19;
  wire wn1,wn2,wn3,wn4,wn5,wn6,wn7,wn8;
 
 not g1(wn1,b3);
  not g2(wn2,a3);
  not g3(wn3,b2);
  not g4(wn4,a2);
  not g5(wn5,b1);
  not g6(wn6,a1);
  not g7(wn7,b0);
  not g8(wn8,a0);
  and g9(w1,a3,wn1);
  and g10(w2,b3,wn2);
  and g11(w3,a2,wn3);
  and g12(w4,b2,wn4);
  and g13(w5,a1,wn5);
  and g14(w6,b1,wn6);
  and g15(w7,a0,wn7);
  and g16(w8,b0,wn8);
  xnor g17(w9,w1,w2);
  xnor g18(w10,w3,w4);
  xnor g19(w11,w5,w6);
  xnor g20(w12,w7,w8);
  and g21(w13,w9,w3);
  and g22(w14,w9,w4); 
  and g23(w15,w9,w10,w5);
  and g24(w16,w9,w10,w6);
  and g25(w17,w9,w10,w11,w7);
  and g26(w18,w9,w10,w11,w8);
  and g27(E,w9,w10,w11,w12);
  or  g28(G,w1,w13,w15,w17);
  or g29(L,w2,w14,w16,w18);

endmodule
