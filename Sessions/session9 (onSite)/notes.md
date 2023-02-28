# Notes on FPGAs
* FPGA is field programmable gate array. 
* Steps:
   1. HDL
   2. logic synthesis
   3. pack -> anhy functionality hatt7t fe anhy logic block.
   4. place -> bn7ot el 7agat ezay baa. 
   5. route
   6. bitstream -> 34an homa dol el b8yrhom 34an a2dr atl3 el logic el ana 3auzo, tb3n 7agmo byb2a kbeer lakn da faydeto eno generic, 34an ye3ml keda hwa bya5od el truth tabel el hwa 3auzo, yelz2o 3la el input bta3 el selectors. 
* el basic component bta3 el FPGA hwa el look-up table
* el look-up table da 3bara 3n cascading of mux-es 
*  BLE -> basic logic element, da asghar element ehna mmkn nshtghl beeh, we hwa bnkrro kter, fa 7atena gowah LUT w selector, sawa2 enta 3auz tshtghl sequential wla combinational.
*  bema en ehna mmkn n7ot 3addad (n) mn el BLE w K mn el inputs ll LUT, tb ma ehna n7ot kam y3ny?
*  da by7sl feh research kber gedan baa
*  ehna el 3auzeno nshofo el delay hayb2a 3amel ezay hwa wl area kol ma nzwd el 3adad w nhawl baa newsl le ahsan no2ta fehom 
* ehna b2a 3ndna el kodra enna ne3ml slice lel LUT, fa de meza bnsbalna, l2n enta mmkn t3ml different logics, hagat mlhash ay 3laka bb b3dha, w t7othom 3la nfs el element, aw nfs el chip. 
* 3adatan n = 10 w k = 6
## Fracturable LUTs
* 8alebn el 6 inputs byb2a ahsn wahed. 

## DSP blocks 
* el mfrod lw 3auz tnzl el code bta3k 3la fpga, fe guide lazm temshy 3leh 34an tedmn eno yenzlk el shoghl bta3k aw ykhlek tshtghl 3la el 7agat el already mwgoda aslun 3la el chip, l2n lw ma mshetsh 3la el guide da, sa3tha hwa hynzlk l design 3la logic blocks, fa da bykbrlk el logic. 
* kol vendor leh library guide. 
* fe chips zy microchip msln, btnzl el FPGA bta3ha b static inputs, elly homa mynf34  enk t8yr el kema bt3thom, sawa2 kano logic 1 msln aw 0, el fekra en el 7agat el static de 7agat mynf34 tt8yr. 
*  