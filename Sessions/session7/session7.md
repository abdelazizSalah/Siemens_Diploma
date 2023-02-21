# Digital Design Concepts
* HDL means hardware description language
* lazm wehna bnshtghl nefhm enna el mfrod nt5yl el circuit bta3tna
* w nefhm enna msh ay haga bnktbha btb2a helwa

### Nature of hdl 
* HDL is concurrent in nature -> el hagat bttnfz ganmb b3d parallel, msh sequential zy el programming language. 
* we use it to model a digital circuit
* el code el bnktbo fl verilog esmo RTL -> register-transfer level
* bnwsf feh ezay el data bttn2l mn register lel tany w bn7dd el values bta3t el register de. 
* our RTL should match the functionality which i need, and must be the most optimized one. 
* Synthesis converts Verilog code into optimized logic gates. 
* we upload our code of FPGA or ASIC. -> field-programmable gate array or Application-specific integerated circuits.
* our synthesis must meet the constrains of the company.
* Siemens tool target both ASIC/FPGA

### Types of Digital Circuits
1. Combinational Circuit
   1. out is affected only by the values of the inputs
   2. no time is tracked
   3. no storage is needed
   4. Examples:
      1. Adder
      2. Mux
2. Sequential Circuit
   1. Propogation of in to out depends on the clock
   2. out is a function of input and history of the last output
   3. Storage is needed
      1. latches
      2. flipflop
   4. Example:
      1. Counter

### modeling Combinational Circuit
1. using assign
2. using always combinational block
3. using gates primitives
* we use the always block for high complexity combinational logic
  * always depend on its **sensitivity list** 
  * we always care about the signals on which the block depends on their values. 
  * we must take care about our sensitivity list, so we shouldn't add more signals or forget some signals. 
  * we can write always@(*)
    * this means that it is sensitive to any change on the rhs of assignments inside the always block. 
  * if we wrote always@(Clock, Din) in latches behaviour, 
  * that is because we need to notice anychange for the data during our period 
  * so we also must make a condition inside the block, that we check that the clock is high, because we want to avoid changing our reg when the clock level is low,
  * but if there was any change happened we must change its value, so it must be in the sensitivity level. 
* when output depends on several conditions, which requires if-else or case constructs to be fully descriped. 

### what is Clock? 
* Control signal propagation circuit
* allows sequential elements to load values on 
  * Raising edge or Falling edge -> FlipFlop
  * Level high or low -> Latches

### Resets
* it is necessary for sequential circuits
* that is because we need to set our circuit in a defined state. 
* We have two types of resets
  * 1. synchronous reset
    * which is synchronous with the clock
  * 2. Asynchronous reset
    * whenever it comes, it resets the circuit. 
* Asynchronous reset is sensitive to glitches. 
* Glitch hwa en ye7sl impulse keda fl signal fa tetl3 l wahed w tenzl tany zero mn gher ma ana el akon 7atet el value bnfsy. 
* Synchronous reset, require that the length of the reset high must be long enough to be seen by the active clock, to be able to apply this action. -> disadvantage of synchronous reset. 
* it is diffcult to differentiate reset from other signals, care must be taken during synthesis -> el tool bthtag te3rf men el reset signal w men el data signal 34an te3rf te3ml routing bshkl kwayes, bs el moshkela hena baa en el tool a7yanan btb2a s3b 3leha enha tfr2 baa ben el data signals wl reset signals, lakn el asynchronous reset signals byb2a sahl enna ne3rfhom. 
* usually Asynchronous resets are more recommanded. 
* that is because it make the power more efficient
* we da 34an ehna 34an ne2ll el power a7yanan bn7tag enna ne2fl el clock 34an nwfr fl power, fa 34an lw aflt el clock msh h3rf a3ml reset, fa sa3tha b2ena nro7 lel asynchronous. 

### Polarity -> when does it work
1. Active High
2. Active Low
3. other conditions -> asynchronous load

### Value -> what is the value which the reg takes.
1. Reset (0)
2. Set (1)
3. other_Data -> Asynchronous Data.

### FF with Priority Reset-Set
* this checks on reset first, if true
  * it resets the output -> Q0 = 0
* then it checks on the set, if true
  * it sets the output to 1 -> Q1 = 1
* else it just set Q0 = Din
* here we must put the three  signals in the sensitivity list (posedge clock or posedge  reset or posedge set)

### FF with Asynchronous Reset and Synchronous Enable
* here we just put the Reset and Clock in the Sensitivity list
* while the enable will be only checked inside the block. 

### FF with Synchronous Reset and Synchronous Enable
* here our sensitivity will contain only the clock. 
* other signals will be checked only inside the always block. 


### Good/Bad practices in Digital Designs
1. Unintentional Latch
   1. this occurs when we don't cover all the cases in the if conditions. 
   2. to solve it we can just add else statement
   3. but we just put the else statment only if we didn't cover all the conditions. 
   4. even if we added else statement we may write else and add a storage element, which also add a sequential element.
   5. if we stored the element so we are using a sequential logic. 
   6. another way to avoid Latches is to set an initial or default values in the beginning of the code. 
2. Blocking vs non-Blocking assignments
   1. Blocking is denoted by "="
      1. evaluation within the always block is **blocked** until this assignment is completed. 
      2. we use it only if we are using a combinational logic.
   2. Non-Blocking is denoted by "<=" 
      1. it is evaluated in parallel, the results are assigned at the end of the statements.
      2. always used in sequential logic.
      
3. Using multiple clocks
   1. don't define multiple clocks in the same always block. 
   2. this is un-synthesizable. 
4. Sensitivity list contains something which is changed inside its block
   1. this cause infinite loop. 
5. Simulation/Synthesis mismatch 
   1. this may happen due to incomplete sensitivity list. 
   2. I didn't implement all the signals which affect my sensitivity list
   3. this may cause that the simulation results are not same as the results of the Synthesis. 
   4. order of the assignment differs in the synthesis, so this also may result in the same mismatch. 
6. assignment in multiple always clock
   1. this is not allowed, because it will cause a racing condition. 

### Clock Dividers
* we wanna create different clocks from our main clock
* this happen by using a toggleflipflop
* this extends the clock frequency to its double value
* to create more multiples we just cascade the tff after each other.


### MEMORY
1. RAM
2. ROM
3. FIFO
   1. first in first out buffer
   2. it is circular
      1. this mean that if we reached the of the buffer we start from the beginning of the buffer.


### Finite State Machine
1. we have states
2. to transfere from state to another we depend on something called transition condition
3. it has two types
   1. Mealy -> depend on the current state and the input    
      1. it is written into shape of two always blocks
         1. the first one is combinational 
         2. the second one is sequential
   2. Moore -> depends only on the current state.
4. Problems of the FSM 
   1.  Dead-end states
       1.  reaching state and can't go out from it. 
   2.  Unreachable state
       1.  this state is never executed.

### Design metrics
1. Speed
   1. Throughput
      1. this is the amount of data that is processed per clock cycle (bits per second)
   2. Latency
      1. this is the time between data input and processed data output 
      2. 3dd el cycles el 5dtha mn sa3t ma d5lt el input l7d ma khrgt el output bta3o
      3. its unit is clock cycle
   3. Timing
      1. the logic delays between sequential elements (clock period)
      2. when a design doesn't meet the timing, it means that the delay of the critical path is greater that the target period. 
2. Area 
3. Power
   1. Dynamic => alpha * f * CL * Vdd^2
      1. Switching activity.
   2. Static 
      1. leakage. 

> we can't meet all the matrices, so it depend on the application which you are implementing. 

### ways of improving the timing
1. pipelining
   1. this happens by adding registers between two registers. 
2.  parallelism
    1.  duplicating the hardware to finish operations in parallel to each other
    2.  this doesn't affect on the power 
    3.  but it enhance the throuhput.
3.  resource sharing
    1.  this is used to reduce the hardware. 
    2.  this is used where  there are functional blocks that can be used in other areas of the design or even in different modules. 
> always try to think hardware level not as software level  to be able to optimize your code and your hardware. 


