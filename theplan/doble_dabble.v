`timescale 1ns / 1ps

module algoritmo(bin,BCD);
input [8:0] bin;          // entrada de 9 bits para el número binario
output reg [11:0] BCD;    // salida de 12 bits para el número en formato BCD
reg [3:0] i;              // registro de 4 bits para el índice del bucle for

always @(bin)             // la salida se actualiza cada vez que la entrada cambia
	begin
		BCD =12'b0;        // se inicializa la salida en 0
		
		for (i=0;i<9;i=i+1'b1) // bucle for que recorre los 9 bits de la entrada binaria
			begin
				BCD = {BCD[10:0],bin[8-i]}; // se desplaza un bit hacia la izquierda la salida BCD y se agrega el bit correspondiente de la entrada binaria al bit menos significativo
				
				if(i<8 && BCD[3:0] > 4)  // si el nibble menos significativo de BCD es mayor que 4, se suma 3 (se ajusta para la conversión BCD)
					BCD[3:0] = BCD[3:0] + 2'b11;
					
				if(i<8 && BCD[7:4] > 4)  // si el segundo nibble de BCD es mayor que 4, se suma 3 (se ajusta para la conversión BCD)
					BCD[7:4] = BCD[7:4] + 2'b11;

				if(i<8 && BCD[11:8] > 4) // si el nibble más significativo de BCD es mayor que 4, se suma 3 (se ajusta para la conversión BCD)
					BCD[11:8] = BCD[11:8] + 2'b11;										
			end
	end
endmodule


