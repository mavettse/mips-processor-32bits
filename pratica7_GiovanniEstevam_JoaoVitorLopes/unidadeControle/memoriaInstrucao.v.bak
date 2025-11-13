module memoriaInstrucao(readAddress, instruction);
	input [31:0] readAddress;
	output [31:0] instruction;
	
	// cria a memoria para acessar o conteudo do endereco (8 bits / 1 byte com 128 posicoes pois 2^8 = 256)
	reg [7:0] mem [0:127];	
	
	integer i;
	// armazena duas instrucoes: add (tipo R) e addi (tipo I)
	initial 
	begin
		// add $s0, $t0, $zero; endereco 0, PC = 0
		// op: 000000, rs: 01000 ($t0), rt: 00000 ($zero), rd: 10000 ($s0), shamt: 00000, fumct: 100000
		mem[0] = 8'b00000001;
		mem[1] = 8'b00000000;
		mem[2] = 8'b10000000;
		mem[3] = 8'b00100000;
		
		// addi $s1, $s0, 4; endereco 1, PC = 4
		// op: 001000, rs: 10000 ($s0), rt: 10001 ($s1), imediate: 0000000000000100 
		mem[4] = 8'b00100010;
		mem[5] = 8'b00010001;
		mem[6] = 8'b00000000;
		mem[7] = 8'b00000100;
		
		// addi $s1, $s1, 4; endereco 2, PC = 8
		// op: 001000, rs: 10001 ($s1), rt: 10001 ($s1), imediate: 0000000000000100 
		mem[8]  = 8'b00100010;
		mem[9]  = 8'b00110001;
		mem[10] = 8'b00000000;
		mem[11] = 8'b00000100;
		
		// addi $s1, $s1, 4; endereco 3, PC = 12
		// op: 001000, rs: 10001 ($s1), rt: 10001 ($s1), imediate: 0000000000000100 
		mem[12] = 8'b00100010;
		mem[13] = 8'b00110001;
		mem[14] = 8'b00000000;
		mem[15] = 8'b00000100;
		
		// addi $s1, $s1, 4; endereco 4, PC = 16
		// op: 001000, rs: 10001 ($s1), rt: 10001 ($s1), imediate: 0000000000000100 
		mem[16] = 8'b00100010;
		mem[17] = 8'b00110001;
		mem[18] = 8'b00000000;
		mem[19] = 8'b00000100;
		
		// zera o conteudo dos outros enderecos da memoria
		for(i = 20; i < 128; i = i + 1)
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