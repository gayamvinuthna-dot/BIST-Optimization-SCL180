module sdm_opt (
    input clk,
    input rst,
    input enable,
    input serial_in,
    output reg [7:0] data_out
);

wire gated_clk;

assign gated_clk = clk & enable;

always @(posedge gated_clk or posedge rst)
begin
    if(rst)
        data_out <= 8'b0;
    else
        data_out <= {data_out[6:0], serial_in};
end

endmodule
