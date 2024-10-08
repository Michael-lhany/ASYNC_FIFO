module FIFO_MEM_CNTRL #(parameter DATA_WIDTH = 8, NUM_OF_REGS = 8) (
input wire wclkEn,
input wire CLK,
input wire RST,
input wire [2:0] waddr,
input wire [2:0] raddr,
input wire [DATA_WIDTH-1:0] wdata,
output wire [DATA_WIDTH-1:0] rdata 
);

integer i;

reg [DATA_WIDTH-1:0] memory [NUM_OF_REGS-1:0];

always @(posedge CLK or negedge RST) begin
	if (~RST) begin
		for( i=0 ; i<NUM_OF_REGS ; i=i+1 )
		begin
			memory[i] <= 'b0;
		end
	end
	else begin
		if (wclkEn) begin
			memory[waddr] <= wdata;
		end
	end
end

assign rdata = memory[raddr];

endmodule