module processador_tb; // testbench para testar as duas instrucoes
	reg clock, reset;
	wire [31:0] pcout_out, instruction_out, ULA_result_out, reg1_data_out_tb, reg2_data_out_tb, immediate_out_tb;
	wire [2:0] ULAop_out_tb;
	wire zero_out, overflow_out, ULASrc_out_tb;
	
	// instancia o prcocssador 
	processador teste(
		.clock(clock),
		.reset(reset),
		.pcout_out(pcout_out),
		.instruction_out(instruction_out),
		.ULA_result_out(ULA_result_out),
		.zero_out(zero_out),
		.overflow_out(overflow_out),
		.reg1_data_out(reg1_data_out_tb), 
		.reg2_data_out(reg2_data_out_tb), 
		.immediate_out(immediate_out_tb), 
		.ULAop_out(ULAop_out_tb), 
		.ULASrc_out(ULASrc_out_tb)
	);
	
	// zera o clock
	initial
	begin
		clock = 0;
	end
	
	// seta o ciclo do clock (periodo de 10ns)
	always
	begin
		#5 clock = ~clock;
	end
	
	initial
		begin
			// comeca com reset e espera um ciclo de clock
			reset = 1;
			#10;
			
			// libera o reset e espera mais 5 ciclos de clock para realizar todas as operações
			reset = 0;
			#50;
			
			$stop;
		end
	
endmodule
