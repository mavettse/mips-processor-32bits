module mux2por1(I0, I1, sel, s);
	input I0, I1, sel;
	output s;
	
	assign s = (~sel & I0) | (sel & I1);
	
endmodule