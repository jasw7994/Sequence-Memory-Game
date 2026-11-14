module fill_reg(
    input logic clk, rst, should_write,
);

    logic [3:0] rand_num;
    logic [6:0] position;
    logic 

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            position <= 7'b0000000;
        end
        else if (should_write) begin
            position <= position + 1;
        end
    end

    lfsr rand_num_gen (
        .clk(clk),
        .reset(reset),
        .random_num(rand_num)
    );

    register reg (
        .clk(clk),
        .rst(1'b0),
        .rs1(6'b000000),
        .we(should_write),
        .rs2(position),
        .wd(rand_num)
    )
endmodule