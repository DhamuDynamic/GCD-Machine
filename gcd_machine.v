// GCD Machine top module
module gcd_machine(clk,rst,go,in1,in2,out,done);
	// Input and Output Declarations
	input clk,rst,go;
	input [7:0] in1,in2;
	output [7:0] out;
	output done;
	// Wired connections between datapath and controller
	wire a_gt_b,a_lt_b,a_eq_b;
	wire a_sel,a_ld,b_sel,b_ld;
	wire op_enb;
	// Instantiation of Controller
	controller c (clk,rst,go,a_gt_b,a_eq_b,a_lt_b,a_sel,a_ld,b_sel,b_ld,op_enb,done);
	// Instantiation of Datapath
	datapath d (clk,rst,in1,in2,a_sel,a_ld,b_sel,b_ld,op_enb,a_gt_b,a_lt_b,a_eq_b,out);
endmodule
