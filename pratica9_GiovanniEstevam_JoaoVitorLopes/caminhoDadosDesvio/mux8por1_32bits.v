module mux8por1_32bits(res_and, res_or, res_soma, res_slt, ULAop, s);
	input [31:0] res_and, res_or, res_soma, res_slt;
	input [2:0] ULAop;
	output[31:0] s;
	
	// I0 = and; I1 = or; I2 = add; I6 = subtract; I7 = slt
								
	genvar i;
	generate
		for(i = 0; i < 32; i = i + 1)
		begin : ripple
			// mux8por1_1bit(			 I0, 			I1, 			 I2, 	 I3, 	 I4, 	 I5, 			  I6,			  I7,	  sel, s)
			mux8por1_1bit op(res_and[i], res_or[i], res_soma[i], 1'b0, 1'b0, 1'b0, res_soma[i], res_slt[i], ULAop, s[i]);
		end
	endgenerate
	
endmodule 	