module countPC(pcin, reset, CLOCK_50, pcout);
	input [31:0] pcin;
	input reset, CLOCK_50;
	output reg [31:0] pcout;
	
	always @(posedge CLOCK_50 or posedge reset)
	begin
		if(reset)
			pcout <= 32'b0;
		else 
			pcout <= pcin;
	end	

endmodule