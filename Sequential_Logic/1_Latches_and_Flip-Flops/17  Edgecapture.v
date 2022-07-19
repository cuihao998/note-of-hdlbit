//这里的out一旦发现in有下降沿就变成1，不能被再次更改
//因此不适合用“out[i] = in_last & ~in[i]”,该式在离开下降沿周期后out又可以变成0
module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] in_last;
    always@(posedge clk)begin
        in_last <= in;
        if (reset)
            out <= 32'b0;
        else 
            for (int i=0;i<32;i++)begin
                if (in_last[i] & ~in[i])  
                    out[i] = 1;           
            end
    end
endmodule
