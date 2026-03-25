module display_sinal(bit_sinal, seg);
	input bit_sinal;
	output [6:0] seg;

	assign seg = {~bit_sinal, 6'b111111};
	
endmodule