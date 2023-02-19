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

* we use version VHDL 1993 and 2002

* we use variables instead of signals to avoid raising latches, and to be reused. 
* so variables should not raise latches.
* we can put label for anything in VHDL. 

* mehtag matfkrsh 3l code bta3k zy el C wl software, laa mehtag tfkr feh hardware wise, w ezay by7sl modeling lel code bta3y w ezay el hagat btt7t wara b3dha
* we have something called unconstraied array, which is defining an array without defining its size,and it is unsynthesizable, unless that we define its size on each time we call it. 
  
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

2. case (Selector) is
   1. when (condition) => 
      1. logic
   2. when (condition) => 
      1. logic
   3. when others =>
      1. logic
   4. end case 
> if we used the Selector as definedEnum which may take 9 values (x, L, 0x, 0Z, etc...) then we must use when others, while if we used the bit vector so using when others is optional 

3. For loops
   1. for (iterator) in (begining index) to (ending index) loop
      1. logic
   2. end loop
> loops are used to synthesize and build same hardware component multiple times. 
> we can only use one iterator per loop, we can't use i and j.
4. while (codition) loop
      1. logic
   1. end loop

5. for generate 
   1. for (iterator) in (SOME_RANGE) generate
      1. build some predefined blocks
   2. end generate
> this is used to generate certain block multiple times as a hardware block. 
> here we can use combinational logic
> usually used when you have a component built by you
> while the normal loop is used to re-produce multiple built in components

### Subtypes 
* b3ml type gded mn type already mwgod, zy mykon msln 3ndy integer, fa a3rf mno sub type w a7ot 3leh condition msln, eno ykon int from range -127 to 128 msln
* w b3d keda a2dr a3rf menha variables from this subtype w hakza baa fahem. 

### Attributes 
* Syntax:   
  * (VariableName)'(Attribute_Name)
* this attribute is a built in function or data which apply some logic or data of the variable
* so we may return the minimum number in array for example. 

### Aggregates 
* It is a list of expressions, separated by commas and enclosed by brackets. 
* Syntax:
  * array (5 downto 0) of STD_LOGIC_VECTOR (3 down to 0)
  * ( "0110", "1000" , others => "0000")
  * keda ana b3rf array 7agmo 6 amakn , kol mkan 3obara 3n 4 bits.

### Assertions
* assertion is used to check on booleans 
* if this boolean result was false, then we raise certain text on the monitor. 
* it act as an information for the user, so it doesn't affect on the values of the model. 
* we have something called **Saverity**
  * this has 4 values 
      1. Note
      2. Error
      3. Warnning 
      4. Failure
1. Note => doesn't break the simulation but print note in the transcript output
2. Warnning => same as NOTE
3. Error => same as them but it just print it in red in transcript. 
4. Failure => this breaks the simulation, we use it if we have a very sensitive cases and we don't want to continue if this case happened. 

### Procedures 
* this is called the first VHDL subprogram. 
* it is used to break the proccesses into multiple block. 
* each block can communicate with the other by calling it. 
* mainly used to make the code clear and avoid redundancy. 
* each procedure has multiple parameters 
* syntax of creation:
  * procedure ASSIGN (parameterName: parameterType) is begin
    * logic
  * end ASSIGN
* syntax of calling 
  * ASSIGN ("sentArgument");

> Note: inside the procedure you can change the real values of the sent signals, this property  doesn't exist in the Function

*  by default the direction of the parameters are input, but we may define their directions. 
*  we can set initial values for the parameters 
*  if we set initial values, so we may don't send this parameter during the call. 
*  in parameter can only be read , 
*  out parameter can only be updated 
*  inout can be read and updated
*  return statment can exist anywhere in the procedure, but it is optional, we may don't use it at all. 

### Functions
* this is called the second VHDL subprogram. 
* it is used to define any logical or mathematical function to calculate a single result
* it must return result, so the return statment is mandatory.
* it may contain more than one return statement.
* it must define the return datatype
* it can't affect the real value of any signal outside it, it just affect the results if it was assigned to it after the return, even the arguments that are sent to it, so it just apply certain algorithm and return certain returntype. 
* it can not contain a wait statement
* can't define in or out ports

### Hierarchical names -> newly added in VHDL 2008
* in VHDL we call it external names
* it allows me to access a signal outside the Entity in which I am working on.
* they are embedded inside << >>
* inside them we define our external name. 
* its value can be assigned to a signal inside our Entity. 
* this operator (^) allow me to go one stage up, same as (../) in operating systems. 
* this operator (@) specify certain package content. 

### Enhanced Generics
* now we can use generic as a type, subtype, packages or even function. 

### UVVM
* using of the VHDL in verification is not usually used in verification
* system verilog contains some logic of oop
* but it is not synthesized
* but these logic is not implemented in VHDL
* but instead they used the UVVM 
* which is a methodolgy used for making structured VHDL-based testbenches to be able to copy the idea of the oop to be able to use the VHDL in verification.
