/*`timescale 1ns / 1ps

module contador_ascendente(
    input clock,on,// entrada de reloj principal del user constrain file
    input rst,//boton de reset 
	 input [6:0] s0,s1,s2,
    output reg [9:0] count,//salida del contador
	 output reg[6:0]seg,
	 output reg[2:0]bas
);
reg [11:0] n2;
wire [6:0] segmento;
//aca instancian el reloj para el contador
//========================================

 clock_puntos clk ( clock, v);
 bcd_to_7seg bcd_7seg (bcd, segmento);
 algoritmo doble_dabble (.bin(count),.BCD(BCD));
 clock_display clock_500hz (clock, clkout_1);


//========================================

always @(posedge v or posedge rst) begin
    if(rst) begin
        count <= 10'd0;
    end else begin
        if(count == 10'd600) begin // valor del contador 
            count <= 10'd0; // Reiniciar a 0
        end else begin
            count <= count + 1;
        end
    end
end



bcd_to_7seg d1(n2[3:0],s0);
bcd_to_7seg d2(n2[7:4],s1);
bcd_to_7seg d3(n2[11:8],s2);




reg [2:0] selector;

always @(posedge clkout_1 )
	begin
	if (on == 0)
	bas = 3'b111;
	else if(selector == 3'b000)
	 begin seg = s0; bas = 3'b110;end
	     
	
	else if(selector == 3'b010)
	 begin seg = s1; bas = 3'b101;end
	 
	 
		
	else if(selector == 3'b100)
	 begin seg = s2; bas = 3'b011;end
	 
	 selector = selector + 1'b1;
	 
end




endmodule
*/
