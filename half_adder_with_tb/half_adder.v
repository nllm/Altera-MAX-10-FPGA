//This program implements a half adder with two switches adn two LEDs

module half_adder

	(input i_switch_a,
	input i_switch_b,
	output o_sum, 
	output o_carry);
	
	assign o_sum = i_switch_a ^ i_switch_b;
	assign o_carry = i_switch_a & i_switch_b;


endmodule
