vlog quiz.v
vsim Session2Quiz
add wave *
force -freeze sim:/Session2Quiz/clock 1 0, 0 {50 ps} -r 100
force reset 1
force load 0
run
run

force reset 0
force load 1
force data 0100
run
run
force load 0
run 
run 
