module flash_lights(
    input logic clk, rst, flash
);
    logic [6:0] position;
    logic [3:0] light;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 1'b0;
        end
        else if (flash) begin
            counter <= counter + 1;
        end
    end

    register reg (
        .clk(clk),
        .rst(1'b0),
        .rs1(position),
        .rd1(light),
        .we(1'b0),
        .rs2(6'b000000),
        .wd(rand_num)
    )

    /* still need to write the logic to flash the actual
    lights based on the light value read in the register */

    
endmodule