module memoriaInstrucao(readAddress, instruction);
	input [31:0] readAddress;
	output [31:0] instruction;
	
	reg [7:0] mem [0:127];	
	
	integer i;
	// armazena duas instrucoes: add (tipo R) e addi (tipo I)
	initial 
	begin
		// lw $8, 0($16); endereco 0, PC = 0
		// op: 100011, rs: 10000 ($16), rt: 01000 ($8), imm: 0000000000000000 (0)
		mem[0] = 8'b10001110;
		mem[1] = 8'b00001000;
		mem[2] = 8'b00000000;
		mem[3] = 8'b00000000;
		
		// sw $9, 0($16); endereco 1, PC = 4
		// op: 101011, rs: 10000 ($16), rt: 01001 ($9), imm: 0000000000000000 (0)
		mem[4] = 8'b10101110;
		mem[5] = 8'b00001001;
		mem[6] = 8'b00000000;
		mem[7] = 8'b00000000;
		
		// add $8, $16, $9; endereco 2, PC = 8
		// op: 000000, rs: 10000 ($16), rt: 01001 ($9), rd: 01000 ($8), shamt: 00000, fumct: 100000 
		mem[8]  = 8'b00000010;
		mem[9]  = 8'b00001001;
		mem[10] = 8'b01000000;
		mem[11] = 8'b00100000;
		
		// sw $8, 4($16); endereco 4, PC = 12
		// op: 101011, rs: 10000 ($16), rt: 01000 ($8), imm: 0000000000000100 (4)
		mem[12] = 8'b10101110;
		mem[13] = 8'b00001000;
		mem[14] = 8'b00000000;
		mem[15] = 8'b00000100;
		
		// lw $9, 4($16); endereco 5, PC = 16
		// op: 100011, rs: 10000 ($16), rt: 01001 ($9), imm: 0000000000000100 (4)
		mem[16] = 8'b10001110;
		mem[17] = 8'b00001001;
		mem[18] = 8'b00000000;
		mem[19] = 8'b00000000;
		
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