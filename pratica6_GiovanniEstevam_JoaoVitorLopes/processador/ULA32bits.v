module ULA32bits(a, b, ULAop, zero, s, overflow);
	input [31:0] a, b;
	input [2:0] ULAop;
	output [31:0] s;
	output overflow, zero;
	
	wire [31:0] res_and, res_or, res_soma, res_slt;
	wire cout;
	
	// and32bits(a, b, s);
	and32bits op_and(a, b, res_and);
	
	// or32bits(a, b, s);
	or32bits op_or(a, b, res_or);
	
	//		somador32bits	(a, b, cin, 	  		soma, cout, overflow);
	somador32bits op_soma(a, b, ULAop[2], res_soma, cout, overflow);
	
	assign res_slt = {31'b0, overflow ^ res_soma[31]};
	
	// mux8por1_32bits(res_and, res_or, res_soma, res_slt, ULAop, s);
	mux8por1_32bits op(res_and, res_or, res_soma, res_slt, ULAop, s);
	
	assign zero = ~|s;
	
endmodule