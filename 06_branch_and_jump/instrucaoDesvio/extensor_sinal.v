module extensor_sinal(a, s);
	input [15:0] a;
	output [31:0] s;
	
	assign s = {{16{a[15]}}, a};
	
endmodule