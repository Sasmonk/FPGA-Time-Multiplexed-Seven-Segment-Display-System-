`timescale 1ns/1ps

module tb_top;

reg clk;
reg reset;

wire [6:0] seg;
wire [3:0] an;


top uut(

    .clk(clk),
    .reset(reset),
    .seg(seg),
    .an(an)

);


// clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end


initial begin

    reset = 1;
    #20;
    reset = 0;

    #100000;

    $finish;

end

endmodule
