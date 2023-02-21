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

