//This program is a Parameterizable Full Adder

module param_full_adder
    #(parameter WIDTH = 5)(
    input [WIDTH-1:0] i_add_term1,
    input [WIDTH-1:0] i_add_term2,
    output [WIDTH:0] o_result
);

    wire [WIDTH:0] w_carry;
    wire [WIDTH-1:0] w_sum;

    assign w_carry[0] = 1'b0;

    genvar ii;
    generate
        for (ii=0; ii < WIDTH; ii=ii+1) 
        begin : generate_block_identifier
            full_adder full_adder_inst(
                .i_switch_a(i_add_term1[ii]),
                .i_switch_b(i_add_term2[ii]),
                .i_cin(w_carry[ii]),
                .o_cout(w_carry[ii+1]),
                .o_sum(w_sum[ii])
            );
        end
    endgenerate

    assign o_result = {w_carry[WIDTH], w_sum};

endmodule
