//This program creates a clock counter for 1 second

module clock_seconds (input clk, output reg led);
reg[24:0] contador;

always @(posedge clk)
	begin
		if(contador == 25'd24999999 )
		
			begin
				contador=0;
				led = ~led;
			end
		contador=contador+1;
	end

endmodule 
