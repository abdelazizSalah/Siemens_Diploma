# Notes
* cover statement:
  * 7aga lazm te7sl at least mara wahda
  * leha two values only
    * covered/uncovered.
* assume statement
  * bt7ot constrain mo3yn 3la el inputs bto3ak
  * malhash ay results
* formal control points
  * wire free, a2dr a7ot 3leh value, 34an a2dr awsl l proof aw counter example. 
*  vacuois flag is diffcult because there is no counter example to detect it, because it can't be covered.
*  I -> inconclusive. 

## Challenges of formal track
1. specification ambiguity
   1. lazm el mataleb kolaha teb2a shaghala s77 mn el awl, w byb2a s3b fl formal baa l2n enta bt7awl tewsl lkol haga aslun mn el awl, fa lazm enk t3ml kol el initial states s7 w keda, 34an t3dy 3la kol el states w tt2kd en mfesh haga ghlt, lakn fl counter example, enta lw wslt l wahed bs el denya btboz khales
   2. da gher enha tool bttlakek aslun 34an ttl3lk firing
2. assertion/constrains development
3. scalability
4. coverage
5. debugging

## Verification processes
1.  ar5am 7aga fl mwdo3 da hwa el assertions, l2n enta m7tag tt2kd en el denya aslun s7 w bt3ml cover l kol haga s7. 
2.  el bus da aham haga tb2a mzbota 34an hwa el bywsl el denya kolaha bb3d, fa lazem teb2a mazbota. 
3.  el AMBA 3bara 3n bus bta3 ARM 
4.  fa lw 2derna enna n2ll el assertion 3la ad ma n2dr kol ma ykon a7sn. 
5.  RISC-V APP -> no3 gdded mn el processors. 
6.  el bymyzo el ISA bt3to. 
7.  our assertions depend on the IEEE 754 standards. 

## USER Spec apps 
1. 7aga msh standard, lakn lw ana el haktblha el assertions beidy el mwdo3 hyb2a mo2rf. 
2. fa bn7awl nakhud el data mn el user w el tfasel fe shkl excel msln aw tcl, w a7awl mnha a3ml automation ll assertions b7es el user myshofsh w my7mlsh el overhead bta3 kol el assertions. 
3. el mfrod baa en el tal3 mn el tool da ykon 100% correct, w da dor el quality assurance. 
4. cond_dly -> kol el connections lazm y3do 3la nfs el condition. 
5. dcond_dly -> destination conditional delay. 
6. mcond_dly -> multiple conditional delay, b7ot multiple conditions baa. 
7. cond_mutex -> 1 hot, m3nha eny mmkn akon interested en fe wahed mwgod bs wl ba2y kolo 0 w khlas. (mutex -> mutualy execlusive,)
-----------------------------------------------------------------
## Registers check 
1. kol register byb2a leh tre2a mo3yna fl checking
2. l2n msh kolohom zy b3d,
3. fe mnhom read only
4. w fe read\write
5. we fe mmkn lama t3mlo reset yeb2a t7ot zeros
6. w wahed lama t3mlo reset bn7ot rkm mo3yan
7. fa byb2a fe cases ktera mot lazm t3mlha cover
------------------------
## Questa secureCheck
1. el security b2t dakhla f kol haga w magal booming, fa yaret tzakro. 
2. Confidentiality: lazm a3ml check en mfesh ay relation ben el secured data w ay output port, mynf34 atl3 ay secured data. 
3. fa lazm lama agy a3ml el cover ala2y el goz2 da uncovered. 
4. Integrity: lazm ykon mfesh ay input by2dr yewsl lel secured data. 

--------
## formal linting 
1. da no3 mn el push button, eny b3dy 3la el RTL w acheck 3la el cases el obvious awy el a3rf mnha enha kda kda ghlt. 
2. zy stuck case fl FSM aw haga. 
3. waving flow, en fe errors ana shoftha khlas, fa mark enhom 5las shoftohom mtl3homsh delw2ty 34an ashof ba2y el hagat. 
4. el hagat el uncoverd mb3rfsh atl3lha wave form.
5. it fits for both verification and design engineers. 
--------------
## Questa Xcheck 
1. sources of the X's are
   1. uninitialized registers
   2. design issues (division by zero.)
2. are they always harmful? 
   1. nope, sometimes we really don't care about their values. 
3. we need to make sure that it really doesn't affect our design, that is why we use the formal tool. 
4. toggle coverage-> hal b2dr eny a3ml toggle for every single bit or not. 
5. FSM coverage -> hal bt3rf tro7 w tt7rk fe kol el states wla laa. 
-----------------
## Equivelance Checking 
1. enta btkarn 2 designs bb3d w 3auz tt2kd enhom homa el etnen zy b3d. 
2. da bnst5dmo lw 3ndk design w 3mltlo optimzation, fa 3auz tt2kd eno still el denya mazbota.
3. aw enk kan 3ndk bug w 3mltlo fix, w 3auz tt2kd en ba2y el system lesa zy mhwa. 
4. 34an ne3ml fault tolerance bn7tag cut point 34an agrb a7ot 7agat 8lt b eidy w at2kd enha lw 7sl fault hal hybwzly el system kolo wla laa 3ady mmkn nhandel el denya? 
5. kol ma el system byzed ahmyto ba7tag eno ykon fault tolerant. 
6. 34an a3ml keda b7tag eny at2kd en 3nd nfs el inputs, hytl3 nfs el output. 
7. -[]> 
8. -[]>
9. el s3b f kda eny ezay a3rf el mapping.
----------------
