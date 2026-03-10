// ============================================================
// Module: top
// Description:
// Top level module connecting all system components.
//
// Modules connected:
// 1. digit_shift_register
// 2. mux_display_controller
// ============================================================

module top(

    input clk,
    input reset,

    output [6:0] seg,
    output [3:0] an

);

wire [15:0] digits;


// shift register generator
digit_shift_register shift_unit(

    .clk(clk),
    .reset(reset),
    .digits(digits)

);


// display controller
mux_display_controller display_unit(

    .clk(clk),
    .reset(reset),
    .digits(digits),

    .an(an),
    .seg(seg)

);

endmodule
