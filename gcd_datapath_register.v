// Register
module register(clk,rst,din,ld,y);
	input clk,rst,ld;
	input [7:0] din;
	output reg [7:0] y;
	always @(posedge clk)
		begin
			if(rst)
				y <= 8'b0;
			else if(ld)
				y <= din;
		end
endmodule
