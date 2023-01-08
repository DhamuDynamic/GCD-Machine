// GCD Datapath
module datapath (clk,rst,in1,in2,a_sel,a_ld,b_sel,b_ld,op_enb,a_gt_b,a_lt_b,a_eq_b,out);
	input clk,rst;
	input [7:0] in1,in2;
	input a_sel,a_ld,b_sel,b_ld,op_enb;
	output a_gt_b,a_lt_b,a_eq_b;
	output [7:0] out;
	wire [7:0] tain,tbin,taout,tbout,t1,t2;
	// Instantiating the subtractors
	subtractor s1(taout,tbout,t1);
	subtractor s2(tbout,taout,t2);
	// Instantiating the 2x1 Multiplexers
	mux m1(tain,a_sel,t1,in1);
	mux m2(tbin,b_sel,t2,in2);
	// Instantiating the registers
	register r1(clk,rst,tain,a_ld,taout);
	register r2(clk,rst,tbin,b_ld,tbout);
	register r3(clk,rst,taout,op_enb,out);
	// Instantiating the comparator
	comparator c1(taout,tbout,a_gt_b,a_eq_b,a_lt_b);
endmodule
