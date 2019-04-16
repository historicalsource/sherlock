<PRINC "
******************************************************************************
******************************* SHERLOCK 1.00 ********************************
******************************************************************************
">

<VERSION XZIP>

ON!-INITIAL
OFF!-INITIAL
ENABLE!-INITIAL
DISABLE!-INITIAL

<SET REDEFINE T>

<SETG SIBREAKS ".,\"!?">

<OR <GASSIGNED? ZILCH>
	<SETG WBREAKS <STRING !\" !,WBREAKS>>>

<COND
	(<GASSIGNED? PREDGEN>
		<SETG ZSTR-ON <SETG ZSTR-OFF ,TIME>>)>

<SETG GL-DEBUG? <>>

<FUNNY-GLOBALS?>

<FREQUENT-WORDS?>

<ORDER-OBJECTS? ROOMS-AND-LGS-FIRST> ; "So we can use byte tables for rooms"

<SETG COMPACT-VOCABULARY? T>	; "Saves a byte/word"

<SETG COMPACT-SYNTAXES? T>	; "Seriously cram syntaxes"

<SETG DO-PURE-TABLE-NTHS? T>	; "Minor optimization"

<ZIP-OPTIONS SOUND UNDO>	; "Set UNDO bit in FLAGS"

; "GLOBAL property should make byte tables instead of word tables, due to
   ROOMS-AND-LGS-FIRST.  DIRECTION properties redefined to take advantage
   of single-byte room pointers, and to make more common exit types take
   less space."
<PROPDEF GLOBAL <>
	 (GLOBAL "MANY" LG:OBJECT = <> "MANY" <ROOM .LG>)>

<PROPDEF DIRECTIONS <>
	 (DIR TO R:ROOM =
	  (UEXIT 1)		#SEMI "UNCONDITIONAL EXIT"
	  (REXIT <ROOM .R>)	#SEMI "TO ROOM")
	 (DIR PER F:FCN =	; "Changed because most common case"
	  (FEXIT 2)		#SEMI "CONDITIONAL EXIT"
	  (FEXITFCN <WORD .F>)	#SEMI "PER FUNCTION")
	 (DIR TO R:ROOM IF O:OBJECT IS OPEN =
	  (DEXIT 3)		#SEMI "CONDITIONAL EXIT"
	  (REXIT <ROOM .R>)	#SEMI "TO ROOM"
	  (DEXITOBJ <OBJECT .O>)	#SEMI "IF DOOR IS OPEN")
	 (DIR SORRY S:STRING =
	  (NEXIT 4)		#SEMI "IMPOSSIBLE EXIT"
	  (NEXITSTR <STRING .S>)	#SEMI "FAILURE MESSAGE"
	  <BYTE 0>
	  <BYTE 0>)
	 (DIR TO R:ROOM IF F:GLOBAL =
	  (CEXIT 5)		#SEMI "CONDITIONAL EXIT"
	  (REXIT <ROOM .R>)	#SEMI "TO ROOM"
	  (CEXITFLAG <GLOBAL .F>) #SEMI "IF FLAG IS TRUE"
	  <BYTE 0> <BYTE 0> <BYTE 0>)
	 >

<DIRECTIONS NORTH NE EAST SE SOUTH SW WEST NW UP DOWN IN OUT>

<PUTPROP PSEUDOS PROPSPEC HACK-PSEUDOS>

<DEFINE20 HACK-PSEUDOS (LIST "AUX" (N 0) (CT 0) NL)
  <SET LIST <REST .LIST>>
  <SET LIST
    <MAPF ,LIST
      <FUNCTION (X)
        <COND (<0? .N>
	       <SET CT <+ .CT 1>>
	       <SET N 1>
	       <COND (<TYPE? .X ATOM>
		      <TABLE (PURE PATTERN (BYTE [REST WORD]))
			     1
			     <VOC <SPNAME .X> ADJ>>)
		     (<TYPE? .X LIST>
		      <EVAL <CHTYPE (TABLE (PURE PATTERN (BYTE [REST WORD]))
				     <LENGTH .X>
				     !<MAPF ,LIST
				       <FUNCTION (Y)
				         <VOC <SPNAME .Y> ADJ>>
				       .X>) FORM>>)
		     (T 0)>)
	      (<1? .N>
	       <SET N 2>
	       <COND (<TYPE? .X ATOM>
		      <TABLE (PURE PATTERN (BYTE [REST WORD]))
			     1 <VOC <SPNAME .X> NOUN>>)
		     (<TYPE? .X LIST>
		      <EVAL <CHTYPE (TABLE (PURE PATTERN (BYTE [REST WORD]))
				     <LENGTH .X>
				     !<MAPF ,LIST
				       <FUNCTION (Y)
				         <VOC <SPNAME .Y> NOUN>>
				       .X>) FORM>>)
		     (T 0)>)
	      (T
	       <SET N 0>
	       .X)>>
      .LIST>>
  (<> <EVAL <CHTYPE (TABLE (PURE PATTERN (BYTE [REST WORD]))
		     .CT !.LIST) FORM>>)>

<PUTPROP SIZE PROPSPEC HACK-SIZE>

<SETG20 SIZE-VALS 13>
<SETG20 MASS-VALS 11>
<SETG20 CAPACITY-VALS 102>

<DEFINE20 HACK-SIZE (LIST "AUX" (VAL 0) TL TN)
  <COND (<SET TL <MEMQ SIZE .LIST>>
	 <SET TN <2 .TL>>
	 <COND (<L? .TN 6>
		<SET VAL .TN>)
	       (<==? .TN 10> <SET VAL 6>)
	       (<==? .TN 12> <SET VAL 7>)
	       (<==? .TN 15> <SET VAL 8>)
	       (<==? .TN 20> <SET VAL 9>)
	       (<==? .TN 50> <SET VAL 10>)
	       (<==? .TN 99> <SET VAL 11>)
	       (<==? .TN 100> <SET VAL 12>)
	       (T <ERROR UNKNOWN-SIZE!-ERRORS .TN .LIST>)>)>
  <COND (<SET TL <MEMQ MASS .LIST>>
	 <SET TN <2 .TL>>
	 <COND (<L? .TN 6>)
	       (<==? .TN 10> <SET TN 6>)
	       (<==? .TN 15> <SET TN 7>)
	       (<==? .TN 50> <SET TN 8>)
	       (<==? .TN 100> <SET TN 9>)
	       (<==? .TN 250> <SET TN 10>)
	       (T <ERROR UNKNOWN-MASS!-ERRORS .TN .NAME .LIST>)>
	 <SET VAL <+ .VAL <* .TN ,SIZE-VALS>>>)>
  <COND (<SET TL <MEMQ CAPACITY .LIST>>
	 <SET TN <2 .TL>>
	 <COND (<L? .TN 101>)
	       (<==? .TN 999> <SET TN 101>)
	       (T <ERROR UNKNOWN CAPACITY!-ERRORS .TN .NAME .LIST>)>
	 <SET VAL <+ .VAL <* .TN <* ,SIZE-VALS ,MASS-VALS>>>>)>
  (<> .VAL)>

<DEFMAC IFSOUND ("ARGS" X)
	<COND (<LENGTH? .X 1> <1 .X>)
	      (T <CHTYPE (!.X) SPLICE>)>>

<INSERT-FILE "CONSTANTS" T>
<INSERT-FILE "MACROS"    T>   ;"AUXES MERGED INTO MACROS"
<INSERT-FILE "SYNTAX" T>      ;"MISC (BETA/GAMMA STUFF) DELETED"
<INSERT-FILE "SCHED"      T>
<INSERT-FILE "BOOT"       T>
<INSERT-FILE "PARSER"     T>
; "If PARSER doesn't end before 44800, you'll lose on the C64."
<PUT-PURE-HERE>
<INSERT-FILE "OTHER-MISC" T>  ;"GO & WAIT & WINDOW MERGED INTO OTHER-MISC"
<INSERT-FILE "SOUNDS"	 T>
<INSERT-FILE "DEBUG"     T>
<INSERT-FILE "HINTS"     T>
<INSERT-FILE "VERBS"	 T>
<INSERT-FILE "PEOPLE"	 T>
<INSERT-FILE "GENERIC"   T>
<INSERT-FILE "PLACES3"   T>
<INSERT-FILE "PLACES2"   T>
<INSERT-FILE "PLACES1"   T>
<INSERT-FILE "THINGS2"   T>
<INSERT-FILE "THINGS1"   T>
<INSERT-FILE "CAB"       T>
<INSERT-FILE "TOWER"     T>
<INSERT-FILE "SCOPE"     T>
<INSERT-FILE "ELIZA"     T>
<INSERT-FILE "CHARLES"   T>
<INSERT-FILE "BANK"      T>
<INSERT-FILE "PUZZLES"   T>
<INSERT-FILE "LOCALS"    T>   ;"MERGED LOCALS1 AND LOCALS2"


