//This is an example of a simple State machine

module maquinaedos1(input clk, input btn, output reg led, input reset);
wire rls;

clock_seconds U1(.clk(clk), .led(rls));
localparam STATE_Initial= 3'd0,
			  STATE_1= 3'd1,
			  STATE_2= 3'd2,
			  STATE_3= 3'd3,
			  STATE_4= 3'd4,
			  STATE_5_PlaceHolder = 3'd5,
			  STATE_6_PlaceHolder = 3'd6,
			  STATE_7_PlaceHolder = 3'd7;
reg[2:0] CurrentState;
reg[2:0] NextState;


always@(posedge rls)begin

	if (reset) CurrentState <= STATE_Initial;
	else CurrentState <= NextState;

	end
	//bloque de transicion
	always@(*)begin
	NextState=CurrentState;
	case (CurrentState)
	STATE_Initial:begin
	if(btn==0)begin
	NextState=CurrentState;
	end
	else begin
	NextState=STATE_1;
	end
	end
	STATE_1:begin
	if(btn==1)begin
	NextState=STATE_2;
	end
	else begin
	NextState=STATE_Initial;
	end
	end
	STATE_2:begin
	if(btn==0)begin
	NextState=STATE_Initial;
	end
	else begin
	NextState=STATE_2;
	end
	end
	STATE_3:begin
	NextState=STATE_Initial;
	end
	STATE_4:begin
	NextState=STATE_Initial;
	end
	
	endcase
	
	end
	//bloque de salida
	/*wire output1, output2;
	reg [2:0] status;
	
	assign output1 = (CurrentState== STATE_1) | (CurrentState == STATE_2);
	assign output2 = (CurrentState == STATE_2);*/
	always@(*) begin
	//status =3'b000;
	case(CurrentState)
	STATE_Initial: begin
	led=0;
	end
	STATE_1: begin
	led=1;
	end
	STATE_2: begin
	led=0;
	end
	endcase
	end
	

endmodule

