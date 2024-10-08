module FIFO_WR (
input wire wclk,
input wire wrst_n,
input wire winc,
input wire [3:0] wq2_rptr,
output wire wfull,
output  [3:0] wptr,
output reg [2:0] waddr,
output reg wclken
);

reg [3:0] bn_wptr;

always @(posedge wclk or negedge wrst_n) begin
	if (~wrst_n) begin
		bn_wptr <= 'b0;
		waddr <= 'b0;
		wclken <= 'b0;
	end
	else if (winc) begin
		if(wfull) begin
			wclken <= 'b0;
		end else begin
			wclken <= 'b1;
			bn_wptr <= bn_wptr+1 ;
			waddr <= waddr+1 ;
		end
	end else begin
		wclken <= 'b0;
	end
end

assign wfull = ((wptr[3]!=wq2_rptr[3]) && (wptr[2]!=wq2_rptr[2]) && (wptr[1:0]==wq2_rptr[1:0])) ;

assign wptr = bn_wptr ^ (bn_wptr >> 1);

endmodule