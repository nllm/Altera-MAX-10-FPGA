//This program lets the user control a Servo with the use of switches

module pwm_generator (input clk, input [3:0] duty, output reg senal);
reg [6:0] contador;
wire reloj100hz;

100hz_clock U1(.clk(clk),.senal(reloj100hz));

always @ (posedge reloj100hz)
begin
	if (contador<duty)
	begin
		senal = 1'b1;
	end
	else
	begin
	senal = 1'b0;
	end
	contador=contador+1;
	if (contador ==7'd100)
	begin
		contador = 0;
	end
end

endmodule 
