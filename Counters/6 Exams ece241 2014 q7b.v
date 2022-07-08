module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0] Q0,Q1,Q2;
    assign c_enable[0] = reset?0:1;
    bcdcount instance0(clk,reset,c_enable[0],Q0);
    assign c_enable[1] = (Q0 == 9)?1:0;
    bcdcount inatance1(clk,reset,c_enable[1],Q1);
    assign c_enable[2] = (Q0 == 9 & Q1 == 9)?1:0;
    bcdcount inatance2(clk,reset,c_enable[2],Q2);
    assign OneHertz = (Q0 == 9 & Q1 == 9 & Q2 == 9 & reset ==0 )?1:0;
    

endmodule
