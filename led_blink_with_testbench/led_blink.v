//Program that lets the user select the Blink frequency of a LED, between 1, 10, 50 and 100 Hz, it also includes an enable switch

module led_blink(input clk, input enable,input switch1, input switch2, output led);

parameter  c_1hz_value = 25'd25000000;
parameter c_10hz_value = 22'd2500000;
parameter c_50hz_value = 19'd500000;
parameter c_100hz_value = 18'd250000;

reg[24:0] c_1hz;
reg[21:0] c_10hz;
reg[18:0] c_50hz;
reg[18:0] c_100hz;

reg led_temp1 = 1'b0;
reg led_temp2 = 1'b0;
reg led_temp3 = 1'b0;
reg led_temp4 = 1'b0;

reg r_led_selector;



always@(posedge clk)
	begin
	
		if(c_1hz == (c_1hz_value - 1))
			begin
			
			c_1hz <= 0;
			led_temp1 <= ~led_temp1; 
			
			end
		else
			c_1hz <= c_1hz + 1;
	
	end


always@(posedge clk)
	begin
	
		if(c_10hz == (c_10hz_value - 1))
			begin
			
			c_10hz <= 0;
			led_temp2 <= ~led_temp2; 
			
			end
		else
			c_10hz <= c_10hz + 1;
	end


always@(posedge clk)
	begin
	
		if(c_50hz == (c_50hz_value - 1))
			begin
			
			c_50hz <= 0;
			led_temp3 <= ~led_temp3; 
			
			end
		else
			c_50hz <= c_50hz + 1;
	
	end


always@(posedge clk)
	begin
	
		if(c_100hz == (c_100hz_value - 1))
			begin
			
			c_100hz <= 0;
			led_temp4 <= ~led_temp4; 
			
			end
	else
		c_100hz <= c_100hz + 1;
	
	end


always@(*)
	begin
	
		case({switch1,switch2})
	
			2'b00: r_led_selector <= led_temp1;
		 
			2'b01: r_led_selector <= led_temp2;
			
			2'b10: r_led_selector <= led_temp3;
			
			2'b11: r_led_selector <= led_temp4;

			default:r_led_selector <= r_led_selector;
			
		endcase
	
	end
	
	assign led = r_led_selector & enable;
		
endmodule
	
