module processador_tb;

	// ENTRADAS PARA O PROCESSADOR
	reg clock, reset;

	// SAÍDAS DO PROCESSADOR
	wire [31:0] pc, instrucao, ULA, reg1, reg2, imediato_aux, WriteData_aux;
	wire [2:0] op;
	wire zero, ULASrc_aux, MemRead_aux; 
	
	// MemRead = 1 => WriteData = WriteData_aux; MemRead = 0 => WriteData = X
	wire [31:0] WriteData;
	assign WriteData = (MemRead_aux == 1) ? WriteData_aux : 32'bx;
	
	// ULASrc = 1 => immediate_out = immediate; ULASrc = 0 => immediate_out = X
	wire [31:0] imediato;
	assign imediato = (ULASrc_aux == 1) ? imediato_aux : 32'bx;
	
	// INSTANCIACAO DO PROCESSADOR
	processador testbench (
		.clock(clock),
		.reset(reset),
		.pcout_out(pc),
		.instruction_out(instrucao),
		.ULA_result_out(ULA),
		.zero_out(zero),
		.reg1_data_out(reg1),
		.reg2_data_out(reg2),
		.immediate_out(imediato_aux),
		.op_out(op),
		.ULASrc_out(ULASrc),
		.WriteData_out(WriteData_aux),
		.MemRead_out(MemRead)
	);
	
	// GERADOR DE CLOCK
	initial
	begin
		clock = 0;
	end
	
	always
	begin
		#5 clock = ~clock;
	end
	
	// RESET E EXECUCAO
	initial
	begin
		// ativa o reset 
		reset = 1;
		#20;
		
		// libera o reset
		reset = 0;
		#200;
		
		$stop;
	end

endmodule