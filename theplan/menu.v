`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:03:31 04/02/2023 
// Design Name: 
// Module Name:    menu 
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
module menu(
  input clk,
  output reg [7:0] count,
  output reg [6:0] seg,
	 output reg [2:0] bas

    );

reloj (.clk(clk), .r(r));


  always @(posedge r )begin
  if (count < 200)begin
  count <= count +1;
  end else begin
  count <= 0;
  end
  end
  
 
//======================================================================================
/////////////////////////////////////////display////////////////////////////////////////

		wire [6:0]s0,s1,s2;
decoder d1(BCD[3:0],s0);
decoder d2(BCD[7:4],s1);
decoder d3(BCD[11:8],s2);
//=================================Activacion y desactivar bases===================
reg [2:0] selector;

always @(posedge clk3)
	begin
	 if(selector == 3'b000)
	 begin seg = s0; bas = 3'b110;end
	     
	
	else if(selector == 3'b010)
	 begin seg = s1; bas = 3'b101;end
	 
	 
		
	else if(selector == 3'b100)
	 begin seg = s2; bas = 3'b011;end
	 
	 selector = selector + 1'b1;
	 
end
			wire clk1,clk2,clk3;
		
			frecuenciaDisplay frecuence(clk,clk3);

wire [11:0]BCD;
algoritmo d4({1'b0,count},BCD);//aqui va salida contador principal de 7 bits.










 
  
  

endmodule
