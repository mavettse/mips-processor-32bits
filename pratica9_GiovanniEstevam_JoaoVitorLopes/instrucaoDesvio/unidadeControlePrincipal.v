module unidadeControlePrincipal(opcode, RegDst, Branch, MemRead, MemtoReg, ULAOp, MemWrite, ULASrc, RegWrite, Jump);
	input [5:0] opcode;
	output RegDst, Branch, MemRead, MemtoReg, MemWrite, ULASrc, RegWrite, Jump;
	output [1:0] ULAOp; 
	
	wire rFormat, lw, sw, beq, addi;
	
	assign rFormat = ~opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];	
	assign lw = opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & opcode[0];
	assign sw = opcode[5] & ~opcode[4] & opcode[3] & ~opcode[2] & opcode[1] & opcode[0];
	assign beq = ~opcode[5] & ~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0];
	assign addi = ~opcode[5] & ~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];	
	assign Jump = 	~opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & ~opcode[0];
	
	assign RegDst = rFormat;
	assign Branch = beq; 
	assign MemRead = lw;
	assign MemtoReg = lw;
	assign MemWrite = sw;
	assign ULASrc = lw | sw | addi;
	assign RegWrite = rFormat | lw | addi;
	assign ULAOp[0] = beq;
	assign ULAOp[1] = rFormat;
	
endmodule