module ULA_top(SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, LEDR, LEDG);
	input [17:0] SW;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	output [17:0] LEDR;
	output [7:0] LEDG;
		
	wire [3:0] a_sw, b_sw;
	wire [2:0] op;
	
	assign a_sw = SW[17:14];
	assign b_sw = SW[10:7];
	assign op = SW[2:0];

	wire [31:0] a_32, b_32;
	
	// extensor_sinal(a, s);
	extensor_sinal a_estendido({12'b0, a_sw}, a_32);
	extensor_sinal b_estendido({12'b0, b_sw}, b_32);
		
	wire [31:0] s_32;
	wire ledr_temp, ledg_temp;
	
	// ULA32bits (a, 		  b, op,		zero,		s, overflow);
	ULA32bits ula(a_32, b_32, op,  ledg_temp, s_32, ledr_temp);
	
	assign LEDR = {17'b00000000000000000, ledr_temp};
	assign LEDG = {7'b0000000, ledg_temp};
	
	wire [5:0] s_6bit, s_abs;
	wire s_sinal;
	
	assign s_6bit = s_32[5:0];
	
	// valor_absoluto		 (s, s_absoluto, bit_sinal);
	valor_absoluto res_abs(s_6bit, s_abs, s_sinal);
	
	// mostra o valor absoluto do resultado
	wire [3:0] s_unidade, s_dezena;
	assign s_unidade = s_abs % 4'b1010;
	assign s_dezena = s_abs / 4'b1010;
	
	// display_sinal		  (bit_sinal, seg);
	display_sinal sinal_neg(s_sinal, HEX2);
	hex_display s_uni(s_unidade, HEX0);
	hex_display s_dez(s_dezena, HEX1);
	
	wire [3:0] a_unidade, a_dezena, b_unidade, b_dezena;
	assign a_unidade = a_sw % 4'b1010;
	assign a_dezena = a_sw / 4'b1010;
	assign b_unidade = b_sw % 4'b1010;
	assign b_dezena = b_sw / 4'b1010;
	
	// hex_display(in,out);
	hex_display a_dez(a_dezena, HEX7);
	hex_display a_uni(a_unidade, HEX6);
	hex_display b_dez(b_dezena, HEX5);
	hex_display b_uni(b_unidade, HEX4);
	
	// apafa o display que nao sera usado
	assign HEX3 = 7'b1111111;

endmodule