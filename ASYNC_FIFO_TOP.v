module ASYNC_FIFO_TOP #(parameter DATA_WIDTH = 8 , NUM_OF_REGS = 8) (
input wire W_CLK,
input wire W_RST,
input wire W_INC,
input wire R_CLK,
input wire R_RST,
input wire R_INC,
input wire [DATA_WIDTH-1:0] WR_DATA,
output wire [DATA_WIDTH-1:0]RD_DATA,
output wire FULL,
output wire EMPTY
);

wire [3:0] wptr, rptr, rq2_wptr, wq2_rptr;
wire [2:0] waddr, raddr;
wire wclken;

FIFO_RD fifo_read(
.rclk(R_CLK),
.rrst_n(R_RST),
.rinc(R_INC),
.rq2_wptr(rq2_wptr),
.rempty(EMPTY),
.rptr(rptr),
.raddr(raddr)
);

DF_SYNC sync_r2w (
.data(rptr),
.CLK(W_CLK),
.RST(W_RST),
.SYNC_OUT(wq2_rptr)
);

FIFO_WR fifo_write(
.wclk(W_CLK),
.wrst_n(W_RST),
.winc(W_INC),
.wq2_rptr(wq2_rptr),
.wfull(FULL),
.wptr(wptr),
.waddr(waddr),
.wclken(wclken)
);

DF_SYNC sync_w2r (
.data(wptr),
.CLK(R_CLK),
.RST(R_RST),
.SYNC_OUT(rq2_wptr)
);

FIFO_MEM_CNTRL memory(
.wclkEn(wclken),
.CLK(W_CLK),
.RST(W_RST),
.waddr(waddr),
.raddr(raddr),
.wdata(WR_DATA),
.rdata(RD_DATA)
);

endmodule