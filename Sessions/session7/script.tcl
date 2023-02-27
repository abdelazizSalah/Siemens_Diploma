vlog Memories.v
vsim RAM
add wave *  
add wave mem
force -freeze sim:/RAM/clk 1 0, 0 {50 ps} -r 100 