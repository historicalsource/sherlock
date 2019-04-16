<GLOBAL PLAYER-IN-ABBEY <>>

<GLOBAL GL-SHORT-STAT? <>>
<GLOBAL GL-SCORE-HEADER-LEN 6>
<GLOBAL GL-STAT-S-POS 11>	; "offset from right for stat score"
<GLOBAL GL-STAT-T-POS 40>	; "offset from right for stat time"
<GLOBAL GL-STAT-MAX-ROOM 39>

<CONSTANT K-SUNRISE 630> ; "6:30am for <RT-TIME>"
<CONSTANT K-DAYTIME 700> ; "7:00am for <RT-TIME>"
<CONSTANT K-SUNSET 1930> ; "7:30pm for <RT-TIME>"
<CONSTANT K-NIGHT  2000> ; "8:00pm for <RT-TIME>"

; "hardware control codes"

<CONSTANT K-S-NOR 0>
<CONSTANT K-S-WIN 1>

<CONSTANT K-H-NRM 0>
<CONSTANT K-H-INV 1>
<CONSTANT K-H-BLD 2>
<CONSTANT K-H-ITL 4>

<CONSTANT K-D-SCR-ON   1>
<CONSTANT K-D-SCR-OFF -1>
<CONSTANT K-D-PRN-ON   2>
<CONSTANT K-D-PRN-OFF -2>
<CONSTANT K-D-TBL-ON   3>
<CONSTANT K-D-TBL-OFF -3>
<CONSTANT K-D-REC-ON   4>
<CONSTANT K-D-REC-OFF -4>

; "exit type codes"

<CONSTANT K-UEXIT 1>	; "uncond"
<CONSTANT K-NEXIT 4>	; "no exit"
<CONSTANT K-PEXIT 2>	; "cond via routine"
<CONSTANT K-CEXIT 5>	; "cond via obj"
<CONSTANT K-DEXIT 3>	; "cond via door"

; "exit type object access codes"

<CONSTANT K-REXIT    0>	; "destination"
<CONSTANT K-NEXITSTR 0>	; "no exit text"
<CONSTANT K-PEXITRTN 0>	; "via routine text"
<CONSTANT K-CEXITFLG 1>	; "via obj object"
<CONSTANT K-DEXITOBJ 1>	; "via door object"
<CONSTANT K-DEXITSTR 2>	; "via door text"


<CONSTANT GL-GAME-VERBS:TABLE
   <PLTABLE
      V?DESC-LEVEL
      V?QUIT
      V?RESTART
      V?DIAGNOSE
      V?INVENTORY
      V?NOTIFY
      V?SAVE
      V?RESTORE
      V?SCRIPT
      V?VERSION>>

<GLOBAL GL-DEBUG-FLAG:FLAG  <>>		; "debug flag"

<GLOBAL GL-SPLIT-ROW:NUMBER  1>		; "screen split row"
<GLOBAL GL-ALLSCREEN:NUMBER  0>		; "width of full screen"
<GLOBAL GL-MIDSCREEN:NUMBER  0>		; "width of half screen"

<GLOBAL GL-DESC-LEVEL:NUMBER 2>		; "verbosity level (0 1 2)"

;<GLOBAL GL-CLOCK-DSP:FLAG   <>>	; "clock display flag"
<GLOBAL GL-CLOCK-FMT:NUMBER  0>		; "clock display format"

;<GLOBAL GL-SCORE-DSP:FLAG   <>>	; "score display flag"
<GLOBAL GL-SCORE-MSG:FLAG    T>		; "score message flag"
<GLOBAL GL-SCORE-MAX:NUMBER  0>		; "score maximum count"
<GLOBAL GL-SCORE-CUR:NUMBER  0>		; "score current count"
<GLOBAL GL-SCORE-STS:NUMBER  0>		; "score status  count"

;<GLOBAL GL-MOVES-DSP:FLAG   <>>	; "move display flag" 
<GLOBAL GL-MOVES-CUR:NUMBER  0> 	; "move current count" 
<GLOBAL GL-MOVES-STS:NUMBER  0> 	; "move status  count" 

<GLOBAL GL-PLACE-CUR:OBJECT  0>		; "current  player location"
<GLOBAL GL-PLACE-PRV:OBJECT  0>		; "previous player location"
<GLOBAL GL-PLACE-STS:OBJECT  0>		; "status   player location"

<GLOBAL GL-WINNER:OBJECT     0> 	; "current character"

<GLOBAL GL-PUPPY:OBJECT     <>>		; "object to follow player"
<GLOBAL GL-FORMER-PUPPY:OBJECT <>>	; "Was following, but knocked out"
<GLOBAL GL-PUPPY-MSG?:FLAG   T>		; "Give default puppy message?"

<CONSTANT GL-YES-IBUF:TABLE		; "for RT-GET-YES-NO"
	<ITABLE BYTE 12>>
<CONSTANT GL-YES-LEXV:TABLE		; "for RT-GET-YES-NO"
	<ITABLE BYTE 10>>

<CONSTANT GL-BLANKS-LEN 10>
<CONSTANT GL-BLANKS <ITABLE ,GL-BLANKS-LEN (BYTE) !\ >>

<GLOBAL GL-CLOSED-OBJECT:OBJECT <>>	; "Closed object preventing touch."
<GLOBAL GL-IN-OUT:FLAG <>>		; "T=Inside, <>=Outside"
<CONSTANT GL-LOC-TRAIL:TABLE <ITABLE 10 0>>	; "Temporary table used by RT-SEEABLE? and RT-TOUCHABLE?"

<SETG20 FATAL-VALUE 2>

;<GLOBAL GL-TIME-OF-DAY:NUMBER    0> ; "0=Night, 1=Day, 2=Sunrise, 3=Sunset"
<GLOBAL GL-LAST-OUT-TOD:NUMBER   0> ; "see above"

<GLOBAL GL-NOW-LIT?:FLAG T>	; "GL-WINNER's room lighting status"
<GLOBAL GL-ALW-LIT?:FLAG <>> 

<GLOBAL GL-PRSA:VERB	0>	
<GLOBAL GL-PRSI:OBJECT	0>	
<GLOBAL GL-PRSO:OBJECT	0>	

<GLOBAL GL-P-IT-OBJECT:OBJECT   <>>	
<GLOBAL GL-P-HER-OBJECT:OBJECT  <>>	
<GLOBAL GL-P-HIM-OBJECT:OBJECT  <>>	
<GLOBAL GL-P-THEM-OBJECT:OBJECT <>>	

<GLOBAL GL-P-QCONTEXT-TH:OBJECT <>>	
<GLOBAL GL-P-QCONTEXT-RM:OBJECT <>>	

<GLOBAL GL-P-TABLE:NUMBER	0>	
<GLOBAL GL-P-SYNTAX:NUMBER	0>	
<GLOBAL GL-P-LEN:NUMBER		0>	
<GLOBAL GL-P-DIR:NUMBER		0>	

<GLOBAL GL-P-GOOD:FLAG	 <>>	; "parser successful"
<GLOBAL GL-P-CONT:FLAG	 <>>    ; "parser continue"
<GLOBAL GL-P-QUOT:FLAG	 <>>	; "quote"
<GLOBAL GL-P-ORPH:FLAG	 <>>    ; "orphan"

<GLOBAL GL-P-MERGED	  <>>	
<GLOBAL GL-P-ACLAUSE	  <>>	
<GLOBAL GL-P-ANAM	  <>>	
<GLOBAL GL-P-AADJ	  <>>	

<GLOBAL GL-P-NCN	0>	

<GLOBAL GL-P-MULT?:FLAG	  <>>	
<GLOBAL GL-NOW-PRSI?:FLAG  <>>	
;<GLOBAL GL-P-DOLLAR-FLAG:FLAG	  <>>	
<GLOBAL GL-P-TIME-FLAG:FLAG	  <>> ; "a time was entered ##:##:##"
<GLOBAL GL-P-GET-FLAGS	   0>   
<GLOBAL GL-P-END-ON-PREP  <>>	
<GLOBAL GL-RESERVE-PTR	  <>>	
<GLOBAL GL-P-DIRECTION	   0>	
<GLOBAL GL-P-WALK-DIR:DIRECTION <>>	
<GLOBAL GL-AGAIN-DIR:DIRECTION  <>>	
<GLOBAL GL-P-DIR-WORD:WORD	  <>>	
<GLOBAL GL-P-PRSA-WORD:WORD	  <>>	
<GLOBAL GL-P-NUMBER:NUMBER	  -1>	
;<GLOBAL GL-P-AMOUNT:NUMBER	0>	
<GLOBAL GL-P-SLOCBITS		0>      
<GLOBAL GL-P-GWIMBIT		0>	
<GLOBAL GL-P-PHR		0> ; "which noun phrase is being parsed?"
<GLOBAL GL-P-AND		  <>>	
<GLOBAL GL-P-MOBY-FOUND		  <>>	
;<GLOBAL GL-P-MOBY-FLAG		  <>> ; "needed only for ZIL"

;-----------------------------------------------------------------------------
; "parser tables (mostly)"
;-----------------------------------------------------------------------------

;<GLOBAL GL-INSAVE-A:TABLE   <ITABLE BYTE 81>>
;<GLOBAL GL-INSAVE-B:TABLE   <ITABLE BYTE 81>>
;<GLOBAL GL-INSAVE-C:TABLE   <ITABLE BYTE 81>>

<CONSTANT GL-P-P-LEX:TABLE    <ITABLE 59 (LEXV) 0 0>>
<CONSTANT GL-P-S-LEX:TABLE    <ITABLE 59 (LEXV) 0 0>>
<CONSTANT GL-P-T-LEX:TABLE    <ITABLE 59 (LEXV) 0 0>>

<CONSTANT K-P-INBUF-SIZE 80>
<CONSTANT GL-P-PIBUF:TABLE    <ITABLE ,K-P-INBUF-SIZE (BYTE LENGTH) 0>>
<CONSTANT GL-P-RIBUF:TABLE    <ITABLE ,K-P-INBUF-SIZE (BYTE LENGTH) 0>>

<CONSTANT GL-P-ITBL:TABLE     <TABLE 0 0 0 0 0 0 0 0 0 0>>
<CONSTANT GL-P-OTBL:TABLE     <TABLE 0 0 0 0 0 0 0 0 0 0>>
<CONSTANT GL-P-VTBL:TABLE     <TABLE 0 0 0 0>>
<CONSTANT GL-P-OVTBL:TABLE    <TABLE 0 0 0 0>>

<CONSTANT GL-OOPS-INBUF:TABLE <ITABLE ,K-P-INBUF-SIZE (BYTE LENGTH) 0>>
<CONSTANT GL-OOPS-TABLE:TABLE <TABLE <> <> <> <>>>

<GLOBAL GL-P-NAM				 <>>
<GLOBAL GL-P-XNAM				 <>>
<CONSTANT GL-P-NAMW:TABLE     <TABLE 0 0>>

<GLOBAL GL-P-ADJ				 <>>
<GLOBAL GL-P-XADJ				 <>>
<CONSTANT GL-P-ADJW:TABLE     <TABLE 0 0>>

<GLOBAL GL-P-OF <>>
<CONSTANT GL-P-OFW:TABLE      <TABLE 0 0>>

<CONSTANT K-P-OBJ-TBL-LEN 45>		; "Size of parser object tables."
<GLOBAL GL-P-OVERFLOW:FLAG <>>	; "Object tables overflowed."
<CONSTANT GL-P-PRSO:TABLE     <ITABLE NONE ,K-P-OBJ-TBL-LEN>>
<CONSTANT GL-P-PRSI:TABLE     <ITABLE NONE ,K-P-OBJ-TBL-LEN>>   
<CONSTANT GL-P-BUTS:TABLE     <ITABLE NONE ,K-P-OBJ-TBL-LEN>>   
<CONSTANT GL-P-MERGE:TABLE    <ITABLE NONE ,K-P-OBJ-TBL-LEN>>  
<CONSTANT GL-P-OCLAUSE:TABLE  <ITABLE NONE ,K-P-OBJ-TBL-LEN>>

<CONSTANT GL-P-TIME:TABLE     <TABLE (BYTE) 0 0 0>>

<GLOBAL GL-CAN-UNDO:NUMBER 0>

; "message tables"

<CONSTANT GL-HOLMES-DESC-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	       <BYTE 1>
	       <PLTABLE
		"Holmes"
		"Your friend"
		"The detective"
		"Your companion">>>

<CONSTANT GL-HOLMES-DESPAIR-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE
		"grimly"
		"sharply"
		"in despair"
		"severely"
		"for a moment">>>

<CONSTANT GL-HOLMES-IMPOSSIBLE-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	   <BYTE 1>
	   <PLTABLE 
		"I thought you had more sense than that, Watson"
		"That can't be done, Watson"
		"That's impossible, Doctor"
		"You can't do that, Watson"
		"You should know better, Doctor"
		"Impossible"
		"Don't be ridiculous, Watson">>>

<CONSTANT GL-WIGGINS-DESC-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE 
		"Wiggins"
		"The boy"
		"The urchin"
		"Your companion"
		"Your assistant">>>

<CONSTANT GL-WIGGINS-IMPOSSIBLE-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE
		"You must be out of your bleedin' mind"
		"That's ruddy impossible"
		"Not bloody likely"
		"For a toff, you're not too bright"
		"Nice try, Guv"
		"I thought doctors was smart">>>

<CONSTANT GL-IMPOSSIBLE-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE 
		"That's impossible"
		"You can't do that"
		"That can't be done"
		"That won't work"
		"You try, but fail">>>

<CONSTANT GL-NOT-LIKELY-TXT:TABLE 
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE
	   " is not likely"
	   " seems doubtful"
	   " seems unlikely">>>

<CONSTANT GL-LOOKS-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE
		"looks"
		"appears"
		"seem to be">>>

<CONSTANT GL-PUZZLED-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE 
		"puzzled"
		"bewildered"
		"confused"
		"perplexed">>>

<CONSTANT GL-BORING-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE
		"unusual"
		"interesting"
		"extraordinary"
		"special">>>

<CONSTANT GL-NO-POINT-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE 
		" not do anything useful"
		" accomplish nothing"
		" have no desirable effect"
		" not be very productive"
		" serve no purpose"
		" be pointless">>>

<CONSTANT GL-FOG-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	 <BYTE 1>
	 <PLTABLE 
		"The fog swirls around you"
		"You can barely see through the thick fog"
		"The fog turns everything into an indistinct blur"
		"Wisps of fog creep along the ground"
		"The fog clings to everything like a shroud"
		"Fog blankets everything around you">>>

;<CONSTANT GL-BUZZ-TABLE:TABLE
   <PTABLE
      <PLTABLE
         <VOC "WHY" <>> <VOC "HOW" <>> <VOC "HOW\'S" <>>
         <VOC "WHEN" <>> <VOC "WHEN\'S" <>> <VOC "WOULD" <>>
         <VOC "COULD" <>> <VOC "SHOULD" <>>>
      <PLTABLE
         <VOC "THAT\'S" <>> <VOC "IT\'S" <>> <VOC "I\'M" <>>
         <VOC "DID" <>> <VOC "THEY\'RE" <>> <VOC "SHALL" <>>
         <VOC "DO" <>> <VOC "HAVE" <>> <VOC "ANY" <>>
         <VOC "I\'LL" <>> <VOC "WHICH" <>> <VOC "WE\'RE" <>>
         <VOC "I\'VE" <>> <VOC "WON\'T" <>> <VOC "HAS" <>>
         <VOC "YOU\'RE" <>> <VOC "HE\'S" <>> <VOC "SHE\'S" <>>
         <VOC "WILL" <>> <VOC "WERE" <>>>
      <PLTABLE
         <VOC "ZERO" <>> <VOC "EIGHT" <>> <VOC "NINE" <>>
         <VOC "TEN" <>> <VOC "ELEVEN" <>> <VOC "TWELVE" <>>
         <VOC "THIRTEEN" <>> <VOC "FOURTEEN" <>> <VOC "FIFTEEN" <>>
         <VOC "SIXTEEN" <>> <VOC "SEVENTEEN" <>> <VOC "EIGHTEEN" <>>
         <VOC "NINETEEN" <>> <VOC "TWENTY" <>> <VOC "THIRTY" <>>
         <VOC "FORTY" <>> <VOC "FIFTY" <>> <VOC "SIXTY" <>>
         <VOC "SEVENTY" <>> <VOC "EIGHTY" <>> <VOC "NINETY" <>>
         <VOC "HUNDRED" <>> <VOC "THOUSAND" <>> <VOC "MILLION" <>>
         <VOC "BILLION" <>>>
      <PLTABLE
         <VOC "QUIETLY" <>> <VOC "SILENTLY" <>> <VOC "PRIVATELY" <>>
         <VOC "CAREFULLY" <>> <VOC "SLOWLY" <>> <VOC "CLOSELY" <>>
         <VOC "CAUTIOUSLY" <>> <VOC "WARILY" <>> <VOC "GENTLY" <>>
         <VOC "QUICKLY" <>> <VOC "RAPIDLY" <>> <VOC "SWIFTLY" <>>
         <VOC "SUDDENLY" <>> <VOC "BRIEFLY" <>> <VOC "HASTILY" <>>
         <VOC "HURRIEDLY" <>> <VOC "RECKLESSLY" <>>
         <VOC "CARELESSLY" <>>>
      <PLTABLE
         <VOC "CURSE" <>> <VOC "GODDAMNED" <>> <VOC "CUSS" <>>
         <VOC "DAMN" <>> <VOC "SHIT" <>> <VOC "FUCK" <>>
         <VOC "SHITHEAD" <>> <VOC "BASTARD" <>> <VOC "ASS" <>>
         <VOC "FUCKING" <>> <VOC "BITCH" <>> <VOC "DAMNED" <>>
         ;<VOC "COCKSUCKER" <>> <VOC "FUCKED" <>> <VOC "PISS" <>>
         ;<VOC "CUNT" <>> <VOC "ASSHOLE" <>> <VOC "PEE" <>>>
      ;<PLTABLE
         <VOC "ZORK" <>> <VOC "XYZZY" <>> <VOC "GRUE" <>>
         <VOC "PLUGH" <>> <VOC "OZMOO" <>> <VOC "GNUSTO" <>>
         <VOC "GRUES" <>> <VOC "WISHBRINGER" <>> <VOC "FROTZ" <>>
         <VOC "MAGICK" <>> <VOC "QUENDOR" <>> <VOC "FROBOZZ" <>>>>>

<CONSTANT K-CAPS:TABLE
   <PLTABLE
      <VOC "N" <>>
      <VOC "E" <>>
      <VOC "S" <>>
      <VOC "W" <>>
      <VOC "I" <>>
      <VOC "MR" <>>
      <VOC "MRS" <>>
      <VOC "MISS" <>>
      <VOC "HOLMES" <>>
      <VOC "WATSON" <>>
      <VOC "ELIZA" <>>
      <VOC "HUDSON" <>>
      <VOC "WIGGINS" <>>
      <VOC "AKBAR" <>>
      <VOC "MORIARTY" <>>
      <VOC "TOBY" <>>
      <VOC "MYCROFT" <>>
      <VOC "SHERMAN" <>>>>

<CONSTANT GL-SEE-VERBS:TABLE
   <PLTABLE
      V?LOOK
      V?EXAMINE
      V?LOOK-INSIDE
      V?LOOK-ON
      V?READ
      V?FIND
      V?SEARCH
      V?SHOW
      V?LOOK-UNDER
      V?LOOK-BEHIND
      V?LOOK-THRU 
      V?LOOK-DOWN
      V?LOOK-UP
      V?READ-TO
      V?LOOK-OUTSIDE
      V?COUNT
      V?WATCH
      V?FOCUS-ON
      V?ADJUST
      V?POINT>>

<CONSTANT GL-TALK-VERBS:TABLE
   <PLTABLE
      V?ALARM
      V?ASK-ABOUT
      V?ASK-FOR
      V?GOODBYE
      V?HELLO
      V?NO
      V?PASSWORD
      V?QUESTION
      V?REPLY
      V?SAY
      V?TELL
      V?TELL-ABOUT
      V?THANK
      V?WAVE-AT
      V?WHAT
      V?WHERE
      V?WHO
      V?YELL
      V?YES>>

<CONSTANT GL-TOUCH-VERBS:TABLE
   <PLTABLE
      V?ADJUST
      V?BLOW-INTO
      V?BURN-WITH
      V?CLEAN
      V?CLEAN-OFF
      V?CLOSE
      V?COVER
      V?CUT
      V?DETONATE
      ;V?DIG
      V?DRINK
      V?DRINK-FROM
      V?EAT
      V?EMPTY-INTO
      V?FEED
      V?FILL
      V?FOLD
      V?GIVE
      V?HIT
      V?KICK
      V?KNOCK
      V?LAMP-ON
      V?LAMP-OFF
      V?LIE-DOWN
      V?LIGHT-WITH
      V?LOCK
      V?LOOSEN
      V?LOWER
      V?MELT
      V?MOVE
      V?MUNG
      V?OPEN
      V?OPEN-WITH
      V?PICK
      V?PLAY
      V?PLUG
      V?PULL
      V?PUSH
      V?PUSH-TO
      V?PUT
      V?PUT-BEHIND
      V?PUT-ON
      V?PUT-UNDER
      V?RAISE
      V?REACH-IN
      V?REPAIR
      V?REPLACE
      V?RIP
      ;V?SCREW
      ;V?SCREW-WITH
      V?SHAKE
      V?SIT
      V?SPIN
      ;V?SQUEEZE
      V?STAND-ON
      V?STRIKE
      V?SWING
      V?TAKE
      V?TAKE-OFF
      V?TASTE
      V?TIE
      V?TOUCH
      V?TOUCH-TO
      V?TUNE-TO
      V?TURN
      V?TURN-TO
      V?UNFOLD
      V?UNLOCK
      ;V?UNSCREW
      V?UNPLUG
      V?UNSCREW-FROM
      V?UNTIE
      V?WIND
      V?WRAP-AROUND>>

;<CONSTANT K-WISH-MSG "Gesundheit">

<CONSTANT K-TOO-DARK-MSG "It is too dark to see.">

<CONSTANT K-DONT-UNDERSTAND-MSG "[Please try to express that another way.]">

<CONSTANT K-BE-MORE-SPECIFIC-MSG "[You must be more specific.]">

<CONSTANT K-BE-SPECIFIC-MSG "[Be specific: what do you want to ">

<CONSTANT K-TO-COMPLETE-MSG " to complete this story.]">

"CAB STUFF"
<GLOBAL GL-WHERE-TO-PROMPT?:FLAG <>>	;"Display 'Where to?' before prompt?"
<GLOBAL GL-WHERE-TO-ORPH?:FLAG <>>	;"Orphan drive verb?"

<CONSTANT K-HANSOM-TIME  2>	;"Minutes for Hansom  to travel one room."
<CONSTANT K-GROWLER-TIME 4>	;"Minutes for Growler to travel one room."

<CONSTANT K-CAB-HERE-MSG "There is a cab here already.">
<CONSTANT K-TAKE-CAB-MSG
"[To take a cab, get in and tell the cabbie to drive to your destination.]">

<CONSTANT GL-CAB-DIST-TBL:TABLE
	<PTABLE (BYTE)
 1
 2  1
 3  2  1
 3  3  2  1
 2  3  3  2  1
 1  2  3  3  2  1
 2  3  4  4  3  2  1
 3  4  5  5  4  3  2  1
 4  5  6  6  5  4  3  2  1
 4  4  3  2  1  2  3  4  5  6
 4  4  3  2  1  2  3  4  5  6  2
 4  5  6  6  5  4  3  2  1  2  5  6
 5  6  7  6  5  5  4  3  2  3  4  6  1
 6  7  7  6  5  6  5  4  3  4  4  6  2  1
 7  7  6  5  4  5  6  5  4  5  3  5  3  2  1
 6  6  5  4  3  4  5  6  5  6  2  4  4  3  2  1
 6  7  6  5  4  5  5  4  3  4  3  5  2  1  2  3  3
 6  6  5  4  3  4  5  5  4  5  2  4  3  2  3  3  2  1
 7  7  6  5  4  5  6  6  5  6  3  5  4  3  3  2  1  2  1
 5  5  4  3  2  3  4  5  5  6  1  3  4  3  4  4  3  2  1  2
 5  5  4  3  2  3  4  5  6  7  1  3  5  4  3  2  1  4  3  2  2
 4  4  3  2  1  2  3  4  5  6  2  2  6  6  6  5  4  5  4  5  3  3
 5  5  4  3  2  3  4  5  6  7  2  3  7  6  6  5  4  5  4  5  3  3  1
 5  5  4  3  2  3  4  5  6  7  1  3  6  5  5  4  3  4  3  4  2  2  2  1
 6  6  5  4  3  4  5  6  7  8  2  4  7  6  6  5  4  5  4  5  3  3  3  2  1
 7  7  6  5  4  5  6  7  8  9  3  5  8  7  7  6  5  6  5  6  4  4  4  3  2  1
 8  8  7  6  5  6  7  8  9 10  4  6  9  8  8  7  6  7  6  7  5  5  5  4  3  2  1
 7  7  6  5  4  5  6  7  8  9  3  5  8  7  7  6  5  6  5  6  4  4  4  3  2  1  2  3
 6  6  5  4  3  4  5  6  7  8  4  4  8  8  8  7  6  7  6  7  5  5  2  3  4  5  6  6  6
 5  5  4  3  2  3  4  5  6  7  3  3  7  7  7  6  5  6  5  6  4  4  1  2  3  4  5  5  5  1
 6  6  5  4  3  4  5  6  7  8  4  4  8  8  8  7  6  7  6  7  5  5  2  3  4  5  5  4  6  2  1
 7  7  6  5  4  5  6  7  8  9  5  5  9  9  9  8  7  8  7  8  6  6  3  4  5  5  4  3  6  3  2  1
 8  8  7  6  5  6  7  8  9 10  6  6 10 10 10  9  8  9  8  9  7  7  4  5  5  4  3  2  5  4  3  2  1
 9  9  8  7  6  7  8  9 10 11  5  7 10  9  9  8  7  8  7  8  6  6  5  5  4  3  2  1  4  5  4  3  2  1
10 10  9  8  7  8  9 10 11 12  6  8 11 10 10  9  8  9  8  9  7  7  6  6  5  4  3  2  5  6  5  4  3  2  1
10 10  9  8  7  8  9 10 11 12  6  8 11 10 10  9  8  9  8  9  7  7  6  6  5  4  3  2  5  6  5  4  3  2  1  2>>

;<GLOBAL GL-CAB-ROOMS:TABLE
	<PLTABLE
		,RM-221B-BAKER-ST
		,RM-YORK-PLACE
		,RM-MARYLEBONE-RD
		,RM-TOTTENHAM-COURT-RD
		,RM-ST-GILES-CIRCUS
		,RM-OXFORD-ST
		,RM-ORCHARD-ST
		,RM-AUDLEY-ST
		,RM-HYDE-PARK-CORNER
		,RM-KENSINGTON-GARDENS
		,RM-TRAFALGAR-SQUARE
		,RM-GREAT-RUSSELL-ST
		,RM-GROSVENOR-PLACE
		,RM-VICTORIA-SQUARE
		,RM-VICTORIA-STREET
		,RM-BROAD-SANCTUARY
		,RM-PARLIAMENT-SQUARE
		,RM-BUCKINGHAM-PALACE-RD
		,RM-QUEENS-GARDENS
		,RM-BIRDCAGE-WALK
		,RM-THE-MALL
		,RM-WHITEHALL
		,RM-NEW-OXFORD-ST
		,RM-COVENT-GARDEN
		,RM-THE-STRAND
		,RM-FLEET-STREET
		,RM-THE-EMBANKMENT
		,RM-UPPER-THAMES-ST
		,RM-BLIND-ALLEY
		,RM-PINCHIN-LANE
		,RM-CHEAPSIDE
		,RM-THREADNEEDLE-ST
		,RM-KING-WILLIAM-ST
		,RM-MONUMENT
		,RM-LOWER-THAMES-ST
		,RM-LONDON-BRIDGE
		,RM-TOWER-ENTRANCE>>


; "GL-LASTFOC"

<GLOBAL GL-LASTFOC:OBJECT <>> 			; "last object focused on"

<GLOBAL GL-LISTEN-OBJ:OBJECT <>>

<CONSTANT GL-HOLMES-INDOORS-LOOK-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE 
		"'s brow is furrowed in intense concentration"
		" is pacing back and forth nervously"
		"'s eyes are half-closed, but they miss nothing"
		" is looking around with interest"
		" appears lost in deep thought"
		"'s lean, severe face gives away none of his thoughts"
		" is here, awaiting your next move">>>

<CONSTANT GL-HOLMES-INDOORS-ENTER-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE
		" trails along after you"
		" walks into the room alongside you"
		" enters and begins pacing back and forth nervously"
		" follows you"
		" joins you and starts looking around with interest"
		" drifts in after you, apparently lost in thought">>>

<CONSTANT GL-HOLMES-HOUSE-LOOK-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE
		" is pacing back and forth nervously"
		" appears lost in thought"
		" is here, awaiting your next move">>>

<CONSTANT GL-HOLMES-HOUSE-ENTER-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE
		" walks into the room alongside you"
		" enters and begins pacing back and forth nervously"
		" drifts in after you, apparently lost in thought">>>

<CONSTANT GL-HOLMES-OUTDOORS-LOOK-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE
		" is staring at the sky, as if he might find a clue there"
		" is looking around with interest"
		" is pacing back and forth nervously"
		"'s lean, severe face gives away none of his thoughts"
		" appears lost in thought"
		" is here"
		"'s eyes are half-closed, but they miss nothing">>>

<CONSTANT GL-HOLMES-OUTDOORS-ENTER-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE
		" walks alongside you"
		" trails along after you"
		" follows you and begins pacing back and forth nervously"
		" joins you and starts looking around with interest"
		" follows you"
		" drifts along after you, apparently lost in thought">>>

<CONSTANT GL-WIGGINS-LOOK-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE
		" is shifting his weight from one foot to the other"
		" appears eager to help"
		" is standing around, waiting for you to do something"
		" is looking around with interest"
		" is here"
		" appears fascinated by everything">>>

<CONSTANT GL-WIGGINS-ENTER-TXT:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE 
		" follows you"
		" walks alongside you"
		" joins you and starts looking around with interest"
		" drifts along after you">>>

<CONSTANT K-BUTLER-ACCEPTS-MSG
"The butler accepts the item and asks you to wait while he takes it to Mr
Mycroft Holmes.">

<CONSTANT K-MUST-WEIGH-MSG
" must weigh twice what you do. You won't be able to lift him.">

<CONSTANT K-NOTHING-INSIDE-MSG
"the box with the key. You rummage around inside for a few moments
but discover nothing that would help you, so">

<CONSTANT K-FIDGETING-MSG
" is fidgeting nervously on the seat next to you">

<CONSTANT K-SPECIFY-MSG
"You must specify a particular ">

<CONSTANT K-SORRY-MATE-MSG
"\"Sorry, mate. I've me own plans, you know.\"">

<CONSTANT K-ENJOYING-RIDE-MSG
" looks like he is enjoying the boat ride">

<CONSTANT K-ILL-HOLD-IT-MSG
"\"Don't worry. I'll hold it for you.\"">

<CONSTANT K-CLOSED-AND-LOCKED-MSG
"It is already closed and locked.">

<CONSTANT K-MORE-VALUABLE-MSG
"\"If you expect me to let you in there, you'll have to offer me something a
lot more valuable than that.\"">

<CONSTANT K-RICOCHET-MSG
"The bullet ricochets wildly.">

<CONSTANT K-EAU-DE-MSG
"Mmmmmm. Eau de malmsey.">

;<CONSTANT K-CAN-LEAVE-MSG
"\"You can leave if you want to, guv. I'm waiting right here.\"">

<CONSTANT K-AFTER-YOU-MSG
"\"After you, guv.\"">

<CONSTANT K-CANT-LEAVE-MSG
"Wiggins sidles up next to you and whispers, \"I'd like to, guv. But Mr
'Olmes done give me clear instructions not to leave this spot. Is there
anyfing else I can do for you?\"">

<CONSTANT K-WOUNDED-PRIDE-MSG
" says with wounded pride, \"Sorry, guv. Me and Mr 'Olmes has a deal. One
shilling's me price. Nothing more. Nothing less.\"">

<CONSTANT K-GUARD-IGNORES-MSG
"The guard ignores you.">

<CONSTANT K-HOLMES-LICKS-MSG
"Holmes absentmindedly licks his fingers and then wipes his hands on his
smoking jacket. His ">

<CONSTANT K-ANOTHER-PHIAL-MSG
"Holmes takes another phial out of his pocket and stares at it in the same
way as before.">

<CONSTANT K-HOT-MSG
"Yeeeeeeeeeeeeeeeeeeeouch!!! Hot, hot, hot, hot...">

<CONSTANT K-ANCHOR-ALREADY-OUT-MSG
"The anchor is already out of the water.">

<CONSTANT K-MUST-BE-IN-BOAT-MSG
"You would have to be in the boat to ">

<CONSTANT K-NOT-SEE-HERE-MSG
"You do not see that here.">

<CONSTANT K-NO-RESTING-MSG
"This is no time for resting.">

<CONSTANT K-DIZZY-MSG
"You begin to feel a little dizzy.">

<CONSTANT K-LESTRADE-ARRESTS-MSG
"Lestrade arrests you and puts you in handcuffs. You will spend the rest of
your life in Dartmoor, trying to understand where you went wrong.">

<CONSTANT K-PLUG-HIM-MYSELF-MSG
" \"I don't blame you a bit, Dr Watson. Said \"Elementary\" one too many
times did 'e? Many's the time I've wanted to plug him myself. Still, I've
got to take you away. Come along now.\"">

<CONSTANT K-ANNIE-OAKELEY-MSG
"Who do you think you are, Annie Oakley?">

<CONSTANT K-SHATTER-MSG
" shatters and disappears.">

<CONSTANT K-CUSTOMARILY-KEEP-MSG
"\"Have you looked in your hat, old fellow? That is where you customarily
keep it.\"">

<CONSTANT K-PLEASE-KEEP-IT-MSG
"\"Please keep it, dear fellow. You may need it.\"">

<CONSTANT K-SEEMS-TO-HEAR-MSG
" seems to hear you, but he does not respond.">

<CONSTANT K-DROP-IT-FIRST-MSG
"Don't you think you should drop it first?">

<CONSTANT K-GNAWS-MSG
" gnaws on your leg briefly in response.">

<CONSTANT K-WORK-OUT-YOURSELF-MSG
"\"I'm afraid you'll have to work that out yourself, old boy.\"">

<CONSTANT K-NEVER-THEORIZE-MSG
"\"Never theorize in advance of the facts, Watson.\"">

<CONSTANT K-ON-DUTY-MSG
"The guard says, \"Sorry, sir. On duty, you know.\"">

<CONSTANT K-CONFUSED-MSG
"The pigeon looks at you with a confused expression.">

<CONSTANT K-TOO-HAUGHTY-MSG
"The nannies are too haughty to acknowledge your presence.">

<CONSTANT K-BETTER-SUCCESS-MSG
"You'd have better success if you launched the boat first.">

<CONSTANT K-REFERRING-MSG "[To what are you referring?]">

<CONSTANT K-DO-IT-YOURSELF-MSG "You will have to do that yourself.">

<CONSTANT K-INAPPROPRIATE-MSG "That would hardly be an appropriate thing to do.">

<CONSTANT K-HOW-TO-MSG "How do you intend to do that?">

<CONSTANT K-NO-SWIM-MSG "There is no place to swim here.">

<CONSTANT K-PROFANITY-MSG "A proper Victorian would never use such a vulgar word.">

<CONSTANT K-SUICIDE-MSG "Suicide is frowned upon in medical circles.">

<CONSTANT K-THEFT-MSG
"Thievery, outside of established limits, is frowned upon by the medical
profession.">

<CONSTANT K-SPECIFY-DIR-MSG "[You must specify a direction.]">

<CONSTANT K-WONT-HELP-MSG " is not likely to help matters.">

<CONSTANT K-GOOD-SHOW-MSG
"\"Good show!\"">

<CONSTANT K-PITY-MSG
"\"Pity.\"">

<CONSTANT K-MAYBE-MSG
"\"Be more decisive!\"">

<CONSTANT K-SIMPLE-TOMB-MSG
"It's a simple tomb, with a brief inscription written on it.">

<CONSTANT K-BREATH-TAKING-MSG
"The ceiling is breathtakingly beautiful.">

<CONSTANT K-GLINT-MSG
"Now that you know what to look for, you see a glint coming from Nelson's
blind eye.">

<CONSTANT K-NELSON-STATUE-MSG
" a statue of Nelson on the top and a bronze relief on the pedestal at
the bottom.">

<CONSTANT K-HEAVY-ARMOUR-MSG
"You cannot take another step in that heavy suit of armour.">

<CONSTANT K-WELL-WORN-MSG
"The door to the parlour is to the north, and
a flight of well-worn stairs leads up to the first floor.">

<CONSTANT K-URCHIN-MSG
"One of the urchins looks strangely familiar to you.">

<CONSTANT GL-LIBRARIAN-TXT1:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE 
	   "The vases of the fourth dynasty of the ancient Sumerians differed
significantly from those of the third dynasty. The most pronounced change
involved a slight flaring of the handles from one dynasty to the next. Most
experts agree that this symbolized a drastic change in the Sumerians'
perception of the goddess Ashtoreth. Others however, believe it made the
vases easier to carry"
	   "Monocotyledonous plants produce an embryo with a single cotyledon,
which functions primarily to make available the food which is
stored in the endosperm, as opposed to the more common dicotyledons,
which include most of the woody, deciduous plants of the temperate
climates"
	   "The Beaker People of prehistoric Britain are remembered primarily
for the reddish-brown pottery from which they take their name, and for
interring their dead in single graves under round barrows. This culture
disappeared in the Middle Bronze Age (circa 1800 B.C.) and has been annoying
British schoolchildren ever since"
	   "Perhaps you would be interested in something on the Punic Wars? I
believe I have a nineteen-volume history of them here somewhere"
	   "Stanislaw Leszczynski was crowned king of Poland in 1704, but was
deposed only five years later because no one could pronounce his name"
	   "The yin and yang philosophy of nature was developed around 2800
B.C. by the Chinese emperor Fu Hsi. According to Fu, health and tranquility
require a harmonious balance among all the body's elements. This theory
has always been ridiculed by the British, whose ancestors at this time
were still painting themselves blue and naming their children Og">>>

<CONSTANT GL-LIBRARIAN-TXT2:TABLE
	<TABLE (PATTERN (BYTE WORD))
	  <BYTE 1>
	  <PLTABLE 
	   "Louis I, son of Charlemagne, ascended France's throne in 814 A.D.
He was the first to implement that country's secret policy of naming all their
kings Louis in order to confuse enemy agents, historians, and their own
peasants." 
	   "The first workers' strike on record took place in Egypt in 1170
B.C., when labourers building a new pyramid in Thebes learned that their
payroll had been delayed. They organized a protest, stopped working, and
picketed the construction site carrying papyrus signs that read, 'Cash on
the line, or you don't get your shrine.' Tradition also has it that the
slogan they chanted was 'Stuff the crypt...We've been gypped...Ra Ra Ra.'"
	   "The confusion between the usage of the present subjunctive and the
past subjunctive is easily resolved as long as one remembers that the terms
refer not to different times, but to differing sorts of uncertainty. Reference
to time itself is only implied by the use of the past perfect subjunctive.
While no deaths have as yet resulted from incorrect usage, it would be
prudent not to take chances."
	   "While uncovering one's head is a symbol of respect in many
cultures, in others the opposite is true. Some Indian religions, for example,
require that a man's head remain covered at all times, giving rise to the use
of the turban, or 'imamah.' The tabu against removing one's turban eventually
became so strong that thieves who thought nothing of stealing a victim's
clothes would nevertheless leave his turban undisturbed."
	   "Most historians ascribe Catherine de Medicis's poor reputation
among the French to her ordering the wholesale massacre of French citizens in
1572. Recent research, however, has revealed that years before, in 1533,
she brought into the country such vegetables as broccoli, artichokes,
cabbage and haricot beans - and it is now widely accepted that this
alone was sufficient to make the French hate her."
	   "Are you sure I can't get you something on the Punic Wars?">>>

<CONSTANT K-SEASICK-MSG
" looks a little green from the motion of the boat">

<CONSTANT K-SITTING-QUIETLY-MSG
" is sitting quietly on the seat next to you">

<CONSTANT K-SECURELY-BOUND-MSG
" is securely bound to a chair with a thick rope">

<CONSTANT K-SIGN-HERE-MSG
"There is a sign on the wall.">

<CONSTANT K-YUCK-MSG
"Yuck! Have you looked at that stuff?">

<CONSTANT K-BRIGHTENS-UP-MSG
", and it brightens up an otherwise gloomy interior">

<CONSTANT K-SHAFT-OF-LIGHT-MSG
"A shaft of sunlight comes through the stained-glass window, lighting up one
of the tombs, and relieving the general gloom of the Abbey's dark interior.">

<CONSTANT K-HUDSON-WORRIED-MSG
" apologetically stands in front of the closed door. \"I'm terribly worried
about Mr Holmes, Doctor. Won't you please attend to him right away?\"">

<CONSTANT K-ASTERISK-MSG "         **********">

<CONSTANT K-TWINKLE-MSG
"Twinkle, twinkle, son of Mars,">

<CONSTANT K-TRANSEPT-MSG
"Transept of the Abbey, which is dominated by a beautiful rose window set
high into the wall.">

<CONSTANT K-EYES-HINGED-MSG
"Your eyes must be hinged a very interesting way if you think you can do
that.">

<CONSTANT K-AMBULATORY-MSG
"This is a narrow corridor lined with tombs.">

<CONSTANT K-EVERYONE-OUT-MSG
"Everyone here has been knocked out by the etherium, although it's hard to tell.">

<CONSTANT K-SAPPHIRE-MSG
", to which is glued a beautiful, deep-blue sapphire.">

<CONSTANT K-BRAVO-MSG
"Holmes looks at you approvingly and says, \"Bravo, Watson. Well done,
old chap.\"">

<CONSTANT K-GOOD-LOOK-MSG
" to get a really good look at it.">

<CONSTANT K-FOUGHT-WELL-MSG
"\"You fought well, Doctor. But you have lost.\"">

<CONSTANT K-WAKE-UP-MSG
"Sometime later you awaken and stumble back to your feet.">

<CONSTANT K-GET-OUT-FIRST-MSG
"You would have to get out of the boat first.">

<CONSTANT K-BRAND-MSG
"It's not your brand, but it's pleasant nonetheless.">

<CONSTANT K-SMOULDERS-MSG
"smoulders for a few seconds, then goes out.">

<CONSTANT K-OUTRAGED-CROWD-MSG
"The crowd is outraged that you would try to rob the ailing girl, and
they beat you about the head and shoulders with their shopping bags.">

<CONSTANT K-GOOD-HEALTH-MSG
" He looks suprised that you didn't try to haggle with him,
says, \"Thank you, guv'nor. Enjoy it in good 'ealth,\"">

<CONSTANT K-TIPSY-MSG
"You start to drink the wine and get a little tipsy. But even in your
altered state of consciousness you soon realize you'll never be able
to drink all of it.">

<CONSTANT K-BULLET-MSG
"The bullet knocks out the bung, which">

<CONSTANT K-CANT-WAIT-MSG
"can't wait for that.">

<CONSTANT K-ENOUGH-ROOM-MSG
"There isn't enough room in the cab to do that.">

<CONSTANT K-HOLMES-DISTRACTION-MSG
"Holmes ignores the distraction and continues staring at the phial.">

<CONSTANT K-WILD-RIDE-MSG
"After a wild ride through the streets of London, the cab finally careens
to a halt and the cabbie says brightly, \"Here we are!\"">


"NAMES FOR TH-EVENT OBJECT"

; "This table consists of quads.  The first element is the table of possible
   synonyms for a use of this; the second is adjectives.  The adjective table
   may be null.  The first word in the synonym table identifies the case we're
   interested in.  The third element is the string to use as the desc.  If
   it's null, use the first word of the name instead.  The fourth element
   specifies the setting of FL-NOARTC, FL-ALIVE, FL-PERSON, and FL-VOWEL."

<CONSTANT EN-NOARTC 1>
<CONSTANT EN-ALIVE 2>
<CONSTANT EN-PERSON 4>
<CONSTANT EN-VOWEL 8>

<CONSTANT EN-ENTLEN 4>

<CONSTANT TH-EVENT-NAMES
  <PLTABLE <PLTABLE <VOC "THEFT" NOUN>
		    <VOC "CHASE" NOUN>>	; "TH-THEFT"
	   <PLTABLE <VOC "MERRY" ADJ>>
	   <>
	   0
	   <PLTABLE <VOC "JUBILEE" NOUN>
		    <VOC "CELEBRATION" NOUN>
		    <VOC "PARADE" NOUN>>	; "TH-JUBILEE"
	   <>
	   "Jubilee"
	   0
	   <PLTABLE <VOC "HENRY" NOUN>
		    <VOC "IV" NOUN>>	; "TH-HENRY-IV"
	   <PLTABLE <VOC "HENRY" ADJ>>
	   "Henry IV"
	   0
	   <PLTABLE <VOC "WELLINGTON" NOUN>
		    <VOC "DUKE" NOUN>>	; "TH-DUKE-OF-WELLINGTON"
	   <PLTABLE <VOC "IRON" ADJ>>
	   "Duke of Wellington"
	   0
	   <PLTABLE <VOC "TOBY" NOUN>
		    <VOC "HOUND" NOUN>
		    <VOC "BLOODHOUND" NOUN>
		    <VOC "DOG" NOUN>>	; "TH-TOBY"
	   <>
	   "Toby"
	   0
	   <PLTABLE <VOC "MYCROFT" NOUN> <VOC "HOLMES" NOUN>
		    <VOC "BROTHER" NOUN>>	; "CH-MYCROFT-HOLMES"
	   <PLTABLE <VOC "MYCROFT" ADJ>>
	   "Mycroft Holmes"
	   <+ ,EN-NOARTC ,EN-ALIVE ,EN-PERSON>
	   <PLTABLE <VOC "PASSWORD" NOUN>
		    <VOC "SWORDFISH" NOUN>
		    <VOC "GIN" NOUN>
		    <VOC "PARR" NOUN>
		    <VOC "CLEVES" NOUN>
		    <VOC "ARAGON" NOUN>
		    <VOC "HOWARD" NOUN>
		    <VOC "SEYMOUR" NOUN>
		    <VOC "BOLEYN" NOUN>>	;"TH-PASSWORD-OBJ"
	   <>
	   <>
	   0
	   <PLTABLE <VOC "AGRA" NOUN> <VOC "TREASURE" NOUN>>
	   	;"TH-AGRA-TREASURE-OBJ"
	   <PLTABLE <VOC "AGRA" ADJ>>
	   "Agra treasure"
	   ,EN-VOWEL
	   <PLTABLE <VOC "KIDNAPPING" NOUN> <VOC "ABDUCTION" NOUN>
		    <VOC "ATTACK" NOUN>>	; "TH-KIDNAPPING-OBJ"
	   <PLTABLE <VOC "HOLMES'" ADJ> <VOC "HOLMES'S" ADJ>
		    <VOC "SHERLOCK" ADJ>>
	   <>
	   0
	   <PLTABLE <VOC "LESTRADE" NOUN>>	; "CH-LESTRADE"
	   <PLTABLE <VOC "INSPECTOR" ADJ>>
	   "Lestrade"
	   <+ ,EN-NOARTC ,EN-ALIVE ,EN-PERSON>
	   >>

<GLOBAL ALLOW-IN-TOWER <>>	; "Allow into tower w/o password"
<GLOBAL PASSWORD-ID 0>		; "FORMERLY AUX1 PROPERTY OF CH-MYCROFT-HOLMES"
<GLOBAL MYCROFT-STATE 3>	; "FL-LOCKED FLAG of MYCROFT"

; "1 BIT MEANS LOCKED, 2 MEANS ASLEEP"
<CONSTANT MYCROFT-LOCKED 1>
<CONSTANT MYCROFT-ASLEEP 2>
<CONSTANT MYCROFT-SEEN 4>

<DEFMAC SET-MYCROFT-STATE (OPER "TUPLE" FLAG)
  <COND (<==? .OPER SET>
	 <FORM SETG MYCROFT-STATE <FORM ORB ',MYCROFT-STATE <ORB !.FLAG>>>)
	(T
	 <FORM SETG MYCROFT-STATE
	       <FORM ANDB ',MYCROFT-STATE <XORB <ORB !.FLAG> -1>>>)>>

; "Syntax structure"
<DEFMAC P-SONUMS ('SYNTAX)
  <FORM LSH <FORM GETB .SYNTAX 0> -6>>

<CONSTANT K-P-SLEN-0 2>
<CONSTANT K-P-SLEN-1 4>
<CONSTANT K-P-SLEN-2 7>

<CONSTANT K-P-SPREP1 0>
<CONSTANT K-P-SPREP2 4>

<CONSTANT K-P-SFWIM1 2>
<CONSTANT K-P-SLOC1 3>
<CONSTANT K-P-SFWIM2 5>
<CONSTANT K-P-SLOC2 6>
<CONSTANT K-P-SACTION 1>

;<CONSTANT K-P-SBITS    0>
;<CONSTANT K-P-SPREP1   1>
;<CONSTANT K-P-SPREP2   2>
;<CONSTANT K-P-SFWIM1   3>
;<CONSTANT K-P-SONUMS   3>
;<CONSTANT K-P-SFWIM2   4>
;<CONSTANT K-P-SLOC1    5>
;<CONSTANT K-P-SLOC2    6>
;<CONSTANT K-P-SACTION  7>
;<CONSTANT K-P-SYNLEN   8>

; "time/date display control - used by rt-clk-nti-msg routines"

<CONSTANT K-NTI-SS 1>		; "disp sec - hh:mm:SS" 
<CONSTANT K-NTI-MM 2>		; "disp min - hh:MM:ss"
<CONSTANT K-NTI-HH 4>		; "disp hrs - HH:mm:ss"
<CONSTANT K-NTI-MT 8>		; "disp 24hr time instead of 12hr am/pm"
<CONSTANT K-NTI-SM 16>		; "disp AM/PM instead of a.m./p.m."

; "time/date display control - used by rt-clk-ndt-msg"

<CONSTANT K-NDT-YY 1>		; "disp yrs - mm/dd/YY"
<CONSTANT K-NDT-DD 2>		; "disp day - mm/DD/yy"
<CONSTANT K-NDT-MM 4>		; "disp mon - MM/dd/YY"

; "time/date display control - used by rt-clk-wdt-msg"

<CONSTANT K-WDT-YY  1>		; "disp yrs - month, dd YYYY"
<CONSTANT K-WDT-DD  2>		; "disp day - month, DD yyyy"
<CONSTANT K-WDT-MM  4>		; "disp mon - MONTH, dd yyyy"
<CONSTANT K-WDT-DS  8>		; "disp day suffix (DDst, DDnd, DDrd, DDth)"
<CONSTANT K-WDT-SN 16>		; "disp short month name"
<CONSTANT K-WDT-EN 32>		; "disp equal month name"

; "time/date display control - used by rt-clk-dow-msg"

<CONSTANT K-DOW-DW 1>		; "disp dow"
<CONSTANT K-DOW-SN 2>		; "disp short dow name"
<CONSTANT K-DOW-EN 4>		; "disp equal dow name"

<CONSTANT FIND-NO-LOCS <PLTABLE TH-PHIAL TH-SYRINGE TH-ASH>>

; "Stuff for calls to SDESC-type routines"
<CONSTANT K-DESC-ANY 1>		; "any foo"
<CONSTANT K-DESC-THE 2>		; "the/your/some foo"
<CONSTANT K-DESC-A 5>		; "a foo"

<GLOBAL KNIFE-COLD? T>	; "Formerly FL-COLD flag"
			  ;"FL-COLD means the knife is stuck to the mail."