/*
	input：BCD码输入ain
	output：数码管显示输出yout
	function：根据BCD码输入生成数码管显示的输出
*/

module bcd_coder(yout,ain);
	output[7:0]yout;
	input[3:0]ain;
	reg[7:0]yout;

	always@(ain)
	begin
		case(ain[3:0])
		4'b0000:yout[7:0]=8'b1111_1100;//0
		4'b0001:yout[7:0]=8'b0110_0000;//1
		4'b0010:yout[7:0]=8'b1101_1010;//2
		4'b0011:yout[7:0]=8'b1111_0010;//3
		4'b0100:yout[7:0]=8'b0110_0110;//4
		4'b0101:yout[7:0]=8'b1011_0110;//5
		4'b0110:yout[7:0]=8'b1011_1110;//6
		4'b0111:yout[7:0]=8'b1110_0000;//7
		4'b1000:yout[7:0]=8'b1111_1110;//8
		4'b1001:yout[7:0]=8'b1111_0110;//9
		default:yout[7:0]=8'bx;
		endcase
	end
	
endmodule