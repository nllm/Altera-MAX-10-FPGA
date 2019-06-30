//This program lets the units at the end of the clock adjust to start over

module tens_end (input a, output reg [6:0] Display, output reg c);
reg [3:0] conta;

always @(negedge a)
begin
	conta=conta+1;
	if (conta>2)
	begin
		conta=0;
		c=~c;
	end
	case (conta)
	4'b0000:
	begin
		Display=7'b1000000;
	end
	4'b0001:
	begin
		Display=7'b1111001;
		c=~c;
	end
	4'b0010:
	begin
		Display=7'b0100100;
	end
	endcase
	
end
endmodule
