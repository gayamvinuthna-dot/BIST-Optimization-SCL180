module td_optimized;

reg clk;
reg rst;
reg enable;

wire [7:0] test_pattern;
wire xor_result;
wire [7:0] signature;

bist_top_optimized DUT (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .test_pattern(test_pattern),
    .xor_result(xor_result),
    .signature(signature)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    enable = 1;

    #20 rst = 0;

    #3000;

    $finish;
end

initial begin
    $monitor("TIME=%0t PATTERN=%h XOR=%b SIG=%h",
             $time,
             test_pattern,
             xor_result,
             signature);
end

endmodule
