/*
触发器是边沿敏感的存储单元，数据存储的动作由时钟的上升或下降沿触发。在时钟为低或高时，输出端信号保持状态不变。
锁存器是一种对脉冲电平敏感的双稳态电路，它具有0和1两种稳定状态，一旦状态被确定，就能自行保持，直到有外部特定输入脉冲电平作用在电路位置时，才有可能改变状态。
*/
module top_module (
    input d, 
    input ena,
    output q);
    always@(*)begin
        if (ena)
            q <= d;
        else
            q <= q;
    end
endmodule
