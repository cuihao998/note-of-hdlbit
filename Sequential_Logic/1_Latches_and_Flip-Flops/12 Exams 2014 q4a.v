module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
	wire temp;
    assign temp = L?R:(E?w:Q);
    always@(posedge clk)begin
        Q <= temp;
    end
endmodule