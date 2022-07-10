module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
	always@(posedge clk)begin
        if (load)
            q <= data;
        else if (ena)begin
            case(amount)
                2'b00:begin
                    q[0] <=0;
                    for(int i=0;i<63;i++)begin
                        q[i+1] <= q[i];
                    end
                end
                2'b01:begin
                    q[7:0] <=0;
                    for(int i=0;i<56;i++)begin
                        q[i+8] <= q[i];
                    end
                end
                2'b10:begin
                    for(int i=0;i<63;i++)begin
                        q[i] <= q[i+1];
                    end
                end 
                2'b11:begin
                    q[63:56] <= {8{q[63]}};
                    for (int i=0;i<56;i++)begin
                        q[i] <= q[i+8];
                    end
                end
            endcase
            /* case部分可以用以下来代替
            case(amount)
                2'b00: q <= {q[62:0],1'b0};
                2'b01: q <= {q[55:0],8'b0}};
                2'b10: q <= {q[63],q[63:1]};
                2'b11: q <= {{8{q[63]}},q[63:8]};
            endcase

            */
        end
        else
            q <= q;
    end
endmodule
