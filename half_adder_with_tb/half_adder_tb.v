`include "half_adder.v"
`timescale 1us/1ns

module half_adder_tb ();

    reg r_switch_0 = 1'b0;
    reg r_switch_1 = 1'b0;

    wire w_sum_led;
    wire w_carry_led;

    half_adder UUT(
        .i_switch_a(r_switch_0),
        .i_switch_b(r_switch_1),
        .o_carry(w_carry_led),
        .o_sum(w_sum_led)
    );

    initial begin
        
        r_switch_0 <= 1'b0;
        r_switch_1 <= 1'b0;
        #10

        r_switch_0 <= 1'b1;
        r_switch_1 <= 1'b0;
        #10

        r_switch_0 <= 1'b0;
        r_switch_1 <= 1'b1;
        #10

        r_switch_0 <= 1'b1;
        r_switch_1 <= 1'b1;
        #10

        $display("Test complete");

    end


endmodule
