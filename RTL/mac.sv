module mac #(
    parameter DATA_WIDTH = 16,
    parameter TRUNC = 14
)(
    input  signed [DATA_WIDTH-1:0] input_1_real,         // Real part of the input for stage 1 (or from the previous stage for subsequent stages)
    input  signed [DATA_WIDTH-1:0] input_1_imag,         // Imaginary part of the input for stage 1 (or from the previous stage for subsequent stages)
    input  signed [DATA_WIDTH-1:0] twiddle_real,         // Real part of the twiddle factor for the current stage
    input  signed [DATA_WIDTH-1:0] twiddle_imag,         // Imaginary part of the twiddle factor for the current stage
    input  signed [DATA_WIDTH-1:0] input_2_real,         // Real part of the input from the previous stage (for subsequent stages)
    input  signed [DATA_WIDTH-1:0] input_2_imag,         // Imaginary part of the input from the previous stage (for subsequent stages)
    output signed [DATA_WIDTH-1:0] sum_real,           // Real part of the sum output (input_1 + input_2 * twiddle)
    output signed [DATA_WIDTH-1:0] sum_imag,           // Imaginary part of the sum output (input_1 + input_2 * twiddle)
    output signed [DATA_WIDTH-1:0] diff_real,          // Real part of the difference output (input_1 - input_2 * twiddle)
    output signed [DATA_WIDTH-1:0] diff_imag           // Imaginary part of the difference output (input_1 - input_2 * twiddle)
);

    // Internal wires for the multiplication of input_2 by twiddle factor
    wire signed [DATA_WIDTH-1:0] multiplied_input_2_real;  // Real part of (input_2 * twiddle)
    wire signed [DATA_WIDTH-1:0] multiplied_input_2_imag;  // Imaginary part of (input_2 * twiddle)

    // Instantiate the complex multiplier to calculate (input_2 * twiddle)
    complex_multiplier #(.DATA_WIDTH(DATA_WIDTH),.TRUNC(TRUNC)) cmul (
        .a_real(input_2_real),
        .a_imag(input_2_imag),
        .b_real(twiddle_real),
        .b_imag(twiddle_imag),
        .out_real(multiplied_input_2_real),  // Real part of (input_2 * twiddle)
        .out_imag(multiplied_input_2_imag)   // Imaginary part of (input_2 * twiddle)
    );

    // Instantiate the complex adder for computing the sum (input_1 + input_2 * twiddle)
    complex_adder #(.DATA_WIDTH(DATA_WIDTH)) adder (
        .a_real(input_1_real),
        .a_imag(input_1_imag),
        .b_real(multiplied_input_2_real),
        .b_imag(multiplied_input_2_imag),
        .sum_real(sum_real),  // Sum of input_1 and multiplied_input_2
        .sum_imag(sum_imag)   // Sum of input_1 and multiplied_input_2
    );

    // Instantiate the complex subtractor for computing the difference (input_1 - input_2 * twiddle)
    complex_subtractor #(.DATA_WIDTH(DATA_WIDTH)) subtractor (
        .a_real(input_1_real),
        .a_imag(input_1_imag),
        .b_real(multiplied_input_2_real),
        .b_imag(multiplied_input_2_imag),
        .diff_real(diff_real),  // Difference of input_1 and multiplied_input_2
        .diff_imag(diff_imag)   // Difference of input_1 and multiplied_input_2
    );

endmodule
