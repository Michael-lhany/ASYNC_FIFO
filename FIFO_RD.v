module FIFO_RD (
input wire rclk,
input wire rrst_n,
input wire rinc,
input wire [3:0] rq2_wptr,
output wire rempty,
output wire [3:0] rptr,
output reg [2:0] raddr
);

reg [3:0] bn_rptr;

always @(posedge rclk or negedge rrst_n) begin
	if (~rrst_n) begin
		bn_rptr <= 'b0;
		raddr <= 'b0;
	end
	else if (rinc) begin
		if(~rempty) begin
			bn_rptr <= bn_rptr+1 ;
			raddr <= raddr+1 ;
		end
	end
end

assign rempty = (rq2_wptr == rptr);

assign rptr = bn_rptr ^ (bn_rptr >> 1);

endmodule