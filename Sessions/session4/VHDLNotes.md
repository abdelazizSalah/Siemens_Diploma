# General Notes about VHDL
* VHDL -> very fast hardware descriptive language.
* LRM -> language reference manual 
* VHDL scope is for digital designing 
* Levels of abstractions are three:
* 1.    Algorithm
* 2.    RTL
* 3.    Gates -> where we synthisis our RTL
* VHDL is same as the verilog, so it focus on the RTL. 
* VHDL is widly used in Europe.
* Verilog is more used in America
* when to use which, verilog or vhdl? 
  * there is no technical difference
  * it depend on the engineers using
*  maybe in the same project we use VHDL and verilog together.
*  concept of blocking and non-blocking doesn't exist in VHDL.
*  optimization depend on two things:
    1.    the written RTL
    2.    the simulator

* we use variables instead of signals to avoid raising latches, and to be reused. 
* so variables should not raise latches.
* we can put label for anything in VHDL. 
## VHDL Syntax
* we have two units
* Entity:
  * the interface for our module.
  * defines our I/O ports
  * specifies the mode of each port
  * but it doesn't explain how the entity works
* Architecture:
  * this what defines how the entity works
  * each entity can have one or more architecture
  * and each one is specified when to be used.
  * The meaning of existing more than one architecture is that at some times maybe you want to change the behaviour of your module to do different operations at certain situations
* we use this operator (:=) to assign variables 
* while we use this operator (<=) to assign signals. 
### Internal signals
  * they are the wires which connects two gates together.

### Naming Rules
*   it is not caseSensitive
*   the first character must be a letter
*   last letter shouldn't be _
*   the name must not contain two consecutive underscores __ 
*   we can't use reserved identifiers
*  Excaped names is that you can write the names by adding ('\') before the name and make the names different between two variables by using numbers.

### dataTypes
*   Bit -> represents a single bit.
*   Boolean -> True/False.
*   Std_logic/ std_ulogic
    *   it defines 9 states
        *   'U' uninitalized -> unseen yet 
        *   'X' -> unknown imposible to be determined
        *   '0' -> logic 0
        *   '1' -> logic 1
        *   'Z' -> High impedence
        *   'W' -> weak signal, can't tell that whethere you should say it 0 or 1
        *   'L' 
*   we have scalar data types which are 
    *   
*   real data type is same as float or double.
*   Enumeration Types -> something like structs or enums in cpp to define certain types for your own types.
*   to use them we must write the given availabe types explicitly
*   Arrays:
    *   this defines an unpacked arrays
    *   defines independent values for different types
    *   bm3na lw 3mlt array of bits, da keda kol bit by3br 3n kol bit 2ayma b zatha, laknhom msh kolohom gmb b3d, bm3na en lw 3mlt array of 2 fa sa3tha da msh up to 3 la2, kol bit bt3br 3n nfsha bs, lw 3auzhom packed, sa3tha bnst5dm vector.
### Vectors
* like register 
* if we use (downto) then (large downto small) 
* if we use (to) then (small to large)
* to define 8 bits -> 
  * (7 downto 0) 
  * (0 to 7)
* here the MSB is always the one on the left.

### Libraries
*   file which contains all our work
*   analyzer: 
    *   this is the compiler for the designers.
*   there are some built-in libraries to be used by the user. 
*   we can use the items or functions or packages which are inside our library.


### Generics
* this is used to make the code act as a template and apply them on different values
* so we can use N-bits adder to act as 4-bits, 8-bits, and 16 bits adder, each act on independant call.

### Configurations
it follows this foramte: 
configuration (configName) of (entityName) is
for (architectureName)
for labelName: (componentName)
use entity (entity_instantiation)
end for
end for
end configuration


* heya el fekra enk bt3ml configuration lkol entity
* w kol entity mmkn yeb2a leha multiple architectures
* fa 34an t7dd configuration le architecture mo3yna bn2ol for (architecture name)
* gowa el architecture de baa momken ykon 3ndk kaza module
* fa 34an t7dd el module el 3auz tshtghl 3leh bn2ol 
* for moduleName: moduleObject
* w b3d keda gowa ba2a bnshof el behaviour el hanshtghl beh

### Structural Vs Behavioral Description
* Behavioral:
  * you define the algorithm and write the functionality of your code
* Structural:
  * you look for the code as a structures, and composition as gates not logic

### Sequential Vs Concurrent
* Sequential:
  * this means that the code will be excecuted in sequence, one after other.
* Concurrent:
  * this imply that they will run in parallel to each other, so no one will wait for the other.

### Sequential Statements: 
1. Process
   * it has a sensitive list, so if any of the arguments has changed, the process body will be executed.
   * it is same as always block in verilog.
   * we shouldn't write if satements outside the process, same as the always block. 
   * all our logic should be implemented inside the architecture.
   * if the process has no sensitivity parameters, then it will be executed only once. 
   * wait on is similar to the sensitivity list.
   * you may use a label for the process by puting it before the process keyword.
 * if we set an instruction outside a process, so it will be a concurrent, otherwise if it was defined inside a process block so it will be executed sequentially
 * we usually use the process block to work with clocks and sequential logic.

### Delta Delays
* this is a infinite small delay
* after it we change the value of our port or reg. 
* so the signal gets its RHV after small time which is the delta delay.
* for simulations we shouldn't ignore it because designers when they design they take it in their considirations. 

* considering this example:
  * B<= A
  * C <= B
* here C will take 2 deltas to get its value because it must wait one delta for B
* then it will take its one delta time to assign its value. 

### Rules for synthesising process
1. the senstivity list must be full, by which we mean that is should contains all the changed signals. 

2. something

3. something

### Sequential statements 
1. if statement 
   1. if (condition) then 
      1. logic
   2. elsif (condition) then
      1. logic
   3. else 
      1. logic
   4. end if
> Note: lw 7tet if gowa sequential statment, w m8atetsh kol el cases el meeting hay3ml latch, w de haga wehsha, ehna dayman bnhawl ntganbha. 
> 
