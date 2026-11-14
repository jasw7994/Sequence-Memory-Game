
module slow_clock (
    input logic clk,
    input logic rst,
    input logic [7:0] lim,
    output logic outclk
);

logic [7:0] counter;

always_comb begin
    if (rst) begin
        counter = 8'd0;
        outclk = 1'b0;
    end
    if (lim == 8'd0) begin
        outclk = clk;
    end else begin
        if (counter == lim) begin
            counter = 8'd0;
            outclk = ~outclk;
        end
    end
end

always_ff @(posedge clk) begin
    counter <= counter + 1'b1;
end

endmodule