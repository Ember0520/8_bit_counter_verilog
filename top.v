/*
	任务是设计一个8位的计数器，步长的改变量要求从0～15，
	实验中用拨挡开关模块的K1～K4来作为步长改变量的输入，用K8来控制计数器的增减，
	具体要求为：当K8输入为高时，计数器为步长可变的加计数器；当K8输入为低时，计数器为步长可变的减计数器。
	计数器输出值用数码管来表示。实验中计数器的时钟频率为了便于眼睛观察， 位选切换用1Hz的时钟。
*/

/*
	input：时钟信号clk、异步复位信号rst_n、控制增减的开关up_down、步长改变量输入step
	output：数码管显示seg、位选信号seg_select
	function：将各模块连接起来，实现计数器系统的功能
*/


module top(
    input wire clk,  // 输入时钟信号
    input wire rst_n,  // 异步复位信号
    input wire up_down,  // 控制增减的开关
    input wire [3:0] step,  // 步长改变量输入
    output reg [7:0] seg,  // 数码管显示
    output reg [1:0] seg_select  // 数码管选择信号
);

    wire [7:0] bin_count;  // 二进制计数器
    wire clk_1hz;  // 中间连线信号
    wire [3:0] data_disp;  // 显示数据
    wire [3:0] ina, inb, inc;  // 输入数据
    wire [7:0] data;  // 数据输出
    wire [1:0] seg_sel;  // 数码管选择信号

    freq #(.cnt_num(4)) freq_dut(  // 强制传参：#(.cnt_num(4))
        .clk(clk), 
        .rst_n(rst_n), 
        .clk_1hz(clk_1hz)
    );

    counter cnt(
        .clk(clk),
        .rst_n(rst_n),
        .up_down(up_down),
        .step(step),
        .count(bin_count)
    );

    bin2bcd changer(
        .bin_in(bin_count),
        .bcd_out({ina, inb, inc})
    );

    mux mux3(
        .clk(clk_1hz),
        .sel(seg_sel),
        .ina(ina),
        .inb(inb),
        .inc(inc),
        .data_out(data_disp)
    );  

    bcd_coder bcd(
        .yout(data),
        .ain(data_disp)
    );

    always @(*) begin
        seg_select[1:0] = seg_sel[1:0];  // 更新数码管选择信号
        seg[7:0] = data[7:0];  // 更新数码管显示数据
    end

endmodule


