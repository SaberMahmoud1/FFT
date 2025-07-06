module complex_adder #(
    parameter DATA_WIDTH = 16
)(
    input signed  [DATA_WIDTH-1:0] a_real,    // Real part of first input
    input signed  [DATA_WIDTH-1:0] a_imag,    // Imaginary part of first input
    input signed  [DATA_WIDTH-1:0] b_real,    // Real part of second input
    input signed  [DATA_WIDTH-1:0] b_imag,    // Imaginary part of second input
    output signed [DATA_WIDTH-1:0] sum_real, // Real part of the sum
    output signed [DATA_WIDTH-1:0] sum_imag  // Imaginary part of the sum
);

    assign sum_real = a_real + b_real;
    assign sum_imag = a_imag + b_imag;

endmodule
