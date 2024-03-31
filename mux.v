/*
	input：时钟信号clk、输入信号ina、inb、inc
	output：输出信号data_out、选择信号sel、
	funtion：根据选择信号选择对应的输入信号输出到data_out
*/

module mux(
    input wire clk,   // 输入时钟信号
    input wire [3:0] ina, inb, inc,   // 输入数据信号
    output reg [3:0] data_out,   // 输出数据信号
    output reg [1:0] sel   // 选择信号寄存器
);

    always @(posedge clk) begin
        case(sel)
            2'b00 : begin
                data_out <= ina;   // 选择输入信号ina
                sel <= 2'b01;   // 更新选择信号为01
            end
            2'b01 : begin
                data_out <= inb;   // 选择输入信号inb
                sel <= 2'b10;   // 更新选择信号为10
            end
            2'b10 : begin
                data_out <= inc;   // 选择输入信号inc
                sel <= 2'b00;  // 更新选择信号为00
            end
            default : 
				begin 
					data_out = 4'b0000;   // 默认情况下输出全零
					sel <= 2'b00;
				end
        endcase
    end

endmodule


