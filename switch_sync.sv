module switch_sync (
    input logic [15:0] switch,
    input logic clk, rst,
    output logic [3:0] swout, 
    output logic swclk
);

logic ff1, ff2;

assign swout[0] = switch[1] | switch[3] | switch[5] | switch[7] | switch[9] | switch[11] | switch[13] | switch[15];
assign swout[1] = switch[2] | switch[3] | switch[6] | switch[7] | switch[10] | switch[11] | switch[14] | switch[15];
assign swout[2] = switch[4] | switch[5] | switch[6] | switch[7] | switch[12] | switch[13] | switch[14] | switch[15];
assign swout[3] = switch[8] | switch[9] | switch[10] | switch[11] | switch[12] | switch[13] | switch[14] | switch[15];

always_ff @ (posedge clk or posedge rst) begin
    if(rst) begin
        ff1 <= 0;
        ff2 <= 0;
    end
    else begin
        ff1 <= |switch;
        ff2 <= ff1;
    end
end

assign swclk = ff2;

endmodule