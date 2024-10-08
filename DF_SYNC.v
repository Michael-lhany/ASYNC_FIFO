module DF_SYNC (
input wire [3:0] data,
input wire CLK,
input wire RST,
output reg [3:0] SYNC_OUT
);

reg [3:0] SYNC_REG_1;

//Multi Flip Flop
always @(posedge CLK or negedge RST) begin
	if (~RST) begin
		SYNC_REG_1 <= 'b0;
		SYNC_OUT <= 'b0;
	end
	else begin
		SYNC_REG_1 <= data;
		SYNC_OUT <= SYNC_REG_1;
	end
end

endmodule