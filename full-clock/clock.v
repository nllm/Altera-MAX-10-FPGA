//This program controls the clock of the program, it counts each second

module clock (input clk, output reg led);
reg[24:0] contador;

always @(posedge clk)
	begin
		if(contador == 25'd24999 )
			begin
				contador=0;
				led = ~led;
			end
		contador=contador+1;
	end

endmodule 
