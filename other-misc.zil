<DEFAULTS-DEFINED TRADEMARK-MSG>

<REPLACE-DEFINITION DEBUGGING-CODE T>

<REPLACE-DEFINITION COMMAND-CODE T>

<CONSTANT SIZE-VALS 13>
<CONSTANT MASS-VALS 11>
<CONSTANT CAPACITY-VALS 102>

<CONSTANT SIZE-TABLE <TABLE (PURE BYTE) 10 12 15 20 50 99 100>>

<ROUTINE SET-SIZE-TO-ONE (OBJ "AUX" (NUM <GETP .OBJ ,P?SIZE>))
  <PUTP .OBJ ,P?SIZE <+ 1 <* </ .NUM ,SIZE-VALS> ,SIZE-VALS>>>>

<ROUTINE GET-SIZE (OBJ "AUX" (NUM <GETP .OBJ ,P?SIZE>))
  <SET NUM <MOD .NUM ,SIZE-VALS>>
  <COND (<L? .NUM 6> .NUM)
	(T
	 <GETB ,SIZE-TABLE <- .NUM 6>>)>>

<CONSTANT MASS-TABLE <TABLE (PURE BYTE) 10 15 50 100 250>>

<ROUTINE SET-MASS-TO-ONE (OBJ "AUX" (NUM <GETP .OBJ ,P?SIZE>))
  <PUTP .OBJ ,P?SIZE <+ ,SIZE-VALS <MOD .NUM ,SIZE-VALS>
			<* </ .NUM <* ,SIZE-VALS ,MASS-VALS>>
			   <* ,SIZE-VALS ,MASS-VALS>>>>>

<ROUTINE GET-MASS (OBJ "AUX" (NUM <GETP .OBJ ,P?SIZE>))
  <SET NUM <MOD </ .NUM ,SIZE-VALS> ,MASS-VALS>>
  <COND (<L? .NUM 6> .NUM)
	(T
	 <GETB ,MASS-TABLE <- .NUM 6>>)>>

<ROUTINE GET-CAPACITY (OBJ "AUX" (NUM <GETP .OBJ ,P?SIZE>))
  <COND (<G? <SET NUM </ .NUM <* ,SIZE-VALS ,MASS-VALS>>> 100> 999)
	(T .NUM)>>

<ROUTINE SET-CAPACITY-TO-ONE (OBJ "AUX" (NUM <GETP .OBJ ,P?SIZE>))
  <PUTP .OBJ ,P?SIZE <+ <* ,SIZE-VALS ,MASS-VALS>
			<MOD .NUM <* ,SIZE-VALS ,MASS-VALS>>>>>

<ROUTINE RT-SEE-ANYTHING-IN? (THING "AUX" OBJ)
	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RFALSE>)
		      (<AND <MC-ISNOT? .OBJ ,FL-NODESC>
			    <NOT <EQUAL? .OBJ ,GL-WINNER>>>
		       <RTRUE>)
		      (T
		       <SET OBJ <NEXT? .OBJ>>)>>>

<ROUTINE RT-CANT-TOUCH-MSG (OBJ CLSD IN-OUT)
	<RT-CYOU-MSG>
	<TELL "cannot " VW " " THE .OBJ>
	<COND (<MC-T? .CLSD>
	       <TELL " because ">
	       <COND (<AND <MC-IS? .OBJ ,FL-PLURAL>
			   <MC-ISNOT? .OBJ ,FL-COLLECTIVE>>
		      <TELL "they are">)
		     (T
		      <TELL "it is">)>
	       <TELL " ">
	       <COND (<MC-T? .IN-OUT>
		      <TELL "inside">)
		     (T
		      <TELL "outside">)>
	       <TELL " " THE .CLSD ", which is closed">)>
	<TELL "." CR>>

<ROUTINE RT-TOTAL-SIZE-IN-OBJ (OBJ1 "AUX" OBJ (TOTSIZ 0))
	<SET OBJ <FIRST? .OBJ1>>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)
		      (T
		       <SET TOTSIZ <+ .TOTSIZ <GET-SIZE .OBJ>>>)>
		<SET OBJ <NEXT? .OBJ>>>
	<RETURN .TOTSIZ>>

<ROUTINE RT-TOTAL-MASS-OF-OBJ (OBJ1 "AUX" OBJ (TOTMAS 0))
	<SET OBJ <FIRST? .OBJ1>>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)
		      (T
		       <SET TOTMAS <+ .TOTMAS <RT-TOTAL-MASS-OF-OBJ .OBJ>>>)>
		<SET OBJ <NEXT? .OBJ>>>
	<SET TOTMAS <+ .TOTMAS <GET-MASS .OBJ1>>>
	<RETURN .TOTMAS>>

<ROUTINE RT-TOTAL-COUNT-IN-OBJ (OBJ1 "AUX" OBJ (TOTCNT 0))
	<SET OBJ <FIRST? .OBJ1>>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)
		      (<AND <MC-IS? .OBJ ,FL-WORN>
			    <IN? .OBJ ,CH-PLAYER>>
		       T)
		      (<MC-IS? .OBJ ,FL-BODYPART>
		       T)
		      (T
		       <INC TOTCNT>)>
		<SET OBJ <NEXT? .OBJ>>>
	<RETURN .TOTCNT>>

<ROUTINE RT-OBJ-TOO-LARGE? (OBJ1 OBJ2)
	<G? <+ <GET-SIZE .OBJ1> <RT-TOTAL-SIZE-IN-OBJ .OBJ2>>
	    <GET-CAPACITY .OBJ2>>>

<ROUTINE RT-OBJ-TOO-HEAVY? (OBJ1 OBJ2)
	<G? <+ <RT-TOTAL-MASS-OF-OBJ .OBJ1> <RT-TOTAL-MASS-OF-OBJ .OBJ2>>
	    <GETP .OBJ2 ,P?STRENGTH>>>

<ROUTINE RT-OBJ-TOO-MANY? (OBJ1 OBJ2)
	<G? <+ 1 <RT-TOTAL-COUNT-IN-OBJ .OBJ2>>
	    <GETP .OBJ2 ,P?DEXTERITY>>>

<ROUTINE RT-REMOVE-ALL (OBJ1 "AUX" OBJ NXT (CNT 0))
	<SET OBJ <FIRST? .OBJ1>>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)>
		<SET NXT <NEXT? .OBJ>>
		<REMOVE .OBJ>
		<INC CNT>
		<SET OBJ .NXT>>
	<RETURN .CNT>>

<ROUTINE RT-MOVE-ALL-BUT-WORN (OBJ1 OBJ2 "AUX" OBJ NXT (CNT 0))
	<SET OBJ <FIRST? .OBJ1>>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)>
		<SET NXT <NEXT? .OBJ>>
		<COND (<AND <MC-ISNOT? .OBJ ,FL-WORN>
			    <NOT <EQUAL? .OBJ ,TH-POCKET>>>
		       <MOVE .OBJ .OBJ2>
		       <INC CNT>)>
		<SET OBJ .NXT>>
	<RETURN .CNT>>

<ROUTINE RT-MOVE-NODESC-OBJS (OBJ1 OBJ2 "AUX" OBJ NXT (CNT 0)) 
	<SET OBJ <FIRST? .OBJ1>>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)>
		<SET NXT <NEXT? .OBJ>>
		<COND (<MC-IS? .OBJ ,FL-NODESC>
		       <MOVE .OBJ .OBJ2>
		       <INC CNT>)>
		<SET OBJ .NXT>>
	<RETURN .CNT>>

<ROUTINE RT-FIND-IN? (OBJ1 FLG "AUX" OBJ) 
	<SET OBJ <FIRST? .OBJ1>>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RFALSE>)
		      (<MC-IS? .OBJ .FLG>
		       <RETURN .OBJ>)>
		<SET OBJ <NEXT? .OBJ>>>>

<ROUTINE RT-GET-ANY-KEY ("AUX" X)
	<TELL "[Press any key.]" CR>
	<SET X <INPUT 1>>
	<RTRUE>>

<ROUTINE RT-GET-YES-NO? ("AUX" WORD)
	<REPEAT ()
		<TELL CR "Please type YES or NO > ">
		<PUTB ,GL-YES-LEXV 0 4>
		<PUTB ,GL-YES-IBUF 1 0>
		<READ ,GL-YES-IBUF ,GL-YES-LEXV>
		<SET WORD <GET ,GL-YES-LEXV ,K-P-LEXSTART>>
		<COND (<ZERO? <GETB ,GL-YES-LEXV ,K-P-LEXWORDS>>
		       T)
		      (<MC-T? .WORD>
		       <COND (<EQUAL? .WORD ,W?Y ,W?YES>
			      <RTRUE>)
			     (<EQUAL? .WORD ,W?N ,W?NO>
			      <RFALSE>)>)>>>

<ROUTINE RT-INIT-SCREEN ("OPT" (FAST? <>))
  <COND (.FAST?
	 <SPLIT ,GL-SPLIT-ROW>
	 <CLEAR 1>)
	(T
	 <CLEAR -1>
	 <SPLIT ,GL-SPLIT-ROW>)>
  <SCREEN ,K-S-WIN>
  ;<BUFOUT <>>
  <HLIGHT ,K-H-INV>
  <CURSET ,GL-SPLIT-ROW 1>
  <RT-PRINT-SPACES ,GL-ALLSCREEN>
  <SETG GL-PLACE-STS -1>
  <SETG GL-MOVES-STS -1>
  <SETG GL-SCORE-STS -1>
  <CURSET ,GL-SPLIT-ROW ,GL-STAT-S-POS>
  <COND (<NOT ,GL-SHORT-STAT?>
	 <TELL "Score:">)>
  <HLIGHT ,K-H-NRM>
  ;<BUFOUT T>
  <SCREEN ,K-S-NOR>
  <RTRUE>>

<ROUTINE RT-GAMETITLE-MSG ()
	<TELL "Sherlock: The Riddle of the Crown Jewels" CR>
	<RTRUE>>

<ROUTINE RT-COPYRIGHT-MSG ()
	<TELL "Copyright 1987 Infocom, Inc." CR>
	<RTRUE>>

<DEFAULT-DEFINITION TRADEMARK-MSG
 <ROUTINE RT-TRADEMARK-MSG ()
	<TELL "Sherlock: The Riddle of the Crown Jewels is a trademark of Infocom, Inc." CR>
	<RTRUE>>>

<ROUTINE RT-ID-MSG ()
	<TELL "Release " N <BAND <LOWCORE ZORKID> *3777*>>
	<TELL " Interpreter " N <LOWCORE INTID>>
	<TELL " Version " C <LOWCORE INTVR>>
	<TELL " Serial Number ">
	<LOWCORE-TABLE SERIAL 6 PRINTC>
	<CRLF>
	<RTRUE>>

<ROUTINE RT-VERSION-MSG ()
	<HLIGHT ,K-H-BLD>
	<RT-GAMETITLE-MSG>
	<RT-COPYRIGHT-MSG>
	<RT-TRADEMARK-MSG>
	<RT-ID-MSG>
	<HLIGHT ,K-H-NRM>
	<RTRUE>>

<ROUTINE RT-DESC-PL-CONT-1 (SURFACE CNT "AUX" OBJ NXT FIRST
			    (PERSON-COUNT 0) (PERSON-PLURAL <>))
  <SET OBJ <FIRST? .SURFACE>>
  <SET FIRST T>
  <REPEAT ()
    <COND (<MC-F? .OBJ>
	   <RETURN>)
	  (<OR <MC-IS? .OBJ ,FL-NODESC>
	       <EQUAL? .OBJ ,GL-PUPPY>>
	   <SET OBJ <NEXT? .OBJ>>
	   <AGAIN>)
	  (<MC-IS? .OBJ ,FL-PERSON>
	   <SET PERSON-COUNT <+ .PERSON-COUNT 1>>
	   <SET OBJ <NEXT? .OBJ>>
	   <AGAIN>)
	  (<MC-T? .FIRST>
	   <COND (<G? .CNT 0>
		  <TELL " ">)
		 (T
		  <CRLF>)>
	   <TELL "You see ">
	   <SET FIRST <>>)>
    <TELL A .OBJ>
    <INC CNT>
    <SET OBJ <NEXT? .OBJ>>
    <REPEAT ()
      <COND (<MC-F? .OBJ>
	     <RETURN>)
	    (<OR <==? .OBJ ,GL-PUPPY>
		 <FSET? .OBJ ,FL-NODESC>> T)
	    (<AND <MC-IS? .OBJ ,FL-PERSON>
		  <MC-ISNOT? .OBJ ,FL-NODESC>>
	     <SET PERSON-COUNT <+ .PERSON-COUNT 1>>)
	    (T
	     <RETURN>)>
      <SET OBJ <NEXT? .OBJ>>>
    <COND (<MC-T? .OBJ>
	   <SET NXT <NEXT? .OBJ>>
	   <REPEAT ()
	     <COND (<MC-F? .NXT>
		    <RETURN>)
		   (<AND <MC-ISNOT? .NXT ,FL-NODESC>
			 <NOT <EQUAL? .NXT ,GL-PUPPY>>
			 <MC-ISNOT? .NXT ,FL-PERSON>>
		    <RETURN>)>
	     <SET NXT <NEXT? .NXT>>>
	   <COND (<MC-F? .NXT>
		  <TELL " and ">)
		 (T
		  <TELL ", ">)>)
	  (T
	   <COND (<NOT <IN? .SURFACE ,ROOMS>>
		  <TELL " on " THE .SURFACE>)>
	   <TELL ".">)>>
  <COND (<G? .PERSON-COUNT 0>
	 <COND (<G? .CNT 0>
		<TELL " ">)
	       (T
		<CRLF>)>
	 <SET CNT <+ .CNT .PERSON-COUNT>>
	 <COND (<G? .PERSON-COUNT 1>
		<SET PERSON-PLURAL T>)>
	 <SET OBJ <FIRST? .SURFACE>>
	 <SET FIRST T>
	 <REPEAT ()
	   <COND (<OR <MC-IS? .OBJ ,FL-NODESC>
		      <EQUAL? .OBJ ,GL-PUPPY>> T)
		 (<MC-IS? .OBJ ,FL-PERSON>
		  <COND (.FIRST
			 <TELL CA .OBJ>)
			(T
			 <TELL A .OBJ>)>
		  <SET FIRST <>>
		  <COND (<MC-IS? .OBJ ,FL-PLURAL>
			 <SET PERSON-PLURAL T>)>
		  <COND (<0? <SET PERSON-COUNT <- .PERSON-COUNT 1>>>
			 <COND (.PERSON-PLURAL
				<TELL " are">)
			       (T
				<TELL " is">)>
			 <TELL " here.">
			 <RETURN>)
			(<1? .PERSON-COUNT>
			 <TELL " and ">)
			(T
			 <TELL ", ">)>)>
	   <SET OBJ <NEXT? .OBJ>>>)>
  <SET OBJ <FIRST? .SURFACE>>
  <REPEAT ()
    <COND (<MC-F? .OBJ>
	   <RETURN>)
	  (<MC-IS? .OBJ ,FL-SURFACE>
	   <SET CNT <RT-DESC-PL-CONT-1 .OBJ .CNT>>)>
    <SET OBJ <NEXT? .OBJ>>>
  <RETURN .CNT>>

<ROUTINE RT-DESCRIBE-PLACE-CONTENTS ("OPTIONAL" (PLACE <>) (LOOK <>) "AUX" OBJ
					         PREV (CNT 0) LIGHT)
	<COND (<MC-F? .PLACE>          ;"if no place is passed as an argument"
	       <SET PLACE ,GL-PLACE-CUR>)>   ;"use gl-place-cur"
	<COND (<MC-T? <RT-DESC-PL-CONT-1 .PLACE 0>>
	       <CRLF>)>; "describe each object"
	<RTRUE>>

<ROUTINE RT-RANK-STR (PTS)
	<COND (<L? .PTS 1>
	       <RETURN "Chief Superintendent of Scotland Yard">)
	      (<L? .PTS 21>
	       <RETURN "Inspector">)
	      (<L? .PTS 41>
	       <RETURN "Detective">)
	      (<L? .PTS 61>
	       <RETURN "Lieutenant">)
	      (<L? .PTS 81>
	       <RETURN "Sergeant">)
	      (<L? .PTS 91>
	       <RETURN "Private">)
	      (<L? .PTS 100>
	       <RETURN "Patrolman">)
	      (T
	       <RETURN "Consulting Detective">)>>

<ROUTINE RT-NEW-SCORE-MSG (PTS)
	<COND (<0? .PTS> <RFALSE>)>
	<HLIGHT ,K-H-BLD>
	<COND (<MC-T? ,GL-SCORE-MSG>
	       <TELL CR "[Your score just went up by " N .PTS " point">
	       <COND (<G? .PTS 1>
		      <TELL "s">)>
	       <TELL
". The total is now " N ,GL-SCORE-CUR " out of " N ,GL-SCORE-MAX ".]" CR>)>
	<HLIGHT ,K-H-NRM>>


; "All words for this are in the table TH-EVENT-NAMES in CONSTANTS.
   This will only ever be found by MOBY-FIND."

<OBJECT TH-EVENT
	(FLAGS FL-NODESC FL-NEEDS-IDENTITY FL-HAS-SDESC FL-NOARTC)
	(OBJ-ADJ 0)
	(OBJ-NOUN 0)
	(ACTION RT-AC-TH-EVENT)>

; "Given noun and adjective, see if TH-EVENT can be a match"
<ROUTINE RT-PARSE-EVENT? (NOUN ADJ "AUX" (OBJ ,TH-EVENT))
  <REPEAT ((N </ <ZGET ,TH-EVENT-NAMES 0> ,EN-ENTLEN>)
	   (TB <ZREST ,TH-EVENT-NAMES 2>)
	   NTB ATB FLGS)
    <COND (<INTBL? .NOUN <ZREST <SET NTB <ZGET .TB 0>> 2>
		   <ZGET .NTB 0>>
	   <COND (<OR <NOT .ADJ>
		      <AND <SET ATB <ZGET .TB 1>>
			   <INTBL? .ADJ <ZREST .ATB 2> <ZGET .ATB 0>>>>
		  <PUTP .OBJ ,P?OBJ-NOUN
			<ZGET .NTB 1>>
		  <SET FLGS <ZGET .TB 3>>
		  ; "NOARTC is handled by RT-DESC-EVENT"
		  <COND (<T? <ANDB .FLGS ,EN-ALIVE>>
			 <FSET .OBJ ,FL-ALIVE>)
			(T
			 <FCLEAR .OBJ ,FL-ALIVE>)>
		  <COND (<T? <ANDB .FLGS ,EN-PERSON>>
			 <FSET .OBJ ,FL-PERSON>)
			(T
			 <FCLEAR .OBJ ,FL-PERSON>)>
		  <COND (<T? <ANDB .FLGS ,EN-VOWEL>>
			 <FSET .OBJ ,FL-VOWEL>)
			(T
			 <FCLEAR .OBJ ,FL-VOWEL>)>
		  <RETURN .OBJ>)
		 (T
		  <RFALSE>)>)>
    <COND (<L? <SET N <- .N 1>> 1> <RFALSE>)>
    <SET TB <ZREST .TB <* ,EN-ENTLEN 2>>>>>

<ROUTINE RT-IDENTIFY-EVENT? (WD "OPT" (OBJ <>)
			     "AUX" (NAM <GETP ,TH-EVENT ,P?OBJ-NOUN>))
  <COND (<AND .OBJ <N==? .OBJ ,TH-EVENT>>
	 <RFALSE>)>
  <REPEAT ((N </ <ZGET ,TH-EVENT-NAMES 0> ,EN-ENTLEN>)
	   (TB <ZREST ,TH-EVENT-NAMES 2>) NTB)
    <COND (<==? .WD <ZGET <SET NTB <ZGET .TB 0>> 1>>
	   ; "This is the case we're interested in"
	   <COND (<INTBL? .NAM <ZREST .NTB 2> <ZGET .NTB 0>>
		  <RTRUE>)
		 (T
		  <RFALSE>)>)>
    <COND (<L? <SET N <- .N 1>> 1> <RFALSE>)>
    <SET TB <ZREST .TB <* ,EN-ENTLEN 2>>>>>
	
<ROUTINE RT-DESC-EVENT ("OPT" (CLASS <>)
			"AUX" (WD <GETP ,TH-EVENT ,P?OBJ-NOUN>)
			FLAGS)
  <REPEAT ((N </ <ZGET ,TH-EVENT-NAMES 0> ,EN-ENTLEN>)
	   (TB <ZREST ,TH-EVENT-NAMES 2>))
     <COND (<==? .WD <ZGET <ZGET .TB 0> 1>>
	    <SET FLAGS <ZGET .TB 3>>
	    <COND (<ZGET .TB 2>
		   <PRINT-SDESC <ZGET .TB 2> .CLASS
				<NOT <0? <ANDB .FLAGS ,EN-NOARTC>>>
				<FSET? ,TH-EVENT ,FL-PLURAL>
				<FSET? ,TH-EVENT ,FL-VOWEL>>)
		  (T
		   <PRINT-SDESC .WD .CLASS
				<NOT <0? <ANDB .FLAGS ,EN-NOARTC>>>
				<FSET? ,TH-EVENT ,FL-PLURAL>
				<FSET? ,TH-EVENT ,FL-VOWEL>
				T>)>
	    <RTRUE>)>
     <COND (<L? <SET N <- .N 1>> 1> <RFALSE>)>
     <SET TB <ZREST .TB <* ,EN-ENTLEN 2>>>>>

<ROUTINE RT-AC-TH-EVENT ("OPT" (CONTEXT <>) (CLASS <>))
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <RT-DESC-EVENT .CLASS>)
	      (<NOT <RT-TALK-VERB?>>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)>>

<ROUTINE RT-TO-DO-THING-USE-MSG (STR1 STR2)
       <TELL "[To " .STR1 " something, use the command: " .STR2 " THING.]" CR>
       <RTRUE>>

<ROUTINE RT-NOT-IN-SENTENCE-MSG (STR)
	 <TELL "[There are not " .STR " in that sentence.]" CR>
	 <RTRUE>>

<ROUTINE RT-IMPOSSIBLE-MSG ("AUX" WHO)
	<SET WHO <RT-WHO-SAYS?>>
	<COND (<EQUAL? .WHO ,CH-HOLMES ,CH-WIGGINS>
	       <COND (<EQUAL? .WHO ,CH-HOLMES>
		      <TELL <RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
			    " looks at you "
			    <RT-PICK-NEXT ,GL-HOLMES-DESPAIR-TXT>
			    " and says, \""
			    <RT-PICK-NEXT ,GL-HOLMES-IMPOSSIBLE-TXT>>)
		     (<EQUAL? .WHO ,CH-WIGGINS>
		      <TELL <RT-PICK-NEXT ,GL-WIGGINS-DESC-TXT>
			    " says, \""
			    <RT-PICK-NEXT ,GL-WIGGINS-IMPOSSIBLE-TXT>>)>
	       <TELL ".\"">)
	      (T
	       <TELL <RT-PICK-NEXT ,GL-IMPOSSIBLE-TXT> ".">)>
	<CRLF>
	<RTRUE>>

<ROUTINE RT-NOT-LIKELY-MSG (THING STR)
	<TELL "It" <RT-PICK-NEXT ,GL-NOT-LIKELY-TXT> " that " THE .THING>
	<TELL " " .STR "." CR>
	<RTRUE>>

<ROUTINE RT-LOOKS-PUZZLED-MSG (WHO)
	<TELL CTHE .WHO " ">
	<TELL <RT-PICK-NEXT ,GL-LOOKS-TXT> " ">
	<TELL <RT-PICK-NEXT ,GL-PUZZLED-TXT> "." CR>
	<RTRUE>>

<ROUTINE RT-WINNER-NOT-HOLDING-MSG ()
	<TELL CTHE ,GL-WINNER>
	<RT-ISNT-ARENT-MSG ,GL-WINNER>
	<TELL "holding ">
        <RTRUE>>

<ROUTINE RT-YOUD-HAVE-TO-MSG (STR THING)
	<TELL "You would have to " .STR " " THE .THING " to do that." CR>
	<RT-THIS-IS-IT .THING>
	<RTRUE>>

<ROUTINE RT-WOULD-HAVE-TO-MSG ("OPTIONAL" (STR <>) (THING <>))   
	<TELL "would have to " .STR " ">
	<COND (<MC-T? .THING>
	       <TELL THE .THING>)>
	<RT-THIS-IS-IT .THING>
	<RTRUE>>

<ROUTINE RT-NOBODY-TO-ASK-MSG ()
   <TELL "[There is nobody here to ask.]" CR>
   <RT-P-CLEAR>
   <RTRUE>>

<ROUTINE RT-TALK-TO-SELF-MSG ()
   <TELL "[You must address characters directly.]" CR>
   <RT-P-CLEAR>
   <RTRUE>>

<ROUTINE RT-WAY-TO-TALK-MSG ()
   <TELL
"[Refer to your instruction manual for the correct way to address
characters.]" CR>
   <RT-P-CLEAR>
   <RFATAL>>

<ROUTINE RT-I-SUN-UP-DOWN-MSG ("AUX" TOD)
    <COND (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
	   <RFALSE>)
	  (<EQUAL? <RT-CLOCK-CMP 6 30 0> 0>
	   <RT-ALARM-SET-REL ,RT-I-SUN-UP-DOWN-MSG <RT-PARM-SET 0 30 0>>
	   <SETG GL-LAST-OUT-TOD 1>
	   <TELL CR
"Visibility increases in the gathering light of the new day.">
	   <COND (<NOT <EQUAL? ,GL-PLACE-CUR ,RM-THAMES-ONE ,RM-THAMES-TWO ,RM-THAMES-THREE ,RM-THAMES-FOUR ,RM-THAMES-FIVE>>
		  <TELL " Tourists are beginning to crowd into the streets.">)>
	   <CRLF>)
	  (<EQUAL? <RT-CLOCK-CMP 7 0 0> 0>
	   <RT-ALARM-SET-REL ,RT-I-SUN-UP-DOWN-MSG <RT-PARM-SET 12 30 0>>
	   <SETG GL-LAST-OUT-TOD 2>
	   <TELL CR
"The sun comes up, as much as it ever comes up in England." CR>
	   <RFALSE>)
	  (<EQUAL? <RT-CLOCK-CMP 19 30 0> 0>
	   <RT-ALARM-SET-REL ,RT-I-SUN-UP-DOWN-MSG <RT-PARM-SET 0 30 0>>
	   <SETG GL-LAST-OUT-TOD 3>
	   <TELL CR
"Daylight begins to fade. Soon it will be dark." CR>)
	  (<EQUAL? <RT-CLOCK-CMP 20 0 0> 0>
	   <RT-ALARM-SET-REL ,RT-I-SUN-UP-DOWN-MSG <RT-PARM-SET 10 30 0>>
	   <SETG GL-LAST-OUT-TOD 0>
	   <TELL CR "Darkness falls and the mists come in." CR>
	   <RFALSE>)>>

<ROUTINE RT-NO-OTHER? ("OPTIONAL" (FEMALE? <>) "AUX" OBJ)
	<SET OBJ <FIRST? ,GL-PLACE-CUR>>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)
		      (T
		       <COND (<AND <NOT <EQUAL? .OBJ ,GL-WINNER>>
				   <MC-IS? .OBJ ,FL-PERSON>>
			      <COND (<AND <MC-T? .FEMALE?>
					  <MC-IS? .OBJ ,FL-FEMALE>>
				     <RETURN>)
				    (<AND <MC-F? .FEMALE?>
					  <MC-ISNOT? .OBJ ,FL-FEMALE>>
				     <RETURN>)>)>
		       <SET OBJ <NEXT? .OBJ>>)>>
	<COND (<MC-F? .OBJ>
	       <RFALSE>)
	      (T
	       <RT-LOOKS-PUZZLED-MSG ,GL-WINNER>
	       <TELL "To whom are you referring?" CR>
	       <RTRUE>)>>

<ROUTINE RT-GLOBAL-IN? (OBJ1 OBJ2 "AUX" TBL)
	<SET TBL <GETPT .OBJ2 ,P?GLOBAL>>
	<COND (<MC-F? .TBL>
	       <RFALSE>)
	      (<AND <L=? .OBJ1 255>
		    <INTBL? .OBJ1 .TBL <PTSIZE .TBL> 1>>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE RT-META-LOC (OBJ)
   <REPEAT ()
      <COND (<MC-F? .OBJ>
	     <RFALSE>)
	    (<IN? .OBJ ,GLOBAL-OBJECTS>
	     <RETURN ,GLOBAL-OBJECTS>)
	    (<IN? .OBJ ,ROOMS>
	     <RETURN .OBJ>)
	    (T
	     <SET OBJ <LOC .OBJ>>)>>>

<ROUTINE GO ()
  ;<SETG GL-CLOCK-DSP  T >
  <SETG GL-CLOCK-FMT  0 >
  ;<SETG GL-MOVES-DSP <> >	; "There's no way to set these, ever"
  ;<SETG GL-SCORE-DSP  T >
  <SETG GL-SCORE-MSG  T >
  <SETG GL-SCORE-MAX 100>
  <SETG GL-PLACE-CUR ,RM-221B-BAKER-ST>
  <RT-CLOCK-INC-SET 0 1 0>				; "hrs min sec"
  <RT-CLOCK-DEF-SET 0 1 0>				; "hrs min sec"
  <RT-CLOCK-SET 5 0 0 18 ;6>		; "hrs min sec yrs mon day dow"
  <RT-ALARM-SET-ABS ,RT-I-BIGBEN <RT-PARM-SET 6 0 0 18>>
  <RT-ALARM-SET-ABS ,RT-I-SUN-UP-DOWN-MSG <RT-PARM-SET 6 30 0 18>>
  <RT-ALARM-SET-ABS ,RT-I-PM-QUITS <RT-PARM-SET 6 30 0 18>>
  <RT-ALARM-SET-ABS ,RT-I-OPEN-WESTMINSTER-DOOR    <RT-PARM-SET  7  0 0 18>>
  <RT-ALARM-SET-ABS ,RT-I-WESTMINSTER-LIGHTS-ON    <RT-PARM-SET  6 55 0 18>>
  <RT-ALARM-SET-ABS ,RT-I-FLASH-WESTMINSTER-LIGHTS <RT-PARM-SET 17 50 0 18>>
  <RT-ALARM-SET-ABS ,RT-I-WESTMINSTER-LIGHTS-OFF   <RT-PARM-SET 18  5 0 18>>
  <RT-ALARM-SET-ABS ,RT-I-WESTMINSTER-LIGHTS-ON    <RT-PARM-SET  6 55 0 19>>
  <RT-ALARM-SET-ABS ,RT-I-FLASH-WESTMINSTER-LIGHTS <RT-PARM-SET 17 50 0 19>>
  <RT-ALARM-SET-ABS ,RT-I-LOCKED-IN-END-GAME       <RT-PARM-SET 18  1 0 19>>
  <RT-ALARM-SET-ABS ,RT-I-OPEN-MUSEUM-DOOR <RT-PARM-SET 8 0 0 18>>
  <RT-ALARM-SET-ABS ,RT-I-OUT-OF-TIME <RT-PARM-SET 9 0 0 20>>

; "the following will normally not have to changed from game to game"

  <SETG GL-SCORE-CUR   0>
  <SETG GL-MOVES-CUR   0>
  <SETG GL-SCORE-STS  -1>
  <SETG GL-MOVES-STS  -1>
  <SETG GL-PLACE-STS  -1>
  <SETG GL-PLACE-PRV  -1>
  <SETG GL-NOW-LIT? <RT-IS-LIT?>>
  <SETG GL-WINNER ,CH-PLAYER>
  <SETG GL-ALLSCREEN <LOWCORE SCRH>>
  <SETG GL-MIDSCREEN </ ,GL-ALLSCREEN 2>>
  <COND (<L? ,GL-ALLSCREEN 60>
	 ; "Short status line"
	 <SETG GL-SHORT-STAT? T>
	 <SETG GL-STAT-S-POS 4>
	 <SETG GL-STAT-T-POS 17>
	 <SETG GL-SCORE-HEADER-LEN 0>
	 <SETG GL-STAT-MAX-ROOM <- ,GL-ALLSCREEN 19>>)>
  <SETG GL-STAT-S-POS <- ,GL-ALLSCREEN ,GL-STAT-S-POS>>
  <SETG GL-STAT-T-POS <- ,GL-ALLSCREEN ,GL-STAT-T-POS>>
  <SETG GL-SPLIT-ROW 1>
  <MOVE ,CH-PLAYER ,GL-PLACE-CUR>
  <CLEAR -1>
  <CRLF>
  <RT-GAMETITLE-MSG>
  <RT-COPYRIGHT-MSG>
  <RT-TRADEMARK-MSG>
  <RT-ID-MSG>
  <CRLF>
  <RT-GET-ANY-KEY>
  <RT-INIT-SCREEN>
  <RT-UPDATE-STATUS-LINE>
  <RT-DESC-ALL>
  <RT-P-CLEAR>
  <RT-MAIN-LOOP>
  <AGAIN>>

;"wait stuff"

<GLOBAL BELIEVE-WAIT-TIME? <>>

<ROUTINE RT-NUMBER? (PTR "AUX" TMP CNT BPTR (TPTR ,K-HRS) CHR (SUM 0) (TIM <>)
		     (AM-PM? 0))
  <SET TMP <REST ,GL-P-P-LEX <* .PTR 2>>>
  <COND (<==? <SET CNT <GET .TMP ,K-P-LEXELEN>> ,W?AM>
	 <SET AM-PM? 1>)
	(<==? .CNT ,W?PM>
	 <SET AM-PM? 2>)>
  <COND (<T? .AM-PM?>
	 <SETG BELIEVE-WAIT-TIME? T>)
	(T
	 <SETG BELIEVE-WAIT-TIME? <>>)>
  <SET CNT <GETB .TMP 2>>
  <SET BPTR <GETB .TMP 3>>
  <REPEAT ()
    <COND (<DLESS? CNT 0>
	   <RETURN>)
	  (T
	   <SET CHR <GETB ,GL-P-PIBUF .BPTR>>
	   <COND (<EQUAL? .CHR !\:>
		  <PUTB ,GL-P-TIME .TPTR .SUM>
		  <COND (<EQUAL? .TPTR ,K-HRS>
			 <COND (<G? .SUM 23>
				<RFALSE>)>
			 <COND (<AND <==? .AM-PM? 2>
				     <L? .SUM 12>>
				<SET SUM <+ .SUM 12>>
				<PUTB ,GL-P-TIME ,K-HRS .SUM>)>
			 <SET TPTR ,K-MIN>)
			(<EQUAL? .TPTR ,K-MIN>
			 <RFALSE>)
			(<EQUAL? .TPTR ,K-SEC>
			 <RFALSE>)>
		  <SET TIM T>
                  <SET SUM 0>)
		 (<G? .SUM 9999>
		  <RFALSE>)
		 (<OR  <G? .CHR !\9>
		       <L? .CHR !\0>>
		  <RFALSE>)
		 (T
		  <SET SUM <+ <* .SUM 10> <- .CHR !\0>>>)>
	   <SET BPTR <+ .BPTR 1>>)>>
  <COND (<MC-T? .TIM>
	 <PUTB ,GL-P-TIME .TPTR .SUM>
	 <COND (<EQUAL? .TPTR ,K-HRS>
		<RFALSE>)
	       (<EQUAL? .TPTR ,K-MIN>
		<COND (<OR <L? .SUM 0>
			   <G? .SUM 59>>
		       <RFALSE>)>)
	       (<EQUAL? .TPTR ,K-SEC>
		<RFALSE>)>)
	(T
	 <COND (<AND <==? .AM-PM? 2>
		     <L? .SUM 12>>
		<SET SUM <+ .SUM 12>>)>
	 <PUTB ,GL-P-TIME ,K-HRS .SUM>
	 <PUTB ,GL-P-TIME ,K-MIN 0>
	 <PUTB ,GL-P-TIME ,K-SEC 0>)>
  <RT-CHANGE-LEXV .PTR ,W?INTNUM>
  <COND (<G? .SUM 9999>
	 <RFALSE>)
	(<MC-T? .TIM>
         <SET SUM 0>)>
  <SETG GL-P-TIME-FLAG .TIM>
  <SETG GL-P-NUMBER .SUM>
  ,W?INTNUM>


<ROUTINE V-WAIT-FOR ("AUX" H M S N)
	<DEBUGGING? <RT-DEBUG-VERB "V-WAIT-FOR">>
	<COND (<MC-PRSO? ,TH-TIME>
	       <SET N ,GL-P-NUMBER>
	       <COND (<EQUAL? .N -1>
		      <SET N 1>)>
	       <COND (<EQUAL? <GETP ,GL-PRSO ,P?OBJ-NOUN> ,W?MINUTE ,W?MINUTES>
		      <SET H 0>
		      <SET M .N>)
		     (T
		      <SET H .N>
		      <SET M 0>)>
	       <SET S 0>
	       <TELL "Time passes..." CR>
	       <RT-CLOCK-JMP .H .M .S>)
	      (<AND <MC-F? ,GL-P-TIME-FLAG>
		    <NOT <MC-PRSO? ,TH-INTNUM>>>
	       <RT-CYOU-MSG>
	       <TELL ,K-CANT-WAIT-MSG CR>
	       <RFATAL>)
	      (T
	       <SET H <GETB ,GL-P-TIME ,K-HRS>>
	       <SET M <GETB ,GL-P-TIME ,K-MIN>>
	       <SET S <GETB ,GL-P-TIME ,K-SEC>>
	       <COND (<AND <MC-PRSO? ,TH-INTNUM>
			   <MC-F? ,GL-P-TIME-FLAG>>
		      <TELL "[" N .H ":00]" CR CR>)>
	       <COND (<G? .H 23>
		      <RT-CYOU-MSG>
		      <TELL ,K-CANT-WAIT-MSG CR>
		      <RFATAL>)
		     (<OR ,BELIEVE-WAIT-TIME?
			  <G? .H 12>>
			; "24 hour notation"
		      <SET H <- .H <GETB ,GL-TIME ,K-HRS>>>
		      <SET M <- .M <GETB ,GL-TIME ,K-MIN>>>
		      <SET S <- .S <GETB ,GL-TIME ,K-SEC>>>)
		     (T
		     ; "12 hour notation"
		     <SET H <- .H <+ <MOD <- <GETB ,GL-TIME ,K-HRS> 1> 12>
				     1>>>
		     <SET M <- .M <GETB ,GL-TIME ,K-MIN>>>
		     <SET S <- .S <GETB ,GL-TIME ,K-SEC>>>)>
	       ; "Normalize seconds"
	       <SET N </ <- .S 59> 60>>
	       <SET M <+ .M .N>>
	       <SET S <- .S <* .N 60>>>
	       <SET N </ <- .M 59> 60>>
	       <SET H <+ .H .N>>
	       <SET M <- .M <* .N 60>>>
	       <REPEAT ()
		       <COND (<G=? .H 0>
			      <RETURN>)>
		       <COND (,BELIEVE-WAIT-TIME?
			      <SET H <+ .H 24>>)
			     (T
			      <SET H <+ .H 12>>)>>
	       <COND (<AND <ZERO? .H>
			   <ZERO? .M>
			   <ZERO? .S>>
		      <TELL "It is">
		      <COND (<G? <+ <MOD <- <GETB ,GL-TIME ,K-HRS> 1> 12> 1>
				   9>
			     <TELL " ">)>
		      <RT-CLK-NTI-MSG <BOR ,K-NTI-HH ,K-NTI-MM>>
		      <TELL " now." CR>
		      <RT-TIME-OF-DAY-MSG T>
		      <RFATAL>)
		     (T
		      <TELL "Time passes..." CR>
		      <RT-CLOCK-JMP .H .M .S>
		      <RT-TIME-OF-DAY-MSG T>)>
	       <RTRUE>)>>

<ROUTINE RT-WAIT-TOD-MSG (TOD)
  <CRLF>
  <TELL "While you were waiting, ">
  <COND (<0? .TOD>
	 <TELL "the sun set and the mists rolled in." CR>)
	(<1? .TOD>
	 <TELL "the sky started to lighten. Soon it will be sunrise." CR>)
	(<==? .TOD 2>
	 <TELL "the sun rose... as much as it ever does here." CR>)
	(T
	 <TELL "the sun set. Soon it will be dark." CR>)>>

;"window routines"

;" RT-WINDOW [table] [left-margin]"
;"   where [table] is a global PLTABLE with the 1st element = width of window"
;"   followed by strings (0 for a blank line)"
;"   if [left-margin] is not specified, window is centered"

<ROUTINE RT-WINDOW (TABLE "OPTIONAL" (MARGIN 0) "AUX" (Y 8) (I 2) WIDTH LINES
			 STR PLINES)
	 <SET LINES <GET .TABLE 0>>
	 <SET WIDTH <GET .TABLE 1>>
	 <SET PLINES .LINES>
	 <COND (<G? .WIDTH ,GL-ALLSCREEN>
		<TELL "[*** Window too wide ***]" CR>
		<RTRUE>)>
	 <COND (<ZERO? .MARGIN>
		<SET MARGIN <- ,GL-MIDSCREEN </ .WIDTH 2>>>)>
	 ;<BUFOUT <>>
	 <SPLIT <+ .LINES 6>>
	 <SCREEN ,K-S-WIN>
	 <HLIGHT ,K-H-INV>
	 <CURSET .Y .MARGIN>
	 <RT-PRINT-SPACES .WIDTH>
	 <REPEAT ()
		<INC Y>
		<CURSET .Y .MARGIN>
		<DEC LINES>
		<COND (<ZERO? .LINES>
		       <RT-PRINT-SPACES .WIDTH>
		       <RETURN>)>
		<SET STR <GET .TABLE .I>>
		<COND (<ZERO? .STR>
		       <RT-PRINT-SPACES .WIDTH>)
		      (T
		       <TELL " " .STR " ">)>
		<INC I>>
	 <HLIGHT ,K-H-NRM>
	 <SCREEN ,K-S-NOR>
	 <SPLIT 1>
	 ;<BUFOUT T>
	 <DIROUT ,K-D-SCR-OFF> ; "send window to printer"
	 <SET I 2>
	 <TELL CR "[">
	 <REPEAT ()
		<DEC PLINES>
		<COND (<ZERO? .PLINES>
		       <RETURN>)>
		<SET STR <GET .TABLE .I>>
		<COND (<NOT <ZERO? .STR>>
		       <COND (<NOT <EQUAL? .I 2>>
			      <TELL " ">)>
		       <TELL .STR>
		       <COND (<EQUAL? .PLINES 1>
			      <TELL "]">)>)>
		<CRLF>
		<INC I>>
	 <CRLF>
	 <DIROUT ,K-D-SCR-ON>
	 <RTRUE>>

; "constants used with table"

<CONSTANT K-SIGN-ABBEY     0>
<CONSTANT K-SIGN-QUIET     1>
<CONSTANT K-SIGN-HORRORS   2>
<CONSTANT K-SIGN-MUSEUM    3>
<CONSTANT K-SIGN-MONUMENT  4>
<CONSTANT K-SIGN-BLIGH     5>
<CONSTANT K-SIGN-BANK      6>
<CONSTANT K-SIGN-TOWER     7>
<CONSTANT K-SIGN-NELSON    8>
<CONSTANT K-SIGN-LOITER    9>
<CONSTANT K-SIGN-GOLDBAR  10>
<CONSTANT K-SIGN-HENRY    11>
<CONSTANT K-SIGN-MARQUEES 12>
<CONSTANT K-SIGN-BLANK    13>
;<CONSTANT K-SIGN-HERRING 14>


; "extra space added to each line that ends in a period followed by a space."

<CONSTANT GL-QUOTES:TABLE
	<PTABLE
		<PLTABLE 38
			"Visiting Hours: 7:00 a.m - 6:00 p.m.">
		<PLTABLE 18
			"\"Quiet, please.\"">
		<PLTABLE 36
			"        CHAMBER OF HORRORS        "
			"ABANDON HOPE ALL YE WHO ENTER HERE">
		<PLTABLE 32
			"MUSEUM HOURS:  8 a.m. - 6 p.m.">
		<PLTABLE 8
			"\"1666\"">
		<PLTABLE 38
			"This a replica of the rowboat in    "
			"which Captain Bligh was set adrift  "
			"after the infamous Mutiny on the    "
			"Bounty. Bligh and his men rowed 3600"
			"miles in 45 days, and lived to see  "
			"the mutineers brought to justice.    ">
		<PLTABLE 38
			"For your convenience, the Bank shall"
			"be closed for the entire Jubilee    "
			"weekend. Thank you for your         "
			"patronage.                           ">
		<PLTABLE 38
			"        THE TOWER IS CLOSED.         "
			0
			"    WE REGRET ANY INCONVENIENCE.     "
			0
			"          HAVE A NICE DAY.           ">
		<PLTABLE 38
			"During the battle of Copenhagen,    "
			"Lord Nelson's commander-in-chief ran"
			"the signal to \"discontinue action\"  "
			"up his mast. Knowing the battle     "
			"could yet be won, Nelson clapped his"
			"telescope to his blind eye and said,"
			"\"I do not see the signal.\" His      "
			"subsequent attack led to victory and"
			"a secure place for Nelson in British"
			"history.                             ">
		<PLTABLE 17
			" No Loitering. "
			0
			"This means YOU!">
		<PLTABLE 13
			"BAR OF GOLD">
		<PLTABLE 38
			"\"Many monarchs are buried in        "
			"Westminster. But only one died here."
			"It happened on March 20th, 1413, and"
			"the event was later made famous in a"
			"scene written by Shakespeare:\"      "
			0
			"\"It hath been prophesied to me many "
			"   years                            "
			"I should not die but in Jerusalem,  "
			"Which vainly I supposed the Holy    "
			"   Land.                             "
			"But bear me to that chamber, there  "
			"   I'll lie,                        "
			"In that Jerusalem shall Harry die.\" "
			0
			"\"Henry IV, Part II, Act V\"          ">
		<PLTABLE 17
			"   HELD OVER   "
			0
			"SIXTH BIG WEEK!"
			0
			"THE MOUSETRAP!!">
		<PLTABLE 39
			"This sign unintentionally left blank.">
		;<PLTABLE 29
			"THE SIGN OF THE RED HERRING">>>

; "global used by invocation code fragment"

<GLOBAL GL-WINDOW:NUMBER 0>

; "setting of global with value from table"

;<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-HENRY>>

; "invocation code fragment"


;<COND (<MC-T? ,GL-WINDOW>
	<RT-WINDOW ,GL-WINDOW>
	<SETG GL-WINDOW <>>
	<CRLF>)>

<ROUTINE HOLMES-COMPLAINS (AMP? SS?)
  <COND (.AMP?
	 <COND (<==? <RT-ANYONE-HERE?> <> ,CH-HOLMES>
		<SET AMP? <>>)>)>
  <COND (<AND <OR .SS? .AMP?>
	      <==? <RT-WHO-SAYS?> ,CH-HOLMES>>
	 <TELL CR "Holmes ">
	 <COND (.AMP?
		<TELL
"takes you aside and whispers, \"Watson, you must keep the ampoule hidden">)>
	 <COND (.SS?
		<COND (.AMP?
		       <TELL ", and">)
		      (T
		       <TELL "says, \"Watson,">)>
		<TELL " take that ridiculous thing out of your ears">)>
	 <TELL ".\"" CR>)>>

<ROUTINE TOO-DARK-TO-GO (NEWPLACE)
  <TELL "You start off into the ">
  <COND (<MC-IS? .NEWPLACE ,FL-INDOORS>
	 <TELL "darkness">)
	(T
	 <TELL "fog">)>
  <TELL ", but think better of it when you realize you have no light
to guide your way." CR>>

<ROUTINE RT-AC-CH-PLAYER-AUX ()
  <COND (<MC-THIS-PRSI?>
	 <COND (<AND <==? ,GL-WINNER ,CH-PLAYER>
		     <MC-VERB? GIVE>>
		<RT-PERFORM ,V?TAKE ,GL-PRSO>
		<RTRUE>)>
	 <RFALSE>)
	(<MC-THIS-PRSO?>
	 <COND (<MC-VERB? EXAMINE LOOK-ON SEARCH>
		<TELL "You don't look any uglier than usual." CR>)>)>>

<ROUTINE RT-CHECK-HANDS ()
  <COND (<AND <MC-VERB? TAKE-OFF>
	      <MC-PRSO? ,TH-HANDS>>
	 <RTRUE>)
	(<AND <MC-VERB? PUT-ON TAKE>
	      <MC-PRSO? ,TH-HANDS>
	      <MC-PRSI? ,TH-EARS>>
	 <RTRUE>)
	(<AND <MC-VERB? COVER>
	      <MC-PRSI? ,TH-HANDS>
	      <MC-PRSO? ,TH-EARS>>
	 <RTRUE>)>>

<ROUTINE RT-HANDS-COVERING-EARS ()
  <TELL "You cannot do that because " THE ,TH-HANDS
	" are covering " THE ,TH-EARS "." CR>>
