module bancoRegistradores (Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock);
	input [4:0] Read1,Read2,WriteReg;
	input [31:0] WriteData;
	input RegWrite, clock;
	output [31:0] Data1, Data2;
		
	// 32 registradores  com 32 bits cada
	reg [31:0] registradores [0:31];
	
	// zera todos os registradores
	integer i;
	initial
	begin
		for(i = 0; i < 32; i = i + 1)
		begin
			registradores[i] = 0;
		end
	end
	
	// faz a leitura fora do bloco always pois a leitura é assíncrona
	assign Data1 = registradores[Read1];
	assign Data2 = registradores[Read2];

	// faz a escrita dentro do bloco always quando RegWrite estiver habilitado e tiver num clock de subida
	always @(posedge clock)
	begin
	
		if(RegWrite)
		begin
			registradores[WriteReg] <= WriteData;
		end
		
	end
	
endmodule
