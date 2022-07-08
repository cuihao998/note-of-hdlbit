module bcdcount(
    input clk,
    input reset,
    input enable,
    output [3:0] q);
    always@(posedge clk)begin
        if (reset)
            q = 0;
        else begin
            if(enable)begin
                if(q == 9)
                    q <= 0;
                else
                    q <= q+1;
            end
            else
                q <= q;
        end
    end
endmodule

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
	wire ena0;
    assign ena0 = 1'b1;
    bcdcount ins1(clk,reset,ena0,q[3:0]);
    bcdcount ins2(clk,reset,ena[1],q[7:4]);
    bcdcount ins3(clk,reset,ena[2],q[11:8]);
    bcdcount ins4(clk,reset,ena[3],q[15:12]);
    assign ena[1] = (q[3:0] == 9)?1:0;
    assign ena[2] = (q[3:0] == 9)&(q[7:4] == 9)?1:0;
    assign ena[3] = (q[3:0] == 9)&(q[7:4] == 9)&(q[11:8] == 9)?1:0;
    
endmodule