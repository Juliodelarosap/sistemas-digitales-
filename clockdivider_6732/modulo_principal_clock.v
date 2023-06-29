`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:53:27 02/20/2023 
// Design Name:    julio de la rosa 
// Module Name:    modulo_principal_clock 
// Project Name:  clock_mux 
// Target Devices: 
// Tool versions: 
// Description: 2018-6732
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module modulo_principal_clock(clock, seg, SevenSegmentEnable, sel, dot, LED, f0,f1,f2,f3,f4,f5,f6,f7,centena,decena,unidad);

input clock;//entrada clock del 500hz y demas 
wire clock_out;//para el clock de 500hz									
output reg [6:0] seg;//segmentos del display					
output reg [2:0] SevenSegmentEnable;//enable del display 7 segementos					
output dot;	//punto de los display									
input [2:0] sel;// selector del mux 8:1						
wire [2:0] SEL;// para negar el selector del mux 8:1
wire [11:0] bcd;// size de los bits para la convercion de bcd a 7seg
wire [6:0] d0,d1,d2;//salidas de 7 bits para los 7 segmentos por cada display	
reg [2:0] select;//selector para los displays multiplexacion  							
output reg LED;// salida donde se veran las frecuencias 							
output reg [3:0] centena,decena,unidad; //salidas con registro que guardan las diferentes unidades 												
output f0,f1,f2,f3,f4,f5,f6,f7;//frecuencias de salida 		

assign dot = 1'd1;//inhabilitacion del punto de los display 

assign SEL[2] = ~sel[2];//negacion del selector con los wire 
assign SEL[1] = ~sel[1];
assign SEL[0] = ~sel[0];

//wire clock_out;
clock_500hz clock_dis(.clock_in(clock),.clock_500(clock_out));//instanciacion del clock 500hz

//wire [11:0] bcd;
assign bcd[11:8] = centena;//asignacion del size de cada display para convertirlos de bcd a 7seg
assign bcd[7:4] = decena;
assign bcd[3:0] = unidad;

//wire [6:0] d0,d1,d2;
bcd_7seg dis_cen(.in(bcd[11:8]),.out(d2));//convercion de los bits bcd a 7 seg, desde el modulo de la 	
bcd_7seg dis_dec(.in(bcd[7:4]),.out(d1));//funcion en unidad,decena,centena
bcd_7seg dis_uni(.in(bcd[3:0]),.out(d0));


//reg [2:0] select;
always @(posedge clock_out)//secuancial de los diplay que dice como iran cambiando con el clock de 500hz 
begin
	if(select == 3'b000)	
		begin seg = d2; SevenSegmentEnable = 3'b011; end
	
	else	if(select == 3'b010) 
		begin seg = d1; SevenSegmentEnable = 3'b101; end
	
	else	if(select == 3'b100) 
		begin seg = d0; SevenSegmentEnable = 3'b110; end
		
select = select + 1'b1;

end	


clock_32hz c0 (.clock_in(clock),.clock_32(f0));//instanciacion y asignacion de cada uno de los modulos de clock 
clock_2hz c1 (.clock_in(clock),.clock_2(f1));
clock_5hz c2 (.clock_in(clock),.clock_5(f2));
clock_7hz c3 (.clock_in(clock),.clock_7(f3));
clock_9hz c4 (.clock_in(clock),.clock_9(f4));
clock_11hz c5 (.clock_in(clock),.clock_11(f5));
clock_13hz c6 (.clock_in(clock),.clock_13(f6));
clock_15hz c7 (.clock_in(clock),.clock_15(f7));


always @(*)//mux de la frecuencia y que mostraran los display 
case (SEL)

3'b000:	//sel..eccion de funcion 
	begin 
	LED = f0;//led es igual a la funcion 000
   centena = 4'd0;//  0
	decena = 4'd3;//  3
	unidad = 4'd2;// 2
	end
3'b001:	
	begin 
	LED = f1; 
	centena = 4'd0; 
	decena = 4'd0;
	unidad = 4'd2;
	end
3'b010:	
	begin 
	LED = f2;
	centena = 4'd0;
	decena = 4'd0;
	unidad = 4'd5;
	end
3'b011:	
	begin 
	LED = f3;
	centena = 4'd0;
	decena = 4'd0;
	unidad = 4'd7;
	end
3'b100:	
	begin 
	LED = f4;
	centena = 4'd0;
	decena = 4'd0;
	unidad = 4'd9;
	end
3'b101:	
	begin 
	LED = f5;
	centena = 4'd0;
	decena = 4'd1;
	unidad = 4'd1;
	end
3'b110:	
	begin 
	LED = f6;
	centena = 4'd0;
	decena = 4'd1;
	unidad = 4'd3;
	end
3'b111:	
	begin 
	LED = f7;
	centena = 4'd0;
	decena = 4'd1;
	unidad = 4'd5;
	end
	endcase
	
endmodule
