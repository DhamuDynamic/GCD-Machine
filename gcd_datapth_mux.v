// 2x1 Multiplexer
module mux(y,sel,in0,in1);
	input [7:0] in0,in1;
	input sel;
	output reg [7:0] y;
	always @(sel or in0 or in1)
		begin
			if(sel == 0)
				y <= in0;
			else
				y <= in1;
		end
endmodule
