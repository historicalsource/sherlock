<ROUTINE RT-META-IN? (OBJ1 OBJ2)
  <REPEAT ()
    <COND (<OR <MC-F? .OBJ1>
	       <IN? .OBJ1 ,ROOMS>
	       <IN? .OBJ1 ,LOCAL-GLOBALS>>
	   <RFALSE>)
	  (<EQUAL? .OBJ1 .OBJ2>
	   <RTRUE>)>
    <SET OBJ1 <LOC .OBJ1>>>>

<ROUTINE RT-SEE-INSIDE? (THING)
  <COND (<MC-F? .THING>
	 <RFALSE>)
	(<MC-IS? .THING ,FL-SURFACE>
	 <RTRUE>)
	(<AND <MC-IS? .THING ,FL-CONTAINER>
	      ; "All vehicles are also containers"
	      ;<OR <MC-IS? .THING ,FL-CONTAINER>
		  <MC-IS? .THING ,FL-VEHICLE>>
	      <OR <MC-IS? .THING ,FL-OPENED>
		  <MC-IS? .THING ,FL-TRANSPARENT>>>
	 <RTRUE>)
	(<AND <OR <MC-IS? .THING ,FL-PERSON>
		  <MC-IS? .THING ,FL-ALIVE>>
	      <NOT <EQUAL? .THING ,CH-PLAYER>>>
	 <RTRUE>)
	(T
	 <RFALSE>)>>

<ROUTINE RT-VISIBLE? (OBJ)
  <RT-ACCESSIBLE? .OBJ T>>

<GLOBAL LAST-PSEUDO-LOC <>>

<ROUTINE CLOSED? (WLOC VISIBLE?)
  <COND (<AND <T? .WLOC>
	      <MC-ISNOT? .WLOC ,FL-OPENED>
	      <OR <NOT .VISIBLE?>
		  <MC-ISNOT? .WLOC ,FL-TRANSPARENT>>
	      <MC-ISNOT? .WLOC ,FL-SURFACE>
	      <MC-ISNOT? .WLOC ,FL-ALIVE>
	      <NOT <IN? .WLOC ,ROOMS>>>
	 T)>>

<ROUTINE RT-ACCESSIBLE? (OBJ "OPT" (VISIBLE? <>) "AUX" LOC OLOC WLOC
		    (RMG <GETPT ,GL-PLACE-CUR ,P?GLOBAL>) (RMGL <PTSIZE .RMG>))
  ; "See if it's a simple case"
  <COND (<F? .OBJ>
	 <SETG GL-CLOSED-OBJECT <>>
	 <RFALSE>)
	(<==? .OBJ ,ROOMS>
	 <RTRUE>)
	(<==? .OBJ ,PSEUDO-OBJECT>
	 <RETURN <==? ,LAST-PSEUDO-LOC ,GL-PLACE-CUR>>)>
  ; "Now get the winner's effective room"
  <SET WLOC <LOC ,GL-WINNER>>
  <REPEAT ()
    <COND (<AND <NOT <IN? .WLOC ,ROOMS>>
		<NOT <CLOSED? .WLOC .VISIBLE?>>>
	   ; "If he's in a vehicle, then if the vehicle's open
	      he can reach stuff in the room as well"
	   <SET WLOC <LOC .WLOC>>)
	  (T
	   <RETURN>)>>
  <SET OLOC .OBJ>
  <COND (<==? .OLOC .WLOC> <RTRUE>)>
  <REPEAT ()
    <COND (<F? .OLOC> <RFALSE>)>
    ; "We've hit a room, a global object, or a local global FOR THIS ROOM"
    <COND (<OR <IN? .OLOC ,GLOBAL-OBJECTS>
	       <INTBL? .OLOC .RMG .RMGL 1>>
	   <COND (<AND <IN? .OLOC ,ROOMS>
		       <N==? .OLOC .OBJ>>
		  <RFALSE>)>
	   <RTRUE>)>
    <COND (<IN? .OLOC ,ROOMS> <RFALSE>)>
    ; "Move up a step, see if we've run into the winner yet"
    <COND (<==? <SET OLOC <LOC .OLOC>> .WLOC> <RTRUE>)>
    ; "Nope, see if this level is closed"
    <COND (<CLOSED? .OLOC .VISIBLE?>
	   <COND (<OR <IN? .OLOC ,GLOBAL-OBJECTS>
		      <INTBL? .OLOC .RMG .RMGL 1>>
		  <RTRUE>)>
	   ; "If the new thing is closed, we've lost"
	   <SETG GL-CLOSED-OBJECT .OLOC>
	   <SETG GL-IN-OUT T>
	   <RFALSE>)>>>

;<ROUTINE RT-ACCESSIBLE? (OBJ "OPT" (VISIBLE? <>) "AUX" WLOC OLOC (CLSD-PTR <>)
			 PTR (CNT 0) TEMP TBL END)
	<COND (<MC-F? .OBJ>
	       <SETG GL-CLOSED-OBJECT <>>
	       <RFALSE>)
	      (<EQUAL? .OBJ ,ROOMS>
	       <RTRUE>)
	      (<EQUAL? .OBJ ,PSEUDO-OBJECT>
	       <RETURN <==? ,LAST-PSEUDO-LOC ,GL-PLACE-CUR>>)>
	<SET PTR ,GL-LOC-TRAIL>
	<SET OLOC .OBJ>
	; "Check the object to see if it's in a closed container"
	<REPEAT ()
	  <PUT .PTR 0 .OLOC>
	  <INC CNT>
	  <COND (<OR <MC-F? .OLOC>
		     <IN? .OLOC ,ROOMS>
		     <IN? .OLOC ,LOCAL-GLOBALS>
		     <IN? .OLOC ,GLOBAL-OBJECTS>>
		 <RETURN>)>
	  <SET OLOC <LOC .OLOC>>
	  <SET PTR <REST .PTR 2>>
	  <COND (<CLOSED? .OLOC .VISIBLE?>
		 <SETG GL-CLOSED-OBJECT .OLOC>
		 <SETG GL-IN-OUT T>
		 <COND (<MC-F? .CLSD-PTR>
			<SET CLSD-PTR .PTR>)>)>>
	<SET PTR <>>
	<SET WLOC ,GL-WINNER>
	; "Now see if the winner's in a closed thing that doesn't enclose
	   anything that encloses the object in question"
	<REPEAT ()
	  <COND (<MC-F? .WLOC>
		 <SETG GL-CLOSED-OBJECT <>>
		 <SETG GL-IN-OUT <>>
		 <RFALSE>)
		(<SET PTR <INTBL? .WLOC ,GL-LOC-TRAIL .CNT>>
		 <RETURN>)
		(<IN? .WLOC ,ROOMS>
		 <RETURN>)>
	  <SET WLOC <LOC .WLOC>>
	  <COND (<CLOSED? .WLOC .VISIBLE?>
		 <SETG GL-CLOSED-OBJECT .WLOC>
		 <SETG GL-IN-OUT <>>
		 <RFALSE>)>>
	<COND (<MC-F? .PTR>
	       <RFALSE>)
	      (<AND <MC-T? .CLSD-PTR>
		    <G? .PTR .CLSD-PTR>>
	       <RFALSE>)
	      (T
	       <RTRUE>)>>

<ROUTINE RT-DONT-ALL? (O I "AUX" L)
  <SET L <LOC .O>>
  <COND  (<OR <MC-F? .L>
	      <EQUAL? .O .I>>
	  <RTRUE>)
	 (<MC-IS? .O ,FL-BODYPART>
	  <RTRUE>)
	 (<MC-IS? .O ,FL-NOALL>
	  <RTRUE>)
	 (<MC-VERB? TAKE>
	  <COND (<AND <MC-F? .I>
		      <RT-META-IN? .O ,GL-WINNER>
		      ; "Let take find things in pockets and stuff if loser
			 gave a name"
		      <OR <IN? .O ,GL-WINNER>
			  <F? <ZGET ,GL-P-NAMW 0>>
			  <NOT <0? <ZGET ,GL-P-BUTS ,K-P-MATCHLEN>>>>>
		 <RTRUE>)
		(<AND <MC-ISNOT? .O ,FL-TAKEABLE>
		     <MC-ISNOT? .O ,FL-TRYTAKE>>
		 <RTRUE>)
		(<AND <MC-IS? .L ,FL-PERSON>
		      <N==? .L .I>>
		 <RTRUE>)
		(<AND <MC-IS? .L ,FL-CONTAINER>
		      <MC-ISNOT? .L ,FL-OPENED>>
		 <RTRUE>)
		(<MC-T? .I>
		 <COND (<NOT <EQUAL? .L .I>>
			<RTRUE>)
		       (<RT-SEE-INSIDE? .I>
			<RFALSE>)
		       (T
			<RTRUE>)>)
		(<OR <EQUAL? .L ,GL-PLACE-CUR>
		     <RT-SEE-INSIDE? .L>>
		 <RFALSE>)
		(T
		 <RTRUE>)>)
	 (<MC-VERB? DROP PUT PUT-ON THROW THROW-OVER>
	  <COND (<EQUAL? .O ,TH-POCKET>
		 <RTRUE>)
		(<EQUAL? .L ,TH-POCKET>
		 <RTRUE>)
		(<MC-IS? .O ,FL-WORN>
		 <RTRUE>)
		(<EQUAL? .L ,GL-WINNER>
		 <RFALSE>)
		(T
		 <RTRUE>)>)
	 (T
	  <RFALSE>)>>

; "tell token output routines"

<ROUTINE DPRINT (O "AUX" X)
	 <COND (<AND <FSET? .O ,FL-HAS-SDESC>
		     <T? <SET X <GETP .O ,P?ACTION>>>>
		<ZAPPLY .X ,K-M-SDESC>)
	       (T
		<PRINTD .O>)>>

<ROUTINE RT-A-PRINT ("OPTIONAL" (O <>))
   <RT-THEO-PRINT .O <> ,K-DESC-A>
   <RTRUE>>

<ROUTINE RT-THEO-PRINT ("OPTIONAL" (O <>) (CAP? <>) (CLASS ,K-DESC-THE))
   <COND (<MC-F? .O>
	  <SET O ,GL-PRSO>)>
   <COND (.CAP?
	  <DIROUT ,K-D-SCR-OFF>
	  <DIROUT ,K-D-TBL-ON ,GL-DIROUT-TBL>)>
   <PROG ()
     <COND (<MC-ISNOT? .O ,FL-NOARTC>
	    <COND (<MC-IS? .O ,FL-YOUR>
		   <TELL "your">)
		  (<==? .CLASS ,K-DESC-ANY>
		   <TELL "any">)
		  (<OR <==? .CLASS ,K-DESC-THE>
		       <AND <MC-IS? .O ,FL-PLURAL>
			    <MC-IS? .O ,FL-PERSON>>>
		   <TELL "the">)
		  (<AND <MC-IS? .O ,FL-PLURAL>
			<MC-ISNOT? .O ,FL-PERSON>>
		   <TELL "some">)
		  (<N==? .O ,LG-WATER>
		   <COND (<MC-IS? .O ,FL-VOWEL>
			  <TELL "an">)
			 (T
			  <TELL "a">)>)>
	    <PRINTC !\ >)
	   (<MC-IS? .O ,FL-HAS-SDESC>
	    ; "Know we have NOARTC set here"
	    <APPLY <GETP .O ,P?ACTION> ,K-M-SDESC .CLASS>
	    <RETURN>)>
     <COND (<AND <==? .O ,CH-ME> .CAP?> ;"to print YOU instead of YOURSELF"
	    <TELL "you">)               ;"at beginning of sentence - GTB"
	   (T 
	    <TELL D .O>)>>
   <COND (.CAP?
	  <DIROUT ,K-D-TBL-OFF>
	  <DIROUT ,K-D-SCR-ON>
	  <COND (<AND <G=? <SET CAP? <GETB ,GL-DIROUT-TBL 2>> !\a>
		      <L=? .CAP? !\z>>
		 <PUTB ,GL-DIROUT-TBL 2 <- .CAP? 32>>)>
	  <PRINTT <ZREST ,GL-DIROUT-TBL 2> <ZGET ,GL-DIROUT-TBL 0>>)>
   <RTRUE>>

<ROUTINE RT-CTHEO-PRINT ("OPTIONAL" (O <>))
   <RT-THEO-PRINT .O T>>

<ROUTINE RT-THEI-PRINT ("OPTIONAL" (I <>))
   <COND (<MC-F? .I>
	  <SET I ,GL-PRSI>)>
   <RT-THEO-PRINT .I>>

<ROUTINE RT-CTHEI-PRINT	("OPTIONAL" (I <>))
   <COND (<MC-F? .I>
	  <SET I ,GL-PRSI>)>
   <RT-THEO-PRINT .I T>>


<ROUTINE RT-PRINT-SPACES (N "AUX" AMT) 
  <REPEAT ()
    <COND (<G? .N ,GL-BLANKS-LEN>
	   <SET AMT ,GL-BLANKS-LEN>)
	  (T
	   <SET AMT .N>)>
    <PRINTT ,GL-BLANKS .AMT>
    <COND (<L=? <SET N <- .N .AMT>> 0>
	   <RTRUE>)>>>

<ROUTINE SAY-NUMBER (N)
  <REPEAT ((X 10000))
    <COND (<L? .N .X>
	   <TELL " ">)
	  (T
	   <RETURN>)>
    <COND (<L? <SET X </ .X 10>> 10>
	   <RETURN>)>>
  <TELL N .N>>

<ROUTINE RT-UPDATE-STATUS-LINE ()
  <COND (<BTST <LOWCORE FLAGS> 4>
	 <RT-INIT-SCREEN T>
	 <LOWCORE FLAGS <BAND <LOWCORE FLAGS> <XORB 4 -1>>>)>
  <SCREEN ,K-S-WIN>
  <HLIGHT ,K-H-INV>
  <COND (<NOT <EQUAL? ,GL-PLACE-CUR ,GL-PLACE-STS>>
	 <COND (,GL-SHORT-STAT?
		<CURSET ,GL-SPLIT-ROW 1>)
	       (T
		<CURSET ,GL-SPLIT-ROW 2>)>
	 <RT-PRINT-SPACES ,GL-STAT-MAX-ROOM>
	 <CURSET ,GL-SPLIT-ROW 2>
	 <COND (<RT-SAY-ROOM-NAME-IF-LIT ,GL-PLACE-CUR <> T>
		<SETG GL-PLACE-STS ,GL-PLACE-CUR>)
	       (T
		<SETG GL-PLACE-STS -1>)>)>
  <COND (<N==? ,GL-SCORE-CUR ,GL-SCORE-STS>
	 <SETG GL-SCORE-STS ,GL-SCORE-CUR>
	 <CURSET ,GL-SPLIT-ROW <+ ,GL-SCORE-HEADER-LEN ,GL-STAT-S-POS>>
	 <SAY-NUMBER ,GL-SCORE-CUR>)>
  <CURSET ,GL-SPLIT-ROW ,GL-STAT-T-POS>
  <COND (,GL-SHORT-STAT?
	 <RT-CLK-DOW-MSG <+ ,K-DOW-DW ,K-DOW-SN>>
	 <TELL " ">
	 <RT-CLK-NTI-MSG <+ ,K-NTI-SM ,K-NTI-HH ,K-NTI-MM>>)
	(T
	 <RT-CLK-DOW-MSG <+ ,K-DOW-DW ,K-DOW-EN>>
	 <CURSET ,GL-SPLIT-ROW <+ 10 ,GL-STAT-T-POS>>
	 <RT-CLK-NTI-MSG <+ ,K-NTI-HH ,K-NTI-MM ,K-NTI-SS>>)>
  <HLIGHT ,K-H-NRM>
  <SCREEN ,K-S-NOR>
  <RTRUE>>

<ROUTINE RT-REFER-TO-MSG ()
	 <TELL "[To what are you referring?]" CR>
	 <RTRUE>>

<ROUTINE RT-SAY-ROOM-NAME-IF-LIT ("OPT" (HERE ,GL-PLACE-CUR) (FORCE? <>)
				        (SL? <>) "AUX" LEN (MAXLEN 300))
   <COND (.SL?
	  <SET MAXLEN ,GL-STAT-MAX-ROOM>)>
   <COND (<OR .FORCE? <MC-T? ,GL-NOW-LIT?>>
	  <DIROUT ,K-D-SCR-OFF>
	  <DIROUT ,K-D-TBL-ON ,GL-DIROUT-TBL>
	  <TELL D .HERE>
	  <DIROUT ,K-D-TBL-OFF>
	  <DIROUT ,K-D-SCR-ON>
	  <SET LEN <ZGET ,GL-DIROUT-TBL 0>>
	  <SET LEN <+ .LEN 1>>
	  <ZPUT ,GL-DIROUT-TBL 0 0>
	  <COND (<G? .LEN 1>
		 <REPEAT ((LC !\ ) X (CNT 2))
			 <SET X <GETB ,GL-DIROUT-TBL .CNT>>
			 <COND (<AND <G=? .X !\a>
				     <L=? .X !\z>>
				<COND (<OR <==? .CNT 2>
					   <==? .LC !\ >>
				       <SET X <- .X 32>>)>)>
			 <PRINTC .X>
			 <SET LC .X>
			 <COND (<G? <SET CNT <+ .CNT 1>> .LEN>
				<RETURN>)>
			 <COND (<G? .CNT .MAXLEN> <RETURN>)>>)
		(T
		 <PRINTC <ZGET ,GL-DIROUT-TBL 2>>)>
	  <RTRUE>)
	 (T
	  <TELL "Darkness">
	  <RFALSE>)>>

<ROUTINE RT-DESCRIBE-PLACE ("OPTIONAL" (PLACE <>) (LOOK <>))
  ; "if no place is passed as an argument use gl-place-cur"
  <COND (<MC-F? .PLACE>
	 <SET PLACE ,GL-PLACE-CUR>)>
  ; "check if this place is lit"
  <COND (<MC-F? <RT-IS-LIT? .PLACE T>>
	 <TELL ,K-TOO-DARK-MSG CR>
	 <RTRUE>)>
  ; "display room description (DESC) in bold"
  <HLIGHT ,K-H-BLD>
  <RT-SAY-ROOM-NAME-IF-LIT .PLACE T>
  <TELL CR CR>
  <HLIGHT ,K-H-NRM>
  ; "determine description context"
  <COND (<MC-T? .LOOK>
	 <RT-EXEC-RM-DESCFCN .PLACE ,K-M-DESC-3>)
	(<MC-ISNOT? .PLACE ,FL-TOUCHED>
	 <MC-MAKE .PLACE ,FL-TOUCHED>
	 <RT-EXEC-RM-DESCFCN .PLACE ,K-M-DESC-1>)
	(<EQUAL? ,GL-DESC-LEVEL 2>
	 <RT-EXEC-RM-DESCFCN .PLACE ,K-M-DESC-2>)
	(<EQUAL? ,GL-DESC-LEVEL 1>
	 <RTRUE>)
	(<EQUAL? ,GL-DESC-LEVEL 0>
	 <RFALSE>)>>

<ROUTINE RT-EXEC-RM-DESCFCN (PLACE CONTEXT "AUX" DF)
	<COND (<FSET? .PLACE ,FL-HAS-DESCFCN>
	       <RETURN <NOT <APPLY <GETP .PLACE ,P?ACTION> .CONTEXT>>>)
	      (T <RTRUE>)>>

<ROUTINE RT-DESCFCN-CONTEXT (CONTEXT)
  <COND (<EQUAL? .CONTEXT ,K-M-DESC-1 ,K-M-DESC-2 ,K-M-DESC-3>
	 <RTRUE>)
	(T
	 <RFALSE>)>>

<ROUTINE RT-DESC-ALL ("OPTIONAL" (PLACE <>) (LOOK <>)
		      "AUX" (HOLMES-IN-HOUSE? <>))
	<COND (<RT-DESCRIBE-PLACE .PLACE .LOOK>
	       <RT-DESCRIBE-PLACE-CONTENTS .PLACE .LOOK>)>
	<COND (<MC-F? <RT-IS-LIT? .PLACE T>>
	       <RTRUE>)
	      (<MC-F? ,GL-PUPPY-MSG?>
	       <SETG GL-PUPPY-MSG? T>)
	      (<MC-T? ,GL-PUPPY>
	       <COND (<EQUAL? ,GL-PUPPY ,CH-HOLMES>
		      <TELL CR
			    <RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>>
		      <COND (<MC-HERE? ,RM-ENTRY-HALL
				       ,RM-PARLOUR
				       ,RM-VESTIBULE
				       ,RM-HOLMES-STUDY
				       ,RM-HOLMES-BEDROOM>
			     <SET HOLMES-IN-HOUSE? T>)>
		      <COND (<MC-T? .LOOK>
			     <COND (<IN? ,CH-HOLMES ,TH-BOAT>
				    <TELL ,K-SEASICK-MSG>)
				   (<OR <IN? ,CH-HOLMES ,TH-HANSOM-CAB>
					<IN? ,CH-HOLMES ,TH-GROWLER-CAB>>
				    <TELL ,K-SITTING-QUIETLY-MSG>)
				   (.HOLMES-IN-HOUSE?
				    <TELL <RT-PICK-NEXT
					   ,GL-HOLMES-HOUSE-LOOK-TXT>>)
				   (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
				    <TELL <RT-PICK-NEXT
					   ,GL-HOLMES-INDOORS-LOOK-TXT>>)
				   (T
				    <TELL <RT-PICK-NEXT
					   ,GL-HOLMES-OUTDOORS-LOOK-TXT>>)>
			     <TELL "." CR>)
			    (<EQUAL? ,GL-DESC-LEVEL 2 1>
			     <COND (.HOLMES-IN-HOUSE?
				    <TELL <RT-PICK-NEXT
					   ,GL-HOLMES-HOUSE-ENTER-TXT>>)
				   (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
				    <TELL <RT-PICK-NEXT
					   ,GL-HOLMES-INDOORS-ENTER-TXT>>)
				   (T
				    <TELL <RT-PICK-NEXT
					   ,GL-HOLMES-OUTDOORS-ENTER-TXT>>)>
			     <TELL "." CR>)>)
		     (<EQUAL? ,GL-PUPPY ,CH-WIGGINS>
		      <TELL CR
			    <RT-PICK-NEXT ,GL-WIGGINS-DESC-TXT>>
		      <COND (<MC-T? .LOOK>
			     <COND (<IN? ,CH-WIGGINS ,TH-BOAT>
				    <TELL ,K-ENJOYING-RIDE-MSG>)
				   (<OR <IN? ,CH-WIGGINS ,TH-HANSOM-CAB>
					<IN? ,CH-WIGGINS ,TH-GROWLER-CAB>>
				    <TELL ,K-FIDGETING-MSG>)
				   (T
				    <TELL <RT-PICK-NEXT
					   ,GL-WIGGINS-LOOK-TXT>>)>
			     <TELL "." CR>)
			    (<EQUAL? ,GL-DESC-LEVEL 2 1>
			     <TELL <RT-PICK-NEXT
				    ,GL-WIGGINS-ENTER-TXT> "." CR>)>)>)>
	<RTRUE>>

<ROUTINE RT-GOTO (NEWPLACE "AUX" X NEWLIT? OLDPLACE AMP? SS?)
  <SET OLDPLACE ,GL-PLACE-CUR>
  <MOVE ,CH-PLAYER .NEWPLACE>
  <SETG GL-PLACE-CUR .NEWPLACE>
  <SET NEWLIT? <RT-IS-LIT?>>
  <MOVE ,CH-PLAYER .OLDPLACE>
  <SETG GL-PLACE-CUR .OLDPLACE>
  <COND (<MC-F? .NEWLIT?>
	 ; "Moved to get it out of preload"
	 <TOO-DARK-TO-GO .NEWPLACE>
	 <RTRUE>)>
  <SET X <APPLY <GETP ,GL-PLACE-CUR ,P?ACTION> ,K-M-EXIT>>
  <COND (<AND <MC-ISNOT? .OLDPLACE ,FL-INDOORS>
	      <MC-ISNOT? .NEWPLACE ,FL-INDOORS>>
	 <RT-CLOCK-JMP 0 5 0>)>
  <SETG GL-PLACE-PRV .OLDPLACE>
  <SETG GL-PLACE-CUR .NEWPLACE>
  <SETG GL-NOW-LIT? <RT-IS-LIT?>>
  <MOVE ,CH-PLAYER ,GL-PLACE-CUR>
  <SET X <APPLY <GETP ,GL-PLACE-CUR ,P?ACTION> ,K-M-ENTERING>>
  <COND (<MC-T? ,GL-PUPPY>
	 <MOVE ,GL-PUPPY <LOC ,CH-PLAYER>>)
	(<AND <MC-T? ,GL-FORMER-PUPPY>
	      <IN? ,GL-FORMER-PUPPY ,GL-PLACE-CUR>
	      <NOT <FSET? ,GL-FORMER-PUPPY ,FL-ASLEEP>>>
	 <SETG GL-PUPPY ,GL-FORMER-PUPPY>
	 <SETG GL-FORMER-PUPPY <>>)>
  <RT-DESC-ALL>
  <SET AMP? <AND <IN? ,TH-ETHERIUM-AMPOULE ,CH-PLAYER>
		 <NOT <FSET? ,TH-ETHERIUM-AMPOULE ,FL-BROKEN>>>>
  <SET SS? <MC-IS? ,TH-STETHOSCOPE ,FL-WORN>>
  <COND (<OR .AMP? .SS?>
	 <HOLMES-COMPLAINS .AMP? .SS?>)>
  <SET X <APPLY <GETP ,GL-PLACE-CUR ,P?ACTION> ,K-M-ENTERED>>
  <RT-RESET-THEM>
  <COND (<IN? ,TH-ETHERIUM-GAS ,GL-PLACE-CUR>
	 <RT-SMELL-ETHERIUM?>)>
  ;"Check if etherium is in the room."
  <RTRUE>>

<ROUTINE RT-RESET-THEM ()
	<COND (<NOT <RT-VISIBLE? ,GL-P-IT-OBJECT>>
	       <SETG GL-P-IT-OBJECT ,TH-NOT-HERE-OBJECT>)>
	<COND (<NOT <RT-VISIBLE? ,GL-P-THEM-OBJECT>>
	       <SETG GL-P-THEM-OBJECT ,TH-NOT-HERE-OBJECT>)>
	<COND (<NOT <RT-VISIBLE? ,GL-P-HIM-OBJECT>>
	       <SETG GL-P-HIM-OBJECT ,TH-NOT-HERE-OBJECT>)>
	<COND (<NOT <RT-VISIBLE? ,GL-P-HER-OBJECT>>
	       <SETG GL-P-HER-OBJECT ,TH-NOT-HERE-OBJECT>)>
	<RTRUE>>

<ROUTINE RT-UPDATE-SCORE ("OPTIONAL" (PTS 1))
	<SETG GL-SCORE-CUR <+ ,GL-SCORE-CUR .PTS>>
	<RT-NEW-SCORE-MSG .PTS>>

<ROUTINE RT-UPDATE-MOVES ("OPTIONAL" (MVS 1))
	<COND (<MC-T? ,GL-CLOCK-WAIT>
	       <RFALSE>)
	      (<MC-T? ,GL-CLOCK-STOP>
	       <RFALSE>)>
	<SETG GL-MOVES-CUR <+ ,GL-MOVES-CUR .MVS>>>

<ROUTINE RT-UPDATE-CLOCK ("OPTIONAL" (HRS 0) (MIN 0) (SEC 0))
	<COND (<OR <MC-NOTZERO? .HRS>
		   <MC-NOTZERO? .MIN>
		   <MC-NOTZERO? .SEC>>
	       <RT-CLOCK-INC-SET .HRS .MIN .SEC>)>
	<RT-CLOCK-INC>>

<ROUTINE RT-MAIN-LOOP ("AUX" ICNT OCNT NUM CNT OBJ TBL (V <>) PTBL OBJ1
			 TMP X (TOUCH-VERB? <>) (MYCROFT? <>) TV)
  <REPEAT ()
    <SET CNT 0>
    <SET OBJ <>>
    <SET PTBL T>
    <SETG GL-P-MULT? <>>
    <COND (<NOT <MC-HERE? GL-P-QCONTEXT-RM>>
	   <SETG GL-P-QCONTEXT-TH <>>)>
    <SETG GL-P-GOOD <RT-PARSER>>
    <COND (<MC-T? ,GL-P-GOOD>
	   <SET ICNT <GET ,GL-P-PRSI ,K-P-MATCHLEN>>
	   <SET OCNT <GET ,GL-P-PRSO ,K-P-MATCHLEN>>
	   <COND (<AND <MC-T? ,GL-P-IT-OBJECT>
		       <RT-ACCESSIBLE? ,GL-P-IT-OBJECT>>
		  <SET TMP <>>
		  <REPEAT ()
		     <COND (<G? <SET CNT <+ .CNT 1>> .ICNT>
			    <RETURN>)
			   (T
			    <COND (<EQUAL? <GET ,GL-P-PRSI .CNT> ,TH-IT>
				   <PUT ,GL-P-PRSI .CNT ,GL-P-IT-OBJECT>
				   <SET TMP T>
				   <RETURN>)>)>>
		  <COND (<ZERO? .TMP>
			 <SET CNT 0>
			 <REPEAT ()
			    <COND (<G? <SET CNT <+ .CNT 1>> .OCNT>
				   <RETURN>)
				  (T
				   <COND (<EQUAL? <GET ,GL-P-PRSO .CNT> ,TH-IT>
					  <PUT ,GL-P-PRSO .CNT ,GL-P-IT-OBJECT>
					  <RETURN>)>)>>)>
		  <SET CNT 0>)>
	   <SET NUM <COND (<ZERO? .OCNT>
			   .OCNT)
			  (<G? .OCNT 1>
			   <SET TBL ,GL-P-PRSO>
			   <COND (<ZERO? .ICNT>
				  <SET OBJ <>>)
				 (T
				  <SET OBJ <GET ,GL-P-PRSI 1>>)>
			   .OCNT)
			  (<G? .ICNT 1>
			   <SET PTBL <>>
			   <SET TBL ,GL-P-PRSI>
			   <SET OBJ <GET ,GL-P-PRSO 1>>
			   .ICNT)
			  (T 1)>>
	   <COND (<AND <ZERO? .OBJ>
		       <EQUAL? .ICNT 1>>
		  <SET OBJ <GET ,GL-P-PRSI 1>>)>
	   <COND (<MC-VERB? WALK>
		  <SET V <RT-PERFORM ,GL-PRSA ,GL-PRSO>>)
		 (<ZERO? .NUM>
		  <COND (<0? <P-SONUMS ,GL-P-SYNTAX>>
			 <SET V <RT-PERFORM ,GL-PRSA>>
			 <SETG GL-PRSO <>>)
			(<ZERO? ,GL-NOW-LIT?>
			 <RT-P-CLEAR>
			 <TELL ,K-TOO-DARK-MSG CR>)
			(T
			 <RT-P-CLEAR>
			 <TELL "[There isn't anything to ">
			 <SET TMP <GET ,GL-P-ITBL ,K-P-VERBN>>
			 <COND (<RT-TALK-VERB?>
				<TELL "talk to">)
			       (<OR <MC-T? ,GL-P-MERGED>
				    <MC-T? ,GL-P-ORPH>>
				<PRINTB <GET .TMP 0>>)
			       (T
				<SET V <RT-WORD-PRINT <GETB .TMP 2>
						      <GETB .TMP 3>>>)>
			 <TELL ".]" CR>
			 <SET V <>>)>)
		 (T
		  <SET X 0>
		  <COND (<G? .NUM 1>
			 <SETG GL-P-MULT? T>)>
		  <SET TMP <>>
		  <REPEAT ()
		    <COND (<G? <SET CNT <+ .CNT 1>> .NUM>
			   <COND (<G? .X 0>
				  <TELL "[The ">
				  <COND (<NOT <EQUAL? .X .NUM>>
					 <TELL "other ">)>
				  <TELL "object">
				  <COND (<NOT <EQUAL? .X 1>>
					 <TELL "s">)>
				  <TELL " that you mentioned ">
				  <COND (<NOT <EQUAL? .X 1>>
					 <TELL "are">)
					(T
					 <TELL "is">)>
				  <TELL "n't here.]" CR>)
				 (<ZERO? .TMP>
				  <RT-REFER-TO-MSG>)>
			   <RETURN>)
			  (T
			   <COND (<MC-T? .PTBL>
				  <SET OBJ1 <GET ,GL-P-PRSO .CNT>>)
				 (T
				  <SET OBJ1 <GET ,GL-P-PRSI .CNT>>)>
			   <COND (<OR <G? .NUM 1>
				      <EQUAL? <GET <GET ,GL-P-ITBL ,K-P-NC1> 0>
					      ,W?ALL ,W?EVERYTHING>>
				  <COND (<EQUAL? .OBJ1 ,TH-NOT-HERE-OBJECT>
					 <INC X>
					 <AGAIN>)
					(<AND <EQUAL? ,GL-P-GET-FLAGS ,K-P-ALL>
					      <RT-DONT-ALL? .OBJ1 .OBJ>>
					 <AGAIN>)
					(<NOT <RT-ACCESSIBLE? .OBJ1>>
					 <AGAIN>)
					(<EQUAL? .OBJ1 ,CH-PLAYER>
					 <AGAIN>)
					(T
					 <COND (<EQUAL? .OBJ1 ,TH-IT>
						<TELL CTHE ,GL-P-IT-OBJECT>)
					       (T
						<TELL CTHE .OBJ1>)>
					 <TELL ": ">)>)>
			   <SET TMP T>
			   <SETG GL-PRSO <COND (<MC-T? .PTBL>
						.OBJ1)
					       (T
						.OBJ)>>
			   <SETG GL-PRSI <COND (<MC-T? .PTBL>
						.OBJ)
					       (T
						.OBJ1)>>
		 ; "DEB -- Do real visibility or accessibility tests here."
			   <COND (<AND <==? ,GL-WINNER ,CH-BUTLER>
				       <EQUAL? <ZGET ,GL-P-NAMW 0>
					       ,W?HOLMES ,W?MYCROFT>>
				  <SET MYCROFT? T>
				  <SET TOUCH-VERB? <>>)>
			   <COND (<AND <F? .MYCROFT?>
				       <N==? ,GL-PRSA ,V?FIND>
				       <OR <SET TOUCH-VERB? <RT-TOUCH-VERB?>>
					   <SET TV <INTBL? ,GL-PRSA <REST ,GL-SEE-VERBS 2>
						      <GET ,GL-SEE-VERBS 0>>>>>
				  <COND (<AND <MC-T? ,GL-PRSO>
					      <NOT <RT-VISIBLE? ,GL-PRSO>>>
					 <RT-CANT-SEE-ANY-MSG ,GL-PRSO>
					 <COND (<L=? .OCNT 1>
						<SET V ,FATAL-VALUE>
						<RETURN>)>
					 <AGAIN>)
					(<AND <MC-T? ,GL-PRSI>
					      <NOT <RT-VISIBLE? ,GL-PRSI>>>
					 <RT-CANT-SEE-ANY-MSG ,GL-PRSI>
					 <COND (<L=? .ICNT 1>
						<SET V ,FATAL-VALUE>
						<RETURN>)>
					 <AGAIN>)>)>
			   <COND (.TOUCH-VERB?
				  <COND (<AND <MC-T? ,GL-PRSO>
					      <NOT <RT-ACCESSIBLE? ,GL-PRSO>>>
					 <RT-CANT-TOUCH-MSG ,GL-PRSO ,GL-CLOSED-OBJECT ,GL-IN-OUT>
					 <COND (<L=? .OCNT 1>
						<SET V ,FATAL-VALUE>
						<RETURN>)>
					 <AGAIN>)
					(<AND <MC-T? ,GL-PRSI>
					      <NOT <RT-ACCESSIBLE? ,GL-PRSI>>>
					 <RT-CANT-TOUCH-MSG ,GL-PRSI ,GL-CLOSED-OBJECT ,GL-IN-OUT>
					 <COND (<L=? .ICNT 1>
						<SET V ,FATAL-VALUE>
						<RETURN>)>
					 <AGAIN>)>)>
		  ; "DEB -- End real visibility and accessibility tests."
			   <SET V <RT-PERFORM ,GL-PRSA ,GL-PRSO ,GL-PRSI>>
			   <COND (<EQUAL? .V ,FATAL-VALUE>
				  <RETURN>)>)>>
		  <COND (,GL-P-OVERFLOW
			 <TELL CR
"[Note: There are so many objects here that a few may have been overlooked.
Please double check to make sure you have accomplished what you intended.]"
CR>)>)>
	   <COND (<EQUAL? .V ,FATAL-VALUE>
		  <SETG GL-P-CONT <>>)>)
	  (T
	   <SETG GL-P-CONT <>>)>
    <COND (<AND <MC-T? ,GL-P-GOOD>
		<NOT <EQUAL? .V ,FATAL-VALUE>>
		<NOT <SET TV <INTBL? ,GL-PRSA <REST ,GL-GAME-VERBS 2>
				     <GET ,GL-GAME-VERBS 0>>>>>
	   <RT-UPDATE-MOVES>
	   <RT-UPDATE-CLOCK>
	   <RT-ALARM-CHK>)>
    <RT-TIME-OF-DAY-MSG>
    <SETG GL-PRSA <>>
    <SETG GL-PRSO <>>
    <SETG GL-PRSI <>>>>

<ROUTINE RT-TOUCH-VERB? ()
  <INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>>

<ROUTINE RT-TALK-VERB? ()
  <INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>>

; "RT-AC-CH-PLAYER has to be here because called every turn, more or less."

<ROUTINE RT-AC-CH-PLAYER ("OPTIONAL" (CONTEXT <>))
  <DEBUGGING? <RT-DEBUG-CH-AC "CH-PLAYER" .CONTEXT>>
  <SETG GL-WAIT-BELL <>>
  <COND (<MC-THIS-WINNER?>
	 <COND (<MC-VERB? TELL>
		<SETG GL-CLOCK-WAIT <>>
		<RFALSE>)
	       (<AND <OR <MC-PRSO? ,TH-HANDS>
			 <MC-PRSI? ,TH-HANDS>>
		     <RT-CHECK-HANDS>>
		<RFALSE>)
	       (<AND <RT-TOUCH-VERB?>
		     <MC-IS? ,TH-HANDS ,FL-LOCKED>>
		<RT-HANDS-COVERING-EARS>)>)
	(T
	 <RT-AC-CH-PLAYER-AUX>)>>
