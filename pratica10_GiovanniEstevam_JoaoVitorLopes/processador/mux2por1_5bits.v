module mux2por1_5bits(I0, I1, sel, s);
	input [4:0] I0, I1;
	input sel;
	output [4:0] s;
	
	assign s = (~{5{sel}} & I0) | ({5{sel}} & I1);
	
endmodule