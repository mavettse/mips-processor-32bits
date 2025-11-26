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
			registradores[8] <= 32'd5;
			registradores[9] <= 32'd5;
			registradores[10] <= 32'd1;
			registradores[12] <= 32'd4;
			
		end
	
		else if(RegWrite && WriteReg != 5'b0) // impede a escrita no registrador $zero
		begin
			registradores[WriteReg] <= WriteData;
		end
	end
		
endmodule
