module countPC(pcin, reset, CLOCK_50, pcout);
	input [31:0] pcin;
	input reset, CLOCK_50;
	output reg [31:0] pcout;
	
	// registrador intermediario para a chamda do somador
	wire cout, overflow;
	wire [31:0] pcout_aux;
	
	// module somador32bits(a, b, cin, s, cout, overflow);
	somador32bits adder(pcin, {29'b0, 3'b100}, 1'b0, pcout_aux, cout, overflow);
	
	initial
	begin	
		pcout <= (32'b0);
	end

	// bloco always para atribuir pcout = pcin + 4
	always @(posedge CLOCK_50 or posedge reset)
	begin
		if(reset)
			pcout <= {32'b0};
		else 
			pcout <= pcout_aux;
	end	

endmodule