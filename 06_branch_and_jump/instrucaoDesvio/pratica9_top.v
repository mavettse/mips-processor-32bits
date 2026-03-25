/*		
				---- INPUT ----
			reset				-> SW[17] 
			
				---- OUTPUTS ----
			clock				-> LEDR[0]
			reset				-> LEDR[1]
			zero				-> LEDR[2]
			
			pc					-> HEX7
			operacao			-> HEX6
				A: add, E: and, o: or, S: slt, b: sub
				
			reg1				-> HEX5
			reg2 ou imed	-> HEX4
			
			resultado ula	-> HEX1 - HEX0

*/

module pratica9_top(SW, CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, LEDR);
	input CLOCK_50;
	input [17:0] SW;
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	output [17:0] LEDR;
	
	// FIOS INTERNOS
	wire [31:0] pc_valor, instrucao_valor, ULA_valor, reg1_valor, reg2_valor, imm_valor, WriteData_out;
	wire [2:0] op_valor;
	wire clock, reset, zero_flag, overflow_flag, ULASrc_out, MemRead_out;
	
	// ENTRADA DO RESET
	assign reset = SW[17];

	// INSTANCIACAO 
	divisor_frequencia divisor_clock(
		.novo_clock(clock),
		.reset(reset), 
		.CLOCK_50(CLOCK_50)
	);

	processador processador_placa(
		.clock(clock),
		.reset(reset),
		.pcout_out(pc_valor),
		.instruction_out(instrucao_valor),
		.ULA_result_out(ULA_valor),
		.zero_out(zero_flag),
		.reg1_data_out(reg1_valor),
		.reg2_data_out(reg2_valor),
		.immediate_out(imm_valor),
		.op_out(op_valor),
		.ULASrc_out(ULASrc_out),
		.WriteData_out(WriteData_out),
		.MemRead_out(MemRead_out)
	);
	
	// LOGICA SAIDA
	assign LEDR = {15'b0, zero_flag, reset, clock};
	
	// pc no hex7 e operacao no hex6
	hex_display disp7 (pc_valor[3:0], HEX7);
	decodificador_operacao_hex disp6 (op_valor, HEX6);
			
	// registrador 1 no HEX 5; registrador 2 ou imediato no HEX4
	hex_display disp5 (reg1_valor[3:0], HEX5);
	wire [31:0] hex4_valor = (ULASrc_out == 1'b1) ? imm_valor : reg2_valor;
	hex_display disp4 (hex4_valor[3:0], HEX4);
	
	// WriteDataReg no HEX3
	wire[31:0] hex3_data;
	assign hex3_data = (MemRead_out == 1'b1) ? WriteData_out : 32'bx; // SE O DISPLAY BUGAR, ACREDITO QUE O PROBLEMA SERA 32'bx
	hex_display disp3 (hex3_data[3:0], HEX3);	
	
	// APAGA O HEX2
	assign HEX2 = 7'b1111111;
	
	// resultado da ula nos HEX1 e HEX0
	hex_display disp0 (ULA_valor[3:0], HEX0);
	hex_display disp1 (ULA_valor[7:4], HEX1);

endmodule