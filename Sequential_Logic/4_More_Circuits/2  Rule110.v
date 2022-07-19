module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    wire [511:0] qleft,qright;
    assign qleft = {1'b0,q[511:1]};
    assign qright= {q[510:0],1'b0};
	always@(posedge clk)begin
        if(load)
            q <= data;
        else 
            q <= (q^qright)|(~qleft&qright);
        
    end
endmodule