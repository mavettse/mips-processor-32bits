module somador6bits(b, cin, s);
	input [5:0] b;
	input cin;
	output [5:0] s;
	
	// o somador sera usado somente para pegar o módulo de um número
	wire [6:0] carry;
	
	assign carry[0] = cin;
	
	genvar i;
	generate
		for(i = 0; i < 6; i = i + 1)
		begin : ripple
			//		  somador1bit(a	, b		 , cin	  , s	  , cout);
			somador1bit inverte(1'b0, b[i]^cin, carry[i], s[i], carry[i+1]);
		end
	endgenerate
	
endmodule