module full_clock(input clk, output [6:0] D1, output [6:0] D2, output [6:0] D3, output [6:0] D4, output [6:0] D5, output [6:0] D6);
wire r1s;
wire ru1;
wire rd1;
wire ru2;
wire rd2;
wire ru3;
wire rd3;
clock U1(.clk(clk), .led(r1s));
units U2(.a(r1s), .Display(D1), .b(ru1));
tens U3(.a(ru1), .Display(D2),.c(rd1));
units U4(.a(rd1), .Display(D3), .b(ru2));
tens U5(.a(ru2), .Display(D4),.c(rd2));
units_end U6(.a(rd2), .Display(D5), .b(ru3));
tens_end U7(.a(ru3), .Display(D6),.c(rd3));

endmodule 
