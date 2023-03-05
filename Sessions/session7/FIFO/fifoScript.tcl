vlog Fifo.v
vsim FIFO
add wave *
add wave dualPortMem
force -freeze sim:/FIFO/clk_write 1 0, 0 {50 ps} -r 100
force -freeze sim:/FIFO/clk_read 1 0, 0 {50 ps} -r 100
force rst 1
run 
run
force rst 0
force ReadingIsFaster 0
force data_in 01011111
force read_enable 0
force write_enable 1 
for {set index 0} { $index < 34 } { incr index } {
    # force data_in eval puts [set myDataIn($index)]
    if { $index == 31 } {
        force data_in 11110000
    }
    run
}
force read_enable 1
force write_enable 0 
 
for {set index 0} { $index < 34 } { incr index } {
    run
    if { $index == 1 } {
        force ReadingIsFaster 1
    }
}