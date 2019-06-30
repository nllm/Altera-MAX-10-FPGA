// 100 Hz Clock to generate PWM

module reloj100hz(input clk, output senal);	//es de 50 hz
reg [19:0] conta;
reg tempo; //evita que la variable serial sea registro

assign senal=tempo;

always @(posedge clk)
begin
	conta=conta+1;
	if (conta == 20'd5000)
	begin
		conta=0;
		tempo = ~tempo;
		
	end
end
endmodule
