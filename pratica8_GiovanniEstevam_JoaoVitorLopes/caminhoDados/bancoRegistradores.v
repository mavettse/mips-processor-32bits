module bancoRegistradores (Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock, reset);
	input [4:0] Read1,Read2,WriteReg;
	input [31:0] WriteData;
	input RegWrite, clock, reset;
	output [31:0] Data1, Data2;
		
	// 32 registradores  com 32 bits cada
	reg [31:0] registradores [0:31];
	
	// faz a leitura fora do bloco always pois a leitura é assíncrona
	assign Data1 = registradores[Read1];
	assign Data2 = registradores[Read2];

	integer i;
	
	// faz a escrita no bloco always quando RegWrite estiver habilitado e num posedge ou reset estiver habilitado
	always @(posedge clock or posedge reset)
	begin		if(reset)
		begin
			for(i = 0; i < 32; i = i + 1)
			begin
				registradores[i] <= 32'b0;
			end
		end
	
		else if(RegWrite && WriteReg != 5'b0) // impede a escrita no registrador $zero
		begin
			registradores[WriteReg] <= WriteData;
		end
	end
	
	// insere o valor da posicao do registrador no respectivo registrador
	initial
	begin
		for(i = 1; i < 32; i = i + 1)
		begin
				registradores[i] <= 32'b0 + i;
		end
	end
	
endmodule
