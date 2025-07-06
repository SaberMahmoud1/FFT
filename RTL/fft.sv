import twiddle_pkg::*;
module fft #(
    parameter DATA_WIDTH = 16,
    parameter INPUT_WIDTH = 8
) (
    input clk_100mhz,                 // 100 MHz clock (for MAC operations)
    input rst_n,                      // Active-low reset

    // Flattened real input samples
    input data_in_valid,
    input signed [INPUT_WIDTH-1:0] input_real0,
    input signed [INPUT_WIDTH-1:0] input_real1,
    input signed [INPUT_WIDTH-1:0] input_real2,
    input signed [INPUT_WIDTH-1:0] input_real3,
    input signed [INPUT_WIDTH-1:0] input_real4,
    input signed [INPUT_WIDTH-1:0] input_real5,
    input signed [INPUT_WIDTH-1:0] input_real6,
    input signed [INPUT_WIDTH-1:0] input_real7,
    input signed [INPUT_WIDTH-1:0] input_real8,
    input signed [INPUT_WIDTH-1:0] input_real9,
    input signed [INPUT_WIDTH-1:0] input_real10,
    input signed [INPUT_WIDTH-1:0] input_real11,
    input signed [INPUT_WIDTH-1:0] input_real12,
    input signed [INPUT_WIDTH-1:0] input_real13,
    input signed [INPUT_WIDTH-1:0] input_real14,
    input signed [INPUT_WIDTH-1:0] input_real15,
    input signed [INPUT_WIDTH-1:0] input_real16,
    input signed [INPUT_WIDTH-1:0] input_real17,
    input signed [INPUT_WIDTH-1:0] input_real18,
    input signed [INPUT_WIDTH-1:0] input_real19,
    input signed [INPUT_WIDTH-1:0] input_real20,
    input signed [INPUT_WIDTH-1:0] input_real21,
    input signed [INPUT_WIDTH-1:0] input_real22,
    input signed [INPUT_WIDTH-1:0] input_real23,
    input signed [INPUT_WIDTH-1:0] input_real24,
    input signed [INPUT_WIDTH-1:0] input_real25,
    input signed [INPUT_WIDTH-1:0] input_real26,
    input signed [INPUT_WIDTH-1:0] input_real27,
    input signed [INPUT_WIDTH-1:0] input_real28,
    input signed [INPUT_WIDTH-1:0] input_real29,
    input signed [INPUT_WIDTH-1:0] input_real30,
    input signed [INPUT_WIDTH-1:0] input_real31,

    // Flattened FFT output (real part)
    output reg signed [DATA_WIDTH-1:0] fft_real_out0,
    output reg signed [DATA_WIDTH-1:0] fft_real_out1,
    output reg signed [DATA_WIDTH-1:0] fft_real_out2,
    output reg signed [DATA_WIDTH-1:0] fft_real_out3,
    output reg signed [DATA_WIDTH-1:0] fft_real_out4,
    output reg signed [DATA_WIDTH-1:0] fft_real_out5,
    output reg signed [DATA_WIDTH-1:0] fft_real_out6,
    output reg signed [DATA_WIDTH-1:0] fft_real_out7,
    output reg signed [DATA_WIDTH-1:0] fft_real_out8,
    output reg signed [DATA_WIDTH-1:0] fft_real_out9,
    output reg signed [DATA_WIDTH-1:0] fft_real_out10,
    output reg signed [DATA_WIDTH-1:0] fft_real_out11,
    output reg signed [DATA_WIDTH-1:0] fft_real_out12,
    output reg signed [DATA_WIDTH-1:0] fft_real_out13,
    output reg signed [DATA_WIDTH-1:0] fft_real_out14,
    output reg signed [DATA_WIDTH-1:0] fft_real_out15,
    output reg signed [DATA_WIDTH-1:0] fft_real_out16,
    output reg signed [DATA_WIDTH-1:0] fft_real_out17,
    output reg signed [DATA_WIDTH-1:0] fft_real_out18,
    output reg signed [DATA_WIDTH-1:0] fft_real_out19,
    output reg signed [DATA_WIDTH-1:0] fft_real_out20,
    output reg signed [DATA_WIDTH-1:0] fft_real_out21,
    output reg signed [DATA_WIDTH-1:0] fft_real_out22,
    output reg signed [DATA_WIDTH-1:0] fft_real_out23,
    output reg signed [DATA_WIDTH-1:0] fft_real_out24,
    output reg signed [DATA_WIDTH-1:0] fft_real_out25,
    output reg signed [DATA_WIDTH-1:0] fft_real_out26,
    output reg signed [DATA_WIDTH-1:0] fft_real_out27,
    output reg signed [DATA_WIDTH-1:0] fft_real_out28,
    output reg signed [DATA_WIDTH-1:0] fft_real_out29,
    output reg signed [DATA_WIDTH-1:0] fft_real_out30,
    output reg signed [DATA_WIDTH-1:0] fft_real_out31,

    // Flattened FFT output (imaginary part)
    output reg signed [DATA_WIDTH-1:0] fft_imag_out0,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out1,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out2,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out3,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out4,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out5,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out6,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out7,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out8,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out9,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out10,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out11,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out12,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out13,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out14,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out15,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out16,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out17,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out18,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out19,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out20,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out21,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out22,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out23,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out24,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out25,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out26,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out27,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out28,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out29,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out30,
    output reg signed [DATA_WIDTH-1:0] fft_imag_out31,

    output reg fft_out_valid
);

    // wire clk_20mhz;                   // Synchronize signal for 20 MHz clock
    // Signal declarations
    wire signed [DATA_WIDTH-1:0] sample_real[0:31];   // Register for storing input samples
    // Stage control signal (select which stage we're in)
    reg [2:0] stage;  // 3-bit stage counter (5 stages)
    wire[2:0] select;
     
    //mac signals
    logic signed [DATA_WIDTH-1:0] input_1_real [15:0];    // Real part of input 1 for all 16 MACs
    logic signed [DATA_WIDTH-1:0] input_1_imag [15:0];    // Imaginary part of input 1 for all 16 MACs
    logic signed [DATA_WIDTH-1:0] twiddle_real [15:0];    // Real part of twiddle factors for all 16 MACs
    logic signed [DATA_WIDTH-1:0] twiddle_imag [15:0];    // Imaginary part of twiddle factors for all 16 MACs
    logic signed [DATA_WIDTH-1:0] input_2_real [15:0];    // Real part of input 2 for all 16 MACs
    logic signed [DATA_WIDTH-1:0] input_2_imag [15:0];    // Imaginary part of input 2 for all 16 MACs
    logic signed [DATA_WIDTH-1:0] sum_real     [15:0];      // Real part of sum output for all 16 MACs
    logic signed [DATA_WIDTH-1:0] sum_imag     [15:0];      // Imaginary part of sum output for all 16 MACs
    logic signed [DATA_WIDTH-1:0] diff_real    [15:0];     // Real part of diff output for all 16 MACs
    logic signed [DATA_WIDTH-1:0] diff_imag    [15:0];      // Imaginary part of diff output for all 16 MACs
    
    

    //mux signals mac
    wire [DATA_WIDTH-1:0] in0_real[0:31];  // Input 0
    wire [DATA_WIDTH-1:0] in1_real[0:31];  // Input 1
    wire [DATA_WIDTH-1:0] in2_real[0:31];  // Input 2
    wire [DATA_WIDTH-1:0] in3_real[0:31];  // Input 3
    wire [DATA_WIDTH-1:0] in4_real[0:31];  // Input 4

    wire [DATA_WIDTH-1:0] in0_imag[0:31];  // Input 0
    wire [DATA_WIDTH-1:0] in1_imag[0:31];  // Input 1
    wire [DATA_WIDTH-1:0] in2_imag[0:31];  // Input 2
    wire [DATA_WIDTH-1:0] in3_imag[0:31];  // Input 3
    wire [DATA_WIDTH-1:0] in4_imag[0:31];  // Input 4
    
    //mux signals twiddle
    wire signed [TWIDDLE_SIZE-1:0] twiddle_in0_real[16-1:0];  // Input 0
    wire signed [TWIDDLE_SIZE-1:0] twiddle_in1_real[16-1:0];  // Input 1
    wire signed [TWIDDLE_SIZE-1:0] twiddle_in2_real[16-1:0];  // Input 2
    wire signed [TWIDDLE_SIZE-1:0] twiddle_in3_real[16-1:0];  // Input 3
    wire signed [TWIDDLE_SIZE-1:0] twiddle_in4_real[16-1:0];  // Input 4

    wire signed [TWIDDLE_SIZE-1:0] twiddle_in0_imag[16-1:0];  // Input 0
    wire signed [TWIDDLE_SIZE-1:0] twiddle_in1_imag[16-1:0];  // Input 1
    wire signed [TWIDDLE_SIZE-1:0] twiddle_in2_imag[16-1:0];  // Input 2
    wire signed [TWIDDLE_SIZE-1:0] twiddle_in3_imag[16-1:0];  // Input 3
    wire signed [TWIDDLE_SIZE-1:0] twiddle_in4_imag[16-1:0];  // Input 4

    // wire [2:0] select;          // 3-bit select signal (needs at least 3 bits for 5 inputs)
    //mac muxes out
    wire [DATA_WIDTH-1:0] mux_out_real[0:31];   // Output
    wire [DATA_WIDTH-1:0] mux_out_imag[0:31];

    //twiddle muxes out
    wire signed [15:0] twiddle_mux_out_real[16-1:0];   // Output
    wire signed [15:0] twiddle_mux_out_imag[16-1:0];

    //multiplier outputs
    reg signed [DATA_WIDTH-1:0] sum_real_r  [15:0];      // Real part of sum output for all 16 MACs
    reg signed [DATA_WIDTH-1:0] sum_imag_r  [15:0];      // Imaginary part of sum output for all 16 MACs
    reg signed [DATA_WIDTH-1:0] diff_real_r [15:0];     // Real part of diff output for all 16 MACs
    reg signed [DATA_WIDTH-1:0] diff_imag_r [15:0];      // Imaginary part of diff output for all 16 MACs
   

// assign select = stage;

    /*connect muxes data for mac*/
//1st MAC
 //1st mux
 assign in0_real[0] = sample_real [0]; 
 assign in1_real[0] = sum_real_r  [0];
 assign in2_real[0] = sum_real_r  [0];
 assign in3_real[0] = sum_real_r  [0];
 assign in4_real[0] = sum_real_r  [0];

 assign in0_imag[0] = 16'b0;
 assign in1_imag[0] = sum_imag_r  [0];
 assign in2_imag[0] = sum_imag_r  [0];
 assign in3_imag[0] = sum_imag_r  [0];
 assign in4_imag[0] = sum_imag_r  [0];

 //2nd mux
 assign in0_real[1] = sample_real [16]; 
 assign in1_real[1] = sum_real_r  [1];
 assign in2_real[1] = sum_real_r  [2];
 assign in3_real[1] = sum_real_r  [4];
 assign in4_real[1] = sum_real_r  [8];

 assign in0_imag[1] = 16'b0;
 assign in1_imag[1] = sum_imag_r  [1];
 assign in2_imag[1] = sum_imag_r  [2];
 assign in3_imag[1] = sum_imag_r  [4];
 assign in4_imag[1] = sum_imag_r  [8];

//2nd MAC
 //3rd mux
 assign in0_real[2] = sample_real [8]; 
 assign in1_real[2] = diff_real_r [0];
 assign in2_real[2] = sum_real_r  [1];
 assign in3_real[2] = sum_real_r  [1];
 assign in4_real[2] = sum_real_r  [1];

 assign in0_imag[2] = 16'b0;
 assign in1_imag[2] = diff_imag_r [0];
 assign in2_imag[2] = sum_imag_r  [1];
 assign in3_imag[2] = sum_imag_r  [1];
 assign in4_imag[2] = sum_imag_r  [1];

 //4th mux
 assign in0_real[3] = sample_real [24];
 assign in1_real[3] = diff_real_r [1];
 assign in2_real[3] = sum_real_r  [3];
 assign in3_real[3] = sum_real_r  [5];
 assign in4_real[3] = sum_real_r  [9];

 assign in0_imag[3] = 16'b0;
 assign in1_imag[3] = diff_imag_r [1];
 assign in2_imag[3] = sum_imag_r  [3];
 assign in3_imag[3] = sum_imag_r  [5];
 assign in4_imag[3] = sum_imag_r  [9];

//3rd MAC
 //5th mux
 assign in0_real[4] = sample_real [4];
 assign in1_real[4] = sum_real_r  [2];
 assign in2_real[4] = diff_real_r [0];
 assign in3_real[4] = sum_real_r  [2];
 assign in4_real[4] = sum_real_r  [2];

 assign in0_imag[4] = 16'b0;
 assign in1_imag[4] = sum_imag_r  [2];
 assign in2_imag[4] = diff_imag_r [0];
 assign in3_imag[4] = sum_imag_r  [2];
 assign in4_imag[4] = sum_imag_r  [2];


 //6th mux
 assign in0_real[5] = sample_real [20];
 assign in1_real[5] = sum_real_r  [3];
 assign in2_real[5] = diff_real_r [2];
 assign in3_real[5] = sum_real_r  [6];
 assign in4_real[5] = sum_real_r  [10];

 assign in0_imag[5] = 16'b0;
 assign in1_imag[5] = sum_imag_r  [3];
 assign in2_imag[5] = diff_imag_r [2];
 assign in3_imag[5] = sum_imag_r  [6];
 assign in4_imag[5] = sum_imag_r  [10];

//4th MAC
 //7th mux
 assign in0_real[6] = sample_real [12];
 assign in1_real[6] = diff_real_r [2];
 assign in2_real[6] = diff_real_r [1];
 assign in3_real[6] = sum_real_r [3];
 assign in4_real[6] = sum_real_r  [3];

 assign in0_imag[6] = 16'b0;
 assign in1_imag[6] = diff_imag_r [2];
 assign in2_imag[6] = diff_imag_r [1];
 assign in3_imag[6] = sum_imag_r [3];
 assign in4_imag[6] = sum_imag_r  [3];

 //8th mux
 assign in0_real[7] = sample_real [28];
 assign in1_real[7] = diff_real_r [3];
 assign in2_real[7] = diff_real_r [3];
 assign in3_real[7] = sum_real_r [7];
 assign in4_real[7] = sum_real_r  [11];

 assign in0_imag[7] = 16'b0;
 assign in1_imag[7] = diff_imag_r [3];
 assign in2_imag[7] = diff_imag_r [3];
 assign in3_imag[7] = sum_imag_r [7];
 assign in4_imag[7] = sum_imag_r  [11];

//5th MAC
 //9th mux
 assign in0_real[8] = sample_real [2];
 assign in1_real[8] = sum_real_r [4];
 assign in2_real[8] = sum_real_r [4];
 assign in3_real[8] = diff_real_r [0];
 assign in4_real[8] = sum_real_r [4];

 assign in0_imag[8] = 16'b0;
 assign in1_imag[8] = sum_imag_r [4];
 assign in2_imag[8] = sum_imag_r [4];
 assign in3_imag[8] = diff_imag_r [0];
 assign in4_imag[8] = sum_imag_r [4];

 //10th mux
 assign in0_real[9] = sample_real [18];
 assign in1_real[9] = sum_real_r [5];
 assign in2_real[9] = sum_real_r [6];
 assign in3_real[9] = diff_real_r [4];
 assign in4_real[9] = sum_real_r [12];

 assign in0_imag[9] = 16'b0;
 assign in1_imag[9] = sum_imag_r [5];
 assign in2_imag[9] = sum_imag_r [6];
 assign in3_imag[9] = diff_imag_r [4];
 assign in4_imag[9] = sum_imag_r [12];

//6th MAC
 //11th mux
 assign in0_real[10] = sample_real [10];
 assign in1_real[10] = diff_real_r [4];
 assign in2_real[10] = sum_real_r [5];
 assign in3_real[10] = diff_real_r [2];
 assign in4_real[10] = sum_real_r [5];

 assign in0_imag[10] = 16'b0;
 assign in1_imag[10] = diff_imag_r [4];
 assign in2_imag[10] = sum_imag_r [5];
 assign in3_imag[10] = diff_imag_r [2];
 assign in4_imag[10] = sum_imag_r [5];

 //12th mux
 assign in0_real[11] = sample_real [26];
 assign in1_real[11] = diff_real_r [5];
 assign in2_real[11] = sum_real_r [7];
 assign in3_real[11] = diff_real_r [5];
 assign in4_real[11] = sum_real_r [13];

 assign in0_imag[11] = 16'b0;
 assign in1_imag[11] = diff_imag_r [5];
 assign in2_imag[11] = sum_imag_r [7];
 assign in3_imag[11] = diff_imag_r [5];
 assign in4_imag[11] = sum_imag_r [13];

//7th MAC
 //13th mux
 assign in0_real[12] = sample_real [6];
 assign in1_real[12] = sum_real_r  [6];
 assign in2_real[12] = diff_real_r [4];
 assign in3_real[12] = diff_real_r [2];
 assign in4_real[12] = sum_real_r  [6];

 assign in0_imag[12] = 16'b0;
 assign in1_imag[12] = sum_imag_r  [6];
 assign in2_imag[12] = diff_imag_r [4];
 assign in3_imag[12] = diff_imag_r [2];
 assign in4_imag[12] = sum_imag_r  [6];

 //14th mux
 assign in0_real[13] = sample_real [22];
 assign in1_real[13] = sum_real_r [7];
 assign in2_real[13] = diff_real_r [6];
 assign in3_real[13] = diff_real_r [6];
 assign in4_real[13] = sum_real_r [14];

 assign in0_imag[13] = 16'b0;
 assign in1_imag[13] = sum_imag_r [7];
 assign in2_imag[13] = diff_imag_r [6];
 assign in3_imag[13] = diff_imag_r [6];
 assign in4_imag[13] = sum_imag_r [14];

//8th MAC
 // 15th mux
 assign in0_real[14] = sample_real [14];
 assign in1_real[14] = diff_real_r [6];
 assign in2_real[14] = diff_real_r [5];
 assign in3_real[14] = diff_real_r [3];
 assign in4_real[14] = sum_real_r  [7];

 assign in0_imag[14] = 16'b0;
 assign in1_imag[14] = diff_imag_r [6];
 assign in2_imag[14] = diff_imag_r [5];
 assign in3_imag[14] = diff_imag_r [3];
 assign in4_imag[14] = sum_imag_r  [7];

 // 16th mux
 assign in0_real[15] = sample_real [30];
 assign in1_real[15] = diff_real_r [7];
 assign in2_real[15] = diff_real_r [7];
 assign in3_real[15] = diff_real_r [7];
 assign in4_real[15] = sum_real_r  [15];

 assign in0_imag[15] = 16'b0;
 assign in1_imag[15] = diff_imag_r [7];
 assign in2_imag[15] = diff_imag_r [7];
 assign in3_imag[15] = diff_imag_r [7];
 assign in4_imag[15] = sum_imag_r  [15];

//9th MAC
 //17th mux
 assign in0_real[16] = sample_real [1]; 
 assign in1_real[16] = sum_real_r  [8];
 assign in2_real[16] = sum_real_r  [8];
 assign in3_real[16] = sum_real_r  [8];
 assign in4_real[16] = diff_real_r [0];

 assign in0_imag[16] = 16'b0;
 assign in1_imag[16] = sum_imag_r  [8];
 assign in2_imag[16] = sum_imag_r  [8];
 assign in3_imag[16] = sum_imag_r  [8];
 assign in4_imag[16] = diff_imag_r  [0];
 //18th mux
 assign in0_real[17] = sample_real [17]; 
 assign in1_real[17] = sum_real_r  [9];
 assign in2_real[17] = sum_real_r  [10];
 assign in3_real[17] = sum_real_r  [12];
 assign in4_real[17] = diff_real_r [8];

 assign in0_imag[17] = 16'b0;
 assign in1_imag[17] = sum_imag_r  [9];
 assign in2_imag[17] = sum_imag_r  [10];
 assign in3_imag[17] = sum_imag_r  [12];
 assign in4_imag[17] = diff_imag_r  [8];

//10th MAC
 //19th mux
 assign in0_real[18] = sample_real [9]; 
 assign in1_real[18] = diff_real_r [8];
 assign in2_real[18] = sum_real_r  [9];
 assign in3_real[18] = sum_real_r  [9];
 assign in4_real[18] = diff_real_r [1];

 assign in0_imag[18] = 16'b0;
 assign in1_imag[18] = diff_imag_r [8];
 assign in2_imag[18] = sum_imag_r  [9];
 assign in3_imag[18] = sum_imag_r  [9];
 assign in4_imag[18] = diff_imag_r [1];

 //20th mux
 assign in0_real[19] = sample_real [25]; 
 assign in1_real[19] = diff_real_r [9];
 assign in2_real[19] = sum_real_r  [11];
 assign in3_real[19] = sum_real_r  [13];
 assign in4_real[19] = diff_real_r  [9];

 assign in0_imag[19] = 16'b0;
 assign in1_imag[19] = diff_imag_r  [9];
 assign in2_imag[19] = sum_imag_r  [11];
 assign in3_imag[19] = sum_imag_r  [13];
 assign in4_imag[19] = diff_imag_r [9];

//11th MAC
 //21th mux
 assign in0_real[20] = sample_real [5]; 
 assign in1_real[20] = sum_real_r [10];
 assign in2_real[20] = diff_real_r [8];
 assign in3_real[20] = sum_real_r [10];
 assign in4_real[20] = diff_real_r [2];

 assign in0_imag[20] = 16'b0;
 assign in1_imag[20] = sum_imag_r [10];
 assign in2_imag[20] = diff_imag_r [8];
 assign in3_imag[20] = sum_imag_r [10];
 assign in4_imag[20] = diff_imag_r  [2];

 //22th mux
 assign in0_real[21] = sample_real [21]; 
 assign in1_real[21] = sum_real_r  [11];
 assign in2_real[21] = diff_real_r [10];
 assign in3_real[21] = sum_real_r  [14];
 assign in4_real[21] = diff_real_r [10];

 assign in0_imag[21] = 16'b0;
 assign in1_imag[21] = sum_imag_r  [11];
 assign in2_imag[21] = diff_imag_r  [10];
 assign in3_imag[21] = sum_imag_r  [14];
 assign in4_imag[21] = diff_imag_r  [10];

//12th MAC
 //23th mux
 assign in0_real[22] = sample_real [13]; 
 assign in1_real[22] = diff_real_r [10];
 assign in2_real[22] = diff_real_r  [9];
 assign in3_real[22] = sum_real_r  [11];
 assign in4_real[22] = diff_real_r  [3];

 assign in0_imag[22] = 16'b0;
 assign in1_imag[22] = diff_imag_r  [10];
 assign in2_imag[22] = diff_imag_r  [9];
 assign in3_imag[22] = sum_imag_r   [11];
 assign in4_imag[22] = diff_imag_r  [3];

 //24th mux
 assign in0_real[23] = sample_real [29]; 
 assign in1_real[23] = diff_real_r [11];
 assign in2_real[23] = diff_real_r [11];
 assign in3_real[23] = sum_real_r  [15];
 assign in4_real[23] = diff_real_r [11];

 assign in0_imag[23] = 16'b0;
 assign in1_imag[23] = diff_imag_r [11];
 assign in2_imag[23] = diff_imag_r [11];
 assign in3_imag[23] = sum_imag_r  [15];
 assign in4_imag[23] = diff_imag_r [11];

//13th MAC
 //25th mux
 assign in0_real[24] = sample_real [3]; 
 assign in1_real[24] = sum_real_r [12];
 assign in2_real[24] = sum_real_r [12];
 assign in3_real[24] = diff_real_r [8];
 assign in4_real[24] = diff_real_r [4];

 assign in0_imag[24] = 16'b0;
 assign in1_imag[24] = sum_imag_r  [12];
 assign in2_imag[24] = sum_imag_r  [12];
 assign in3_imag[24] = diff_imag_r  [8];
 assign in4_imag[24] = diff_imag_r  [4];

 //26th mux
 assign in0_real[25] = sample_real [19]; 
 assign in1_real[25] = sum_real_r [13];
 assign in2_real[25] = sum_real_r [14];
 assign in3_real[25] = diff_real_r [12];
 assign in4_real[25] = diff_real_r [12];

 assign in0_imag[25] = 16'b0;
 assign in1_imag[25] = sum_imag_r  [13];
 assign in2_imag[25] = sum_imag_r  [14];
 assign in3_imag[25] = diff_imag_r  [12];
 assign in4_imag[25] = diff_imag_r  [12];

//14th MAC
 //27th mux
 assign in0_real[26] = sample_real [11]; 
 assign in1_real[26] = diff_real_r [12];
 assign in2_real[26] = sum_real_r  [13];
 assign in3_real[26] = diff_real_r  [9];
 assign in4_real[26] = diff_real_r  [5];

 assign in0_imag[26] = 16'b0;
 assign in1_imag[26] = diff_imag_r [12];
 assign in2_imag[26] = sum_imag_r  [13];
 assign in3_imag[26] = diff_imag_r  [9];
 assign in4_imag[26] = diff_imag_r  [5];

 //28th mux
 assign in0_real[27] = sample_real [27]; 
 assign in1_real[27] = diff_real_r [13];
 assign in2_real[27] = sum_real_r  [15];
 assign in3_real[27] = diff_real_r [13];
 assign in4_real[27] = diff_real_r [13];

 assign in0_imag[27] = 16'b0; 
 assign in1_imag[27] = diff_imag_r [13];
 assign in2_imag[27] = sum_imag_r  [15];
 assign in3_imag[27] = diff_imag_r [13];
 assign in4_imag[27] = diff_imag_r [13];

//15th MAC
 //29th mux
 assign in0_real[28] = sample_real [7]; 
 assign in1_real[28] = sum_real_r [14];
 assign in2_real[28] = diff_real_r [12];
 assign in3_real[28] = diff_real_r  [10];
 assign in4_real[28] = diff_real_r  [6];

 assign in0_imag[28] = 16'b0;
 assign in1_imag[28] = sum_imag_r  [14];
 assign in2_imag[28] = diff_imag_r  [12];
 assign in3_imag[28] = diff_imag_r  [10];
 assign in4_imag[28] = diff_imag_r  [6];

 //30th mux
 assign in0_real[29] = sample_real [23]; 
 assign in1_real[29] = sum_real_r [15];
 assign in2_real[29] = diff_real_r  [14];
 assign in3_real[29] = diff_real_r  [14];
 assign in4_real[29] = diff_real_r  [14];

 assign in0_imag[29] = 16'b0;
 assign in1_imag[29] = sum_imag_r  [15];
 assign in2_imag[29] = diff_imag_r  [14];
 assign in3_imag[29] = diff_imag_r  [14];
 assign in4_imag[29] = diff_imag_r  [14];

// 16th MAC
 //31th mux
 assign in0_real[30] = sample_real [15]; 
 assign in1_real[30] = diff_real_r [14];
 assign in2_real[30] = diff_real_r  [13];
 assign in3_real[30] = diff_real_r  [11];
 assign in4_real[30] = diff_real_r  [7];

 assign in0_imag[30] = 16'b0;
 assign in1_imag[30] = diff_imag_r  [14];
 assign in2_imag[30] = diff_imag_r  [13];
 assign in3_imag[30] = diff_imag_r  [11];
 assign in4_imag[30] = diff_imag_r  [7];

 //32th mux
 assign in0_real[31] = sample_real [31]; 
 assign in1_real[31] = diff_real_r [15];
 assign in2_real[31] = diff_real_r [15];
 assign in3_real[31] = diff_real_r [15];
 assign in4_real[31] = diff_real_r [15];

 assign in0_imag[31] = 16'b0;
 assign in1_imag[31] = diff_imag_r  [15];
 assign in2_imag[31] = diff_imag_r  [15];
 assign in3_imag[31] = diff_imag_r  [15];
 assign in4_imag[31] = diff_imag_r  [15];

    /*connect muxes for twiddles*/
//first mux 2nd mac
assign twiddle_in0_real[0] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[0] = TWIDDLE_REAL  [8];
assign twiddle_in2_real[0] = TWIDDLE_REAL  [4];
assign twiddle_in3_real[0] = TWIDDLE_REAL  [2];
assign twiddle_in4_real[0] = TWIDDLE_REAL  [1];

assign twiddle_in0_imag[0] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[0] = TWIDDLE_IMAG  [8];
assign twiddle_in2_imag[0] = TWIDDLE_IMAG  [4];
assign twiddle_in3_imag[0] = TWIDDLE_IMAG  [2];
assign twiddle_in4_imag[0] = TWIDDLE_IMAG  [1];

//2nd mux 3nd mac
assign twiddle_in0_real[1] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[1] = TWIDDLE_REAL  [0];
assign twiddle_in2_real[1] = TWIDDLE_REAL  [8];
assign twiddle_in3_real[1] = TWIDDLE_REAL  [4];
assign twiddle_in4_real[1] = TWIDDLE_REAL  [2];

assign twiddle_in0_imag[1] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[1] = TWIDDLE_IMAG  [0];
assign twiddle_in2_imag[1] = TWIDDLE_IMAG  [8];
assign twiddle_in3_imag[1] = TWIDDLE_IMAG  [4];
assign twiddle_in4_imag[1] = TWIDDLE_IMAG  [2];

//3rd mux
assign twiddle_in0_real[2] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[2] = TWIDDLE_REAL  [8];
assign twiddle_in2_real[2] = TWIDDLE_REAL  [12];
assign twiddle_in3_real[2] = TWIDDLE_REAL  [6];
assign twiddle_in4_real[2] = TWIDDLE_REAL  [3];

assign twiddle_in0_imag[2] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[2] = TWIDDLE_IMAG  [8];
assign twiddle_in2_imag[2] = TWIDDLE_IMAG  [12];
assign twiddle_in3_imag[2] = TWIDDLE_IMAG  [6];
assign twiddle_in4_imag[2] = TWIDDLE_IMAG  [3]; 

//4th
assign twiddle_in0_real[3] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[3] = TWIDDLE_REAL  [0];
assign twiddle_in2_real[3] = TWIDDLE_REAL  [0];
assign twiddle_in3_real[3] = TWIDDLE_REAL  [8];
assign twiddle_in4_real[3] = TWIDDLE_REAL  [4];

assign twiddle_in0_imag[3] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[3] = TWIDDLE_IMAG  [0];
assign twiddle_in2_imag[3] = TWIDDLE_IMAG  [0];
assign twiddle_in3_imag[3] = TWIDDLE_IMAG  [8];
assign twiddle_in4_imag[3] = TWIDDLE_IMAG  [4];

//5th
assign twiddle_in0_real[4] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[4] = TWIDDLE_REAL  [8];
assign twiddle_in2_real[4] = TWIDDLE_REAL  [4];
assign twiddle_in3_real[4] = TWIDDLE_REAL  [10];
assign twiddle_in4_real[4] = TWIDDLE_REAL  [5];

assign twiddle_in0_imag[4] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[4] = TWIDDLE_IMAG  [8];
assign twiddle_in2_imag[4] = TWIDDLE_IMAG  [4];
assign twiddle_in3_imag[4] = TWIDDLE_IMAG  [10];
assign twiddle_in4_imag[4] = TWIDDLE_IMAG  [5];

//6th
assign twiddle_in0_real[5] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[5] = TWIDDLE_REAL  [0];
assign twiddle_in2_real[5] = TWIDDLE_REAL  [8];
assign twiddle_in3_real[5] = TWIDDLE_REAL  [12];
assign twiddle_in4_real[5] = TWIDDLE_REAL  [6];

assign twiddle_in0_imag[5] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[5] = TWIDDLE_IMAG  [0];
assign twiddle_in2_imag[5] = TWIDDLE_IMAG  [8];
assign twiddle_in3_imag[5] = TWIDDLE_IMAG  [12];
assign twiddle_in4_imag[5] = TWIDDLE_IMAG  [6];

//7th
assign twiddle_in0_real[6] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[6] = TWIDDLE_REAL  [8];
assign twiddle_in2_real[6] = TWIDDLE_REAL  [12];
assign twiddle_in3_real[6] = TWIDDLE_REAL  [14];
assign twiddle_in4_real[6] = TWIDDLE_REAL  [7];

assign twiddle_in0_imag[6] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[6] = TWIDDLE_IMAG  [8];
assign twiddle_in2_imag[6] = TWIDDLE_IMAG  [12];
assign twiddle_in3_imag[6] = TWIDDLE_IMAG  [14];
assign twiddle_in4_imag[6] = TWIDDLE_IMAG  [7];

//8th
assign twiddle_in0_real[7] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[7] = TWIDDLE_REAL  [0];
assign twiddle_in2_real[7] = TWIDDLE_REAL  [0];
assign twiddle_in3_real[7] = TWIDDLE_REAL  [0];
assign twiddle_in4_real[7] = TWIDDLE_REAL  [8];

assign twiddle_in0_imag[7] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[7] = TWIDDLE_IMAG  [0];
assign twiddle_in2_imag[7] = TWIDDLE_IMAG  [0];
assign twiddle_in3_imag[7] = TWIDDLE_IMAG  [0];
assign twiddle_in4_imag[7] = TWIDDLE_IMAG  [8];

//9th
assign twiddle_in0_real[8] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[8] = TWIDDLE_REAL  [8];
assign twiddle_in2_real[8] = TWIDDLE_REAL  [4];
assign twiddle_in3_real[8] = TWIDDLE_REAL  [2];
assign twiddle_in4_real[8] = TWIDDLE_REAL  [9];

assign twiddle_in0_imag[8] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[8] = TWIDDLE_IMAG  [8];
assign twiddle_in2_imag[8] = TWIDDLE_IMAG  [4];
assign twiddle_in3_imag[8] = TWIDDLE_IMAG  [2];
assign twiddle_in4_imag[8] = TWIDDLE_IMAG  [9];

//10th
assign twiddle_in0_real[9] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[9] = TWIDDLE_REAL  [0];
assign twiddle_in2_real[9] = TWIDDLE_REAL  [8];
assign twiddle_in3_real[9] = TWIDDLE_REAL  [4];
assign twiddle_in4_real[9] = TWIDDLE_REAL  [10];

assign twiddle_in0_imag[9] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[9] = TWIDDLE_IMAG  [0];
assign twiddle_in2_imag[9] = TWIDDLE_IMAG  [8];
assign twiddle_in3_imag[9] = TWIDDLE_IMAG  [4];
assign twiddle_in4_imag[9] = TWIDDLE_IMAG  [10];

//11th
assign twiddle_in0_real[10] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[10] = TWIDDLE_REAL  [8];
assign twiddle_in2_real[10] = TWIDDLE_REAL  [12];
assign twiddle_in3_real[10] = TWIDDLE_REAL  [6];
assign twiddle_in4_real[10] = TWIDDLE_REAL  [11];

assign twiddle_in0_imag[10] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[10] = TWIDDLE_IMAG  [8];
assign twiddle_in2_imag[10] = TWIDDLE_IMAG  [12];
assign twiddle_in3_imag[10] = TWIDDLE_IMAG  [6];
assign twiddle_in4_imag[10] = TWIDDLE_IMAG  [11];

//12th mux
assign twiddle_in0_real[11] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[11] = TWIDDLE_REAL  [0];
assign twiddle_in2_real[11] = TWIDDLE_REAL  [0];
assign twiddle_in3_real[11] = TWIDDLE_REAL  [8];
assign twiddle_in4_real[11] = TWIDDLE_REAL  [12];

assign twiddle_in0_imag[11] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[11] = TWIDDLE_IMAG  [0];
assign twiddle_in2_imag[11] = TWIDDLE_IMAG  [0];
assign twiddle_in3_imag[11] = TWIDDLE_IMAG  [8];
assign twiddle_in4_imag[11] = TWIDDLE_IMAG  [12];

//13th mux
assign twiddle_in0_real[12] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[12] = TWIDDLE_REAL  [8];
assign twiddle_in2_real[12] = TWIDDLE_REAL  [4];
assign twiddle_in3_real[12] = TWIDDLE_REAL  [10];
assign twiddle_in4_real[12] = TWIDDLE_REAL  [13];

assign twiddle_in0_imag[12] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[12] = TWIDDLE_IMAG  [8];
assign twiddle_in2_imag[12] = TWIDDLE_IMAG  [4];
assign twiddle_in3_imag[12] = TWIDDLE_IMAG  [10];
assign twiddle_in4_imag[12] = TWIDDLE_IMAG  [13];

//14th mux
assign twiddle_in0_real[13] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[13] = TWIDDLE_REAL  [0];
assign twiddle_in2_real[13] = TWIDDLE_REAL  [8];
assign twiddle_in3_real[13] = TWIDDLE_REAL  [12];
assign twiddle_in4_real[13] = TWIDDLE_REAL  [14];

assign twiddle_in0_imag[13] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[13] = TWIDDLE_IMAG  [0];
assign twiddle_in2_imag[13] = TWIDDLE_IMAG  [8];
assign twiddle_in3_imag[13] = TWIDDLE_IMAG  [12];
assign twiddle_in4_imag[13] = TWIDDLE_IMAG  [14];

//15th mux
assign twiddle_in0_real[14] = TWIDDLE_REAL  [0]; 
assign twiddle_in1_real[14] = TWIDDLE_REAL  [8];
assign twiddle_in2_real[14] = TWIDDLE_REAL  [12];
assign twiddle_in3_real[14] = TWIDDLE_REAL  [14];
assign twiddle_in4_real[14] = TWIDDLE_REAL  [15];

assign twiddle_in0_imag[14] = TWIDDLE_IMAG  [0];
assign twiddle_in1_imag[14] = TWIDDLE_IMAG  [8];
assign twiddle_in2_imag[14] = TWIDDLE_IMAG  [12];
assign twiddle_in3_imag[14] = TWIDDLE_IMAG  [14];
assign twiddle_in4_imag[14] = TWIDDLE_IMAG  [15];

//conections of the mux out to the mac input
//mac 0
assign twiddle_real[0] = TWIDDLE_REAL[0];
assign twiddle_imag[0] = TWIDDLE_IMAG[0];

//mac 1
assign twiddle_real[1] = twiddle_mux_out_real[0];
assign twiddle_imag[1] = twiddle_mux_out_imag[0];

//mac 2
assign twiddle_real[2] = twiddle_mux_out_real[1];
assign twiddle_imag[2] = twiddle_mux_out_imag[1];

//mac 3
assign twiddle_real[3] = twiddle_mux_out_real[2];
assign twiddle_imag[3] = twiddle_mux_out_imag[2];

//mac 4
assign twiddle_real[4] = twiddle_mux_out_real[3];
assign twiddle_imag[4] = twiddle_mux_out_imag[3];

//mac 5
assign twiddle_real[5] = twiddle_mux_out_real[4];
assign twiddle_imag[5] = twiddle_mux_out_imag[4];

//mac 6
assign twiddle_real[6] = twiddle_mux_out_real[5];
assign twiddle_imag[6] = twiddle_mux_out_imag[5];

//mac 7
assign twiddle_real[7] = twiddle_mux_out_real[6];
assign twiddle_imag[7] = twiddle_mux_out_imag[6];

//mac 8
assign twiddle_real[8] = twiddle_mux_out_real[7];
assign twiddle_imag[8] = twiddle_mux_out_imag[7];

//mac 9
assign twiddle_real[9] = twiddle_mux_out_real[8];
assign twiddle_imag[9] = twiddle_mux_out_imag[8];

//mac 10
assign twiddle_real[10] = twiddle_mux_out_real[9];
assign twiddle_imag[10] = twiddle_mux_out_imag[9];

//mac 11
assign twiddle_real[11] = twiddle_mux_out_real[10];
assign twiddle_imag[11] = twiddle_mux_out_imag[10];

//mac 12
assign twiddle_real[12] = twiddle_mux_out_real[11];
assign twiddle_imag[12] = twiddle_mux_out_imag[11];

//mac 13
assign twiddle_real[13] = twiddle_mux_out_real[12];
assign twiddle_imag[13] = twiddle_mux_out_imag[12];

//mac 14
assign twiddle_real[14] = twiddle_mux_out_real[13];
assign twiddle_imag[14] = twiddle_mux_out_imag[13];

//mac 15
assign twiddle_real[15] = twiddle_mux_out_real[14];
assign twiddle_imag[15] = twiddle_mux_out_imag[14];

//prepare input data for processing
assign    sample_real[0]  = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real0[INPUT_WIDTH - 1]}}, input_real0, 3'b000};
assign    sample_real[1]  = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real1[INPUT_WIDTH - 1]}}, input_real1, 3'b000};
assign    sample_real[2]  = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real2[INPUT_WIDTH - 1]}}, input_real2, 3'b000};
assign    sample_real[3]  = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real3[INPUT_WIDTH - 1]}}, input_real3, 3'b000};
assign    sample_real[4]  = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real4[INPUT_WIDTH - 1]}}, input_real4, 3'b000};
assign    sample_real[5]  = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real5[INPUT_WIDTH - 1]}}, input_real5, 3'b000};
assign    sample_real[6]  = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real6[INPUT_WIDTH - 1]}}, input_real6, 3'b000};
assign    sample_real[7]  = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real7[INPUT_WIDTH - 1]}}, input_real7, 3'b000};
assign    sample_real[8]  = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real8[INPUT_WIDTH - 1]}}, input_real8, 3'b000};
assign    sample_real[9]  = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real9[INPUT_WIDTH - 1]}}, input_real9, 3'b000};
assign    sample_real[10] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real10[INPUT_WIDTH - 1]}}, input_real10, 3'b000};
assign    sample_real[11] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real11[INPUT_WIDTH - 1]}}, input_real11, 3'b000};
assign    sample_real[12] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real12[INPUT_WIDTH - 1]}}, input_real12, 3'b000};
assign    sample_real[13] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real13[INPUT_WIDTH - 1]}}, input_real13, 3'b000};
assign    sample_real[14] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real14[INPUT_WIDTH - 1]}}, input_real14, 3'b000};
assign    sample_real[15] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real15[INPUT_WIDTH - 1]}}, input_real15, 3'b000};
assign    sample_real[16] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real16[INPUT_WIDTH - 1]}}, input_real16, 3'b000};
assign    sample_real[17] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real17[INPUT_WIDTH - 1]}}, input_real17, 3'b000};
assign    sample_real[18] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real18[INPUT_WIDTH - 1]}}, input_real18, 3'b000};
assign    sample_real[19] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real19[INPUT_WIDTH - 1]}}, input_real19, 3'b000};
assign    sample_real[20] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real20[INPUT_WIDTH - 1]}}, input_real20, 3'b000};
assign    sample_real[21] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real21[INPUT_WIDTH - 1]}}, input_real21, 3'b000};
assign    sample_real[22] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real22[INPUT_WIDTH - 1]}}, input_real22, 3'b000};
assign    sample_real[23] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real23[INPUT_WIDTH - 1]}}, input_real23, 3'b000};
assign    sample_real[24] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real24[INPUT_WIDTH - 1]}}, input_real24, 3'b000};
assign    sample_real[25] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real25[INPUT_WIDTH - 1]}}, input_real25, 3'b000};
assign    sample_real[26] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real26[INPUT_WIDTH - 1]}}, input_real26, 3'b000};
assign    sample_real[27] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real27[INPUT_WIDTH - 1]}}, input_real27, 3'b000};
assign    sample_real[28] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real28[INPUT_WIDTH - 1]}}, input_real28, 3'b000};
assign    sample_real[29] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real29[INPUT_WIDTH - 1]}}, input_real29, 3'b000};
assign    sample_real[30] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real30[INPUT_WIDTH - 1]}}, input_real30, 3'b000};
assign    sample_real[31] = {{(DATA_WIDTH - INPUT_WIDTH - 3){input_real31[INPUT_WIDTH - 1]}}, input_real31, 3'b000};


   /*connect mac signals*/
   genvar j;
generate
  for (j = 0; j < 16; j = j + 1) begin
    assign input_1_real[j] = mux_out_real[2*j];
    assign input_2_real[j] = mux_out_real[2*j+1];
    assign input_1_imag[j] = mux_out_imag[2*j];
    assign input_2_imag[j] = mux_out_imag[2*j+1];
  end
endgenerate

    /*instantiate 16 mac*/
    genvar i;
generate
    for (i = 0; i < 16; i = i + 1) begin : mac_inst
        mac #(
            .DATA_WIDTH(DATA_WIDTH)
        ) mac_instance (
            .input_1_real(input_1_real[i]),    // Connect the real part of input 1 (done)
            .input_1_imag(input_1_imag[i]),    // Connect the imaginary part of input 1 (done)
            .twiddle_real(twiddle_real[i]),    // Connect the real part of twiddle (done)
            .twiddle_imag(twiddle_imag[i]),    // Connect the imaginary part of twiddle (done)
            .input_2_real(input_2_real[i]),    // Connect the real part of input 2 (done)
            .input_2_imag(input_2_imag[i]),    // Connect the imaginary part of input 2 (done)
            .sum_real(sum_real[i]),            // Connect the real part of sum output y = x1 + w * x2 (done)
            .sum_imag(sum_imag[i]),            // Connect the imaginary part of sum output (done)
            .diff_real(diff_real[i]),          // Connect the real part of diff output y = x1 - w * x2 (done)
            .diff_imag(diff_imag[i])           // Connect the imaginary part of diff output (done)
        );
    end
endgenerate

    /*instantiate 32 mux to handel the inputs of the macs*/
   genvar k;
generate
    for (k = 0; k < 32; k = k + 1) begin : mux5_1_complex_gen
        mux5_1_complex #(.DATA_WIDTH(DATA_WIDTH)) mux_inst (
            .in0_real(in0_real[k]), .in0_imag(in0_imag[k]),
            .in1_real(in1_real[k]), .in1_imag(in1_imag[k]),
            .in2_real(in2_real[k]), .in2_imag(in2_imag[k]),
            .in3_real(in3_real[k]), .in3_imag(in3_imag[k]),
            .in4_real(in4_real[k]), .in4_imag(in4_imag[k]),
            .select(select), 
            .out_real(mux_out_real[k]),
            .out_imag(mux_out_imag[k])
        );
    end
endgenerate

 /*instantiate 15 mux to handel the twiddle*/
   genvar t;
generate
    for (t = 0; t < 15; t = t + 1) begin : mux5_1_complex_gen_twiddle
        mux5_1_complex #(.DATA_WIDTH(DATA_WIDTH)) mux_inst (
            .in0_real(twiddle_in0_real[t]), .in0_imag(twiddle_in0_imag[t]),
            .in1_real(twiddle_in1_real[t]), .in1_imag(twiddle_in1_imag[t]),
            .in2_real(twiddle_in2_real[t]), .in2_imag(twiddle_in2_imag[t]),
            .in3_real(twiddle_in3_real[t]), .in3_imag(twiddle_in3_imag[t]),
            .in4_real(twiddle_in4_real[t]), .in4_imag(twiddle_in4_imag[t]),
            .select(select), 
            .out_real(twiddle_mux_out_real[t]),
            .out_imag(twiddle_mux_out_imag[t])
        );
    end
endgenerate

// Control block: sampling, FFT stage control, and output generation
always_ff @(posedge clk_100mhz or negedge rst_n) begin
    if (!rst_n) begin
        fft_out_valid <= 1'b0;
             // Reset all fft_real_out and fft_imag_out outputs to 0
        fft_real_out0  <= '0; fft_real_out1  <= '0; fft_real_out2  <= '0; fft_real_out3  <= '0;
        fft_real_out4  <= '0; fft_real_out5  <= '0; fft_real_out6  <= '0; fft_real_out7  <= '0;
        fft_real_out8  <= '0; fft_real_out9  <= '0; fft_real_out10 <= '0; fft_real_out11 <= '0;
        fft_real_out12 <= '0; fft_real_out13 <= '0; fft_real_out14 <= '0; fft_real_out15 <= '0;
        fft_real_out16 <= '0; fft_real_out17 <= '0; fft_real_out18 <= '0; fft_real_out19 <= '0;
        fft_real_out20 <= '0; fft_real_out21 <= '0; fft_real_out22 <= '0; fft_real_out23 <= '0;
        fft_real_out24 <= '0; fft_real_out25 <= '0; fft_real_out26 <= '0; fft_real_out27 <= '0;
        fft_real_out28 <= '0; fft_real_out29 <= '0; fft_real_out30 <= '0; fft_real_out31 <= '0;

        fft_imag_out0  <= '0; fft_imag_out1  <= '0; fft_imag_out2  <= '0; fft_imag_out3  <= '0;
        fft_imag_out4  <= '0; fft_imag_out5  <= '0; fft_imag_out6  <= '0; fft_imag_out7  <= '0;
        fft_imag_out8  <= '0; fft_imag_out9  <= '0; fft_imag_out10 <= '0; fft_imag_out11 <= '0;
        fft_imag_out12 <= '0; fft_imag_out13 <= '0; fft_imag_out14 <= '0; fft_imag_out15 <= '0;
        fft_imag_out16 <= '0; fft_imag_out17 <= '0; fft_imag_out18 <= '0; fft_imag_out19 <= '0;
        fft_imag_out20 <= '0; fft_imag_out21 <= '0; fft_imag_out22 <= '0; fft_imag_out23 <= '0;
        fft_imag_out24 <= '0; fft_imag_out25 <= '0; fft_imag_out26 <= '0; fft_imag_out27 <= '0;
        fft_imag_out28 <= '0; fft_imag_out29 <= '0; fft_imag_out30 <= '0; fft_imag_out31 <= '0;
    end else if (data_in_valid) begin
        if (select >= 4) begin
            // Generate FFT output
            fft_real_out0  <= sum_real[0];
            fft_real_out1  <= sum_real[1];
            fft_real_out2  <= sum_real[2];
            fft_real_out3  <= sum_real[3];
            fft_real_out4  <= sum_real[4];
            fft_real_out5  <= sum_real[5];
            fft_real_out6  <= sum_real[6];
            fft_real_out7  <= sum_real[7];
            fft_real_out8  <= sum_real[8];
            fft_real_out9  <= sum_real[9];
            fft_real_out10 <= sum_real[10];
            fft_real_out11 <= sum_real[11];
            fft_real_out12 <= sum_real[12];
            fft_real_out13 <= sum_real[13];
            fft_real_out14 <= sum_real[14];
            fft_real_out15 <= sum_real[15];

            fft_real_out16 <= diff_real[0];
            fft_real_out17 <= diff_real[1];
            fft_real_out18 <= diff_real[2];
            fft_real_out19 <= diff_real[3];
            fft_real_out20 <= diff_real[4];
            fft_real_out21 <= diff_real[5];
            fft_real_out22 <= diff_real[6];
            fft_real_out23 <= diff_real[7];
            fft_real_out24 <= diff_real[8];
            fft_real_out25 <= diff_real[9];
            fft_real_out26 <= diff_real[10];
            fft_real_out27 <= diff_real[11];
            fft_real_out28 <= diff_real[12];
            fft_real_out29 <= diff_real[13];
            fft_real_out30 <= diff_real[14];
            fft_real_out31 <= diff_real[15];

            fft_imag_out0  <= sum_imag[0];
            fft_imag_out1  <= sum_imag[1];
            fft_imag_out2  <= sum_imag[2];
            fft_imag_out3  <= sum_imag[3];
            fft_imag_out4  <= sum_imag[4];
            fft_imag_out5  <= sum_imag[5];
            fft_imag_out6  <= sum_imag[6];
            fft_imag_out7  <= sum_imag[7];
            fft_imag_out8  <= sum_imag[8];
            fft_imag_out9  <= sum_imag[9];
            fft_imag_out10 <= sum_imag[10];
            fft_imag_out11 <= sum_imag[11];
            fft_imag_out12 <= sum_imag[12];
            fft_imag_out13 <= sum_imag[13];
            fft_imag_out14 <= sum_imag[14];
            fft_imag_out15 <= sum_imag[15];

            fft_imag_out16 <= diff_imag[0];
            fft_imag_out17 <= diff_imag[1];
            fft_imag_out18 <= diff_imag[2];
            fft_imag_out19 <= diff_imag[3];
            fft_imag_out20 <= diff_imag[4];
            fft_imag_out21 <= diff_imag[5];
            fft_imag_out22 <= diff_imag[6];
            fft_imag_out23 <= diff_imag[7];
            fft_imag_out24 <= diff_imag[8];
            fft_imag_out25 <= diff_imag[9];
            fft_imag_out26 <= diff_imag[10];
            fft_imag_out27 <= diff_imag[11];
            fft_imag_out28 <= diff_imag[12];
            fft_imag_out29 <= diff_imag[13];
            fft_imag_out30 <= diff_imag[14];
            fft_imag_out31 <= diff_imag[15];

            fft_out_valid <= 1;  // output valid
        end else begin
            fft_out_valid <= 1'b0;
        end
    end
end

// FFT pipeline register stage
always_ff @(posedge clk_100mhz or negedge rst_n) begin
    if (!rst_n) begin
        sum_real_r[0]  <= '0; sum_imag_r[0]  <= '0; diff_real_r[0] <= '0; diff_imag_r[0] <= '0;
        sum_real_r[1]  <= '0; sum_imag_r[1]  <= '0; diff_real_r[1] <= '0; diff_imag_r[1] <= '0;
        sum_real_r[2]  <= '0; sum_imag_r[2]  <= '0; diff_real_r[2] <= '0; diff_imag_r[2] <= '0;
        sum_real_r[3]  <= '0; sum_imag_r[3]  <= '0; diff_real_r[3] <= '0; diff_imag_r[3] <= '0;
        sum_real_r[4]  <= '0; sum_imag_r[4]  <= '0; diff_real_r[4] <= '0; diff_imag_r[4] <= '0;
        sum_real_r[5]  <= '0; sum_imag_r[5]  <= '0; diff_real_r[5] <= '0; diff_imag_r[5] <= '0;
        sum_real_r[6]  <= '0; sum_imag_r[6]  <= '0; diff_real_r[6] <= '0; diff_imag_r[6] <= '0;
        sum_real_r[7]  <= '0; sum_imag_r[7]  <= '0; diff_real_r[7] <= '0; diff_imag_r[7] <= '0;
        sum_real_r[8]  <= '0; sum_imag_r[8]  <= '0; diff_real_r[8] <= '0; diff_imag_r[8] <= '0;
        sum_real_r[9]  <= '0; sum_imag_r[9]  <= '0; diff_real_r[9] <= '0; diff_imag_r[9] <= '0;
        sum_real_r[10] <= '0; sum_imag_r[10] <= '0; diff_real_r[10] <= '0; diff_imag_r[10] <= '0;
        sum_real_r[11] <= '0; sum_imag_r[11] <= '0; diff_real_r[11] <= '0; diff_imag_r[11] <= '0;
        sum_real_r[12] <= '0; sum_imag_r[12] <= '0; diff_real_r[12] <= '0; diff_imag_r[12] <= '0;
        sum_real_r[13] <= '0; sum_imag_r[13] <= '0; diff_real_r[13] <= '0; diff_imag_r[13] <= '0;
        sum_real_r[14] <= '0; sum_imag_r[14] <= '0; diff_real_r[14] <= '0; diff_imag_r[14] <= '0;
        sum_real_r[15] <= '0; sum_imag_r[15] <= '0; diff_real_r[15] <= '0; diff_imag_r[15] <= '0;
    end else  begin
        sum_real_r[0]  <= sum_real[0]; sum_imag_r[0]  <= sum_imag[0]; diff_real_r[0] <= diff_real[0]; diff_imag_r[0] <= diff_imag[0];
        sum_real_r[1]  <= sum_real[1]; sum_imag_r[1]  <= sum_imag[1]; diff_real_r[1] <= diff_real[1]; diff_imag_r[1] <= diff_imag[1];
        sum_real_r[2]  <= sum_real[2]; sum_imag_r[2]  <= sum_imag[2]; diff_real_r[2] <= diff_real[2]; diff_imag_r[2] <= diff_imag[2];
        sum_real_r[3]  <= sum_real[3]; sum_imag_r[3]  <= sum_imag[3]; diff_real_r[3] <= diff_real[3]; diff_imag_r[3] <= diff_imag[3];
        sum_real_r[4]  <= sum_real[4]; sum_imag_r[4]  <= sum_imag[4]; diff_real_r[4] <= diff_real[4]; diff_imag_r[4] <= diff_imag[4];
        sum_real_r[5]  <= sum_real[5]; sum_imag_r[5]  <= sum_imag[5]; diff_real_r[5] <= diff_real[5]; diff_imag_r[5] <= diff_imag[5];
        sum_real_r[6]  <= sum_real[6]; sum_imag_r[6]  <= sum_imag[6]; diff_real_r[6] <= diff_real[6]; diff_imag_r[6] <= diff_imag[6];
        sum_real_r[7]  <= sum_real[7]; sum_imag_r[7]  <= sum_imag[7]; diff_real_r[7] <= diff_real[7]; diff_imag_r[7] <= diff_imag[7];
        sum_real_r[8]  <= sum_real[8]; sum_imag_r[8]  <= sum_imag[8]; diff_real_r[8] <= diff_real[8]; diff_imag_r[8] <= diff_imag[8];
        sum_real_r[9]  <= sum_real[9]; sum_imag_r[9]  <= sum_imag[9]; diff_real_r[9] <= diff_real[9]; diff_imag_r[9] <= diff_imag[9];
        sum_real_r[10] <= sum_real[10]; sum_imag_r[10] <= sum_imag[10]; diff_real_r[10] <= diff_real[10]; diff_imag_r[10] <= diff_imag[10];
        sum_real_r[11] <= sum_real[11]; sum_imag_r[11] <= sum_imag[11]; diff_real_r[11] <= diff_real[11]; diff_imag_r[11] <= diff_imag[11];
        sum_real_r[12] <= sum_real[12]; sum_imag_r[12] <= sum_imag[12]; diff_real_r[12] <= diff_real[12]; diff_imag_r[12] <= diff_imag[12];
        sum_real_r[13] <= sum_real[13]; sum_imag_r[13] <= sum_imag[13]; diff_real_r[13] <= diff_real[13]; diff_imag_r[13] <= diff_imag[13];
        sum_real_r[14] <= sum_real[14]; sum_imag_r[14] <= sum_imag[14]; diff_real_r[14] <= diff_real[14]; diff_imag_r[14] <= diff_imag[14];
        sum_real_r[15] <= sum_real[15]; sum_imag_r[15] <= sum_imag[15]; diff_real_r[15] <= diff_real[15]; diff_imag_r[15] <= diff_imag[15];
    end 
end


always_ff @(posedge clk_100mhz or negedge rst_n) begin
     if (!rst_n) begin
       stage <= 3'd0;
    end else if(data_in_valid) begin
        stage <= (stage >= 4) ? 0 : stage + 1;
    end
end

 buffer_chain #(
    .STAGES(1),
    .WIDTH(3)
) my_buffer (
    .clk(clk_100mhz),
    .rst_n(rst_n),
    .in_signal(stage),      // 3-bit
    .out_signal(select)     // 3-bit
);


endmodule
