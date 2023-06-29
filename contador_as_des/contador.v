`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:05:33 03/12/2023 
// Design Name: 
// Module Name:    contador 
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

module contador(
  input clock, reset, pulsador, back,
  output dot,
  input [1:0] sele,
  output reg [5:0] out,
  output audio,
  d0,d1,d2,d3,
  output [7:0] bar,
  output reg [6:0]seg,
 output reg [2:0]bas,
 output reg activador,
 output reg updown

);
  reg [6:0] d0 = 0, d1 = 0, d2 = 0, d3 = 0;
  reg [7:0] b;
  reg bp, bp1;
  assign bar = b;
  wire frecuencia, reset_1;
  assign reset_1 = ~reset;
  wire clk1hz;
  assign dot = 1'd1;
  
  always @ (posedge clock) begin
  if (pulsador == 1'b0 && bp == 1'b1)begin
  if (activador == 1'b1) begin
		activador <= 1'b0;
	end else begin
	activador <= 1'b1;
	end
	
	end
	bp <= pulsador;
	end
	
always @ (posedge clock) begin
  if (back == 1'b1 && bp1 == 1'b0)begin
  if (updown == 1'b1) begin
		updown <= 1'b0;
	end else begin
	updown <= 1'b1;
	end
	
	end
	bp1 <= back;
	end
  



multi mux (clock, sele, frecuencia);
mux notas_musicales (.sel(sel), .nota(audio), .h(h), .clk(clock), .activado(activador));

  always @(posedge frecuencia or posedge reset_1) begin
    if (reset_1) begin
      out = 6'b0;
    end 
	 else if (activador) begin
      if (updown) begin
        if (out < 6'd40) begin
          out = out + 1;
        end else begin
          out = 6'b0; // Reinicia el contador al valor inicial
        end
      end else begin
        if (out > 6'd0) begin
          out = out - 1;
        end else begin
          out = 6'd40; // Reinicia el contador al valor inicial
        end
      end
    end else begin
      out = 6'b0;
    end
  end


wire clk_out;//contador para displays

always @(out)
	begin
		case(out)
			6'd0:
				begin
					d0 = 7'b1111111; //LIMPIO
					d1 = 7'b1111111; //LIMPIO
					d2 = 7'b1111111; //LIMPIO
					d3 = 7'b1111111; //LIMPIO
					 b = 8'b00000000;
				end
			6'd1: 
				begin
					d0 = 7'b1001000; //H
					d1 = 7'b1111111; //LIMPIO
					d2 = 7'b1111111; //LIMPIO
					d3 = 7'b1111111; //LIMPIO
					 b = 8'b11111111;
				end
			6'd2: 
				begin
					d0 = 7'b0001000; //A
					d1 = 7'b1001000; //H
					d2 = 7'b1111111; //LIMPIO
					d3 = 7'b1111111; //LIMPIO
					 b = 8'b11111111;
				end
			6'd3: 
				begin
					d0 = 7'b1111001; //I
					d1 = 7'b0001000; //A
					d2 = 7'b1001000; //H
					d3 = 7'b1111111; //LIMPIO
					 b = 8'b11111111;
				end
			6'd4: 
				begin
					d0 = 7'b1110001; //L
					d1 = 7'b1111001; //I
					d2 = 7'b0001000; //A
					d3 = 7'b1001000; //H
					 b = 8'b11111111;
				end
			6'd5: 
				begin
					d0 = 7'b1111001; //I
					d1 = 7'b1110001; //L
					d2 = 7'b1111001; //I
					d3 = 7'b0001000; //A
					 b = 8'b11111111;					
				end
			6'd6: 
				begin
					d0 = 7'b0110000; //E
					d1 = 7'b1111001; //I
					d2 = 7'b1110001; //L
					d2 = 7'b1111001; //I
					 b = 8'b11111111;
				end
			6'd7: 
				begin
					d0 = 7'b1111110; //-
					d1 = 7'b0110000; //E
					d2 = 7'b1111001; //I
					d3 = 7'b1110001; //L
					 b = 8'b01111111;
				end
			6'd8: 
				begin
					d0 = 7'b0010010; //2
					d1 = 7'b1111110; //-
					d2 = 7'b0110000; //E
					d3 = 7'b1111001; //I
					 b = 8'b01111111;
				end
			6'd9: 
				begin
					d0 = 7'b0000001; //0
					d1 = 7'b0010010; //2
					d2 = 7'b1111110; //-
					d3 = 7'b0110000; //E
					 b = 8'b01111111;
				end
			6'd10: 
				begin
					d0 = 7'b0010010; //2
					d1 = 7'b0000001; //0
					d2 = 7'b0010010; //2
					d3 = 7'b1111110; //-
					 b = 8'b01111111;
				end
			6'd11:
				begin
					d0 = 7'b0000001; //0
					d1 = 7'b0010010; //2
					d2 = 7'b0000001; //0
					d3 = 7'b0010010; //2
					 b = 8'b00111111;
				end
			6'd12:
				begin
					d0 = 7'b1111110; //-
					d1 = 7'b0000001; //0
					d2 = 7'b0010010; //2
					d3 = 7'b0000001; //0
					 b = 8'b00111111;
				end
			6'd13:
				begin
					d0 = 7'b1001111; //1
					d1 = 7'b1111110; //-
					d2 = 7'b0000001; //0
					d3 = 7'b0010010; //2
					 b = 8'b00111111;
				end
			6'd14:
				begin
					d0 = 7'b0000001; //0
					d1 = 7'b1001111; //1
					d2 = 7'b1111110; //-
					d3 = 7'b0000001; //0
					 b = 8'b00111111;
				end
			6'd15:
				begin
					d0 = 7'b1001100; //4
					d1 = 7'b0000001; //0
					d2 = 7'b1001111; //1
					d3 = 7'b1111110; //-
					 b = 8'b00011111;
				end
			6'd16:
				begin
					d0 = 7'b1001111; //1
					d1 = 7'b1001100; //4
					d2 = 7'b0000001; //0
					d3 = 7'b1001111; //1
					 b = 8'b00011111;
				end
			6'd17:
				begin
					d0 = 7'b0000000; //8
					d1 = 7'b1001111; //1
					d2 = 7'b1001100; //4
					d3 = 7'b0000001; //0
					 b = 8'b00011111;
				end
			6'd18:
				begin
					d0 = 7'b1111110; //-
					d1 = 7'b0000000; //8
					d2 = 7'b1001111; //1
					d3 = 7'b1001100; //4
					 b = 8'b00011111;
				end
			6'd19:
				begin
					d0 = 7'b1111110; //-
					d1 = 7'b1111110; //-
					d2 = 7'b0000000; //8
					d3 = 7'b1001111; //1
					 b = 8'b00011111;
				end
			6'd20:
				begin
					d0 = 7'b1111110; //-
					d1 = 7'b1111110; //-
					d2 = 7'b1111110; //-
					d3 = 7'b0000000; //8
					 b = 8'b00001111;
				end
			6'd21:
				begin
					d0 = 7'b1000011; //J
					d1 = 7'b1111110; //-
					d2 = 7'b1111110; //-
					d3 = 7'b1111110; //-
					 b = 8'b00001111;
				end
				
			6'd22:
				begin
					d0 = 7'b1000001; //U
					d1 = 7'b1000011; //J
					d2 = 7'b1111110; //-
					d3 = 7'b1111110; //-
					 b = 8'b00001111;
				end
				
			6'd23:
				begin
					d0 = 7'b1110001; //L
					d1 = 7'b1000001; //U
					d2 = 7'b1000011; //J
					d3 = 7'b1111110; //-
					 b = 8'b00001111;
				end
			6'd24:
				begin
					d0 = 7'b1111001; //I
					d1 = 7'b1110001; //L
					d2 = 7'b1000001; //U
					d3 = 7'b1000011; //J
					 b = 8'b00001111;
				end
			6'd25:
				begin
					d0 = 7'b1100010; //O
					d1 = 7'b1111001; //I
					d2 = 7'b1110001; //L
					d3 = 7'b1000001; //U
					 b = 8'b00000111;
				end
			6'd26:
				begin
					d0 = 7'b1111110; //-
					d1 = 7'b1100010; //O
					d2 = 7'b1111001; //I
					d3 = 7'b1110001; //L
					 b = 8'b00000111;
				end
			6'd27:
				begin
					d0 = 7'b0010010; //2
					d1 = 7'b1111110; //-
					d2 = 7'b1100010; //O
					d3 = 7'b1111001; //I
					 b = 8'b00000111;
				end	
			6'd28:
				begin
					d0 = 7'b0000001; //0
					d1 = 7'b0010010; //2
					d2 = 7'b1111110; //-
					d3 = 7'b1100010; //O
					 b = 8'b00000111;
				end	
			6'd29:
				begin
					d0 = 7'b1001111; //1
					d1 = 7'b0000001; //0
					d2 = 7'b0010010; //2
					d3 = 7'b1111110; //-
					 b = 8'b00000111;
				end
			6'd30:
				begin
					d0 = 7'b0000000; //8
					d1 = 7'b1001111; //1
					d2 = 7'b0000001; //0
					d3 = 7'b0010010; //2
					 b = 8'b00000111;
				end
			6'd31:
				begin
					d0 = 7'b1111110; //-
					d1 = 7'b0000000; //8
					d2 = 7'b1001111; //1
					d3 = 7'b0000001; //0
					 b = 8'b00000111;
				end	
			6'd32:
				begin
					d0 = 7'b0100000; //6
					d1 = 7'b1111110; //-
					d2 = 7'b0000000; //8
					d3 = 7'b1001111; //1
					 b = 8'b00000111;
				end
			6'd33:
				begin
					d0 = 7'b0001111; //7
					d1 = 7'b0100000; //6
					d2 = 7'b1111110; //-
					d3 = 7'b0000000; //8
					 b = 8'b00000011;
				end
			6'd34:
				begin
					d0 = 7'b0000110; //3
					d1 = 7'b0001111; //7
					d2 = 7'b0100000; //6
					d3 = 7'b1111110; //-
					 b = 8'b00000011;
				end
			6'd35:
				begin
					d0 = 7'b0010010; //2
					d1 = 7'b0000110; //3
					d2 = 7'b0001111; //7
					d3 = 7'b0100000; //6
					 b = 8'b00000001;
				end
			6'd36:
				begin
					d0 = 7'b1111111; //LIMPIO
					d1 = 7'b0010010; //2
					d2 = 7'b0000110; //3
					d3 = 7'b0001111; //7
					 b = 8'b00000001;
				end
			6'd37:
				begin
					d0 = 7'b1111111; //LIMPIO
					d1 = 7'b1111111; //LIMPIO
					d2 = 7'b0010010; //2
					d3 = 7'b0000110; //3
					 b = 8'b00000001;
				end
			6'd38:
				begin
					d0 = 7'b1111111; //LIMPIO
					d1 = 7'b1111111; //LIMPIO
					d2 = 7'b1111111; //LIMPIO
					d3 = 7'b0010010; //2
					 b = 8'b00000001;
				end	
			6'd39:
				begin
					d0 = 7'b1111111; //LIMPIO
					d1 = 7'b1111111; //LIMPIO
					d2 = 7'b1111111; //LIMPIO
					d3 = 7'b1111111; //LIMPIO
					 b = 8'b00000000;
				end				
			default: 
				begin
					d0 = 7'b1111111;
					d1 = 7'b1111111;
					d2 = 7'b1111111;
					d3 = 7'b1111111;
					 b = 8'b00000000;
				end
endcase
end
	
clock_500hz clkdis (.clock_in(clock), .g(g)
    );


reg [2:0] contador;

always @ (posedge g)

	begin
			contador <= contador + 1;
				if (contador == 3'b000)
					begin
						seg <= d0;
						bas <= 3'b110;
					end
				else if (contador == 3'b010)
					begin
						seg <= d1;
						bas <= 3'b101;
					end
				else if (contador == 3'b100)
					begin
						seg <= d2;
						bas <= 3'b011;
					end
			
	end


endmodule


