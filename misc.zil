;<REPLACE-DEFINITION DEBUGGING-CODE T>

;<REPLACE-DEFINITION TRADEMARK-MSG
 <CONSTANT GAMMA-TESTERS
	   <PLTABLE "Steve Barone"
		    "Geoff Cohen"
		    "Robby Kumar"
		    "Joshua Mandel"
		    "Kelly Marold"
		    "Michael Milgram"
		    "Martin Rubenstein"
		    "John Schappert"
		    "Ron Tison"
		    "Steve Watkins"
		    "Jeff Bailey"
		    "Michael Stein">>
 <ROUTINE RT-TRADEMARK-MSG ()
   <COND (<AND <G? ,SERIAL 0>
	       <L? ,SERIAL <ZGET ,GAMMA-TESTERS 0>>>
	  <TELL "Gamma test copy for "
		<ZGET ,GAMMA-TESTERS ,SERIAL>
		CR>)>>>
