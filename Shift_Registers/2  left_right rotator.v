module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
    always@(posedge clk)begin
        if (load)
            q <= data;
        else if (ena == 2'b01)begin      // q <= {q[0],q[99:1]};
            q[99] <= q[0];
            for(int i=0;i<99;i++)begin
                q[i] <= q[i+1];
            end
        end
        else if (ena == 2'b10)begin      // q <= {q[98:0],q[99]};
            q[0] <= q[99];
            for(int j=0;j<99;j++)begin
                q[j+1] <= q[j];
            end
        end
        else
            q <= q;
    end
endmodule
