module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [0:7] Q;
    always@(posedge clk)begin
        if(enable)
            Q <= {S,Q[0:6]};
        else
            Q <= Q;
    end
    assign Z = (~A&~B&~C&Q[0]) | (~A&~B&C&Q[1]) | (~A&B&~C&Q[2]) | (~A&B&C&Q[3]) | (A&~B&~C&Q[4]) |(A&~B&C&Q[5]) |(A&B&~C&Q[6])|(A&B&C&Q[7]);
    /*可以改用case更加方便
    always@(*)begin
        case({A,B,C})
            3'b000:Z=Q[0];
            3'b001:Z=Q[1];
            3'b010:Z=Q[2];
            3'b011:Z=Q[3];
            3'b100:Z=Q[4];
            3'b101:Z=Q[5];
            3'b110:Z=Q[6];
            3'b111:Z=Q[7];
        endcase
    end
    */
endmodule
