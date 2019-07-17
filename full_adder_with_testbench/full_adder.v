//This program represents a full adder, with 2 inputs, a carry-in input, and carry-out and a sum output

module full_adder(
    input i_switch_a,
    input i_switch_b,
    input i_cin,
    output o_cout,
    output o_sum
);

wire w_op1;
wire w_op2;
wire w_op3;

assign w_op1 = i_switch_a ^ i_switch_b;
assign w_op2 = w_op1 & i_cin;
assign w_op3 = i_switch_a & i_switch_b;

assign o_cout = w_op2 | w_op3 ;

assign o_sum = w_op1 ^ i_cin ;


endmodule
