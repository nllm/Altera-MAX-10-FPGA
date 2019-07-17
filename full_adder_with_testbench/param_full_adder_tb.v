`include "param_full_adder.v"
`timescale 1us/1ns

module param_full_add_tb();

    parameter WIDTH = 3;

    reg [WIDTH-1:0] r_t1 = 0;
    reg [WIDTH-1:0] r_t2 = 0;
    wire w_result;

    param_full_adder #(.WIDTH(WIDTH)) UUT(
        .i_add_term1(r_t1),
        .i_add_term2(r_t2),
        .o_result(w_result)
    );

    initial begin
        r_t1 = 3'b0;
        r_t2 = 3'b0;
        #10

        r_t1 = 3'b001;
        r_t2 = 3'b0;
        #10

        r_t1 = 3'b001;
        r_t2 = 3'b001;
        #10

        r_t1 = 3'b010;
        r_t2 = 3'b000;
        #10

        r_t1 = 3'b000;
        r_t2 = 3'b010;
        #10

        r_t1 = 3'b010;
        r_t2 = 3'b010;
        #10

        r_t1 = 3'b100;
        r_t2 = 3'b100;
        #10

        $display("Test complete");
    end
endmodule 
