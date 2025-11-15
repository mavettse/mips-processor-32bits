module memoriaInstrucao(readAddress, instruction);
	input [31:0] readAddress;
	output [31:0] instruction;
	
	reg [7:0] mem [0:127];	
	
	integer i;
	// armazena duas instrucoes: add (tipo R) e addi (tipo I)
	initial 
	begin
		// addi $t0, $zero, 4; endereco 0, PC = 0
		// op: 001000, rs: 00000 ($zero), rt: 01000 ($t0), imm: 0000000000000100 (4)
		// $t0 = 0 + 4 = 4
		mem[0] = 8'b00100000;
		mem[1] = 8'b00001000;
		mem[2] = 8'b00000000;
		mem[3] = 8'b00000100;
		
		// add $s0, $t0, $t0; endereco 1, PC = 4
		// op: 000000, rs: 01000 ($t0), rt: 01000 ($t0), rd: 10000 ($s0), shamt: 00000, fumct: 100000 
		// $s0 = 4 + 4 = 8
		mem[4] = 8'b00000001;
		mem[5] = 8'b00001000;
		mem[6] = 8'b10000000;
		mem[7] = 8'b00100000;
		
		// add $s0, $s0, $s0; endereco 2, PC = 8
		// op: 000000, rs: 10000 ($s0), rt: 10000 ($s0), rd: 10000 ($s0), shamt: 00000, fumct: 100000 
		// $s0 = 8 + 8 = 16
		mem[8]  = 8'b00000010;
		mem[9]  = 8'b00010000;
		mem[10] = 8'b10000000;
		mem[11] = 8'b00100000;
		
		// addi $s0, $s0, -1; endereco 4, PC = 12
		// op: 001000, rs: 10000 ($s0), rt: 10000 ($s0), imm: 0000000000000001 (1)
		// $s0 = 16 - 1 = 15
		mem[12] = 8'b00100010;
		mem[13] = 8'b00010000;
		mem[14] = 8'b11111111;
		mem[15] = 8'b11111111;
		
		// zera o conteudo dos outros enderecos da memoria
		for(i = 16; i < 128; i = i + 1)
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