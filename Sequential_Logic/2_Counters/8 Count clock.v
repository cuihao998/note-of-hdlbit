module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    wire enassten,enammone,enammten,enahhone,enahhten;
    count60 secondone(clk,reset,ena     ,4'b1001,ss[3:0]);
    count60 secondten(clk,reset,enassten,4'b0101,ss[7:4]);
    count60 minuteone(clk,reset,enammone,4'b1001,mm[3:0]);
    count60 minuteten(clk,reset,enammten,4'b0101,mm[7:4]);
    count12 hour(clk,reset,enahhone,pm,hh);
    assign enassten = ena & ss[3:0]==9;
    assign enammone = ena & ss[3:0]==9 & ss[7:4]==5;
    assign enammten = ena & ss[3:0]==9 & ss[7:4]==5 & mm[3:0] ==9;
    assign enahhone = ena & ss[3:0]==9 & ss[7:4]==5 & mm[3:0] ==9 & mm[7:4] ==5;
endmodule
    
module count12(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh);
    wire [3:0] q;
    always@(posedge clk)begin
        if (reset)begin
            pm <= 0;
            q <= 12;
        end
        else begin
            if(ena)begin
                if(q == 12)
                    q <= 1;
                else begin
                    if (q == 11)begin
                        pm <= pm==1?0:1;
                        q <= q+1;
                    end
                    else
                        q <= q+1;
                end
            end
            else
                q <= q;
        end
    end
    assign hh[7:4] = (q>9)? 1:0;
    assign hh[3:0] = (q>9)? (q-10):q;
endmodule

module count60(
    input clk,
    input reset,
    input ena,
    input [3:0] top,
    output [3:0] q);
    always@(posedge clk)begin
        if (reset)
            q = 0;
        else begin
            if(ena)begin
                if(q == top)
                    q <= 0;
                else
                    q <= q+1;
            end
            else
                q <= q;
        end
    end
endmodule