 module seg_sel(bit_disp,seg_sel);
    input [1:0] bit_disp;
    output reg [3:0] seg_sel;
    always@(bit_disp)
        case(bit_disp)
            2'b00 : seg_sel = 3'b0001;
            2'b01 : seg_sel = 3'b0010;
            2'b10 : seg_sel = 3'b0100;
            default : seg_sel = 3'b1000;
        endcase
endmodule