# Verification Session notes
* bn3ml post synthesis leh? 
  * 34an el rtl mmkn ykon wasef logic ghlt
  * aw en 34an el rtl byshtghl fe no time, lakn ehna el mfrod nbos 3la el timing, fa mmkn yboz wehna bn3ml synthesis. 
* dayman fl design flow, lw haga bazet bnrg3 nzbot fl rtl. 

* good coding practices eliminate iterations and make it 
  * 1. scalable and easy to integerate. 

* how to adopt good coding practices
  * 1. Code review -> senior engineer review the code and modify the issues
  * 2. automate this process by using 
    * 1. Static analysis tools -> linting
      * this make sure that the code is compiled correctly
      * doesn't require test bench
      * revel simulation and synthesis mismatch
      * easier to spot and fix problems.
    * 2. Dynamic analysis tools 
## Finite State machine:
* El fr2 been el moore wl mealy hwa el response bta3 el circuit
* mfesh wahda ahsn mn el tanya
* mealy output depends on the inputs and state
* moore depends on the state only
* el mealy finite state machine, moshkeltha en el output bytghyr w very sensitive lel inputs, fa once the inputs change, it only takes the gate delay, then it produces the output, which may cause some glitches. 
* woooow! we have tools in which you can design a finite state machine and it automatically generates a code for you !!!. 
* tre2t ktabt el finite state machine ka enk t3ml case aw if, da non-logical changes, fa da msh by2sr awy fl synthesis awy, l2n el optimizer keda keda hay-optimize it to a good optimization. 
* lama bnegy ne3ml synthesis lazm ne5tar el design technology el ehna hanmshy 3leha, 34an byfr2o 3n b3d.
* w bn7ot shwyt constrains 
* one-hot this means that we need 1 bit to represent each state
* safe machine is that all states are defined. 
* Live-lock -> infinite loop
* Dead-lock -> reaching a node which you can't go out from it. 

## Goals:
* de 7agat b7otha 34an at2kd 3lehom
* w b7dd ana 3auz at3aml m3ahom ezay (saverity)
  * warning
  * errors 
  * and so on

## Inferred Latches
* avoid using/inferring latches.
* having input,output and enable.
* when enable is active, the output is transparently follows the inputs.
* they arises when signals are not assigned values for all possible execution paths
* we avoid them due to two reasons
  * 1. In an FPGA, you want your logic to be fully synchronous, so you want all your storage elements to be clocked
  * 2. Anythinss that is async to clock need to be treated very carefully, other wise they will cause timing error.
  * so unintended latches causes timing violations.
* when we get unti
  * 1. incomplete assignments in conditional assignment
  * 2. missing default conditoin in case statement 
* to avoid latches we do this by
  * 1. checking all the conditions 
* std_logic has 9 values. 
* fa lw 7tet if condition 7ata lw by3ml cover lel binary values 0,1 fe if else if
* still hayzhr m3aya, latch l2n el standard synthesis tool btt3aml 3la el sample space l mwgod kolo, el hwa 9, fa lw l2ak msh 3aml cover le kol l cases hwa hay3tbr en lazm y7ot latch. 
* lw l2et gowa conditions, fe kaza parameter, lw kolohm msh mt3rflohom kema mo3yna, fa hay7sl latch brdu.
* if you need latches
  * they must be simple 
  * and must be identifiable

## Sensitivity List Checks
* synthesis doesn't look at the sensitivity list
* lw 3aml sensitivty list ghlt, hytl3lk senthesis mismatch
* our **Rules**:
  * 1. include all signals read in the block in the sensitiity list. 
  * 2. for sequential logic
    * 1. only clock and asynchronous controls are included in the senstivity list
  * 3. for combinational logic
    * 1. all input signals. 
    * 2. all conditional signals 
      * 1. if 
      * 2. case
      * 3. for
* 