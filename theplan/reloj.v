`timescale 1ns / 1ps

module reloj_displays (input clock_in, output reg clock_out);

reg [31:0]  counter = 32'd0;
parameter DIVISOR = 32'd40000000;
always @(posedge clock_in)
begin
counter <= counter + 32'd1;
if (counter >=(DIVISOR-1))
counter <= 32'd0;
clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;

end

endmodule

/*module reloj_displays(input clk,pausa,on, output reg ou);

reg [27:0]z=28'd0;
parameter w=28'd20000000;

always@(posedge clk)
if (pausa == 0 && on == 0)
begin
z<=z+28'd1;
if(z>=(w-1))
z<=28'd0;
ou<=(z<w/2)?1'b1:1'b0;
end
endmodule */