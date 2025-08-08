# ASYNC_FIFO
## Description
* Asynchronous FIFO is a 2-port memory with certain depth.
* It has two clocks, one for read (i_rclk) and one for write (i_wclk).
* It has two addresses, one for read and one for write.
* It is used when going from a faster clock domain to a slower one to solve the problem of the potential data loss
