/*
	input：时钟信号clk、控制增减的开关up_down、异步复位信号rst_n、步长改变量输入step
	output：计数器值count
	function：根据步长改变量和增减控制信号实现计数器的计数功能
*/

module counter(
    input wire clk, 
    input wire up_down, // 控制增减的开关
	 input wire rst_n,
    input wire [3:0] step, // 步长改变量输入
    output reg [7:0] count
);

	reg [3:0] step_size; // 步长

	always @ (posedge clk) 
		begin
			 if(!rst_n)           // 如果复位信号有效
				  begin
						count <= 8'b00000000; // 计数输出置0
				  end
			 else
			 begin
				 if(up_down)  // 加法计数
				 begin
					  count <= count + step_size;
				 end 
				 else   // 减法计数
				 begin
					  count <= count - step_size;
				 end
			 end
		end

	always @ (step) 
	begin
		 case(step)
			  4'b0000: step_size <= 4'b0000; // 步长0
			  4'b0001: step_size <= 4'b0001; // 步长1
			  4'b0010: step_size <= 4'b0010; // 步长2
			  4'b0011: step_size <= 4'b0011; // 步长3
			  4'b0100: step_size <= 4'b0100; // 步长4
			  4'b0101: step_size <= 4'b0101; // 步长5
			  4'b0110: step_size <= 4'b0110; // 步长6
			  4'b0111: step_size <= 4'b0111; // 步长7
			  4'b1000: step_size <= 4'b1000; // 步长8
			  4'b1001: step_size <= 4'b1001; // 步长9
			  4'b1010: step_size <= 4'b1010; // 步长10
			  4'b1011: step_size <= 4'b1011; // 步长11
			  4'b1100: step_size <= 4'b1100; // 步长12
			  4'b1101: step_size <= 4'b1101; // 步长13
			  4'b1110: step_size <= 4'b1110; // 步长14
			  4'b1111: step_size <= 4'b1111; // 步长15
		 endcase
	end


endmodule