module misr_opt (
    input clk,
    input rst,
    input data_in,
    output reg [7:0] signature
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        signature <= 8'b0;
    else begin
        signature[0] <= data_in ^ signature[7];
        signature[1] <= signature[0];
        signature[2] <= signature[1];
        signature[3] <= signature[2];
        signature[4] <= signature[3];
        signature[5] <= signature[4];
        signature[6] <= signature[5];
        signature[7] <= signature[6];
    end
end

endmodule
