Fast Fourier Transform (FFT) Design in SystemVerilog
Overview
This project presents a high-speed and low-error Fast Fourier Transform (FFT) hardware implementation written in SystemVerilog, designed to operate reliably at 100 MHz. The architecture is optimized for precision, minimum computational error, and efficient resource usage on FPGA platforms.

The design is tailored for real-time signal processing applications where accurate frequency analysis is critical, such as wireless communications, audio processing, and radar systems.

Key Features
✅ SystemVerilog RTL Design

✅ 100 MHz Clock Frequency Support

✅ Low Error Margin via high-precision arithmetic

✅ Floating-Point Support to improve accuracy

✅ Pipelined & Modular Design for maximum performance

✅ Scalable for different FFT sizes (e.g., 64, 128, 256 points)

Design Details
1. Floating Point vs Fixed Point
This FFT design uses traditional fixed-point to minimize area on hardware.

2. Butterfly Computation
The core operation is based on the Cooley-Tukey radix-2 butterfly structure. Each butterfly unit is optimized for:

Latency reduction

Accurate complex multiplications

Seamless integration in a pipelined datapath

3. Clock Frequency
The entire pipeline is optimized for 100 MHz operation, tested through timing analysis and post-synthesis simulation to meet timing closure on popular FPGA boards (e.g., Xilinx Artix-7).

4. Architecture Highlights
Input Format: real integer numbers (easy to include complex and fixed points).

Output: Complex frequency domain components

Stages: Log₂(N) pipeline stages with fully registered intermediate signals

Twiddle Factors: Stored in ROM, pre-computed at high precision

Configurable FFT Size: Parameterized for different point sizes (N-point FFT)

Accuracy & Testing
Error Rate: Significantly lower than fixed-point FFTs, due to floating-point support

Testbench: Includes a golden model comparison with MATLAB/NumPy reference

Validation: Verified with synthetic and real waveform datasets

SNR & THD: Meets high signal fidelity requirements for communication applications

Applications
Digital Signal Processing (DSP)

Software-Defined Radio (SDR)

Biomedical Signal Analysis

Audio and Speech Processing

Vibration and Fault Analysis
