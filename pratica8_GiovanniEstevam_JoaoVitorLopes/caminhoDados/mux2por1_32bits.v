module mux2por1_32bits(I0, I1, sel, s);
	input [31:0] I0, I1;
	input sel;
	output [31:0] s;
	
	assign s = (~{32{sel}} & I0) | ({32{sel}} & I1);
	
endmodule