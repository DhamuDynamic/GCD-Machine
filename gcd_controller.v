// GCD Controller 
module controller (clk,rst,go,a_gt_b,a_eq_b,a_lt_b,a_sel,a_ld,b_sel,b_ld,op_enb,done);
	input clk,rst,go,a_gt_b,a_eq_b,a_lt_b;
	output reg a_sel,a_ld,b_sel,b_ld,op_enb,done;
	reg [2:0] curr_state,nxt_state;
	parameter s0 = 3'b000;
	parameter s1 = 3'b001;
	parameter s2 = 3'b010;
	parameter s3 = 3'b011;
	parameter s4 = 3'b100;
	parameter s5 = 3'b101;
	parameter s6 = 3'b110;
	parameter s7 = 3'b111;
	always @(rst or posedge clk)
		begin
			if(rst == 1)
				curr_state <= s0;
			else
				curr_state <= nxt_state;
		end
	always @(go or a_gt_b or a_eq_b or a_lt_b or curr_state)
		begin
			case(curr_state)
				s0 : if(go==0) nxt_state <= s0;
						else nxt_state <= s1;
				s1 : nxt_state <= s2;
				s2 : nxt_state <= s3;
				s3 : if(a_gt_b == 1)
						nxt_state <= s4;
						else if(a_eq_b == 1)
						nxt_state <= s7;
						else
						nxt_state <= s5;
				s4 : nxt_state <= s6;
				s5 : nxt_state <= s6;
				s6 : nxt_state <= s3;
				s7 : nxt_state <= s0;
				default : nxt_state <= s0;
			endcase
		end
	always @(go or a_gt_b or a_eq_b or a_lt_b or curr_state)
		begin
			case(curr_state)
				s0 :  begin
						a_sel <= 1'b0;
						a_ld <= 1'b0;
						b_sel <= 1'b0;
						b_ld <= 1'b0;
						op_enb <= 1'b0;
						done <= 1'b1;
					  end
				s1 :  begin
						a_sel <= 1'b1;
						a_ld <= 1'b1;
						b_sel <= 1'b1;
						b_ld <= 1'b1;
						op_enb <= 1'b0;
						done <= 1'b0;
						end
				s2 :  begin
						a_sel <= 1'b0;
						a_ld <= 1'b0;
						b_sel <= 1'b0;
						b_ld <= 1'b0;
						op_enb <= 1'b0;
						done <= 1'b0;
						end
				s3 :  begin
						a_sel <= 1'b0;
						a_ld <= 1'b0;
						b_sel <= 1'b0;
						b_ld <= 1'b0;
						op_enb <= 1'b0;
						done <= 1'b0;
						end
				s4 :   begin
						a_sel <= 1'b0;
						a_ld <= 1'b1;
						b_sel <= 1'b0;
						b_ld <= 1'b0;
						op_enb <= 1'b0;
						done <= 1'b0;
						end
				s5 :  begin
						a_sel <= 1'b0;
						a_ld <= 1'b0;
						b_sel <= 1'b0;
						b_ld <= 1'b1;
						op_enb <= 1'b0;
						done <= 1'b0;
						end
				s6 :  begin
						a_sel <= 1'b0;
						a_ld <= 1'b0;
						b_sel <= 1'b0;
						b_ld <= 1'b0;
						op_enb <= 1'b0;
						done <= 1'b0;
						end
				s7 :  begin
						a_sel <= 1'b0;
						a_ld <= 1'b0;
						b_sel <= 1'b0;
						b_ld <= 1'b0;
						op_enb <= 1'b1;
						done <= 1'b1;
						end
				default : begin
						 a_sel <= 1'b0;
						a_ld <= 1'b0;
						b_sel <= 1'b0;
						b_ld <= 1'b0;
						op_enb <= 1'b0;
						done <= 1'b0;
						end
			endcase
		end		
endmodule			
