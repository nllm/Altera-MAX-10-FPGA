//This program uses 2 seven-segment displays to show a 59 seconds counter

module seconds_counter(input clk, output [6:0] D1, output [6:0] D2);
wire r1s;
wire nled;
reg led;
reg[2:0] contador;

clock_seconds U1(.clk(clk), .led(r1s));
simple_counter U2(.a(r1s),.Display(D1));
simple_counter U3(.a(led),.Display(D2));
assign nled = ~led;


always @(posedge r1s)
	begin
		if(contador == 3'd4 )
			begin
				contador=0;
				led = ~led;
			end
		contador=contador+1;
	end
endmodule 
