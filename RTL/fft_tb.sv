
module tb_fft;

    // Parameters
    parameter DATA_WIDTH = 16;
    parameter INPUT_WIDTH = 8;
    parameter N = 32;

    // Testbench signals
    reg clk_100mhz;
    reg rst_n;
    reg signed  [INPUT_WIDTH-1:0] input_real [0:N-1];
    wire signed [DATA_WIDTH-1:0] fft_real_out [0:N-1];
    wire signed [DATA_WIDTH-1:0] fft_imag_out [0:N-1];
    wire        fft_out_valid;

    parameter DATA_NUMBER = 32*9;
    
    logic signed [INPUT_WIDTH-1:0] data_in_array [DATA_NUMBER-1:0];

    
    logic signed [32-1:0] fft_out_array [0:DATA_NUMBER-1]; // Packed real & imag
    int output_count = 0;                          // Output collection tracker
    //rect input
   // Rectangular input
reg signed [INPUT_WIDTH-1:0] rect_input [0:31] = '{
     127, 127, 127, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0
};

// Sin input
reg signed [INPUT_WIDTH-1:0] sin_input [0:31] = '{
     0,  25,  49,  70,  91, 107, 119, 126,
   127, 126, 119, 107,  91,  70,  49,  25,
     0, -25, -49, -70, -91,-107,-119,-126,
  -127,-126,-119,-107, -91, -70, -49, -25
};

// Cos input
reg signed [INPUT_WIDTH-1:0] cos_input [0:31] = '{
   127, 126, 119, 107,  91,  70,  49,  25,
     0, -25, -49, -70, -91,-107,-119,-126,
  -127,-126,-119,-107, -91, -70, -49, -25,
     0,  25,  49,  70,  91, 107, 119, 126
};

// Exp input
reg signed [INPUT_WIDTH-1:0] exp_input [0:31] = '{
   127, 112,  98,  86,  75,  66,  57,  51,
    44,  39,  34,  30,  26,  23,  19,  17,
    15,  13,  11,  10,   9,   8,   7,   6,
     5,   5,   4,   4,   3,   3,   3,   2
};

// Triangle input
reg signed [INPUT_WIDTH-1:0] tri_input [0:31] = '{
  -128, -112, -96, -80, -64, -48, -32, -16,
     0,   16,  32,  48,  64,  80,  96, 112,
   127,  112,  96,  80,  64,  48,  32,  16,
     0,  -16, -32, -48, -64, -80, -96, -112
};

//Single Impulse (Delta Function)
reg signed [INPUT_WIDTH-1:0] impulse_input [0:31] = '{
    127, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0
};

//Alternating Sign (Nyquist Frequency)
reg signed [INPUT_WIDTH-1:0] alt_input [0:31] = '{
    127, -127, 127, -127, 127, -127, 127, -127,
   127, -127, 127, -127, 127, -127, 127, -127,
   127, -127, 127, -127, 127, -127, 127, -127,
   127, -127, 127, -127, 127, -127, 127, -127
};

// Step Function
reg signed [INPUT_WIDTH-1:0] step_input [0:31] = '{
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
  127,127,127,127,127,127,127,127,
  127,127,127,127,127,127,127,127
};

//Random Noise Input
reg signed [INPUT_WIDTH-1:0] noise_input [0:31] = '{
    22, -78, 34, 112, -45, 0, 67, -23,
    -90, 11, 35, -127, 127, -64, 12, 98,
    -1, -99, 33, 77, -50, 26, -88, 47,
    13, -19, 76, -31, 62, -84, 5, -43
};


reg data_in_valid;



    // Clock generation (100 MHz)
    initial clk_100mhz = 0;
    always #5 clk_100mhz = ~clk_100mhz;  // 10 ns period -> 100 MHz

// Instantiate the FFT module
fft #(
    .DATA_WIDTH(16),
    .INPUT_WIDTH(8)
) fft_inst (
    .clk_100mhz(clk_100mhz),
    .rst_n(rst_n),
    .data_in_valid(data_in_valid),
    .input_real0(input_real[0]),
    .input_real1(input_real[1]),
    .input_real2(input_real[2]),
    .input_real3(input_real[3]),
    .input_real4(input_real[4]),
    .input_real5(input_real[5]),
    .input_real6(input_real[6]),
    .input_real7(input_real[7]),
    .input_real8(input_real[8]),
    .input_real9(input_real[9]),
    .input_real10(input_real[10]),
    .input_real11(input_real[11]),
    .input_real12(input_real[12]),
    .input_real13(input_real[13]),
    .input_real14(input_real[14]),
    .input_real15(input_real[15]),
    .input_real16(input_real[16]),
    .input_real17(input_real[17]),
    .input_real18(input_real[18]),
    .input_real19(input_real[19]),
    .input_real20(input_real[20]),
    .input_real21(input_real[21]),
    .input_real22(input_real[22]),
    .input_real23(input_real[23]),
    .input_real24(input_real[24]),
    .input_real25(input_real[25]),
    .input_real26(input_real[26]),
    .input_real27(input_real[27]),
    .input_real28(input_real[28]),
    .input_real29(input_real[29]),
    .input_real30(input_real[30]),
    .input_real31(input_real[31]),

    .fft_real_out0(fft_real_out[0]),
    .fft_real_out1(fft_real_out[1]),
    .fft_real_out2(fft_real_out[2]),
    .fft_real_out3(fft_real_out[3]),
    .fft_real_out4(fft_real_out[4]),
    .fft_real_out5(fft_real_out[5]),
    .fft_real_out6(fft_real_out[6]),
    .fft_real_out7(fft_real_out[7]),
    .fft_real_out8(fft_real_out[8]),
    .fft_real_out9(fft_real_out[9]),
    .fft_real_out10(fft_real_out[10]),
    .fft_real_out11(fft_real_out[11]),
    .fft_real_out12(fft_real_out[12]),
    .fft_real_out13(fft_real_out[13]),
    .fft_real_out14(fft_real_out[14]),
    .fft_real_out15(fft_real_out[15]),
    .fft_real_out16(fft_real_out[16]),
    .fft_real_out17(fft_real_out[17]),
    .fft_real_out18(fft_real_out[18]),
    .fft_real_out19(fft_real_out[19]),
    .fft_real_out20(fft_real_out[20]),
    .fft_real_out21(fft_real_out[21]),
    .fft_real_out22(fft_real_out[22]),
    .fft_real_out23(fft_real_out[23]),
    .fft_real_out24(fft_real_out[24]),
    .fft_real_out25(fft_real_out[25]),
    .fft_real_out26(fft_real_out[26]),
    .fft_real_out27(fft_real_out[27]),
    .fft_real_out28(fft_real_out[28]),
    .fft_real_out29(fft_real_out[29]),
    .fft_real_out30(fft_real_out[30]),
    .fft_real_out31(fft_real_out[31]),

    .fft_imag_out0(fft_imag_out[0]),
    .fft_imag_out1(fft_imag_out[1]),
    .fft_imag_out2(fft_imag_out[2]),
    .fft_imag_out3(fft_imag_out[3]),
    .fft_imag_out4(fft_imag_out[4]),
    .fft_imag_out5(fft_imag_out[5]),
    .fft_imag_out6(fft_imag_out[6]),
    .fft_imag_out7(fft_imag_out[7]),
    .fft_imag_out8(fft_imag_out[8]),
    .fft_imag_out9(fft_imag_out[9]),
    .fft_imag_out10(fft_imag_out[10]),
    .fft_imag_out11(fft_imag_out[11]),
    .fft_imag_out12(fft_imag_out[12]),
    .fft_imag_out13(fft_imag_out[13]),
    .fft_imag_out14(fft_imag_out[14]),
    .fft_imag_out15(fft_imag_out[15]),
    .fft_imag_out16(fft_imag_out[16]),
    .fft_imag_out17(fft_imag_out[17]),
    .fft_imag_out18(fft_imag_out[18]),
    .fft_imag_out19(fft_imag_out[19]),
    .fft_imag_out20(fft_imag_out[20]),
    .fft_imag_out21(fft_imag_out[21]),
    .fft_imag_out22(fft_imag_out[22]),
    .fft_imag_out23(fft_imag_out[23]),
    .fft_imag_out24(fft_imag_out[24]),
    .fft_imag_out25(fft_imag_out[25]),
    .fft_imag_out26(fft_imag_out[26]),
    .fft_imag_out27(fft_imag_out[27]),
    .fft_imag_out28(fft_imag_out[28]),
    .fft_imag_out29(fft_imag_out[29]),
    .fft_imag_out30(fft_imag_out[30]),
    .fft_imag_out31(fft_imag_out[31]),

    .fft_out_valid(fft_out_valid)
);
    // Stimulus
    integer i;
    initial begin
for (i = 0; i < 32; i = i + 1) begin
    data_in_array[i] = rect_input[i];
end
for (i = 0; i < 32; i = i + 1) begin
    data_in_array[32 + i] = sin_input[i];
end
for (i = 0; i < 32; i = i + 1) begin
    data_in_array[64 + i] = cos_input[i];
end
for (i = 0; i < 32; i = i + 1) begin
    data_in_array[96 + i] = exp_input[i];
end
for (i = 0; i < 32; i = i + 1) begin
    data_in_array[128 + i] = tri_input[i];
end

for (i = 0; i < 32; i = i + 1) begin
    data_in_array[160 + i] = impulse_input[i];
end

for (i = 0; i < 32; i = i + 1) begin
    data_in_array[192 + i] = alt_input[i];
end
for (i = 0; i < 32; i = i + 1) begin
    data_in_array[224 + i] = step_input[i];
end
for (i = 0; i < 32; i = i + 1) begin
    data_in_array[256 + i] = noise_input[i];
end

        // Reset sequence
        rst_n = 0;
        #20;
        rst_n = 1;

    
    for (int k = 0; k < DATA_NUMBER / 32; k++) begin
        data_in_valid = 1;
    for (i = 0; i < N; i = i + 1) begin
        input_real[i] = data_in_array[k * 32 + i];  // Use offset
    end
        @(posedge fft_out_valid);  
    end
    
    wait(output_count == DATA_NUMBER);
    data_in_valid = 0;
    #20
    // for (int i = 0; i < DATA_NUMBER; i++) begin
    // $display("fft_out_array[%0d] = %0h", i, fft_out_array[i]);
    // end
       $writememh("memory_dump.txt",data_in_array);
       $writememh("data_out.txt", fft_out_array);
        $stop;
    end

always_ff @(posedge clk_100mhz) begin : sample_out
    if (rst_n == 0) begin
        output_count <= 0;
    end else if (fft_out_valid) begin
        for (int j = 0; j < N; j++) begin
            // Pack real (upper 16) and imag (lower 16) parts
            fft_out_array[output_count + j] <= {fft_real_out[j] >>> 3, fft_imag_out[j] >>> 3};
            // $display("FFT[%0d] = %0d + j%0d", output_count + j, fft_real_out[output_count + j] >>>2 , fft_imag_out[output_count + j] >>>2);
        end

        output_count <= output_count + N;

    end
end

endmodule
