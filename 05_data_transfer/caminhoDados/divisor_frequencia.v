/* Módulo 2: Divisor de Frequência
 Converte o clock de 50 MHz em um clock de ~0.75Hz.
*/
module divisor_frequencia(novo_clock, reset, CLOCK_50);
		
	input reset;
	input CLOCK_50;
	output novo_clock;
		
	reg [25:0] Q;
   
    always @(posedge CLOCK_50 or posedge reset) 
	 begin
       if (reset) 
	      Q <= 26'b0; // Usando non-blocking assignment (<=)
       else 
         Q <= Q + 1; // Usando non-blocking assignment (<=)
    end

    // A saída é o bit mais significativo, que divide a frequência por 2^26.
    // Freq = 50MHz / 2^26 ~=  0.75Hz ~= 1,33 segundos
    assign novo_clock = Q[25]; 

endmodule