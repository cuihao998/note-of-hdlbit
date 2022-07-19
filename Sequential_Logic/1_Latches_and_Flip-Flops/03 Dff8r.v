//写一个带reset高电平有效复位的D触发器（时钟是上升沿触发）
//reset是同步复位
module top_module (
    input clk,
    input reset,            
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk)begin // 注意不是always @(posedge clk or posedge reset)
        if(reset == 1)
            q <= 8'd0;
        else
            q <= d;
    end
endmodule
