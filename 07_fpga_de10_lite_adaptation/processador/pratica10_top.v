/*		
				---- INPUT ----
			reset				-> SW[9] 
			
				---- OUTPUTS ----
			clock				-> LEDR[0]
			reset				-> LEDR[1]
			zero				-> LEDR[2]
			
			pc					-> HEX5
			operacao			-> HEX4
				A: add, E: and, o: or, S: slt, b: sub
				
			reg1				-> HEX3
			reg2 ou imed	-> HEX2
			
			writereg			-> HEX1
			
			resultado ula	-> HEX0

*/

module pratica10_top(SW, MAX10_CLK1_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, LEDR);
	input MAX10_CLK1_50;
	input [9:0] SW;
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output [9:0] LEDR;
	
	// FIOS INTERNOS
	wire [31:0] pc_valor, instrucao_valor, ULA_valor, reg1_valor, reg2_valor, imm_valor, WriteData_out;
	wire [2:0] op_valor;
	wire clock, reset, zero_flag, overflow_flag, ULASrc_out, MemRead_out;
	
	// ENTRADA DO RESET
	assign reset = SW[9];

	// INSTANCIACAO 
	divisor_frequencia divisor_clock(
		.novo_clock(clock),
		.reset(reset), 
		.MAX10_CLK1_50(MAX10_CLK1_50)
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
	assign LEDR = {7'b0, zero_flag, reset, clock};
	
	// pc no hex5 e operacao no hex4
	hex_display disp5 (pc_valor[3:0], HEX5);
	decodificador_operacao_hex disp4 (op_valor, HEX4);
			
	// registrador 1 no HEX 3; registrador 2 ou imediato no HEX2
	hex_display disp3 (reg1_valor[3:0], HEX3);
	wire [31:0] hex2_valor = (ULASrc_out == 1'b1) ? imm_valor : reg2_valor;
	hex_display disp2 (hex2_valor[3:0], HEX2);
	
	// WriteDataReg no HEX1
	wire[31:0] hex1_data;
	assign hex1_data = (MemRead_out == 1'b1) ? WriteData_out : 32'bx; // SE O DISPLAY BUGAR, ACREDITO QUE O PROBLEMA SERA 32'bx
	hex_display disp1 (hex1_data[3:0], HEX1);	
	
	// resultado da ula no HEX0
	hex_display disp0 (ULA_valor[3:0], HEX0);

endmodule