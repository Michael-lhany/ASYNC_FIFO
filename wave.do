onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {TestBench signals} -color Gold /ASYNC_FIFO_tb/W_CLK_tb
add wave -noupdate -expand -group {TestBench signals} -color {Cornflower Blue} /ASYNC_FIFO_tb/R_CLK_tb
add wave -noupdate -expand -group {TestBench signals} /ASYNC_FIFO_tb/W_RST_tb
add wave -noupdate -expand -group {TestBench signals} /ASYNC_FIFO_tb/W_INC_tb
add wave -noupdate -expand -group {TestBench signals} /ASYNC_FIFO_tb/R_RST_tb
add wave -noupdate -expand -group {TestBench signals} /ASYNC_FIFO_tb/R_INC_tb
add wave -noupdate -expand -group {TestBench signals} -color Turquoise /ASYNC_FIFO_tb/WR_DATA_tb
add wave -noupdate -expand -group {TestBench signals} -color {Medium Blue} /ASYNC_FIFO_tb/RD_DATA_tb
add wave -noupdate -expand -group {TestBench signals} -color {Medium Sea Green} /ASYNC_FIFO_tb/FULL_tb
add wave -noupdate -expand -group {TestBench signals} -color Gray65 /ASYNC_FIFO_tb/EMPTY_tb
add wave -noupdate -expand -group {TestBench signals} /ASYNC_FIFO_tb/i
add wave -noupdate -expand -group {TestBench signals} /ASYNC_FIFO_tb/j
add wave -noupdate -expand -group {TestBench signals} /ASYNC_FIFO_tb/READ_MEM
add wave -noupdate -expand -group {TestBench signals} /ASYNC_FIFO_tb/WRITE_MEM
add wave -noupdate -group {fifo write signals} /ASYNC_FIFO_tb/FIFO/fifo_write/wclk
add wave -noupdate -group {fifo write signals} /ASYNC_FIFO_tb/FIFO/fifo_write/wrst_n
add wave -noupdate -group {fifo write signals} /ASYNC_FIFO_tb/FIFO/fifo_write/winc
add wave -noupdate -group {fifo write signals} /ASYNC_FIFO_tb/FIFO/fifo_write/wq2_rptr
add wave -noupdate -group {fifo write signals} /ASYNC_FIFO_tb/FIFO/fifo_write/wfull
add wave -noupdate -group {fifo write signals} /ASYNC_FIFO_tb/FIFO/fifo_write/wptr
add wave -noupdate -group {fifo write signals} /ASYNC_FIFO_tb/FIFO/fifo_write/waddr
add wave -noupdate -group {fifo write signals} /ASYNC_FIFO_tb/FIFO/fifo_write/wclken
add wave -noupdate -group {fifo write signals} /ASYNC_FIFO_tb/FIFO/fifo_write/bn_wptr
add wave -noupdate -group {fifo read signals} /ASYNC_FIFO_tb/FIFO/fifo_read/rclk
add wave -noupdate -group {fifo read signals} /ASYNC_FIFO_tb/FIFO/fifo_read/rrst_n
add wave -noupdate -group {fifo read signals} /ASYNC_FIFO_tb/FIFO/fifo_read/rinc
add wave -noupdate -group {fifo read signals} /ASYNC_FIFO_tb/FIFO/fifo_read/rq2_wptr
add wave -noupdate -group {fifo read signals} /ASYNC_FIFO_tb/FIFO/fifo_read/rempty
add wave -noupdate -group {fifo read signals} /ASYNC_FIFO_tb/FIFO/fifo_read/rptr
add wave -noupdate -group {fifo read signals} /ASYNC_FIFO_tb/FIFO/fifo_read/raddr
add wave -noupdate -group {fifo read signals} /ASYNC_FIFO_tb/FIFO/fifo_read/bn_rptr
add wave -noupdate -group MEM /ASYNC_FIFO_tb/FIFO/memory/DATA_WIDTH
add wave -noupdate -group MEM /ASYNC_FIFO_tb/FIFO/memory/NUM_OF_REGS
add wave -noupdate -group MEM /ASYNC_FIFO_tb/FIFO/memory/wclkEn
add wave -noupdate -group MEM /ASYNC_FIFO_tb/FIFO/memory/CLK
add wave -noupdate -group MEM /ASYNC_FIFO_tb/FIFO/memory/RST
add wave -noupdate -group MEM /ASYNC_FIFO_tb/FIFO/memory/waddr
add wave -noupdate -group MEM /ASYNC_FIFO_tb/FIFO/memory/raddr
add wave -noupdate -group MEM /ASYNC_FIFO_tb/FIFO/memory/wdata
add wave -noupdate -group MEM /ASYNC_FIFO_tb/FIFO/memory/rdata
add wave -noupdate -group MEM /ASYNC_FIFO_tb/FIFO/memory/i
add wave -noupdate -group MEM -expand /ASYNC_FIFO_tb/FIFO/memory/memory
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {76200 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {267 ns}
