// GCD Machine Testbench
module gcd_machine_tb();
	reg clk,rst,go;
	reg [7:0] in1;
	reg [7:0] in2;
	wire [7:0] out;
	wire done;
	gcd_machine dut (clk,rst,go,in1,in2,out,done);
	initial
		begin
			clk = 1'b0;
			forever #10 clk = ~clk;
		end
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars(1);
			#500 $finish;
		end
	initial
		begin
			rst = 1'b1;
			go = 1'b0;
			#40;
			rst = 1'b0;
			in1 = 15;
			in2 = 24;
			#40;
			go = 1'b1;
			while (done == 1'b1)
				begin
					#20;
				end
			go = 1'b0;
			while (done != 1'b1)
				begin
					#20;
				end
			$display("done = %b gcd = %d",done,out);
		end
endmodule
