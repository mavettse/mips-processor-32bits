module memoriaDados(address, memWrite, memRead, clock, writeData, readData);
	// 2^6 = 64 posicoes de memoria
	input [5:0] address;
	input memWrite, memRead, clock;
	
	input [31:0] writeData;
	// é declarado cmo reg porque armazena valor dentro do always
	output reg [31:0] readData;
	
	// cada posicao guarda 8 bits (1 byte); bloco de memória de 64 bytes = 512 bits; 
	reg [7:0] memory [0:63];
	
	// faz a escrita na borda de subida
	always @(posedge clock)
	begin
	
		if(memWrite) // escreve se o sinal estiver ativo
		begin
			// escreve na memória 4 bytes (32 bits); 1o byte em address, 2o byte em address + 1 e assmi por diante
			memory[address] <= writeData[7:0];
			memory[address + 1] <= writeData[15:8];
			memory[address + 2] <= writeData[23:16];
			memory[address + 3] <= writeData[31:24];
		end
	
	end
	
	// faz a leitura na borda de descida
	always @(negedge clock)
	begin
	
		if(memRead) // lê se o sinal estiver ativo
		begin
			// lê da memória 4 bytes (32 bits); na ordem contraria à ordem lida como é feito no mips
			readData <= {memory[address + 3], memory[address + 2], memory[address + 1], memory[address]};
		end
	
	end
	
	integer i;
	
	// inicializa todos os valores dos enderecos com 0 e memory[16:19] = 32'd4
	initial
	begin 
		// zera os valores dos enderecos
		for(i = 0; i < 64; i = i + 1)
		begin
			memory[i] = 8'b0;
		end
	end
	
endmodule