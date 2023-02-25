vlog examples.v
vsim Latch
add wave *  
force -freeze sim:/FF/CLK 1 0, 0 {50 ps} -r 100 