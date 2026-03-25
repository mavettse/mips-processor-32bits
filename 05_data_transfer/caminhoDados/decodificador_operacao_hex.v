module decodificador_operacao_hex(op, segmentos_hex);

	input [2:0] op;
	output reg [6:0] segmentos_hex;
	
	always @(*)
	begin
		case (op)
			3'b000: segmentos_hex = 7'b0000110; // E (and)
			3'b001: segmentos_hex = 7'b0100011; // o (or)
			3'b010: segmentos_hex = 7'b0001000; // A (add)
			3'b110: segmentos_hex = 7'b0000011; // b (sub)
			3'b111: segmentos_hex = 7'b0010010; // S (slt)
			default: segmentos_hex = 7'b1111111; // (apaga tudo)
		endcase
	end
	
endmodule