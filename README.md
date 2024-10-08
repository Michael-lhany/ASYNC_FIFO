# ASYNC_FIFO
## Description
* Asynchronous FIFO is a 2-port memory with certain depth.
* It has two clocks, one for read (i_rclk) and one for write (i_wclk).
* It has two addresses, one for read and one for write.
* Writing happens at location specified by write address.
* Reading happens at location specified by read address.
* It is used when going from a faster clock domain to a slower one to solve the problem of the potential data loss
