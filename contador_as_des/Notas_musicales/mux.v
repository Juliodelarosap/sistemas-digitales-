`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:39:18 03/10/2023 
// Design Name: 
// Module Name:    mux 
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
module mux(

output [7:0] sel, output reg nota, output [13:0] h, input clk, activado
    );


Contador_notas contador_notas (.clk(clk), .activado(activado), .out(sel));



doo  (.clock_in(clk), .clock_out(h[0]));
do_grande  (.clock_in(clk), .clock_out(h[1]));
do_sos  (.clock_in(clk), .clock_out(h[2]));
fa_sos  (.clock_in(clk), .clock_out(h[3]));
la  (.clock_in(clk), .clock_out(h[4]));
la_sos  (.clock_in(clk), .clock_out(h[5]));
mi  (.clock_in(clk), .clock_out(h[6]));
mi_grande  (.clock_in(clk), .clock_out(h[7]));
re  (.clock_in(clk), .clock_out(h[8]));
re_sos  (.clock_in(clk), .clock_out(h[9]));
re_sos_grande  (.clock_in(clk), .clock_out(h[10]));
si  (.clock_in(clk), .clock_out(h[11]));
sol  (.clock_in(clk), .clock_out(h[12]));
silencio  (.clock_in(clk), .clock_out(h[13]));

always @ (*)

begin
case (sel)

			8'd0:
				begin
					nota = h[6];  //mi*8
				end
				
			8'd1:
				begin
					nota = h[6];  
				end
				
			8'd2:
				begin
					nota = h[6];  
				end
				
			8'd3:
				begin
					nota = h[6];  
				end
				
			8'd4:
				begin
					nota = h[6];  
				end
				
			8'd5:
				begin
					nota = h[6];  
				end
				
			8'd6:
				begin
					nota = h[6];  
				end
				
			8'd7:
				begin
					nota = h[13];  //silencio
				end
				
			8'd8:
				begin
					nota = h[2]; //do#  
				end
				
			8'd9:
				begin
					nota = h[8];  //re
				end
				
			8'd10:
				begin
					nota = h[9];  //re#
				end

			8'd11:
				begin
					nota = h[6];  //mi*8
				end
			8'd12:
			
				begin
					nota = h[6];  
				end
				
			8'd13:
				begin
					nota = h[6];  
				end
				
			8'd14:
				begin
					nota = h[6];  
				end
				
			8'd15:
				begin
					nota = h[6];  
				end
				
			8'd16:
				begin
					nota = h[6];  
				end
				
			8'd17:
				begin
					nota = h[6];  
				end
				
			8'd18:
				begin
					nota = h[13]; 	//silencio 				
				end
				
			8'd19:
				begin
					nota = h[9];  //re#
				end
				
			8'd20:
				begin
					nota = h[6];  //mi
				end
				
			8'd21:
				begin
					nota = h[13];  //silencio
				end
				
			8'd22:
				begin
					nota = h[3]; //fa#				
				end
				
			8'd23:
				begin
					nota = h[12];//sol 					
				end
	
			8'd24:
				begin
					nota = h[13];//silencio 					
				end
				
			8'd25:
				begin
					nota = h[9];  //re#
				end
				
			8'd26:
				begin
					nota = h[6];  //mi
				end
								

			8'd27:
				begin
					nota = h[3]; //fa#				
				end
				
			8'd28:
				begin
					nota = h[12];//sol 					
				end
				
			8'd29:
				begin
					nota = h[1];//do_grande 					
				end

			8'd30:
				begin
					nota = h[11];//si					
				end

			8'd31:
				begin
					nota = h[3];//fa# 					
				end
				
			8'd32:
				begin
					nota = h[12];//sol 					
				end

			8'd33:
				begin
					nota = h[5];//la#	*4				
				end

			8'd34:
				begin
					nota = h[5];				
				end

			8'd35:
				begin
					nota = h[5];				
				end

			8'd36:
				begin
					nota = h[5];				
				end

			8'd37:
				begin
					nota = h[13];//silencio					
				end

			8'd38:
				begin
					nota = h[4];//la					
				end
			
			8'd39:
				begin
					nota = h[12];//sol					
				end

			8'd40:
				begin
					nota = h[6];//mi					
				end
				
			8'd41:
				begin
					nota = h[8];//re					
				end
				
			8'd42:
				begin
					nota = h[6];//mi *4					
				end

			8'd43:
				begin
					nota = h[6];					
				end
				
			8'd44:
				begin
					nota = h[6];					
				end
				
			8'd45:
				begin
					nota = h[6];					
				end
				
			8'd46:
				begin
					nota = h[13];//silencio 					
				end
				
			8'd47:
				begin
					nota = h[9];//re#					
				end				

			8'd48:
				begin
					nota = h[6];//mi					
				end
				
			8'd49:
				begin
					nota = h[13];//silencio					
				end
					
			8'd50:
				begin
					nota = h[3];//fa#					
				end
				
			8'd51:
				begin
					nota = h[12];//sol					
				end

			8'd52:
				begin
					nota = h[13];//silencio					
				end

			8'd53:
				begin
					nota = h[9];//re#					
				end				

			8'd54:
				begin
					nota = h[6];//mi					
				end	

			8'd55:
				begin
					nota = h[3];//fa#					
				end

			8'd56:
				begin
					nota = h[12];//sol					
				end


			8'd57:
				begin
					nota = h[4];//la					
				end

			8'd58:
				begin
					nota = h[11];//si					
				end

			8'd59:
				begin
					nota = h[12];//sol					
				end

			8'd60:
				begin
					nota = h[11];//si					
				end

			8'd61:
				begin
					nota = h[7];//mi_grande					
				end

			8'd62:
				begin
					nota = h[10];//re_sos_grande	*8			
				end


			8'd63:
				begin
					nota = h[10];					
				end


			8'd64:
				begin
					nota = h[10];					
				end
				

			8'd65:
				begin
					nota = h[10];					
				end


			8'd66:
				begin
					nota = h[10];					
				end
				

			8'd67:
				begin
					nota = h[10];					
				end


			8'd68:
				begin
					nota = h[10];					
				end


			8'd69:
				begin
					nota = h[10];					
				end


			8'd70:
				begin
					nota = h[13];//silencio 					
				end				
				
			8'd71:
				begin
					nota = h[9];  //re#
				end
				
			8'd72:
				begin
					nota = h[6];  //mi
				end
				
			8'd73:
				begin
					nota = h[13];  //silencio
				end
				
			8'd74:
				begin
					nota = h[3]; //fa#				
				end
				
			8'd75:
				begin
					nota = h[12];//sol 					
				end
	
			8'd76:
				begin
					nota = h[13];//silencio 					
				end
				
			8'd77:
				begin
					nota = h[9];  //re#
				end
				
			8'd78:
				begin
					nota = h[6];  //mi
				end
								

			8'd79:
				begin
					nota = h[3]; //fa#				
				end
				
			8'd80:
				begin
					nota = h[12];//sol 					
				end
				
			8'd81:
				begin
					nota = h[1];//do_grande 					
				end

			8'd82:
				begin
					nota = h[11];//si					
				end

			8'd83:
				begin
					nota = h[3];//fa# 					
				end
				
			8'd84:
				begin
					nota = h[12];//sol 					
				end

			8'd85:
				begin
					nota = h[5];//la#	*4				
				end

			8'd86:
				begin
					nota = h[5];				
				end

			8'd87:
				begin
					nota = h[5];				
				end

			8'd88:
				begin
					nota = h[5];				
				end

			8'd89:
				begin
					nota = h[13];//silencio					
				end

			8'd90:
				begin
					nota = h[4];//la					
				end
			
			8'd91:
				begin
					nota = h[12];//sol					
				end

			8'd92:
				begin
					nota = h[6];//mi					
				end
				
			8'd93:
				begin
					nota = h[8];//re					
				end
				
			8'd94:
				begin
					nota = h[6];//mi *4					
				end

			8'd95:
				begin
					nota = h[6];					
				end
				
			8'd96:
				begin
					nota = h[6];					
				end
				
			8'd97:
				begin
					nota = h[6];					
				end
								
			8'd98:
				begin
					nota = h[13];//silencio					
				end

			8'd99:
				begin
					nota = h[7];//mi_grande * 2					
				end

			8'd100:
				begin
					nota = h[7];					
				end
				
			8'd101:
				begin
					nota = h[10];//re_grande_sos					
				end
												
			8'd102:
				begin
					nota = h[11];//si					
				end
						
			8'd103:
				begin
					nota = h[4];//la					
				end

			8'd104:
				begin
					nota = h[12];//sol					
				end
												
			8'd105:
				begin
					nota = h[6];//mi					
				end

			8'd106:
				begin
					nota = h[11];//si					
				end

			8'd107:
				begin
					nota = h[4];//la *2					
				end

			8'd108:
				begin
					nota = h[4];					
				end
					

			8'd109:
				begin
					nota = h[11];//si					
				end

			8'd110:
				begin
					nota = h[4];//la *2					
				end

			8'd111:
				begin
					nota = h[4];					
				end
						

			8'd112:
				begin
					nota = h[11];//si					
				end

			8'd113:
				begin
					nota = h[4];//la *2					
				end

			8'd114:
				begin
					nota = h[4];					
				end
					

			8'd115:
				begin
					nota = h[11];//si					
				end

			8'd116:
				begin
					nota = h[4];//la *2					
				end

			8'd117:
				begin
					nota = h[4];					
				end
					

			8'd118:
				begin
					nota = h[12];//sol					
				end

			8'd119:
				begin
					nota = h[6];//mi					
				end
	
			8'd120:
				begin
					nota = h[8];//re					
				end

			8'd121:
				begin
					nota = h[6];//mi					
				end

			8'd122:
				begin
					nota = h[13];//silencio 					
				end

			8'd123:
				begin
					nota = h[6];//mi *4					
				end

			8'd124:
				begin
					nota = h[6];					
				end

			8'd125:
				begin
					nota = h[6];				
				end

			8'd126:
				begin
					nota = h[6];					
				end
				
			8'd127:
				begin
					nota = h[13];//silencio					
				end
			8'd128:
				begin
					nota = h[12];//sol					
				end

			8'd129:
				begin
					nota = h[6];//mi					
				end
	
			8'd130:
				begin
					nota = h[8];//re					
				end

			8'd131:
				begin
					nota = h[6];//mi					
				end

			8'd132:
				begin
					nota = h[13];//silencio 					
				end

			8'd133:
				begin
					nota = h[6];//mi *4					
				end

			8'd134:
				begin
					nota = h[6];					
				end

			8'd135:
				begin
					nota = h[6];				
				end

			8'd136:
				begin
					nota = h[6];					
				end
				
			8'd137:
				begin
					nota = h[13];//silencio					
				end

			8'd138:
				begin
					nota = h[12];//sol					
				end

			8'd139:
				begin
					nota = h[6];//mi					
				end
	
			8'd140:
				begin
					nota = h[8];//re					
				end

			8'd141:
				begin
					nota = h[6];//mi					
				end

			8'd142:
				begin
					nota = h[13];//silencio 					
				end

			8'd143:
				begin
					nota = h[6];//mi *4					
				end

			8'd144:
				begin
					nota = h[6];					
				end

			8'd145:
				begin
					nota = h[6];				
				end

			8'd146:
				begin
					nota = h[6];					
				end
				
			8'd147:
				begin
					nota = h[13];//silencio					
				end

endcase 
end
endmodule
