// ============================================================
// Module: mux_display_controller
// Description:
// Controls multiplexing of the 4-digit seven segment display.
// Only one digit is active at a time but switching occurs
// fast enough that all digits appear continuously lit.
// ============================================================

module mux_display_controller(

    input clk,
    input reset,
    input [15:0] digits,

    output reg [3:0] an,
    output [6:0] seg

);

reg [1:0] digit_select;
reg [3:0] current_digit;
reg [19:0] refresh_counter;

wire [6:0] seg_out;


// instantiate decoder
seven_seg_decoder decoder(
    .digit(current_digit),
    .seg(seg_out)
);

assign seg = seg_out;


// refresh counter
always @(posedge clk or posedge reset) begin
    if(reset)
        refresh_counter <= 0;
    else
        refresh_counter <= refresh_counter + 1;
end


// select digit
always @(posedge clk or posedge reset) begin
    if(reset)
        digit_select <= 0;
    else if(refresh_counter == 0)
        digit_select <= digit_select + 1;
end


// multiplex logic
always @(*) begin

    case(digit_select)

        2'b00: begin
            an = 4'b1110;
            current_digit = digits[3:0];
        end

        2'b01: begin
            an = 4'b1101;
            current_digit = digits[7:4];
        end

        2'b10: begin
            an = 4'b1011;
            current_digit = digits[11:8];
        end

        2'b11: begin
            an = 4'b0111;
            current_digit = digits[15:12];
        end

    endcase

end

endmodule
