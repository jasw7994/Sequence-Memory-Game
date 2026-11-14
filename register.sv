module register (
    input  logic        clk,
    input  logic        rst,

    input  logic [6:0]  rs1,
    output logic [3:0]  rd1,

    input  logic        we,
    input  logic [6:0]  rd,
    input  logic [3:0]  wd
);

    logic [3:0] registers [0:127];

    assign rd1 = registers[rs1];

    always_ff @(posedge clk) begin
        if (rst) begin
            for (int i = 0; i < 128; i++) begin
                registers[i] <= 4'b0;
            end
        end
        else if (we) begin
            registers[rd] <= wd;
        end
    end

endmodule