// ============================================================
// Module: digit_shift_register
// Description:
// Sequential shift register that generates digits 0-9.
// Every clock cycle a new digit is shifted into a
// 4-digit register used by the display controller.
// ============================================================

module digit_shift_register(
    input clk,
    input reset,
    output reg [15:0] digits   // four BCD digits
);

reg [3:0] counter;

// Counter generates digits 0 -> 9 repeatedly
always @(posedge clk or posedge reset) begin
    if(reset)
        counter <= 0;
    else if(counter == 9)
        counter <= 0;
    else
        counter <= counter + 1;
end

// Shift register for 4 digits
always @(posedge clk or posedge reset) begin
    if(reset)
        digits <= 16'h0000;
    else
        digits <= {digits[11:0], counter};
end

endmodule
