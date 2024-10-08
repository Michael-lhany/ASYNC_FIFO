`timescale 1ns/100ps

module ASYNC_FIFO_tb();


///		Parameters		///
localparam WCLK_PERIOD = 10.0  ;
localparam RCLK_PERIOD = 25.0  ;

parameter DATA_WIDTH = 8 , NUM_OF_REGS = 8;

///		integers		///
integer test_case;
integer i, j;

///		DUT signals		///
reg W_CLK_tb;
reg W_RST_tb;
reg W_INC_tb;
reg R_CLK_tb;
reg R_RST_tb;
reg R_INC_tb;
reg [DATA_WIDTH-1:0] WR_DATA_tb;
wire [DATA_WIDTH-1:0] RD_DATA_tb;
wire FULL_tb;
wire EMPTY_tb;


///		Test bench registers	///
reg [DATA_WIDTH-1:0] WRITE_MEM [14:0];
reg [DATA_WIDTH-1:0] READ_MEM [14:0];

////		DUT instantiation		////
ASYNC_FIFO_TOP FIFO(
.W_CLK(W_CLK_tb),
.W_RST(W_RST_tb),
.W_INC(W_INC_tb),
.R_CLK(R_CLK_tb),
.R_RST(R_RST_tb),
.R_INC(R_INC_tb),
.WR_DATA(WR_DATA_tb),
.RD_DATA(RD_DATA_tb),
.FULL(FULL_tb),
.EMPTY(EMPTY_tb)
);


///		Initial block for read		///
initial
begin
	$dumpfile("FIFO_DUMP.vcd") ;       
	$dumpvars;

	init();
	Rreset();
	#(2*RCLK_PERIOD)
	for( j=0 ; j<15 ; j=j+1) begin
		wait(!EMPTY_tb);
		@(negedge R_CLK_tb)
		R_INC_tb = 'b1;
		#(RCLK_PERIOD)
		R_INC_tb = 'b0;
		READ_MEM[j] = RD_DATA_tb;
		if (READ_MEM[j] == WRITE_MEM[j]) begin
			$display("Data write and read %d success",j+1);
		end else begin
			$display("Data write and read %d failed",j+1);
		end
		#(RCLK_PERIOD);
	end


	$stop;
end


///		Initial block for write		///
initial
begin
	Wreset();

	#(3*WCLK_PERIOD)
	for( i=0 ; i<15 ; i=i+1) begin
		wait(!FULL_tb);
		@(negedge W_CLK_tb)
		WRITE_MEM[i] = $random % (1 << 8);
		WR_DATA_tb = WRITE_MEM[i];
		W_INC_tb = 'b1;
		#(WCLK_PERIOD)
		W_INC_tb = 'b0;
		#(WCLK_PERIOD);
	end

end


///		write clock generator		///
always #(WCLK_PERIOD/2.0) W_CLK_tb = ~W_CLK_tb;



///		read clock generator		///
always #(RCLK_PERIOD/2.0) R_CLK_tb = ~R_CLK_tb;


///		Tasks		///

//Initialize
task init;	
 begin
 	W_CLK_tb = 'b0;
	W_RST_tb = 'b1;
	W_INC_tb = 'b0;
	R_CLK_tb = 'b0;
	R_RST_tb = 'b1;
	R_INC_tb = 'b0;
	WR_DATA_tb = 'b0;
 end
endtask

//Write Reset
task Wreset;
 begin
	W_RST_tb = 'b1;
	#(WCLK_PERIOD)
	W_RST_tb = 'b0;
	#(WCLK_PERIOD)
	W_RST_tb = 'b1;
 end
endtask

//Read Reset
task Rreset;
 begin
	R_RST_tb = 'b1;
	#(RCLK_PERIOD)
	R_RST_tb = 'b0;
	#(RCLK_PERIOD)
	R_RST_tb = 'b1;
 end
endtask

endmodule