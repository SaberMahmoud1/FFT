module buffer_chain #(
    parameter STAGES = 3,
    parameter WIDTH  = 3  // <-- Set to 3 bits
)(
    input  logic              clk,
    input  logic              rst_n,
    input  logic [WIDTH-1:0]  in_signal,
    output logic [WIDTH-1:0]  out_signal
);

    logic [WIDTH-1:0] buffer [0:STAGES-1];

    integer i;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < STAGES; i = i + 1)
                buffer[i] <= '0;
        end else begin
            buffer[0] <= in_signal;
            for (i = 1; i < STAGES; i = i + 1)
                buffer[i] <= buffer[i-1];
        end
    end

    assign out_signal = buffer[STAGES-1];

endmodule
