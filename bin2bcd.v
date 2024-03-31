/*
	input：二进制输入bin_in
	output：BCD码输出bcd_out
	function：将二进制输入转换为BCD码输出
*/

module bin2bcd(
	input	[7:0]	bin_in,   // 8位二进制输入
	output	[11:0]	bcd_out   // 12位BCD码输出
);

	reg [3:0] ones;   // 个位BCD码
	reg [3:0] tens;   // 十位BCD码
	reg [3:0] hundreds;   // 百位BCD码
	integer i;   // 循环计数器

	always @(*) 
	begin
		ones = 4'd0;   // 初始化个位BCD码
		tens = 4'd0;   // 初始化十位BCD码
		hundreds = 4'd0;   // 初始化百位BCD码
		
		for(i = 7; i >= 0; i = i - 1)   // 从高位到低位遍历二进制输入
		begin
			if (ones >= 4'd5) 		ones = ones + 4'd3;   // 处理个位进位
			if (tens >= 4'd5) 		tens = tens + 4'd3;   // 处理十位进位
			if (hundreds >= 4'd5)	hundreds = hundreds + 4'd3;   // 处理百位进位
			hundreds = {hundreds[2:0],tens[3]};   // 更新百位BCD码
			tens = {tens[2:0],ones[3]};   // 更新十位BCD码
			ones = {ones[2:0],bin_in[i]};   // 更新个位BCD码
		end
	end
	
	assign bcd_out = {hundreds, tens, ones};   // 将百位、十位和个位BCD码连接为12位BCD码输出

endmodule

