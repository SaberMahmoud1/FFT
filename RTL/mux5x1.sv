module mux5_1_complex #(
    parameter DATA_WIDTH = 16
)(
    input  wire [DATA_WIDTH-1:0] in0_real,
    input  wire [DATA_WIDTH-1:0] in0_imag,
    input  wire [DATA_WIDTH-1:0] in1_real,
    input  wire [DATA_WIDTH-1:0] in1_imag,
    input  wire [DATA_WIDTH-1:0] in2_real,
    input  wire [DATA_WIDTH-1:0] in2_imag,
    input  wire [DATA_WIDTH-1:0] in3_real,
    input  wire [DATA_WIDTH-1:0] in3_imag,
    input  wire [DATA_WIDTH-1:0] in4_real,
    input  wire [DATA_WIDTH-1:0] in4_imag,
    input  wire [2:0] select, // 3 bits needed for 5 options
    output reg  [DATA_WIDTH-1:0] out_real,
    output reg  [DATA_WIDTH-1:0] out_imag
);

    always @(*) begin
        case (select)
            3'd0: begin out_real = in0_real; out_imag = in0_imag; end
            3'd1: begin out_real = in1_real; out_imag = in1_imag; end
            3'd2: begin out_real = in2_real; out_imag = in2_imag; end
            3'd3: begin out_real = in3_real; out_imag = in3_imag; end
            3'd4: begin out_real = in4_real; out_imag = in4_imag; end
            default: begin out_real = {DATA_WIDTH{1'b0}}; out_imag = {DATA_WIDTH{1'b0}}; end
        endcase
    end

endmodule
