module processador_tb;

	// ENTRADAS PARA O PROCESSADOR
	reg clock, reset;

	// SAÍDAS DO PROCESSADOR
	wire [31:0] pcout_out, instruction_out, ULA_result_out, reg1_data_out, reg2_data_out, immediate_out;
	wire [2:0] op_out;
	wire zero_out, overflow_out, ULASrc_out;
	
	// INSTANCIACAO DO PROCESSADOR
	processador uut (
		.clock(clock),
		.reset(reset),
		.pcout_out(pcout_out),
		.instruction_out(instruction_out),
		.ULA_result_out(ULA_result_out),
		.zero_out(zero_out),
		.overflow_out(overflow_out),
		.reg1_data_out(reg1_data_out),
		.reg2_data_out(reg2_data_out),
		.immediate_out(immediate_out),
		.op_out(op_out),
		.ULASrc_out(ULASrc_out)
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
		#30;
		
		// libera o reset
		reset = 0;
		#100;
		
		$stop;
	end

endmodule