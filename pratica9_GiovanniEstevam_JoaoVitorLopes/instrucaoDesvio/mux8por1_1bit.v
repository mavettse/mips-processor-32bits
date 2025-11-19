module mux8por1_1bit(I0, I1, I2, I3, I4, I5, I6, I7, sel, s);
	input I0, I1, I2, I3, I4, I5, I6, I7;
	input [2:0] sel;
	output s;
	
	wire temp_mux1, temp_mux2, temp_mux3, temp_mux4, temp_mux5, temp_mux6;

	// mux2por1(I0, I1, sel, s)
	mux2por1 mux1 (I0, I1, sel[0], temp_mux1);
	mux2por1 mux2 (I2, I3, sel[0], temp_mux2);
	mux2por1 mux3 (I4, I5, sel[0], temp_mux3);
	mux2por1 mux4 (I6, I7, sel[0], temp_mux4);

	mux2por1 mux5 (temp_mux1, temp_mux2, sel[1], temp_mux5);
	mux2por1 mux6 (temp_mux3, temp_mux4, sel[1], temp_mux6);

	mux2por1 mux7 (temp_mux5, temp_mux6, sel[2], s);

endmodule