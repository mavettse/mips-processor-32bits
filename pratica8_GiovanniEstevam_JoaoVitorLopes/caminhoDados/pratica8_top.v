/*		
				---- INPUT ----
			reset				-> SW[17] 
			
				---- OUTPUTS ----
			clock				-> LEDR[0]
			reset				-> LEDR[1]
			zero				-> LEDR[2]
			pc					-> LEDG[7:4]
			overflow			-> LEDG[0]
			
			writedata		-> HEX7
			operacao			-> HEX6
				A: add, E: and, o: or, S: slt, b: sub
			reg1				-> HEX5
			reg2 ou imed	-> HEX4
			resultado ula	-> HEX3 - HEX0

*/

module pratica8_top(SW, CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, LEDR, LEDG);
	input CLOCK_50;
	input [17:0] SW;
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	output [17:0] LEDR;
	output [7:0] LEDG;
	
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
		.overflow_out(overflow_flag),
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
	assign LEDG = {pc_valor[3:0], 4'b0, overflow_flag};
		
	// resultado da ula nos HEX3 - HEX0
	hex_display disp0 (ULA_valor[3:0], HEX0);
	hex_display disp1 (ULA_valor[7:4], HEX1);
	hex_display disp2 (ULA_valor[11:8], HEX2);
	hex_display disp3 (ULA_valor[15:12], HEX3);
	
	// ULASrc = 1 => HEX 4 = imediato; ULASrc = 0 => HEX 4 = registrador 2
	wire [31:0] hex4_data;
	assign hex4_data = (ULASrc_out == 1'b1) ? imm_valor : reg2_valor;
	hex_display disp4 (hex4_data[3:0], HEX4);

	// registrador 1 no HEX 5
	hex_display disp5 (reg1_valor[3:0], HEX5);

	// operacao no HEX 6
	decodificador_operacao_hex dec_hex6 (
		.op(op_valor),
		.segmentos_hex(HEX6)
	);
	
	// MemRead = 1 => HEX 3 = WriteData; MemRead = 0 => HEX 3 APAGADO
	wire[31:0] hex3_data;
	assign hex3_data = (MemRead_out == 1'b1) ? WriteData_out : 32'bx;
	hex_display disp7 (hex3_data[3:0], HEX7);	
	
endmodule