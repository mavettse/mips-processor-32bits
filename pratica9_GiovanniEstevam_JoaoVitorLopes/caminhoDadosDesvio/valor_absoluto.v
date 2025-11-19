module valor_absoluto(s, s_absoluto, bit_sinal);
		input [5:0] s;
		output [5:0] s_absoluto;
		output bit_sinal;
			
		assign bit_sinal = s[5];
		
		// somador6bits (b, cin, s);
		somador6bits abs(s, bit_sinal, s_absoluto);
	
endmodule