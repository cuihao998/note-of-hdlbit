//实现具有高电平同步复位的8个D触发器，同时复位值为0x34，下降沿触发。

module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
    always@(negedge clk)begin
        if (reset == 1)
            q = 8'h 34;  //0x34 是16进制
        else q = d;
    end
endmodule