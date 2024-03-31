# 8位计数器设计

​       本实验的任务是设计一个8位的计数器，步长的改变量要求从0～15，实验中用拨挡开关模块的K5～K8来作为步长改变量的输入，用K2来控制计数器的增减，具体要求为：当K2输入为高时，计数器为步长可变的加计数器；当K2输入为低时，计数器为步长可变的减计数器。计数器输出值用数码管来表示。实验中计数器的时钟频率为了便于眼睛观察， 位选切换用1Hz的时钟。

## 功能描述

- 计数器范围：0～255
- 步长改变量范围：0～15
- 增减控制：通过开关控制计数器的增减
- 数码管显示：将计数器的值转换为BCD码，并显示在数码管上
- 时钟频率：1Hz用于位选切换

## 模块介绍

### top模块

- 输入：
  - clk：时钟信号
  - rst_n：异步复位信号
  - up_down：控制增减的开关
  - step：步长改变量输入
- 输出：
  - seg：数码管显示
  - seg_select：位选信号

### counter模块

- 输入：
  - clk：时钟信号
  - rst_n：异步复位信号
  - up_down：控制增减的开关
  - step：步长改变量输入
- 输出：
  - count：计数器值

### bin2bcd模块

- 输入：
  - bin_in：二进制输入
- 输出：
  - bcd_out：BCD码输出

### bcd_coder模块

- 输入：
  - ain：BCD码输入
- 输出：
  - yout：数码管显示输出

### freq模块

- 输入：
  - clk：系统时钟
  - rst_n：系统复位信号
- 输出：
  - clk_1hz：1Hz时钟输出

### mux模块

- 输入：
  - clk：时钟信号
  - ina, inb, inc：输入信号
- 输出：
  - data_out：输出信号
  - sel：选择信号

## 使用说明

1. 将设计文件加载到FPGA开发板中
2. 设置拨动开关K5-K8来选择步长改变量
3. 设置拨动开关K2来控制计数器的增减
4. 观察数码管显示的计数器数值

