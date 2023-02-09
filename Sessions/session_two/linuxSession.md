> linux is open source 

> open source means that anybody can take a look at and modify it. 

> introduction to linux notes:
>> Kernel: el mo5 bta3 el operating system el ms2ol eno ye2sm el hardware bta3 el system kolo w ye2dr yedy awamr lel hardware wl memory

>> Shell: is an interface between the user and the kernel, the user write the commands and the kernel applyies them.

>> Terminal: the GUI on which the user write the commands and the shell output its results on. 


# Command Line 
* cd 
  * change directory
* ls 
  * list 

> we have 3 ways to get help about commands 
* man
* whatis 
* --help option

> man contains all the commands inside it you can find any command you wanna use.

## creating files
> touch -> create a file 
> mkdir -> create a directory

## browsing and exploring file systems
> cd 
> cd-
> cd.


## TextEditing (vim notes)
* /mohammed -> this search for mohammed
* :3 -> this goes to line 3
* i -> lets you insert into the file 
* cat -> print a file content. 


## wildcards 
* (*) -> get all the items with 0 character or more
* ? -> search for certain number of characters depending on the # of ? exists.
* [a-f] -> search on characters in that range.
## general commnads
* head -2 filename 
  *   gets the first 2 lines in the filename

## permissions
  file or dir     owner group others
      
     -             ---    ---   ---
> to give premission we wirte (chmod)

> to add we use chmod+

> to remove we use chmod-

> u -> for user
> o -> owner
> g -> grp


## piping
m3naha eny 3auz a5od el output bta3 command abaseh le command tany fa bst5mdo 
cat file1 | sort
keda hwa hytb3 el content bta3 file1 w b3d keda haya5od el output da w ye3mlo sort.

## Redirection
bta5od el output bta3 command mo3ayn w t7oto fe file. 

> command > file -> redirect the normal outputs

> command 2> file -> redirect the output of errors 

> command &> file -> redirect both.
>
## searching 
grep -> we search for certain words in a files or directories. 

greb -v key -> keda hygeb kol el files el mfhash el key da.

## archiving
> **tar** 
this command is used to archive the files, like zipping them in the 

# Shell Scripting
* we mainly uses the scripting for automation. 
* also we use it for data extraction by which we mean that we get certain informations from our files
* also used to monitor the system
* finally used for running some testcases. 
* we can write all commands inside the script. 
* we have many type of shell one of them is Cshell and another one is Bash

# MakeFiles
1. bn3ml file 3ady w nektb gowah esm el target "hello" 
2. bnsave w ne2fl
3. bnktb make w nektb esm el target 
   1. make hello

* lazm el esm bta3o ykon esmo makefile aw MAKEFILE
* lw 3ndk kaza target fa mmkn t5ly wahed ynfz wahed abl ma ytnfz hwa fa sa3tha da esmo dependencies
  * all : one two 
    * keda all dependenet on one and two
    * fa keda lama tegy tnfz all haynfz one el awl w b3den ynfz two.
* lw btktb command lazm tnzl satr w te3ml tap
* lw btktb dependency fa byb2o gamb b3d
  ## makefile parameter
  * bast5dmo variable gowa el makefile
  * x:=1 keda 3rft x w kemtha 1
  * b3d keda btst5dm el esm w 34an taccess el value bnst5dm el $x
  ## why make files? 
  * lw 3ndk files ktera w 7auz trtb el compilation bta3hom. 
  * b7es en kol file by-depend 3la wahed tany, fa ana gowa el make file baa bartbhom b-mzagy
  * mn esmo aslun hwa by3ml make lel hagat, akno bybny structure kda. 

# General notes 
* mv f1 f2 
  * this move all the content of file1 into file2 
  * this means that it overwrites the content not appending
  * and then removes f1.

* mv f1 dir1
  * here we move file f1 into directory dir1

* cd (no inputs)
  * it goes to the home. 

* cp f1 f2 
  * this copy the content of f1 into f2.

* there are two admins who can change the permissions either the root or the owner of the file.
  
* **group** is a file on linux defined inside it a group of people who share the same access.
* sudo is for the root and some other users which have the sudo permission. 
* 