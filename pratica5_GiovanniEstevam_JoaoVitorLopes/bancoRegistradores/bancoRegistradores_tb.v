module bancoRegistradores_tb;
	reg [4:0] Read1,Read2,WriteReg;
	reg [31:0] WriteData;
	reg RegWrite, clock;
	wire [31:0] Data1, Data2;
			
	bancoRegistradores teste (Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock);
	
	// zera o clock
	initial
	begin
		clock = 0;
	end
	
	// seta o ciclo do clock
	always
	begin
		#5 clock = ~clock;
	end
	
	initial
	begin
		#5;
		
		// teste de escrita; atribui o valor AABBCCDD ao registrador de endereço 0
		WriteReg = 5'd0;
		WriteData = 32'hAABBCCDD;
		RegWrite = 1'b1;
		@(posedge clock);
		RegWrite = 0;
		#5;	
		// teste de leitura; lê o valor AABBCCDD em hexadecimal no endereço 0
		Read1 = 5'd0;
		#10;	
		
		// teste de escrita; atribui o valor FFFFFFFF ao registrador de endereço 4
		WriteReg = 5'd4;
		WriteData = 32'hFFFFFFFF;
		RegWrite = 1'b1;
		@(posedge clock);
		RegWrite = 0;
		#5;	
		// teste de leitura; lê o valor FFFFFFFF em hexadecimal no endereço 4
		Read2 = 5'd4;
		#10;
		
		$stop;
	end
	
endmodule
