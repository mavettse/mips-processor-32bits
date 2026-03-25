module unidadeControleULA(funct, ULAOp, op);
	input [1:0] ULAOp;
	input [5:0] funct; 
	output [2:0] op;
	
	assign op[0] = (ULAOp[1] & (funct[0] | funct[3]));
	assign op[1] = (~ULAOp[1] | ~funct[2]);
	assign op[2] = (ULAOp[0] | (ULAOp[1] & funct[1]));

endmodule