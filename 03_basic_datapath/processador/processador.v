module processador(clock, reset, pcout_out, instruction_out, ULA_result_out, zero_out, overflow_out, reg1_data_out, reg2_data_out, immediate_out, ULAop_out, ULASrc_out);
	input clock, reset;
	output [31:0] pcout_out, instruction_out, ULA_result_out, reg1_data_out, reg2_data_out, immediate_out;
	output [2:0] ULAop_out;
	output zero_out, overflow_out, ULASrc_out;
	
	// FIOS INTERNOS
	wire RegWrite, overflow, zero, ULASrc, RegDest;
	wire [31:0] instruction, a, b, s, sinal_estendido, b_operando, pcout;
	wire [4:0] WriteReg;
	wire [5:0] opcode;
	wire [2:0] ULAop;
		
	// LOGICA DE CONTROLE FORCADA
	assign opcode = instruction[31:26];
	assign ULASrc = (opcode == 6'b001000); // 1 se for addi, 0 se for add
	assign RegWrite = 1; // como as duas instrucoes inseridas escrevem no registrador, fica sempre 1
	assign RegDest = (opcode == 6'b000000); // 1 se for add, 0 se for addi
	assign ULAop = 3'b010; // como as duas instrucoes sao soma, ULAop é sempre 010
	
	// INSTANCIACOES 
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
	
	mux2por1_5bits muxReg(
		.I0(instruction[20:16]),
		.I1(instruction[15:11]),
		.sel(RegDest),
		.s(WriteReg)
	);
	
	bancoRegistradores bReg(
		.Read1(instruction[25:21]),
		.Read2(instruction[20:16]),
		.WriteReg(WriteReg),
		.WriteData(s),
		.RegWrite(RegWrite),  
		.Data1(a),
		.Data2(b),
		.clock(clock),
		.reset(reset)
	);
	
	extensor_sinal extensor(
	.a(instruction[15:0]), 
	.s(sinal_estendido)
	);
	
	mux2por1_32bits muxULA(
		.I0(b), 
		.I1(sinal_estendido), 
		.sel(ULASrc), 
		.s(b_operando)
	);
	
	ULA32bits ula(
		.a(a), 
		.b(b_operando), 
		.ULAop(ULAop), 
		.zero(zero), 
		.s(s), 
		.overflow(overflow)
	);
	
	// ATRIBUICOES PARA A SAIDA DO MODULEO
	assign pcout_out = pcout;
	assign instruction_out = instruction;
	assign ULA_result_out = s;
	assign zero_out = zero;
	assign overflow_out = overflow;
	
	assign reg1_data_out = a; // valor lido do registrador 1 (Data1)
	assign reg2_data_out = b; // valor lido do registrador 2 (Data2)
	assign immediate_out = sinal_estendido; // valor do imediato estendido
	assign ULAop_out = ULAop; // sinal de controle da ULA
	assign ULASrc_out = ULASrc; // sinal de controle do Mux da ULA
	
endmodule