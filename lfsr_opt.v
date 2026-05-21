module lfsr_opt (
    input clk,
    input rst,
    output reg [7:0] lfsr_out
);

wire feedback;

assign feedback = lfsr_out[7] ^ lfsr_out[5];

always @(posedge clk or posedge rst)
begin
    if(rst)
        lfsr_out <= 8'h1;
    else
        lfsr_out <= {lfsr_out[6:0], feedback};
end

endmodule
