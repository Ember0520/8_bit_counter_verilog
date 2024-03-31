//分频模块：48MHZ----->1HZ
/*
	input：系统时钟clk、系统复位信号rst_n
	output：1Hz时钟输出clk_1hz
	function：生成1Hz的时钟信号用于位选切换
*/

module freq(clk, rst_n, clk_1hz);

	input clk;				//系统时钟：50MHZ
	input rst_n;			//系统复位：低电平有效
	
	output reg clk_1hz;	//目标时钟：1HZ
	
	reg [25:0] cnt;		//定义计数器
	
	parameter cnt_num = 48_000_000 / 1 / 2 - 1;		//0.5s
	/********行为建模（时序逻辑）*******/
	always @ (posedge clk or negedge rst_n)			//异步复位
	begin
		if(!rst_n)
			begin
				cnt <= 26'd0;									//计数器清零
				clk_1hz <= 1'b0;								//时钟初始以低电平开始
			end
		else
			begin
				if(cnt < cnt_num)								//计数器没有计数到0.5s
					begin
						cnt <= cnt + 26'd1;					//计数器自加一
					end
				else												//计数器计数到0.5s
					begin
						cnt <= 26'd0;							//计数器清零
						clk_1hz <= ~clk_1hz;					//时钟取反（0.5s高，0.5s低，一个时钟周期1s）
					end
			end
	end

endmodule 
