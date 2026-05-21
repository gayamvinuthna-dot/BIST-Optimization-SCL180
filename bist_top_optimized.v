module bist_top_optimized (
    input clk,
    input rst,
    input enable,
    output [7:0] test_pattern,
    output xor_result,
    output [7:0] signature
);

wire [7:0] lfsr_pattern;

lfsr_opt U1 (
    .clk(clk),
    .rst(rst),
    .lfsr_out(lfsr_pattern)
);

sdm_opt U2 (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .serial_in(lfsr_pattern[0]),
    .data_out(test_pattern)
);

cxm_parallel_opt U3 (
    .data_in(test_pattern),
    .xor_out(xor_result)
);

misr_opt U4 (
    .clk(clk),
    .rst(rst),
    .data_in(xor_result),
    .signature(signature)
);

endmodule
