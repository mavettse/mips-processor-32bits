module processador_tb;

	// ENTRADAS PARA O PROCESSADOR
	reg clock, reset;

	// SAÍDAS DO PROCESSADOR
	wire [31:0] pcout_out, instruction_out, ULA_result_out, reg1_data_out, reg2_data_out, immediate, WriteData;
	wire [2:0] op_out;
	wire zero_out, overflow_out, ULASrc_out, MemRead_out; 
	
	// MemRead = 1 => WriteData_out = WriteData; MemRead = 0 => WriteData_out = X
	wire [31:0] WriteData_out;
	assign WriteData_out = (MemRead_out == 1) ? WriteData : 32'bx;
	
	// ULASrc = 1 => immediate_out = immediate; ULASrc = 0 => immediate_out = X
	wire [31:0] immediate_out;
	assign immediate_out = (ULASrc_out == 1) ? immediate : 32'bx;
	
	// INSTANCIACAO DO PROCESSADOR
	processador testbench (
		.clock(clock),
		.reset(reset),
		.pcout_out(pcout_out),
		.instruction_out(instruction_out),
		.ULA_result_out(ULA_result_out),
		.zero_out(zero_out),
		.overflow_out(overflow_out),
		.reg1_data_out(reg1_data_out),
		.reg2_data_out(reg2_data_out),
		.immediate_out(immediate),
		.op_out(op_out),
		.ULASrc_out(ULASrc_out),
		.WriteData_out(WriteData),
		.MemRead_out(MemRead_out)
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
		#100;
		
		$stop;
	end

endmodule