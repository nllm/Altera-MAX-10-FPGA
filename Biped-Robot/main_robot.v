//This program controls the movement of a biped robot using servos

module main_robot (input clk, input reset, input btn, output reg led, output reg led1, output reg led2, output reg led3, output reg led4
, output reg senal,output reg senal1, output reg senal2,output reg senal3, output reg senal4,output reg senal5, output reg senal6);
reg [6:0] contador;
reg [6:0] contador1;
reg [6:0] contador2;
reg [6:0] contador3;
reg [6:0] contador4;
reg [6:0] contador5;
reg [6:0] duty;
reg [6:0] duty1;
reg [6:0] duty2;
reg [6:0] duty3;
reg [6:0] duty4;
reg [6:0] duty5;
reg [3:0] mov;
reg [3:0] cont;
wire rls;
wire clock100hz;

clock100hz U1(.clk(clk),.senal(reloj100hz));
clock_seconds U2(.clk(clk), .led(rls));

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

always@(posedge rls)begin
	if(cont==4'd1)begin
	
	led4 = 1;
	cont=0;
	mov=mov+1;
	end
	else begin
	led4 = 0;
	end 
	if(mov==4'd4)begin
	mov=4'd0;
	end
	
	cont=cont+1;
	
	case(mov)
	4'd0: begin
	led = 1;
	led1 = 0;
	led3 = 0;
	led2 = 0;
	duty = 6'd7;//pie i  x>7  hacia afuera ya quedo
	duty1 = 6'd7;//rodilla x>7 atras
	duty2 = 6'd8;//ingles x>7 enfrente
	duty3 = 6'd7;//pie d
	duty4 = 6'd7;//rodillas
	duty5 = 6'd6;//ingles
	end
	4'd1: begin

	led = 0;
	led1 = 1;
	led3 = 0;
	led2 = 0;
	duty = 6'd7;//pie i  x>7  hacia afuera ya quedo
	duty1 = 6'd8;//rodilla x>7 atras
	duty2 = 6'd9;//ingles x>7 enfrente
	duty3 = 6'd7;//pie d
	duty4 = 6'd8;//rodillas
	duty5 = 6'd7;//ingles
	end
	4'd2: begin

	led = 0;
	led1 = 0;
	led3 = 0;
	led2 = 1;
	duty = 6'd7;//pie i  x>7  hacia afuera ya quedo
	duty1 = 6'd8;//rodilla x>7 atras
	duty2 = 6'd8;//ingles x>7 enfrente
	duty3 = 6'd7;//pie d
	duty4 = 6'd7;//rodillas
	duty5 = 6'd6;//ingles
	end
	4'd3: begin
	
	led = 0;
	led1 = 0;
	led3 = 1;
	led2 = 0;
	duty = 6'd7;//pie i  x>7  hacia afuera ya quedo
	duty1 = 6'd6;//rodilla x>7 atras
	duty2 = 6'd8;//ingles x>7 enfrente
	duty3 = 6'd7;//pie d
	duty4 = 6'd6;//rodillas
	duty5 = 6'd5;//ingles*/
	end

	endcase
end
	
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

always @ (posedge reloj100hz)
begin
	
	if (contador1<duty1)
	begin
		senal1 = 1'b1;
	end
	else
	begin
	senal1 = 1'b0;
	end
	contador1=contador1+1;
	if (contador1 ==7'd100)
	begin
		contador1 = 0;
	end
end

always @ (posedge reloj100hz)
begin
	
	if (contador2<duty2)
	begin
		senal2 = 1'b1;
	end
	else
	begin
	senal2 = 1'b0;
	end
	contador2=contador2+1;
	if (contador2 ==7'd100)
	begin
		contador2 = 0;
	end
end

always @ (posedge reloj100hz)
begin
	
	if (contador3<duty3)
	begin
		senal3 = 1'b1;
	end
	else
	begin
	senal3 = 1'b0;
	end
	contador3=contador3+1;
	if (contador3 ==7'd100)
	begin
		contador3 = 0;
	end
end

always @ (posedge reloj100hz)
begin
	
	if (contador4<duty4)
	begin
		senal4 = 1'b1;
	end
	else
	begin
	senal4 = 1'b0;
	end
	contador4=contador4+1;
	if (contador4 ==7'd100)
	begin
		contador4 = 0;
	end
end

always @ (posedge reloj100hz)
begin
	
	if (contador5<duty5)
	begin
		senal5 = 1'b1;
	end
	else
	begin
	senal5 = 1'b0;
	end
	contador5=contador5+1;
	if (contador5 ==7'd100)
	begin
		contador5 = 0;
	end
end
	endmodule


	
