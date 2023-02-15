# General notes
* we usually use a blocking assignment (=) with the combinational circuits
* but we use the non-blocking assingment with the sequential designs
* el by7sl fl non-blocking hwa en ana bastna l7d ma awsl lel end 34an a3ml update lel values
* bm3na lw 3ndy 7aga zy keda
  * b<= a
  * c<= b
  * end
* sa3tha el c msh hatakhod kemt el a, laa hya hatakhod el kema el adema lel b w el value bta3t el b hy7slha update b3d ma akhbt fl end. 
* mynf34 t3tmd 3la output tool fe mwdo3 el synthesis, da 34an de haga el banyadmen el by3mloha, fa mmkn warning tzhr fe tool w mtzhrsh fe tool tanya.
* lw fe one level bs sa3tha msh hyfr2 awy enk te3ml blocking aw non-blocking
* lakn lw feh multiple levels lazm sa3tha lw shaghal sequential, el a7sn enk teshtghl non-blocking.
* w da 34an enta 3auz te3ml read abl ma te3ml write 34an t-avoid moshkelt enk mmkn te2ra data ghalat.
* ### Simulation Race
* always @(posedge clock)
  * b = a;
* always @ (posedge clock)
  * c = b; 
* hena el hy7sl en hayb2a fe race benhom, l2enhom shaghalen concurrent, fa msh hayb2a 3aref men fehom el haykhod el kema el awl.
  
### latches
* latch is a level sensitive. 
* while flipflop is an edge sensitive. 
* latch usually has a lot of timing issues
* so we prefer using flip flops

### shifting
* we usually make the shifting process by using the concatination { }

### testbench for sequential
* delay is usually by nano seconds
* we use forever loop to be able to make the clock. 
* we use the initial block to set our initial values 
* bn7tag ne3ml el awl reset le fatra twela shwya, w b3d ma n5ly el reset b 0 brdo bn7tag nestna shwaya 34an neb2a mot2kden el el state el hanshtghl 3aleha de state wad7a.

* $stop this stops the simulation
* $random this generates random values
* $display('') this display some data on the terminals
* @(negedge clk) -> this is called a blocking event
* odam brdu el randomization mmkn ne2dr behom enna n7dd e7na 3auzen kam percent en el parameter yakhod value mo3yna, w el b2y yakhod kema tanya.
* lama tkon bt3ml testbench 5aleh hwa y2olak enta 3adet el test wla laa 3n tre2 enk te3ml display to some good indication strings. 