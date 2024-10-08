vlib work
vlog *.*v
vsim -gui -voptargs=+acc work.ASYNC_FIFO_tb
do wave.do
run -all