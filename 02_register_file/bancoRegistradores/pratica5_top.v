	/*		
			Endereços sao inseridos com 3 bits nos switches da placa
			Valores sao inseridos com 5 bits nos switches da placa
			
				---- INPUTS ----
			Read1			 -> SW[17:15] 
			Read2			 -> SW[14:12] 
			WriteReg		 -> SW[11:9] 
			WriteData	 -> SW[8:4] 
			RegWrite		 -> SW[0]
			reset			 -> SW[1]
			
				---- OUTPUTS ----
			Data1			-> HEX7 E HEX6
			Data2			-> HEX4 E HEX3
	
	*/

module pratica5_top(SW, CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	input [17:0] SW;
	input CLOCK_50;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	
	// cria fios intermetiarios para fazer as conexoes com o bbancoRegistradores
	wire [4:0] read1_aux, read2_aux, writeReg_aux;
	wire [31:0] writeData_aux;
	wire [31:0] data1_aux, data2_aux;
	wire regWrite_flag, reset, clock;
		
	// diminui a frequencia do clock
	divisor_frequencia novo_clock(clock, reset, CLOCK_50);
		
	// atribui as entradas nos switches correpondentes, completando os bits necessários para que o modulo funcione corretamente
	assign read1_aux = {2'b0, SW[17:15]};
	assign read2_aux = {2'b0, SW[14:12]};
	assign regWrite_flag = SW[0];
	assign reset = SW[1];
	assign writeReg_aux = {2'b0, SW[11:9]};
	assign writeData_aux = {27'b0, SW[8:4]};
	
	// module bancoRegistradores (Read1		, Read2	  , WriteReg	 , WriteData	 , RegWrite		 , Data1		, Data2	  , clock);
	bancoRegistradores testePlaca(read1_aux, read2_aux, writeReg_aux, writeData_aux, regWrite_flag, data1_aux, data2_aux, clock);

	// separa os numeros dos dados em dezena e unidade para mostrar no dipslay
	wire [3:0] data1_unidade, data1_dezena, data2_unidade, data2_dezena;
	assign data1_unidade = data1_aux % 4'b1010;
	assign data1_dezena = data1_aux / 4'b1010;
	assign data2_unidade = data2_aux % 4'b1010;
	assign data2_dezena = data2_aux / 4'b1010;

	// FAZ A ATRIBUIÇÃO DAS SAIDAS NO DISPLAY
	hex_display data1_unid_display (data1_unidade, HEX7);
	hex_display data1_dezen_display (data1_dezena, HEX6);
	hex_display data2_unid_display (data2_unidade, HEX4);
	hex_display data2_dezen_display (data2_dezena, HEX3);
	
	// apaga os displays que nao serao utilizados
	assign HEX5 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX1 = 7'b1111111;
	assign HEX0 = 7'b1111111;
	
endmodule