module or32bits(a, b, s);
	input[31:0] a, b;
	output[31:0] s;

	genvar i;
	generate
		for(i = 0; i < 32; i = i + 1)
		begin : ripple
			or1bit op_or(a[i], b[i], s[i]);
		end
	endgenerate
	
endmodule