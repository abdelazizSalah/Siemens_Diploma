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
* 