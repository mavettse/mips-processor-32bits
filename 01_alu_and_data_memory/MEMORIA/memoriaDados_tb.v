module memoriaDados_tb;
	reg clock, memWrite, memRead;
	reg [5:0] address;
	reg [31:0] writeData;

   wire [31:0] readData;

   memoriaDados teste (address, memWrite, memRead, clock, writeData, readData);
	 
	initial
	begin
		clock = 0;
	end
	
	always
	begin
		#5 clock = ~clock;
	end

	initial
	begin
		// teste de escrita; habilita a escrita e desabilita a leitura
		address   = 6'd8;
		writeData = 32'hAABBCCDD;
		memWrite  = 1'b1;
		memRead   = 1'b0;
		@(posedge clock);
		memWrite = 1'b0;
		#10;
		
		// teste de leitura; habilita a leitura
		address   = 6'd8;
		memRead   = 1'b1;
		@(posedge clock);
		#10;
		
		// verifica se deu certo
		if (readData == 32'hAABBCCDD)
		begin
			$display(">>> SUCESSO! O valor lido esta correto.");
		end
		
		else
		begin
			$display(">>> FALHA! O valor lido eh diferente do esperado.");
		end
		#10;
		
		$stop;
	end

endmodule