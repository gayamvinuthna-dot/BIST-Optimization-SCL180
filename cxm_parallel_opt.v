module cxm_parallel_opt (
    input [7:0] data_in,
    output xor_out
);

wire x1, x2, x3, x4;
wire y1, y2;

assign x1 = data_in[0] ^ data_in[1];
assign x2 = data_in[2] ^ data_in[3];
assign x3 = data_in[4] ^ data_in[5];
assign x4 = data_in[6] ^ data_in[7];

assign y1 = x1 ^ x2;
assign y2 = x3 ^ x4;

assign xor_out = y1 ^ y2;

endmodule
