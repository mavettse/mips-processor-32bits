module processador(clock, reset, pcout_out, instruction_out, ULA_result_out, zero_out, overflow_out, reg1_data_out,
						 reg2_data_out, immediate_out, op_out, ULASrc_out, WriteData_out, MemRead_out);
	
	input clock, reset;
	output [31:0] pcout_out, instruction_out, ULA_result_out, reg1_data_out, reg2_data_out, immediate_out, WriteData_out;
	output [2:0] op_out;
	output zero_out, overflow_out, ULASrc_out, MemRead_out;
	
	//				---- FIOS INTERNOS ----
	
	// SAÍDA/ENTRADA DO PC
	wire [31:0] pcout;
	
	// SAÍDA DA INSTRUÇÃO
	wire [31:0] instruction;
	
	// SEPARANDO OS BITS DA INSTRUÇÃO COM SEUS RESPECTIVOS NOMES
	wire [5:0] opcode = instruction[31:26];
	wire [4:0] rs = instruction[25:21];
	wire [4:0] rt = instruction[20:16];
	wire [4:0] rd = instruction[15:11];
	wire [15:0] immediate_16bits = instruction[15:0];
	wire [5:0] funct = instruction[5:0];
	
	// SAÍDAS DA UNIDADE DE CONTROLE PRINCIPAL
	wire RegDst, Branch, MemRead, MemtoReg, MemWrite, ULASrc, RegWrite;
	wire [1:0] ULAOp;
	
	// SAÍDA DO MUX DO WRITE REGISTER
	wire [4:0] WriteReg;
	
	// SAÍDAS DO BANCO DE REGISTRADORES
	wire [31:0] A, Data2;
	
	// SAÍDA DO EXTENSOR DE SINAL
	wire [31:0] immediate_32bits;
	
	// SAÍDA DO CONTROLE DA ULA
	wire [2:0] op;
	
	// SAÍDA MUX DO SEGUNDO OPERANDO DA ULA
	wire [31:0] B;
	
	// SAÍDAS DA ULA
	wire [31:0] ULA_result;
	wire zero, overflow;
	
	// SAÍDA DA MEMORIA DE DADOS	
	wire [31:0] ReadData;
	
	// SAIDA MUX DA MEMORIA DE DADOS	
	wire [31:0] WriteData;

	
	//				---- INSTANCIACOES ----
	countPC pc(
		.pcin(pcout), 
		.reset(reset), 
		.CLOCK_50(clock), 
		.pcout(pcout)
	);
	
	memoriaInstrucao memInstr(
		.readAddress(pcout), 
		.instruction(instruction)
	);
	
	unidadeControlePrincipal controlePrincipal(
		.opcode(opcode), 
		.RegDst(RegDst), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemtoReg(MemtoReg), 
		.ULAOp(ULAOp), 
		.MemWrite(MemWrite), 
		.ULASrc(ULASrc), 
		.RegWrite(RegWrite)
	);
	
	mux2por1_5bits muxReg(
		.I0(rt),
		.I1(rd),
		.sel(RegDst),
		.s(WriteReg)
	);
	
	bancoRegistradores bReg(
		.Read1(rs),
		.Read2(rt),
		.WriteReg(WriteReg),
		.WriteData(WriteData),
		.RegWrite(RegWrite),  
		.Data1(A),
		.Data2(Data2),
		.clock(clock),
		.reset(reset)
	);
	
	extensor_sinal extensor(
		.a(immediate_16bits), 
		.s(immediate_32bits)
	);

	unidadeControleULA controleULA(
		.funct(funct), 
		.ULAOp(ULAOp), 
		.op(op)
	);
	
	mux2por1_32bits muxULA(
		.I0(Data2), 
		.I1(immediate_32bits), 
		.sel(ULASrc), 
		.s(B)
	);
	
	ULA32bits ula(
		.a(A), 
		.b(B), 
		.op(op), 
		.zero(zero), 
		.s(ULA_result), 
		.overflow(overflow)
	);
	
	memoriaDados memoria(
		.address(ULA_result[5:0]), 
		.memWrite(MemWrite), 
		.memRead(MemRead), 
		.clock(clock), 
		.writeData(Data2), 
		.readData(ReadData)
		);
	
	mux2por1_32bits muxDataMem(
		.I0(ULA_result), 
		.I1(ReadData), 
		.sel(MemtoReg), 
		.s(WriteData)
	);
		
	// INSERÇÃO DA LÓGICA DO BRANCH DO PC
	
	
	//				---- ATRIBUIÇÕES PARA OS FIOS EXTERNOS ----
	assign pcout_out = pcout;
	assign instruction_out = instruction;
	assign ULA_result_out = ULA_result;
	assign zero_out = zero;
	assign overflow_out = overflow;
	assign reg1_data_out = A; // valor lido do registrador 1 (A)
	assign reg2_data_out = Data2; // valor lido do registrador 2 (Data2)
	assign immediate_out = immediate_32bits; // valor do imediato estendido
	assign op_out = op; // sinal de controle da ULA
	assign ULASrc_out = ULASrc;
	assign WriteData_out = WriteData; // valor que sera gravado no registrador destinoa
	assign MemRead_out = MemRead;
	
endmodule