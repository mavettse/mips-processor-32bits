module somador32bits(a, b, cin, s, cout, overflow);
	input [31:0] a, b;
	input cin;
	output[31:0] s;
	output cout, overflow;
	
	wire [32:0] carry;
	
	assign carry[0] = cin;
	assign cout = carry[32];	
	assign overflow = carry[32] ^ carry[31];	
	
	genvar i;
	generate
		for(i = 0; i < 32; i = i + 1)
		begin : ripple
			//		  somador1bit(a	, b		 , cin	  , s	  , cout);
			somador1bit op_soma(a[i], b[i]^cin, carry[i], s[i], carry[i+1]);
		end
	endgenerate
	
endmodule