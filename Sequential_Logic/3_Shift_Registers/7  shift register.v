module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [2:0] q;
    always@(posedge clk)begin
        if(!resetn)
        {q,out} <= 4'b0;
        else
        	{q,out} <= {in,q};
    end
endmodule
