module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    reg [17:0] q_2d [17:0];       //定义二维向量，对q的矩阵进行扩展
    reg [2:0] sum;
    always@(*)begin
        q_2d[0] = {q[15*16],q[15*16+:16],q[15*16+15]};
        q_2d[17]= {q[0*16], q[0*16+:16], q[0*16+15]};
        for (int i=1;i<17;i++)begin
            q_2d[i] = {q[16*(i-1)],q[16*(i-1)+:16],q[16*i-1]};
        end
    end
    always@(posedge clk)begin
        if(load)
            q <= data;
        else begin
            for(int m =1;m<17;m++)begin 
                for(int n=1;n<17;n++)begin
                    sum = q_2d[m-1][n-1]+q_2d[m-1][n]+q_2d[m-1][n+1]+
                    q_2d[m][n-1]+q_2d[m][n+1]+
                    q_2d[m+1][n-1]+q_2d[m+1][n]+q_2d[m+1][n+1];
                    case(sum)
                        3'b011:q[(m-1)*16+(n-1)] <= 1'b1;
                        3'b010:q[(m-1)*16+(n-1)] <= q[(m-1)*16+(n-1)];
                        default:q[(m-1)*16+(n-1)] <= 1'b0;
                    endcase
                end
            end
        end
    end          
endmodule
