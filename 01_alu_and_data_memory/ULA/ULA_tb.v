module ULA_tb;		// testbench para as operações
	reg [31:0] a, b;
	reg [2:0] ULAop;
	wire [31:0] s;
	wire overflow, zero;
	
	ULA32bits ULA_tb(a, b, ULAop, zero, s, overflow);
	
	initial begin
		// testa a operação AND: 5 & 6 = 4
		a     = 32'd5;
		b     = 32'd6;
		ULAop = 3'b000;
		#10;
		
		// testa a operação OR: 4 & 8 = 12
		a     = 32'd4;
		b     = 32'd8;
		ULAop = 3'b001;
		#10;
		
		// testa a operação ADD: 10 + 30 = 40
		a     = 32'd10;
		b     = 32'd30;
		ULAop = 3'b010;
		#10;
		
		// testa a operação SUB: 40 - 40 = 0
		a     = 32'd40;
		b     = 32'd40;
		ULAop = 3'b110;
		#10;
		
		// testa a operação SLT verdadeira: 4 < 8 = 1
		a     = 32'd4;
		b     = 32'd8;
		ULAop = 3'b111;
		#10;
		
		// testa a operação SLT falsa: 8 < 4 = 0
		a     = 32'd8;
		b     = 32'd4;
		ULAop = 3'b111;
		#10;
		
		$stop;
	end

endmodule