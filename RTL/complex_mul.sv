module complex_multiplier #(
    parameter DATA_WIDTH = 16,
    parameter TRUNC = 8
)(
    input  signed [DATA_WIDTH-1:0] a_real,
    input  signed [DATA_WIDTH-1:0] a_imag,
    input  signed [DATA_WIDTH-1:0] b_real,
    input  signed [DATA_WIDTH-1:0] b_imag,
    output signed [DATA_WIDTH-1:0] out_real,
    output signed [DATA_WIDTH-1:0] out_imag
);

    wire signed [(2*DATA_WIDTH)-1:0] real_real;
    wire signed [(2*DATA_WIDTH)-1:0] imag_imag;
    wire signed [(2*DATA_WIDTH)-1:0] real_imag;
    wire signed [(2*DATA_WIDTH)-1:0] imag_real;
    wire signed [(2*DATA_WIDTH)-1:0] out_real_unscaled;
    wire signed [(2*DATA_WIDTH)-1:0] out_imag_unscaled;

    assign real_real = a_real * b_real;
    assign imag_imag = a_imag * b_imag;
    assign real_imag = a_real * b_imag;
    assign imag_real = a_imag * b_real;

    assign out_real_unscaled = (real_real - imag_imag); 
    assign out_imag_unscaled = (real_imag + imag_real) ; 

    assign out_real = out_real_unscaled[ (DATA_WIDTH -1 + TRUNC):TRUNC];   //Truncation
    assign out_imag = out_imag_unscaled[ (DATA_WIDTH -1 + TRUNC):TRUNC];   //Truncation
endmodule 
