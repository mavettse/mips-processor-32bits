module memoriaInstrucao(readAddress, instruction);
	input [31:0] readAddress;
	output [31:0] instruction;
	
	reg [7:0] mem [0:127];	
	
	integer i;
	initial 
	begin
		// endereço 0: beq $8, $9, 1 -> hex: 11090001
		mem[0] = 8'h11;
		mem[1] = 8'h09;
		mem[2] = 8'h00;
		mem[3] = 8'h01;
		
		// endereço 4: addi $8, $8, 2 -> hex: 21080002
		mem[4] = 8'h21;
		mem[5] = 8'h08;
		mem[6] = 8'h00;
		mem[7] = 8'h02;
		
		// endereço 8: sw $8, 0($12) -> hex: AD880000
		mem[8]  = 8'hAD;
		mem[9]  = 8'h88;
		mem[10] = 8'h00;
		mem[11] = 8'h00;
		
		// endereço 12: lw $16, 0($12) -> hex: 8D900000
		mem[12] = 8'h8D;
		mem[13] = 8'h90;
		mem[14] = 8'h00;
		mem[15] = 8'h00;
		
		// endereço 16: sub $8, $16, $10 -> hex: 020A4022
		mem[16] = 8'h02;
		mem[17] = 8'h0A;
		mem[18] = 8'h40;
		mem[19] = 8'h22;
		
		// endereço 20: j 0 -> hex: 08000000
		mem[20] = 8'h08;
		mem[21] = 8'h00;
		mem[22] = 8'h00;
		mem[23] = 8'h00;
		
		// zera as outras instruções
		for(i = 24; i < 128; i = i + 1)
		begin
			mem[i] = 8'b0;
		end
		
	end
	
	// salvando somente os 7 primeiros bits do endereço para caber na memoria
	wire [6:0] addr = readAddress[6:0];
	
	// cria wire de protecao para nao sair do range do tamanho da memoria 
	wire outRange = (addr > 7'd124);
	
	// se estiver fora do range, zera a instrucao; se nao, concatena 4 bytes para formar a instrução de 32 bits
	assign instruction = outRange ? 32'b0 : {mem[addr], mem[addr + 7'd1], mem[addr + 7'd2], mem[addr + 7'd3]};

	endmodule