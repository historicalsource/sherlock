;******************************************************************************
; "game : SHERLOCK!"
; "file : PARSER.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   27 Oct 1987 19:00:52  $"
; "rev  : $Revision:   1.55  $"
; "vers : 1.00"
;******************************************************************************

<GLOBAL INHIBIT-ROOMS <>>

<GLOBAL GL-FUNNY-CLAUSE? <>>

<CONSTANT SH		 128>		; "held"
<CONSTANT SC		  64>		; "carried"
<CONSTANT SIR		  32>		; "in room"
<CONSTANT SOG		  16>		; "on ground"
<CONSTANT STAKE		   8>		; "take"
<CONSTANT SMANY		   4>		; "many"
<CONSTANT SHAVE		   2>		; "have"

<CONSTANT LAST-OBJECT      0>		; "the number of the last object"

;<CONSTANT K-CURRENCY-SYMBOL !\$>

<CONSTANT K-M-BEG      1>	; "room action context begin case"
<CONSTANT K-M-ENTERING 2>	; "room action context entering case"
<CONSTANT K-M-ENTERED  3>	; "room action routine entered case"
<CONSTANT K-M-EXIT     4>	; "room action routine exit case"
<CONSTANT K-M-END      5>	; "room action routine end case"
<CONSTANT K-M-FLOOK    6>	
<CONSTANT K-M-NLOOK    7>	
<CONSTANT K-M-WINNER   8>	
<CONSTANT K-M-CONT     9>	; "for container routine general case"
<CONSTANT K-M-OBJDESC 10>	
<CONSTANT K-M-CANT    11>       ; "for container routine limitations"
<CONSTANT K-M-DESCFCN 12>	; "replaces DESCFCN property"
<CONSTANT K-M-SDESC   13>	; "replaces SDESC"

<CONSTANT K-M-DESC-1 14>
<CONSTANT K-M-DESC-2 15>
<CONSTANT K-M-DESC-3 16>

<CONSTANT K-P-LEXWORDS 1>           ; "byte offset to # of entries in LEXV"
<CONSTANT K-P-LEXSTART 1>           ; "word offset to start of LEXV entries"
<CONSTANT K-P-LEXELEN  2>           ; "number of words per LEXV entry"
<CONSTANT K-P-WORDLEN  4>           
<CONSTANT K-P-PSOFF    6>           ; "offset to parts of speech byte"
<CONSTANT K-P-P1OFF    7>           ; "offset to first parts of speech"
<CONSTANT K-P-P1BITS   3>           ; "first part of speech mask in PSOFF byte"
<CONSTANT K-P-ITBLLEN  9>           

<CONSTANT K-P-VERB     0>	
<CONSTANT K-P-VERBN    1>	
<CONSTANT K-P-PREP1    2>	
<CONSTANT K-P-PREP1N   3>	
<CONSTANT K-P-PREP2    4>	
<CONSTANT K-P-NC1      6>	
<CONSTANT K-P-NC1L     7>	
<CONSTANT K-P-NC2      8>	
<CONSTANT K-P-NC2L     9>	

<CONSTANT K-O-PTR      0>	
<CONSTANT K-O-START    1>	
<CONSTANT K-O-LENGTH   2>	
<CONSTANT K-O-END      3>	

<CONSTANT K-P-MATCHLEN 0>	
<CONSTANT K-P-ALL      1>	
<CONSTANT K-P-ONE      2>	
<CONSTANT K-P-INHIBIT  4>	
<CONSTANT K-P-SRCBOT   2>	
<CONSTANT K-P-SRCTOP   0>	
<CONSTANT K-P-SRCALL   1>

<ROUTINE RT-CAPITALIZE (PTR)
  <COND (<OR <MC-T? ,GL-P-ORPH>
	    <MC-T? ,GL-P-MERGED>>
	 <PRINTB <GET .PTR 0>>)
	(T
	 <PRINTC <- <GETB ,GL-P-PIBUF <GETB .PTR 3>> 32>>
	 <RT-WORD-PRINT <- <GETB .PTR 2> 1> <+ <GETB .PTR 3> 1>>)>>

<ROUTINE RT-WORD-PRINT (CNT BUF)
   <PRINTT <ZREST ,GL-P-PIBUF .BUF> .CNT>
   ;<REPEAT ()
      <COND (<DLESS? CNT 0>
	     <RTRUE>)
	   (T
            <PRINTC <GETB ,GL-P-PIBUF .BUF>>
            <SET BUF <+ .BUF 1>>)>>>

<ROUTINE RT-VERB-PRINT ("AUX" TMP)
	<SET TMP <GET ,GL-P-ITBL ,K-P-VERBN>>
	<COND (<ZERO? .TMP>
	       <TELL "tell">)
	      (<ZERO? <GETB ,GL-P-VTBL 2>>
	       <PRINTB <GET .TMP 0>>)
	      (T
	       <RT-WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>
	       <PUTB ,GL-P-VTBL 2 0>)>>

<ROUTINE RT-PREP-PRINT (PREP "OPTIONAL" (SP? T) "AUX" WRD) 
	<COND (<AND <MC-T? .PREP>
		    <ZERO? ,GL-P-END-ON-PREP>>
	       <COND (<MC-T? .SP?>
		      <TELL " ">)>
	       <SET WRD <RT-PREP-FIND .PREP>>
	       <PRINTB .WRD>
	       <COND (<AND <EQUAL? ,W?SIT <GET <GET ,GL-P-ITBL ,K-P-VERBN> 0>>
			   <EQUAL? ,W?DOWN .WRD>>
		      <TELL " on">)>
	       <COND (<AND <EQUAL? ,W?GET <GET <GET ,GL-P-ITBL ,K-P-VERBN> 0>>
			   <EQUAL? ,W?OUT .WRD>>
		      <TELL " of">)>
	       <RTRUE>)>>

<ROUTINE RT-CLAUSE-PRINT (BPTR EPTR "OPTIONAL" (THE? T)) 
	<RT-BUFFER-PRINT <GET ,GL-P-ITBL .BPTR> <GET ,GL-P-ITBL .EPTR> .THE?>> 

<ROUTINE RT-BUFFER-PRINT (BEG END CP "AUX" (NOSP <>) WRD (FIRST?? T) (PN <>))
  <REPEAT ()
    <COND (<EQUAL? .BEG .END>
	   <RETURN>)
	  (T
	   <COND (<MC-T? .NOSP>
		  <SET NOSP <>>)
		 (T
		  <TELL " ">)>
	   <SET WRD <GET .BEG 0>>
	   <COND (<OR <AND <EQUAL? .WRD ,W?HIM>
			   <NOT <RT-VISIBLE? ,GL-P-HIM-OBJECT>>>
		      <AND <EQUAL? .WRD ,W?HER>
			   <NOT <RT-VISIBLE? ,GL-P-HER-OBJECT>>>
		      <AND <EQUAL? .WRD ,W?THEM>
			   <NOT <RT-VISIBLE? ,GL-P-THEM-OBJECT>>>>
		  <SET PN T>)>
	   <COND (<EQUAL? .WRD ,W?PERIOD>
		  <SET NOSP T>)
		 (<NOT <OR <EQUAL? .WRD ,W?ALL ,W?OF>
			   <NOT <WT? .WRD ,PS?BUZZ-WORD <> ,PS?PREPOSITION>>
			   <WT? .WRD ,PS?ADJECTIVE <> ,PS?OBJECT>>>
		  <SET NOSP T>)
		 (<EQUAL? .WRD ,W?ME>
		  <TELL D ,CH-PLAYER>
		  <SET PN T>)
		 (<INTBL? .WRD <ZREST ,K-CAPS 2> <ZGET ,K-CAPS 0>>
		  <RT-CAPITALIZE .BEG>
		  <SET PN T>)
		 (T
		  <COND (<AND <MC-T? .FIRST??>
			      <ZERO? .PN>
			      <MC-T? .CP>>
			 <TELL "the ">)>
		  <COND (<OR <MC-T? ,GL-P-ORPH>
			     <MC-T? ,GL-P-MERGED>>
			 <PRINTB .WRD>)
			(<AND <EQUAL? .WRD ,W?IT>
			      <RT-VISIBLE? ,GL-P-IT-OBJECT>>
			 <TELL D ,GL-P-IT-OBJECT>)
			(<AND <EQUAL? .WRD ,W?HER>
			      <ZERO? .PN>>
			 <TELL D ,GL-P-HER-OBJECT>)
			(<AND <EQUAL? .WRD ,W?THEM>
			      <ZERO? .PN>>
			 <TELL D ,GL-P-THEM-OBJECT>)
			(<AND <EQUAL? .WRD ,W?HIM>
			      <ZERO? .PN>>
			 <TELL D ,GL-P-HIM-OBJECT>)
			(T
			 <RT-WORD-PRINT <GETB .BEG 2> <GETB .BEG 3>>)>
		  <SET FIRST?? <>>)>)>
    <SET BEG <REST .BEG ,K-P-WORDLEN>>>>

<GLOBAL GL-LONG-OOPS 3>

<ROUTINE RT-DONT-KNOW-WORD-MSG (PTR "AUX" BUF MSG)
	<COND (<0? ,GL-LONG-OOPS>
	       <TELL "[You don't need to use the word \"">)
	      (T
	       <SETG GL-LONG-OOPS <- ,GL-LONG-OOPS 1>>
	       <TELL "[You can play the game from start to finish, solve all the puzzles, get all the points, and STILL never need to use the word \"">)>
	<RT-WORD-PRINT <GETB <REST ,GL-P-P-LEX <SET BUF <* .PTR 2>>> 2>
		       <GETB <REST ,GL-P-P-LEX .BUF> 3>>
	<TELL "\".]" CR>
	<PUT ,GL-OOPS-TABLE ,K-O-PTR .PTR>
	<SETG GL-P-QUOT <>>
	<SETG GL-P-ORPH <>>
	<RTRUE>>

<ROUTINE RT-DONT-KNOW-WORD-USE-MSG (PTR "AUX" BUF) 
	<TELL "[This story cannot understand the word \"">
	<RT-WORD-PRINT <GETB <REST ,GL-P-P-LEX <SET BUF <* .PTR 2>>> 2>
		       <GETB <REST ,GL-P-P-LEX .BUF> 3>>
	<TELL "\" when you use it that way.]" CR>
	<SETG GL-P-QUOT <>>
	<SETG GL-P-ORPH <>>
	<RTRUE>>

<ROUTINE RT-CANT-SEE-ANY-MSG ("OPTIONAL" (THING <>) (STRING? <>) (PRSO? T)
			      "AUX" WRD)
	<RT-CYOU-MSG>
	<TELL "cannot ">
	<COND (<MC-VERB? LISTEN>
	       <TELL "hear">)
	      (<MC-VERB? SMELL>
	       <TELL "smell">)
	      (T
	       <TELL "see">)>
	<COND (<MC-T? .STRING?>
	       <TELL .STRING?>)
	      (<AND <MC-T? .THING>
		    <NOT <EQUAL? .THING ,TH-NOT-HERE-OBJECT>>>
	       <TELL " ">
	       <TELL ANY .THING>)
	      (T
	       <COND (<AND .THING
			   <MC-PRSI? ,TH-NOT-HERE-OBJECT>>
		      <SET PRSO? <>>)>
	       <SET WRD <GET ,GL-P-NAMW <COND (.PRSO? 0) (T 1)>>>
	       <COND (<NOT <INTBL? .WRD <ZREST ,K-CAPS 2>
				   <ZGET ,K-CAPS 0>>>
		      <TELL " any">)>
	       <RT-NOT-HERE-PRINT .PRSO?>)>
	<TELL " here." CR>
	<SETG GL-P-IT-OBJECT ,TH-NOT-HERE-OBJECT>
	<RT-P-CLEAR>
	<RTRUE>>

<ROUTINE RT-TH-NOT-HERE-OBJECT ("AUX" TBL (PRSO? T) OBJ ; (X <>))
	<COND (<AND <MC-PRSO? ,TH-NOT-HERE-OBJECT>
		    <MC-PRSI? ,TH-NOT-HERE-OBJECT>>
	       <TELL "Those things aren't here." CR>
	       <RTRUE>)
	      (<MC-PRSO? ,TH-NOT-HERE-OBJECT>
	       <SET TBL ,GL-P-PRSO>)
	      (T
	       <SET TBL ,GL-P-PRSI>
	       <SET PRSO? <>>)>
	<COND (<MC-T? .PRSO?>
	       <COND (<OR <MC-VERB? FIND WHO WHAT WHERE WAIT-FOR WAIT SAY DRIVE
				    CALL MAKE PASSWORD WALK-TO>
			  <AND <MC-VERB? TAKE>
			       <OR <AND <MC-HERE? ,RM-DIOGENES-CLUB>
					<==? ,GL-WINNER ,CH-BUTLER>>
				   <AND <MC-HERE? ,RM-SHERMANS-HOUSE>
					<==? ,GL-WINNER ,CH-SHERMAN>>>>>
		      <SET OBJ <RT-FIND-NOT-HERE .TBL .PRSO?>>
		      <COND (<MC-T? .OBJ>
			     <COND (<NOT <EQUAL? .OBJ ,TH-NOT-HERE-OBJECT>>
				    <RFATAL>)>)
			    (T
			     <RFALSE>)>)>)
	      (T
	       <COND (<MC-VERB? TELL-ABOUT ASK-ABOUT ASK-FOR>
		      <SET OBJ <RT-FIND-NOT-HERE .TBL .PRSO?>>
		      <COND (<MC-T? .OBJ>
			     <COND (<NOT <EQUAL? .OBJ ,TH-NOT-HERE-OBJECT>>
				    <RFATAL>)>)
			    (T
			     <RFALSE>)>)>)>
	<TELL "[">
	<RT-CYOU-MSG>
	<TELL "cannot ">
	<COND (<MC-VERB? LISTEN>
	       <TELL "hear">)
	      (<MC-VERB? SMELL>
	       <TELL "smell">)
	      (T
	       <TELL "see">)>
	<COND (<NOT <INTBL? ,GL-P-XNAM <ZREST ,K-CAPS 2>
			    <ZGET ,K-CAPS 0>>>
	       <TELL " any">)>
	<RT-NOT-HERE-PRINT .PRSO?>
	<TELL " here.]" CR>
	<RT-P-CLEAR>
	<RFATAL>>

<ROUTINE RT-FAKE-ORPHAN-MSG ("AUX" TMP)
   <RT-ORPHAN ,GL-P-SYNTAX <>>
   <TELL ,K-BE-SPECIFIC-MSG>
   <SET TMP <GET ,GL-P-OTBL ,K-P-VERBN>>
   <COND (<ZERO? .TMP>
	  <TELL "tell">)
	 (<ZERO? <GETB ,GL-P-VTBL 2>>
	  <PRINTB <GET .TMP 0>>)
	  (T
	   <RT-WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>
	   <PUTB ,GL-P-VTBL 2 0>)>
   <TELL "?]" CR>
   <SETG GL-P-ORPH T>
   <SETG GL-P-GOOD <>>
   <RTRUE>>

<ROUTINE RT-TIME-OF-DAY-MSG ("OPT" (WAIT? <>) "AUX" TOD)
  <SET TOD <RT-TIME-OF-DAY>>
  <COND (<NOT <MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>>
	 <COND (<NOT <EQUAL? ,GL-LAST-OUT-TOD .TOD>>
		<COND
		 (.WAIT?
		  <RT-WAIT-TOD-MSG .TOD>)
		 (T
		  <CRLF>
		  ;<CRLF>
		  <RT-CYOU-MSG "notice" "notices">
		  <TELL "that ">
		  <COND
		 (<EQUAL? .TOD 1>
		  <TELL
		     "the sky is lighter. Soon it will be sunrise." CR>)
		 (<EQUAL? .TOD 2>
		  <TELL
"the sun has risen... as much as it ever does in England." CR>)
		 (<EQUAL? .TOD 3>
		  <TELL
		     "the setting sun marks the end of another day. Soon it will be dark." CR>)
		 (T
		  <TELL
		   "the sun has set and the mists have rolled in." CR>)>)>
	 <SETG GL-LAST-OUT-TOD .TOD>)>)>>

<ROUTINE RT-TIME-OF-DAY ("AUX" (TOD <>))
	<COND
		(<EQUAL? <RT-CLOCK-CMP 6 30 0> 1>
			<SET TOD 0>)
		(<EQUAL? <RT-CLOCK-CMP 7 0 0> 1>
			<SET TOD 1>)
		(<EQUAL? <RT-CLOCK-CMP 19 30 0> 1>
			<SET TOD 2>)
		(<EQUAL? <RT-CLOCK-CMP 20 0 0> 1>
			<SET TOD 3>)
		(T
			<SET TOD 0>
		)
	>
	<RETURN .TOD>
>

;------------------------------------------------------------------------------
; "RT-SPOKEN-TO-MSG"
;------------------------------------------------------------------------------

<ROUTINE RT-SPOKEN-TO-MSG (WHO)
   <COND (<OR <NOT <EQUAL? .WHO ,GL-P-QCONTEXT-TH>>
	      <NOT <EQUAL? ,GL-PLACE-CUR ,GL-P-QCONTEXT-RM>>>
	  <SETG GL-P-QCONTEXT-TH .WHO>
	  <SETG GL-P-QCONTEXT-RM <LOC .WHO>>
	  <RT-THIS-IS-IT .WHO>
	  <TELL "[spoken to " THE .WHO "]" CR>)>
   <RTRUE>>

;------------------------------------------------------------------------------
; "RT-SYNTAX-CHECK"
; "Perform syntax matching operations, using GL-P-ITBL as the source of"
; "the verb and adjectives for this input.  Returns false if no"
; "syntax matches, and does it's own orphaning.  If return is true,"
; "the syntax is saved in GL-P-SYNTAX"
;------------------------------------------------------------------------------
 
<ROUTINE RT-GET-PREP (SYN WHICH "AUX" PREP)
  <COND (<1? .WHICH>
	 <SET PREP <GETB .SYN ,K-P-SPREP1>>)
	(T
	 <SET PREP <GETB .SYN ,K-P-SPREP2>>)>
  <COND (<0? <SET PREP <ANDB .PREP *77*>>> 0)
	(T <+ .PREP *300*>)>>

<ROUTINE RT-SYNTAX-CHECK ("AUX" SYN LEN NUM OBJ (DRIVE1 <>) (DRIVE2 <>)
				PREP VERB TPREP) 
  <SET VERB <GET ,GL-P-ITBL ,K-P-VERB>>
  <COND (<ZERO? .VERB>
	 <RT-NOT-IN-SENTENCE-MSG "any verbs">
	 <RFALSE>)>
  <SET SYN <GET ,VERBS <- 255 .VERB>>>
  <SET LEN <GETB .SYN 0>>
  <SET SYN <REST .SYN>>
  <REPEAT ()
    ;<SET NUM <BAND <GETB .SYN ,K-P-SBITS> ,K-P-SONUMS>>
    <SET NUM <P-SONUMS .SYN>>
    <COND (<G? ,GL-P-NCN .NUM>
	   T)
	  (<AND	<G=? .NUM 1>
		<ZERO? ,GL-P-NCN>
		<OR <ZERO? <SET PREP <GET ,GL-P-ITBL ,K-P-PREP1>>>
		    <EQUAL? .PREP ;<GETB .SYN ,K-P-SPREP1>
				  <RT-GET-PREP .SYN 1>>>>
	   <SET DRIVE1 .SYN>)
	  (<EQUAL? ;<GETB .SYN ,K-P-SPREP1>
		   <RT-GET-PREP .SYN 1>
		   <GET ,GL-P-ITBL ,K-P-PREP1>>
	   <COND (<AND <EQUAL? .NUM 2>
		       <EQUAL? ,GL-P-NCN 1>>
		  <SET DRIVE2 .SYN>)
		 (<AND <L=? .NUM 1>
		       <T? <GET ,GL-P-ITBL ,K-P-PREP2>>> T)
		 (<OR <L=? .NUM 1>
		      <EQUAL? ;<GETB .SYN ,K-P-SPREP2>
			  <RT-GET-PREP .SYN 2>
			  <GET ,GL-P-ITBL ,K-P-PREP2>>>
		  <RT-SYNTAX-FOUND .SYN>
		  <RTRUE>)>)>
    <COND (<DLESS? LEN 1>
	   <COND (<OR <MC-T? .DRIVE1>
		      <MC-T? .DRIVE2>>
		  <RETURN>)
		 (<AND <==? ,GL-P-NCN 2>
		       ,GL-FUNNY-CLAUSE?>
		  <SETG GL-P-NCN 1>
		  <SETG GL-FUNNY-CLAUSE? <>>
		  <PUT ,GL-P-ITBL ,K-P-NC1L <GET ,GL-P-ITBL ,K-P-NC2L>>
		  <RETURN <RT-SYNTAX-CHECK>>)
		 (T
		  <TELL ,K-DONT-UNDERSTAND-MSG CR>
		  <RFALSE>)>)
	  (T
	   <COND (<0? .NUM>
		  <SET SYN <REST .SYN ,K-P-SLEN-0>>)
		 (<1? .NUM>
		  <SET SYN <REST .SYN ,K-P-SLEN-1>>)
		 (T
		  <SET SYN <REST .SYN ,K-P-SLEN-2>>)>
	   ;<SET SYN <REST .SYN ,K-P-SYNLEN>>)>>
  <COND (<AND <MC-T? .DRIVE1>
	      <SET OBJ <RT-GET-WHAT-I-MEAN <GETB .DRIVE1 ,K-P-SFWIM1>
					   <GETB .DRIVE1 ,K-P-SLOC1>
					   <RT-GET-PREP .DRIVE1 1>
					   ;<GETB .DRIVE1 ,K-P-SPREP1>>>>
	 <PUT ,GL-P-PRSO ,K-P-MATCHLEN 1>
	 <PUT ,GL-P-PRSO 1 .OBJ>
	 <RT-SYNTAX-FOUND .DRIVE1>
	 <RTRUE>)
	(<AND <MC-T? .DRIVE2>
	      <SET OBJ <RT-GET-WHAT-I-MEAN <GETB .DRIVE2 ,K-P-SFWIM2>
					   <GETB .DRIVE2 ,K-P-SLOC2>
					   <RT-GET-PREP .DRIVE2 2>
					   ;<GETB .DRIVE2 ,K-P-SPREP2>>>>
	 <PUT ,GL-P-PRSI ,K-P-MATCHLEN 1>
	 <PUT ,GL-P-PRSI 1 .OBJ>
	 <RT-SYNTAX-FOUND .DRIVE2>
	 <RTRUE>)
	(<EQUAL? .VERB ,ACT?FIND ; ,ACT?WHAT>
	 <TELL ,K-DO-IT-YOURSELF-MSG CR>
	 <RFALSE>)
	(T
	 <COND (<EQUAL? ,GL-WINNER ,CH-PLAYER>
		<RT-ORPHAN .DRIVE1 .DRIVE2>
		<TELL "[Wh">)
	       (T
		<TELL "[Your command was not complete. Type wh">)>
	 <COND (<EQUAL? .VERB ,ACT?WALK ,ACT?GO>
		<TELL "ere">)
	       (<OR <AND <MC-T? .DRIVE1>
			 <EQUAL? <GETB .DRIVE1 ,K-P-SFWIM1> ,FL-PERSON>>
		    <AND <MC-T? .DRIVE2>
			 <EQUAL? <GETB .DRIVE2 ,K-P-SFWIM2> ,FL-PERSON>>>
		<TELL "om">)
	       (T
		<TELL "at">)>
	 <COND (<EQUAL? ,GL-WINNER ,CH-PLAYER>
		<TELL " do you want to ">)
	       (T
		<TELL " you want " THE ,GL-WINNER " to ">)>
	 <RT-VERB-PRINT>
	 <COND (<MC-T? .DRIVE2>
		<RT-CLAUSE-PRINT ,K-P-NC1 ,K-P-NC1L>)>
	 <SETG GL-P-END-ON-PREP <>>
	 <RT-PREP-PRINT <COND (<MC-T? .DRIVE1>
			       <RT-GET-PREP .DRIVE1 1>
			       ;<GETB .DRIVE1 ,K-P-SPREP1>)
			      (T
			       <RT-GET-PREP .DRIVE2 2>
			       ;<GETB .DRIVE2 ,K-P-SPREP2>)>>
	 <COND (<EQUAL? ,GL-WINNER ,CH-PLAYER>
		<SETG GL-P-ORPH T>
		<TELL "?]" CR>)
	       (T
		<SETG GL-P-ORPH <>>
		<TELL ".]" CR>)>
	 <RFALSE>)>>

;------------------------------------------------------------------------------
; "RT-CLAUSE"
; "scan through a noun phrase, leaving a pointer to its starting location"
;------------------------------------------------------------------------------

<ROUTINE RT-CLAUSE (PTR VAL WRD
		    "AUX" OFF NUM (ANDFLG <>) (FIRST?? T) NW (LW 0) TPTR
			  TMP)
  <SET OFF <* <- ,GL-P-NCN 1> 2>>
  <COND (<MC-T? .VAL>
         <PUT ,GL-P-ITBL <SET NUM <+ ,K-P-PREP1 .OFF>> .VAL>
         <PUT ,GL-P-ITBL <+ .NUM 1> .WRD>
         <SET PTR <+ .PTR ,K-P-LEXELEN>>)
	(T
         <SETG GL-P-LEN <+ ,GL-P-LEN 1>>)>
  <COND (<ZERO? ,GL-P-LEN>
         <SETG GL-P-NCN <- ,GL-P-NCN 1>>
         <RETURN -1>)>
  <PUT ,GL-P-ITBL <SET NUM <+ ,K-P-NC1 .OFF>> <REST ,GL-P-P-LEX <* .PTR 2>>>
  <COND (<EQUAL? <GET ,GL-P-P-LEX .PTR> ,W?THE ,W?A ,W?AN>
         <PUT ,GL-P-ITBL .NUM <REST <GET ,GL-P-ITBL .NUM> 4>>)>
  <REPEAT ()
    <COND (<L? <SETG GL-P-LEN <- ,GL-P-LEN 1>> 0>
	   <PUT ,GL-P-ITBL <+ .NUM 1> <REST ,GL-P-P-LEX <* .PTR 2>>>
	   <RETURN -1>)>
    <COND ;(<RT-BUZZ-WORD-MSG? <SET WRD <GET ,GL-P-P-LEX .PTR>>>
            <RFALSE>)
	  (<OR <MC-T? <SET WRD <GET ,GL-P-P-LEX .PTR>>>
               <SET WRD <RT-NUMBER? .PTR>>
               ;<SET WRD <NAME? .PTR>>>
	   <COND (<ZERO? ,GL-P-LEN>
		  <SET NW 0>)
		 (T
		  <COND (<F? <SET NW <GET ,GL-P-P-LEX
					  <SET TPTR <+ .PTR ,K-P-LEXELEN>>>>>
			 <COND (<N==? .WRD ,W?INTNUM>
				<SET NW <RT-NUMBER? .TPTR>>
				<PUT ,GL-P-P-LEX .TPTR .NW>)>)>)>
	   ;<COND (<AND <EQUAL? .WRD ,W?OF>
			<EQUAL? <GET ,GL-P-ITBL ,K-P-VERB>
				,ACT?MAKE ,ACT?TAKE>>
		   <RT-CHANGE-LEXV .PTR ,W?WITH>
		   <SET WRD ,W?WITH>)>
	   <COND (<AND <EQUAL? .WRD ,W?PERIOD>
		       <OR <EQUAL? .LW ,W?MR ,W?MRS ,W?MISS>
			   <EQUAL? .LW ,W?DR>>>
		  <SET LW 0>)
		 (<EQUAL? .WRD ,W?AND ,W?COMMA>
		  <SET ANDFLG T>)
		 (<EQUAL? .WRD ,W?ALL ,W?BOTH ,W?EVERYTHING>
		  <COND (<EQUAL? .NW ,W?OF>
			 <SETG GL-P-LEN <- ,GL-P-LEN 1>>
			 <SET PTR <+ .PTR ,K-P-LEXELEN>>)>)
		 (<OR <EQUAL? .WRD ,W?THEN ,W?PERIOD>
		      <AND <WT? .WRD ,PS?PREPOSITION>
			   <GET ,GL-P-ITBL ,K-P-VERB>
			   <NOT .FIRST??>>>
		  <SETG GL-P-LEN <+ ,GL-P-LEN 1>>
		  <PUT ,GL-P-ITBL <+ .NUM 1>
		       <REST ,GL-P-P-LEX <* .PTR 2>>>
		  <RETURN <- .PTR ,K-P-LEXELEN>>)
		 (<AND <MC-T? .ANDFLG>
		       <OR <ZERO? <GET ,GL-P-ITBL ,K-P-VERBN>>
			   <RT-VERB-DIR-ONLY? .WRD>>>
		  <SET PTR <- .PTR 4>>
		  <RT-CHANGE-LEXV <+ .PTR 2> ,W?THEN>
		  <SETG GL-P-LEN <+ ,GL-P-LEN 2>>)
		 (<WT? .WRD ,PS?OBJECT>
		  <COND (<AND <G? ,GL-P-LEN 0>
			      <EQUAL? .NW ,W?OF>
			      <NOT <EQUAL? .WRD ,W?ALL ,W?EVERYTHING>>>
			 <PUT ,GL-P-OFW <- ,GL-P-NCN 1> .WRD>)
			(<AND <WT? .WRD ,PS?ADJECTIVE>
			      <MC-T? .NW>
			      <WT? .NW ,PS?OBJECT>>
			 <COND (<AND <EQUAL? .WRD ,W?INTNUM>
				     <EQUAL? .NW ,W?HOUR ,W?HOURS
						  ,W?MINUTE ,W?MINUTES>>
				T)
			       (<==? .NW ,W?TOMB> T)
			       (T
				<COND (<==? .WRD ,W?BOX>
				       <COND (<N==? .NW ,W?INTNUM>
					      <SET TMP T>)>)
				      (<==? .WRD ,W?TOMB>
				       <SET TMP T>)>
				<COND
				 (.TMP
				  <SETG GL-FUNNY-CLAUSE? T>
				  <ZPUT ,GL-P-ITBL <SET NUM <+ .NUM 1>>
					<ZREST ,GL-P-P-LEX
					       <* <+ .PTR 2> 2>>>
				  <RETURN .PTR>)>)>
			 T)
			(<AND <ZERO? .ANDFLG>
			      <NOT <EQUAL? .NW ,W?BUT ,W?EXCEPT>>
			      <NOT <EQUAL? .NW ,W?AND ,W?COMMA>>>
			 <PUT ,GL-P-ITBL <+ .NUM 1>
			      <REST ,GL-P-P-LEX <* <+ .PTR 2> 2>>>
			 <RETURN .PTR>)
			(T
			 <SET ANDFLG <>>)>)
		 (<AND <OR <MC-T? ,GL-P-MERGED>
			   <MC-T? ,GL-P-ORPH>
			   <MC-T? <GET ,GL-P-ITBL ,K-P-VERB>>>
		       <WT? .WRD ,PS?ADJECTIVE <> ,PS?BUZZ-WORD>>)
		 (<AND <MC-T? .ANDFLG>
		       <ZERO? <GET ,GL-P-ITBL ,K-P-VERB>>>
		  <SET PTR <- .PTR 4>>
		  <RT-CHANGE-LEXV <+ .PTR 2> ,W?THEN>
		  <SETG GL-P-LEN <+ ,GL-P-LEN 2>>)
		 (<WT? .WRD ,PS?PREPOSITION>
		  T)
		 (T
		  <RT-DONT-KNOW-WORD-USE-MSG .PTR>
		  <RFALSE>)>)
	  (T
	   <RT-DONT-KNOW-WORD-MSG .PTR>
	   <RFALSE>)>
    <SET LW .WRD>
    <SET FIRST?? <>>
    <SET PTR <+ .PTR ,K-P-LEXELEN>>>>

;------------------------------------------------------------------------------
; "RT-GET-WHAT-I-MEAN"
;------------------------------------------------------------------------------

<ROUTINE RT-GET-WHAT-I-MEAN (GBIT LBIT PREP "OPT" (NO-ROOMS? <>)
			     (SILENT? <>) "AUX" OBJ)
  <COND (<EQUAL? .GBIT ,FL-LOCATION>
	 <RETURN ,ROOMS>)
	(<AND <MC-T? ,GL-P-IT-OBJECT>
	      <MC-IS? ,GL-P-IT-OBJECT .GBIT>>
	 <COND (<F? .SILENT?> <TELL "[" THE ,GL-P-IT-OBJECT "]" CR>)>
	 <RETURN ,GL-P-IT-OBJECT>)>
  <SETG INHIBIT-ROOMS .NO-ROOMS?>
  <SETG GL-P-GWIMBIT .GBIT>
  <SETG GL-P-SLOCBITS .LBIT>
  <PUT ,GL-P-MERGE ,K-P-MATCHLEN 0>
  <COND (<RT-GET-OBJECT ,GL-P-MERGE <>>
	 <SETG GL-P-GWIMBIT 0>
	 <COND (<EQUAL? <GET ,GL-P-MERGE ,K-P-MATCHLEN> 1>
		<SET OBJ <GET ,GL-P-MERGE 1>>
		<COND (<AND <EQUAL? ,GL-WINNER ,CH-PLAYER>
			    <NOT <EQUAL? .OBJ ,TH-HANDS>>
			    <F? .SILENT?>>
		       <TELL "[">
		       <COND (<RT-PREP-PRINT .PREP <>>
			      <MC-SPACE>)>
		       <TELL THE .OBJ>
		       <TELL "]" CR>)>
		<SETG INHIBIT-ROOMS <>>
		<RETURN .OBJ>)>)
	(T
	 <SETG GL-P-GWIMBIT 0>
	 <SETG INHIBIT-ROOMS <>>
	 <RFALSE>)>>

;*****************************************************************************
; "routines with no screen output"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-P-CLEAR"
;-----------------------------------------------------------------------------

<ROUTINE RT-P-CLEAR ()
	 <SETG GL-P-CONT <>>
	 <SETG GL-P-QUOT <>>
	 <RTRUE>
>

;------------------------------------------------------------------------------
; "RT-PICK-NEXT"
;------------------------------------------------------------------------------

<ROUTINE RT-PICK-NEXT (TBL "AUX" CNT STR NT)
	<SET CNT <GETB .TBL 0>>
	<SET NT <ZGET <REST .TBL 1> 0>>
	<SET STR <ZGET .NT .CNT>>       
	<COND (<G? <SET CNT <+ .CNT 1>> <GET .NT 0>>
	       <SET CNT 1>)>
	<PUTB .TBL 0 .CNT>
	<RETURN .STR>>

<ROUTINE RT-QCONTEXT-GOOD? ()
	<COND (<AND <F? ,GL-WHERE-TO-ORPH?>
		    <MC-T? ,GL-P-QCONTEXT-TH>
		    <MC-IS? ,GL-P-QCONTEXT-TH ,FL-PERSON>
		    <EQUAL? ,GL-PLACE-CUR ,GL-P-QCONTEXT-RM>
		    <RT-VISIBLE? ,GL-P-QCONTEXT-TH>>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE RT-FIND-PERSON (THING "AUX" OBJ OBJ1 (WHO-P <>) (WHO-A <>))
	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND (<ZERO? .OBJ>
		       <RETURN>)
		      (<MC-IS? .OBJ ,FL-PERSON>
		       <COND (<AND <MC-ISNOT? .OBJ ,FL-PLURAL>
				   <NOT <EQUAL? .OBJ ,CH-PLAYER ,GL-WINNER>>>
			      <COND (<MC-IS? .OBJ ,FL-ASLEEP>) ;"RFP"
				    (<EQUAL? .OBJ ,GL-PUPPY>
				     <SET WHO-P .OBJ>)
				    (T
				     <RETURN>)>)>)
		      (<OR <MC-IS? .OBJ ,FL-SURFACE>
			   <AND <MC-IS? .OBJ ,FL-CONTAINER>
				<MC-IS? .OBJ ,FL-OPENED>>>
		       <SET OBJ1 .OBJ>
		       <COND (<SET OBJ <RT-FIND-PERSON .OBJ>>
			      <COND (<MC-IS? .OBJ ,FL-ASLEEP>) ;"RFP"
				    (<EQUAL? .OBJ ,GL-PUPPY>
				     <SET WHO-P .OBJ>)
				    (T
				     <RETURN>)>)>
		       <SET OBJ .OBJ1>)>
		<SET OBJ <NEXT? .OBJ>>>
	<COND (<MC-T? .OBJ>
	       <RETURN .OBJ>)
	      (<MC-T? .WHO-P>
	       <RETURN .WHO-P>)
	      ;(<MC-T? .WHO-A>   ;"RFP"
	       <RETURN .WHO-A>)>
	<RFALSE>>

<ROUTINE RT-ANYONE-HERE? ()
	<COND (<RT-QCONTEXT-GOOD?>
	       <RETURN ,GL-P-QCONTEXT-TH>)
	      (T
	       <RETURN <RT-FIND-PERSON ,GL-PLACE-CUR>>)>>

<ROUTINE RT-MOVE-ALL (FROM TO "AUX" OBJ NXT)
	<SET OBJ <FIRST? .FROM>>
	<REPEAT ()
		<COND (<ZERO? .OBJ>
		       <RTRUE>)>
		<SET NXT <NEXT? .OBJ>>
		<MOVE .OBJ .TO>
		<SET OBJ .NXT>>
	<RTRUE>>

<ROUTINE RT-GOT? (OBJ)
	<COND (<ZERO? .OBJ>
	       <RFALSE>)
	      (<AND <EQUAL? ,GL-WINNER ,CH-PLAYER>
		    <IN? .OBJ ,TH-POCKET>>
	       <RTRUE>)
	      (<RT-HELD? .OBJ>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE RT-HELD? (OBJ "AUX" L)
	<COND (<ZERO? .OBJ>
	       <RFALSE>)
	      (<AND <NOT <MC-IS? .OBJ ,FL-TAKEABLE>>
		    <NOT <MC-IS? .OBJ ,FL-TRYTAKE>>>
	       <RFALSE>)>
	<SET L <LOC .OBJ>>
	<COND (<EQUAL? .L <> ,ROOMS ,GLOBAL-OBJECTS>
	       <RFALSE>)
	      (<EQUAL? .L ,GL-WINNER>
	       <RTRUE>)
	      (<AND <EQUAL? ,GL-WINNER ,CH-PLAYER>
		    <EQUAL? .L ,TH-POCKET>>
	       <RFALSE>)
	      (T
	       <RT-HELD? .L>)>>

<ROUTINE RT-THIS-IS-IT (OBJ)
   <COND (<OR <EQUAL? .OBJ <> ,CH-PLAYER ,TH-NOT-HERE-OBJECT>
	      <EQUAL? .OBJ ,TH-INTDIR ,TH-INTNUM>
	      <EQUAL? .OBJ ,TH-LEFT ,TH-RIGHT>>
	  <RTRUE>)
	 (<AND <MC-VERB? WALK WALK-TO>
	       <EQUAL? .OBJ ,GL-PRSO>>
	  <RTRUE>)
	 (<AND <MC-IS? .OBJ ,FL-PERSON>
	       <MC-IS? .OBJ ,FL-FEMALE>>
	  <SETG GL-P-HER-OBJECT .OBJ>
	  <RTRUE>)
	 (<AND <MC-IS? .OBJ ,FL-PERSON>
	       <MC-ISNOT? .OBJ ,FL-FEMALE>>
	  <SETG GL-P-HIM-OBJECT .OBJ>
	  <RTRUE>)
	 (<MC-IS? .OBJ ,FL-COLLECTIVE>
	  <SETG GL-P-THEM-OBJECT .OBJ>
	  <SETG GL-P-IT-OBJECT .OBJ>
	  <RTRUE>)
	 (<MC-IS? .OBJ ,FL-PLURAL>
	  <SETG GL-P-THEM-OBJECT .OBJ>
	  <RTRUE>)
	 (T
	  <COND (<FSET? .OBJ ,FL-NEEDS-IDENTITY>
		 <PUTP ,TH-IT ,P?OBJ-NOUN <GETP .OBJ ,P?OBJ-NOUN>>
		 <PUTP ,TH-IT ,P?OBJ-ADJ <GETP .OBJ ,P?OBJ-ADJ>>)
		(T
		 <PUTP ,TH-IT ,P?OBJ-NOUN 0>
		 <PUTP ,TH-IT ,P?OBJ-ADJ 0>)>
	  <SETG GL-P-IT-OBJECT .OBJ>
	  <RTRUE>)>>

<ROUTINE RT-CHANGE-LEXV (PTR WRD "OPTIONAL" (PTRS? <>) "AUX" X Y Z)
   <COND (<MC-T? .PTRS?>
	  <SET X <+ 2 <* 2 <- .PTR ,K-P-LEXELEN>>>>
	  <SET Y <GETB ,GL-P-P-LEX .X>>
	  <SET Z <+ 2 <* 2 .PTR>>>
	  <PUTB ,GL-P-P-LEX .Z .Y>
	  <PUTB ,GL-P-S-LEX .Z .Y>
	  <SET Y <GETB ,GL-P-P-LEX <+ 1 .X>>>
	  <SET Z <+ 3 <* 2 .PTR>>>
	  <PUTB ,GL-P-P-LEX .Z .Y>
	  <PUTB ,GL-P-S-LEX .Z .Y>)>
   <PUT ,GL-P-P-LEX .PTR .WRD>
   <PUT ,GL-P-S-LEX .PTR .WRD>
   <RTRUE>>

;------------------------------------------------------------------------------
; "RT-WT?"
;  "Check whether word pointed at by PTR is the correct part of speech."
;  "The second argument is the part of speech (,PS?<part of speech>).  The"
;  "3rd argument (,P1?<part of speech>), if given, causes the value"
;  "for that part of speech to be returned."
;------------------------------------------------------------------------------

; "This is only called through the WT? macro, when it doesn't generate
   a BTST directly..."

<ROUTINE RT-WT? (PTR BIT "OPTIONAL" (B1 5) "AUX" (OFFS ,K-P-P1OFF) TYP
		 TBL)
   <COND (<BTST <SET TYP <GETB .PTR ,K-P-PSOFF>> .BIT>
	  <COND (<G? .B1 4>
		 <RTRUE>)
		(<==? .BIT ,PS?PREPOSITION>
		 ; "We have to get the preposition ID out of PREPOSITIONS
		    rather than the word"
		 <COND (<SET TBL <INTBL? .PTR <ZREST ,PREPOSITIONS 2>
					 <ZGET ,PREPOSITIONS 0> *203*>>
			<GETB .TBL 2>)>)
		(T
		 <SET TYP <BAND .TYP ,K-P-P1BITS>>
		 ; "Following no longer applies, since there's only
		    one byte defined for all this"
		 ;<COND (<NOT <EQUAL? .TYP .B1>>
			<SET OFFS <+ .OFFS 1>>)>
		 <GETB .PTR .OFFS>)>)>>

;------------------------------------------------------------------------------
; "RT-VERB-DIR-ONLY?"
;------------------------------------------------------------------------------

<ROUTINE RT-VERB-DIR-ONLY? (WRD)
   <COND
      (<NOT <OR <WT? .WRD ,PS?OBJECT <> ,PS?ADJECTIVE>
		<NOT <WT? .WRD ,PS?DIRECTION <> ,PS?VERB>>>>
       <RTRUE>)
      (T
         <RFALSE>
      )
   >
>

;------------------------------------------------------------------------------
; "RT-STUFF"
; "for AGAIN purposes, put contents of one LEXV table into another"
;------------------------------------------------------------------------------

<ROUTINE RT-STUFF (DEST SRC "OPTIONAL" (MAX 29))
   <COPYT .SRC .DEST <+ ,K-P-LEXSTART <* .MAX ,K-P-WORDLEN ;,K-P-LEXELEN>>>>

;------------------------------------------------------------------------------
; "RT-INBUF-ADD"
; "put the word in the positions specified from GL-P-PIBUF to the end of"
; "GL-OOPS-INBUF, leaving the appropriate pointers in GL-P-S-LEX"
;------------------------------------------------------------------------------

<ROUTINE RT-INBUF-ADD (LEN BEG SLOT "AUX" DBEG (CTR 0) TMP)
   <SET TMP <GET ,GL-OOPS-TABLE ,K-O-END>>
   <COND
      (<MC-T? .TMP>
         <SET DBEG .TMP>
      )
      (T
         <SET DBEG <+ <GETB ,GL-P-S-LEX
            <SET TMP <GET ,GL-OOPS-TABLE ,K-O-LENGTH>>>
			     <GETB ,GL-P-S-LEX <+ .TMP 1>>>>
      )
   >

   <PUT ,GL-OOPS-TABLE ,K-O-END <+ .DBEG .LEN>>

   <COPYT <ZREST ,GL-P-PIBUF .BEG> <ZREST ,GL-OOPS-INBUF .DBEG> .LEN>
   ;<REPEAT ()
      <PUTB ,GL-OOPS-INBUF <+ .DBEG .CTR>
	    <GETB ,GL-P-PIBUF <+ .BEG .CTR>>>
      <INC CTR>
      <COND (<EQUAL? .CTR .LEN>
	     <RETURN>)>>
   <PUTB ,GL-P-S-LEX .SLOT .DBEG>
   <PUTB ,GL-P-S-LEX <- .SLOT 1> .LEN>
   <RTRUE>
>

;------------------------------------------------------------------------------
; "RT-ACLAUSE-WIN"
;------------------------------------------------------------------------------

<ROUTINE RT-ACLAUSE-WIN (ADJ "AUX" X) 
   <PUT ,GL-P-ITBL ,K-P-VERB <GET ,GL-P-OTBL ,K-P-VERB>>
   <SET X <+ ,GL-P-ACLAUSE 1>>
   <RT-CLAUSE-COPY ,GL-P-OTBL ,GL-P-OTBL ,GL-P-ACLAUSE .X
      ,GL-P-ACLAUSE .X .ADJ
	>
   <AND <MC-T? <GET ,GL-P-OTBL ,K-P-NC2>> <SETG GL-P-NCN 2>>
   <SETG GL-P-ACLAUSE <>>
   <RTRUE>
>

;------------------------------------------------------------------------------
; "RT-NCLAUSE-WIN"
;------------------------------------------------------------------------------

<ROUTINE RT-NCLAUSE-WIN ()
   <RT-CLAUSE-COPY ,GL-P-ITBL ,GL-P-OTBL ,K-P-NC1 ,K-P-NC1L
      ,GL-P-ACLAUSE <+ ,GL-P-ACLAUSE 1>
	>
   <AND <MC-T? <GET ,GL-P-OTBL ,K-P-NC2>> <SETG GL-P-NCN 2>>
	<SETG GL-P-ACLAUSE <>>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-ORPHAN-VERB"
;-----------------------------------------------------------------------------

<ROUTINE RT-ORPHAN-VERB (VERB PREVERB)
	<PUT ,GL-P-VTBL	0				.VERB>

	<PUT ,GL-P-OTBL	,K-P-VERB	.PREVERB>
	<PUT ,GL-P-OTBL	,K-P-VERBN	,GL-P-VTBL>
	<PUT ,GL-P-OTBL	,K-P-PREP1	0>
	<PUT ,GL-P-OTBL	,K-P-PREP1N	0>
	<PUT ,GL-P-OTBL	,K-P-PREP2	0>
	<PUT ,GL-P-OTBL	5 				0>
	<PUT ,GL-P-OTBL	,K-P-NC1		1>
	<PUT ,GL-P-OTBL	,K-P-NC1L	0>
	<PUT ,GL-P-OTBL	,K-P-NC2		0>
	<PUT ,GL-P-OTBL	,K-P-NC2L	0>

	<SETG GL-P-ORPH	T>
>

;------------------------------------------------------------------------------
; "RT-ORPHAN"
;------------------------------------------------------------------------------

<ROUTINE RT-ORPHAN (D1 D2 "AUX" (CNT -1)) 
	<COND (<ZERO? ,GL-P-MERGED>
	       <PUT ,GL-P-OCLAUSE ,K-P-MATCHLEN 0>)>
	<PUT ,GL-P-OVTBL 0 <GET ,GL-P-VTBL 0>>
	<PUTB ,GL-P-OVTBL 2 <GETB ,GL-P-VTBL 2>>
	<PUTB ,GL-P-OVTBL 3 <GETB ,GL-P-VTBL 3>>
	<COPYT ,GL-P-ITBL ,GL-P-OTBL <* 2 <+ ,K-P-ITBLLEN 1>>>
	;<REPEAT ()
	  <COND (<IGRTR? CNT ,K-P-ITBLLEN>
		 <RETURN>)
		(T
		 <PUT ,GL-P-OTBL .CNT <GET ,GL-P-ITBL .CNT>>)>>
	<COND (<EQUAL? ,GL-P-NCN 2>
	       <RT-CLAUSE-COPY ,GL-P-ITBL ,GL-P-OTBL ,K-P-NC2
			       ,K-P-NC2L ,K-P-NC2 ,K-P-NC2L>)>
	<COND (<NOT <L? ,GL-P-NCN 1>>
	       <RT-CLAUSE-COPY ,GL-P-ITBL ,GL-P-OTBL
			       ,K-P-NC1 ,K-P-NC1L ,K-P-NC1 ,K-P-NC1L>)>
	<COND (<MC-T? .D1>
	       <PUT ,GL-P-OTBL ,K-P-PREP1 <RT-GET-PREP .D1 1>>
	       <PUT ,GL-P-OTBL ,K-P-NC1 1>)
	      (<MC-T? .D2>
	       <PUT ,GL-P-OTBL ,K-P-PREP2 <RT-GET-PREP .D2 2>>
	       <PUT ,GL-P-OTBL ,K-P-NC2 1>)>> 

;------------------------------------------------------------------------------
; "RT-ORPHAN-MERGE"
;------------------------------------------------------------------------------

<ROUTINE RT-ORPHAN-MERGE ("AUX" (CNT -1) TEMP VERB BEG END (ADJ <>) WRD) 
  <SETG GL-P-ORPH <>>
  <COND (<OR <F? <SET WRD <GET ,GL-P-ITBL ,K-P-VERBN>>>
	     <F? <SET WRD <GET .WRD 0>>>>
	 T) 
	(<OR <EQUAL? <WT? <SET WRD <GET <GET ,GL-P-ITBL ,K-P-VERBN> 0>>
			  ,PS?VERB ,P1?VERB>
		     <GET ,GL-P-OTBL ,K-P-VERB>>
	     <WT? .WRD ,PS?ADJECTIVE>>
	 <SET ADJ T>)
	(<WT? <SET WRD <GET <GET ,GL-P-ITBL ,K-P-VERBN> 0>>
	      ,PS?ADJECTIVE>
	 <SET ADJ T>)
	(<AND <WT? .WRD ,PS?OBJECT>
	      <ZERO? ,GL-P-NCN>
	      <MC-T? <SET VERB <GET ,GL-P-ITBL ,K-P-VERB>>>
	      ; "ADDED 8/24/87 PER SWG">
	 <PUT ,GL-P-ITBL ,K-P-VERB 0>
	 <PUT ,GL-P-ITBL ,K-P-VERBN 0>
	 <PUT ,GL-P-ITBL ,K-P-NC1 <REST ,GL-P-P-LEX 2>>
	 <PUT ,GL-P-ITBL ,K-P-NC1L <REST ,GL-P-P-LEX 6>>
	 <SETG GL-P-NCN 1>)>
  <COND (<AND <MC-T? <SET VERB <GET ,GL-P-ITBL ,K-P-VERB>>>
	      <ZERO? .ADJ>
	      <NOT <EQUAL? .VERB <GET ,GL-P-OTBL ,K-P-VERB>>>>
	 <RFALSE>)
	(<EQUAL? ,GL-P-NCN 2>
	 <COND (<T? ,GL-FUNNY-CLAUSE?>
		<SETG GL-P-NCN 1>
		<SETG GL-FUNNY-CLAUSE? <>>
		<PUT ,GL-P-ITBL ,K-P-NC1L <GET ,GL-P-ITBL ,K-P-NC2L>>
		<RETURN <RT-ORPHAN-MERGE>>)>
	 <RFALSE>)
	(<EQUAL? <GET ,GL-P-OTBL ,K-P-NC1> 1>
	 <COND (<OR <EQUAL? <SET TEMP <GET ,GL-P-ITBL ,K-P-PREP1>>
			    <GET ,GL-P-OTBL ,K-P-PREP1>>
		    <ZERO? .TEMP>>
		<COND (<MC-T? .ADJ>
		       <PUT ,GL-P-OTBL ,K-P-NC1 <REST ,GL-P-P-LEX 2>>
		       <COND (<ZERO? <GET ,GL-P-ITBL ,K-P-NC1L>>
			      <PUT ,GL-P-ITBL ,K-P-NC1L <REST ,GL-P-P-LEX 6>>)>
		       <COND (<ZERO? ,GL-P-NCN>
			      <SETG GL-P-NCN 1>)>)
		      (T
		       <PUT ,GL-P-OTBL ,K-P-NC1 <GET ,GL-P-ITBL ,K-P-NC1>>
		       ;<PUT ,GL-P-OTBL ,K-P-NC1L <GET ,GL-P-ITBL ,K-P-NC1L>>)>
		<PUT ,GL-P-OTBL ,K-P-NC1L <GET ,GL-P-ITBL ,K-P-NC1L>>)
	       (T
		<RFALSE>)>)
	(<EQUAL? <GET ,GL-P-OTBL ,K-P-NC2> 1>
	 <COND (<OR <EQUAL? <SET TEMP <GET ,GL-P-ITBL ,K-P-PREP1>>
			    <GET ,GL-P-OTBL ,K-P-PREP2>>
		    <ZERO? .TEMP>>
		<COND (<MC-T? .ADJ>
		       <PUT ,GL-P-ITBL ,K-P-NC1 <REST ,GL-P-P-LEX 2>>
		       <COND (<ZERO? <GET ,GL-P-ITBL ,K-P-NC1L>>
			      <PUT ,GL-P-ITBL ,K-P-NC1L
				   <REST ,GL-P-P-LEX 6>>)>)>
		<PUT ,GL-P-OTBL ,K-P-NC2 <GET ,GL-P-ITBL ,K-P-NC1>>
		<PUT ,GL-P-OTBL ,K-P-NC2L <GET ,GL-P-ITBL ,K-P-NC1L>>
		<SETG GL-P-NCN 2>)
	       (T
		<RFALSE>)>)
	(<MC-T? ,GL-P-ACLAUSE>
	 <COND (<AND <NOT <EQUAL? ,GL-P-NCN 1>> <NOT .ADJ>>
		<SETG GL-P-ACLAUSE <>>
		<RFALSE>)
	       (T
		<SET BEG <GET ,GL-P-ITBL ,K-P-NC1>>
		<COND (<MC-T? .ADJ>
		       <SET BEG <REST ,GL-P-P-LEX 2>>
		       <SET ADJ <>>)>
		<SET END <GET ,GL-P-ITBL ,K-P-NC1L>>
		<REPEAT ()
		 <SET WRD <GET .BEG 0>>
		 <COND (<EQUAL? .BEG .END>
			<COND (<MC-T? .ADJ>
			       <RT-ACLAUSE-WIN .ADJ>
			       <RETURN>)
			      (T
			       <SETG GL-P-ACLAUSE <>>
			       <RFALSE>)>)
		       (<AND ;<ZERO? .ADJ>
			     <OR <AND <BTST <GETB .WRD ,K-P-PSOFF>
					    ,PS?ADJECTIVE>
				      <RT-ADJ-CHECK .WRD .ADJ>>
				 <EQUAL? .WRD ,W?ALL ,W?EVERYTHING>>>
			<SET ADJ .WRD>)
		       ;(<EQUAL? .WRD ,W?ONE>
			 <RT-ACLAUSE-WIN .ADJ>
			 <RETURN>)
		       (<BTST <GETB .WRD ,K-P-PSOFF> ,PS?OBJECT>
			<COND (<EQUAL? .WRD ,GL-P-ANAM>
			       <RT-ACLAUSE-WIN .ADJ>)
			      (T
			       <RT-NCLAUSE-WIN>)>
			<RETURN>)>
		 <SET BEG <REST .BEG ,K-P-WORDLEN>>
		 <COND (<ZERO? .END>
			<SET END .BEG>
			<SETG GL-P-NCN 1>
			<PUT ,GL-P-ITBL ,K-P-NC1 <BACK .BEG 4>>
			<PUT ,GL-P-ITBL ,K-P-NC1L .BEG>)>>)>)>
  <PUT ,GL-P-VTBL 0 <GET ,GL-P-OVTBL 0>>
  <PUTB ,GL-P-VTBL 2 <GETB ,GL-P-OVTBL 2>>
  <PUTB ,GL-P-VTBL 3 <GETB ,GL-P-OVTBL 3>>
  <PUT ,GL-P-OTBL ,K-P-VERBN ,GL-P-VTBL>
  <PUTB ,GL-P-VTBL 2 0>
  ;<AND <NOT <EQUAL? <GET ,GL-P-OTBL ,K-P-NC2> 0>> <SETG GL-P-NCN 2>>
  <COPYT ,GL-P-OTBL ,GL-P-ITBL <* 2 <+ ,K-P-ITBLLEN 1>>>
  <SETG GL-P-MERGED T>
  <RTRUE>>



;-----------------------------------------------------------------------------
; "RT-ADJ-CHECK    Per SWG 8/27/87"
;-----------------------------------------------------------------------------

<ROUTINE RT-ADJ-CHECK (WRD ADJ)
	<COND
		(<EQUAL? .WRD ,W?BROWN ,W?BLUE>
			<RTRUE>
		)
		(<ZERO? .ADJ>
			<RTRUE>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-CLAUSE-COPY"
;------------------------------------------------------------------------------

<ROUTINE RT-CLAUSE-COPY (SRC DEST SRCBEG SRCEND DESTBEG DESTEND
									"OPTIONAL" (INSRT <>) "AUX" BEG END)

	<SET BEG <GET .SRC .SRCBEG>>
	<SET END <GET .SRC .SRCEND>>
	<PUT .DEST .DESTBEG <REST ,GL-P-OCLAUSE
		<+ <* <GET ,GL-P-OCLAUSE ,K-P-MATCHLEN> ,K-P-LEXELEN> 2>>>

	<REPEAT ()
		<COND
			(<EQUAL? .BEG .END>
				<PUT .DEST .DESTEND <REST ,GL-P-OCLAUSE
					<+ 2 <* <GET ,GL-P-OCLAUSE ,K-P-MATCHLEN> ,K-P-LEXELEN>>>>
				<RETURN>
			)
			(T
				<COND
					(<AND	<MC-T? .INSRT>
							<EQUAL? ,GL-P-ANAM <GET .BEG 0>>
							>
								<RT-CLAUSE-ADD .INSRT>
					)
				>
				<RT-CLAUSE-ADD <GET .BEG 0>>
			)
		>
		<SET BEG <REST .BEG ,K-P-WORDLEN>>
	>
>

;------------------------------------------------------------------------------
; "RT-CLAUSE-ADD"
;------------------------------------------------------------------------------

<ROUTINE RT-CLAUSE-ADD (WRD "AUX" PTR) 
	<SET PTR <+ <GET ,GL-P-OCLAUSE ,K-P-MATCHLEN> 2>>
	<PUT ,GL-P-OCLAUSE <- .PTR 1> .WRD>
	<PUT ,GL-P-OCLAUSE .PTR 0>
	<PUT ,GL-P-OCLAUSE ,K-P-MATCHLEN .PTR>> 

<ROUTINE RT-PREP-FIND (PREP "AUX" (CNT 0) SIZE TBL) 
	; "Use INTBL? to wander down PREPOSITIONS.  Rest off the table
	   length (two bytes) and the first word, so we're looking at
	   the first prep (which is a byte value).  Then look at three-
	   byte records, and return the word just BEFORE the record that
	   matches."
	<COND (<SET TBL <INTBL? .PREP <ZREST ,PREPOSITIONS 4>
				<ZGET ,PREPOSITIONS 0>
				*003*>>
	       <ZGET <BACK .TBL 2> 0>)>
	;<SET SIZE <* <ZGET ,PREPOSITIONS 0> 2>>
	;<REPEAT ()
	  <COND (<IGRTR? CNT .SIZE>
		 <RFALSE>)
		(<EQUAL? <GET ,PREPOSITIONS .CNT> .PREP>
		 <RETURN <GET ,PREPOSITIONS <- .CNT 1>>>)>>>
 
;------------------------------------------------------------------------------
; "RT-SYNTAX-FOUND"
;------------------------------------------------------------------------------

<ROUTINE RT-SYNTAX-FOUND (SYN) 
	<SETG GL-P-SYNTAX .SYN>
	<SETG GL-PRSA <GETB .SYN ,K-P-SACTION>>>
 
;------------------------------------------------------------------------------
; "RT-BUT-MERGE"
;------------------------------------------------------------------------------

<ROUTINE RT-BUT-MERGE (TBL "AUX" LEN BUTLEN (CNT 1) (MATCHES 0) OBJ NTBL) 
	<SET LEN <GET .TBL ,K-P-MATCHLEN>>
	<PUT ,GL-P-MERGE ,K-P-MATCHLEN 0>
	<REPEAT ()
		<COND
			(<DLESS? LEN 0>
				<RETURN>
			)
		>
		<SET OBJ <GET .TBL .CNT>>
		<COND
			(<INTBL? .OBJ <REST ,GL-P-BUTS 2> <GET ,GL-P-BUTS 0>>
;				<ZMEMQ <SET OBJ <GET .TBL .CNT>> ,GL-P-BUTS>
				T
			)
			(T
				<PUT ,GL-P-MERGE <+ .MATCHES 1> .OBJ>
				<SET MATCHES <+ .MATCHES 1>>
			)
		>
		<SET CNT <+ .CNT 1>>
	>
	<PUT ,GL-P-MERGE ,K-P-MATCHLEN .MATCHES>
	<SET NTBL ,GL-P-MERGE>
	<SETG GL-P-MERGE .TBL>
	.NTBL
>

;------------------------------------------------------------------------------
; "RT-SNARF-OBJECTS"
;------------------------------------------------------------------------------

<ROUTINE RT-SNARF-OBJECTS ("AUX" PTR (NUM <P-SONUMS ,GL-P-SYNTAX>)) 
	<COND (<AND <G? .NUM 0>
		    <MC-T? <SET PTR <GET ,GL-P-ITBL ,K-P-NC1>>>>
	       <SETG GL-P-PHR 0>
	       <SETG GL-P-SLOCBITS <GETB ,GL-P-SYNTAX ,K-P-SLOC1>>
	       <OR <RT-SNARF .PTR <GET ,GL-P-ITBL ,K-P-NC1L> ,GL-P-PRSO>
		   <RFALSE>>
	       <OR <ZERO? <GET ,GL-P-BUTS ,K-P-MATCHLEN>>
		   <SETG GL-P-PRSO <RT-BUT-MERGE ,GL-P-PRSO>>>)>
	<COND (<AND <G? .NUM 1>
		    <MC-T? <SET PTR <GET ,GL-P-ITBL ,K-P-NC2>>>>
	       <SETG GL-P-PHR 1>
	       <SETG GL-P-SLOCBITS <GETB ,GL-P-SYNTAX ,K-P-SLOC2>>
	       <OR <RT-SNARF .PTR <GET ,GL-P-ITBL ,K-P-NC2L> ,GL-P-PRSI>
		   <RFALSE>>
	       <COND (<MC-T? <GET ,GL-P-BUTS ,K-P-MATCHLEN>>
		      <COND (<EQUAL? <GET ,GL-P-PRSI ,K-P-MATCHLEN> 1>
			     <SETG GL-P-PRSO <RT-BUT-MERGE ,GL-P-PRSO>>)
			    (T
			     <SETG GL-P-PRSI <RT-BUT-MERGE ,GL-P-PRSI>>)>)>)>
	<RTRUE>>

<ROUTINE RT-SNARF (PTR EPTR TBL "AUX" (BUT <>) LEN WV WRD NW (WAS-ALL? <>)
							ONEOBJ)
	 <SETG GL-P-AND <>>
	 <COND (<EQUAL? ,GL-P-GET-FLAGS ,K-P-ALL>
		<SET WAS-ALL? T>)>
	 <SETG GL-P-GET-FLAGS 0>
	 <PUT ,GL-P-BUTS ,K-P-MATCHLEN 0>
	 <PUT .TBL ,K-P-MATCHLEN 0>
	 <SET WRD <GET .PTR 0>>
	 <REPEAT ()
		 <COND (<EQUAL? .PTR .EPTR>
			<SET WV <RT-GET-OBJECT <OR .BUT .TBL>>>
			<COND (<MC-T? .WAS-ALL?>
			       <SETG GL-P-GET-FLAGS ,K-P-ALL>)>
			<RETURN .WV>)
		       (T
			<COND (<==? .EPTR <REST .PTR ,K-P-WORDLEN>>
			       <SET NW 0>)
			      (T
			       <SET NW <GET .PTR ,K-P-LEXELEN>>)>
			<COND (<EQUAL? .WRD ,W?ALL ,W?BOTH ,W?EVERYTHING>
			       <SETG GL-P-GET-FLAGS ,K-P-ALL>
			       <COND (<EQUAL? .NW ,W?OF>
				      <SET PTR <REST .PTR ,K-P-WORDLEN>>)>)
			      (<EQUAL? .WRD ,W?BUT ,W?EXCEPT>
			       <OR <RT-GET-OBJECT <OR .BUT .TBL>> <RFALSE>>
			       <SET BUT ,GL-P-BUTS>
			       <PUT .BUT ,K-P-MATCHLEN 0>)
			      ;(<RT-BUZZ-WORD-MSG? .WRD>
				<RFALSE>)
			      (<EQUAL? .WRD ,W?A ; ,W?ONE>
			       <COND (<ZERO? ,GL-P-ADJ>
				      <SETG GL-P-GET-FLAGS ,K-P-ONE>
				      <COND (<EQUAL? .NW ,W?OF>
					     <SET PTR <REST .PTR ,K-P-WORDLEN>>)>)
				     (T
				      <SETG GL-P-NAM .ONEOBJ>
				      <OR <RT-GET-OBJECT <OR .BUT .TBL>>
					  <RFALSE>>
				      <AND <ZERO? .NW> <RTRUE>>)>)
			      (<AND <EQUAL? .WRD ,W?AND ,W?COMMA>
				    <NOT <EQUAL? .NW ,W?AND ,W?COMMA>>>
			       <SETG GL-P-AND T>
			       <OR <RT-GET-OBJECT <OR .BUT .TBL>> <RFALSE>>
			       T)
			      (<WT? .WRD ,PS?BUZZ-WORD>)
			      (<EQUAL? .WRD ,W?AND ,W?COMMA>)
			      (<EQUAL? .WRD ,W?OF>
			       <COND (<ZERO? ,GL-P-GET-FLAGS>
				      <SETG GL-P-GET-FLAGS ,K-P-INHIBIT>)>)
			      (<AND <WT? .WRD ,PS?ADJECTIVE>
				    <ZERO? ,GL-P-ADJ>
				    <NOT <EQUAL? .NW ,W?OF>>>
			       <SETG GL-P-ADJ .WRD>)
			      (<WT? .WRD ,PS?OBJECT ;,P1?OBJECT>
			       <SETG GL-P-NAM .WRD>
			       <SET ONEOBJ .WRD>)>)>
		 <COND (<NOT <EQUAL? .PTR .EPTR>>
			<SET PTR <REST .PTR ,K-P-WORDLEN>>
			<SET WRD .NW>)>>>

<ROUTINE RT-GET-OBJECT (TBL "OPTIONAL" (VRB T) (NO-ROOMS? <>)
		       "AUX" BTS LEN XBITS TLEN (GCHECK <>) (OLEN 0) OBJ ADJ X)
  <SET XBITS ,GL-P-SLOCBITS>
  <SET TLEN <GET .TBL ,K-P-MATCHLEN>>
  <COND (<BTST ,GL-P-GET-FLAGS ,K-P-INHIBIT>
	 <RTRUE>)>
  <SET ADJ ,GL-P-ADJ>
  <COND (<AND <ZERO? ,GL-P-NAM>
	      <MC-T? ,GL-P-ADJ>>
	 <COND (<WT? ,GL-P-ADJ ,PS?OBJECT>
		<SETG GL-P-NAM ,GL-P-ADJ>
		<SETG GL-P-ADJ <>>)
	       (<SET BTS <WT? ,GL-P-ADJ ,PS?DIRECTION ,P1?DIRECTION>>
		<SETG GL-P-ADJ <>>
		<PUT .TBL ,K-P-MATCHLEN 1>
		<PUT .TBL 1 ,TH-INTDIR>
		<SETG GL-P-DIRECTION .BTS>
		<RTRUE>)>)>
  <COND (<AND <ZERO? ,GL-P-NAM>
	      <ZERO? ,GL-P-ADJ>
	      <NOT <EQUAL? ,GL-P-GET-FLAGS ,K-P-ALL>>
	      <ZERO? ,GL-P-GWIMBIT>>
	 <COND (<MC-T? .VRB> 
		<RT-NOT-IN-SENTENCE-MSG "enough nouns">)>
	 <RFALSE>)>
  <COND (<OR <NOT <EQUAL? ,GL-P-GET-FLAGS ,K-P-ALL>>
	     <ZERO? ,GL-P-SLOCBITS>>
	 <SETG GL-P-SLOCBITS -1>)>
  <COND (<==? .TBL ,GL-P-PRSO>
	 <SETG GL-P-OF <ZGET ,GL-P-OFW 0>>)
	(T
	 <SETG GL-P-OF <ZGET ,GL-P-OFW 1>>)>
  <SETG GL-P-TABLE .TBL>
  <PROG ()
    <COND (<MC-T? .GCHECK>
	   <RT-GLOBAL-CHECK .TBL>)
	  (T
	   <COND (<MC-T? ,GL-NOW-LIT?>
		  <MC-UNMAKE ,CH-PLAYER ,FL-TRANSPARENT>
		  <RT-DO-SL ,GL-PLACE-CUR ,SOG ,SIR>
		  <MC-MAKE ,CH-PLAYER ,FL-TRANSPARENT>)>
	   <RT-DO-SL ,CH-PLAYER ,SH ,SC>)>
    <SET LEN <- <GET .TBL ,K-P-MATCHLEN> .TLEN>>
    <COND (<BTST ,GL-P-GET-FLAGS ,K-P-ALL>)
	  (<AND	<BTST ,GL-P-GET-FLAGS ,K-P-ONE>
		<MC-T? .LEN>>
	   <COND (<NOT <EQUAL? .LEN 1>>
		  <PUT .TBL 1 <GET .TBL <RANDOM .LEN>>>
		  <TELL "[How about " THE <GET .TBL 1> "?]" CR>)>
	   <PUT .TBL ,K-P-MATCHLEN 1>)
	  (<OR <G? .LEN 1>
	       <AND <ZERO? .LEN>
		    <NOT <EQUAL? ,GL-P-SLOCBITS -1>>>>
	   <COND (<EQUAL? ,GL-P-SLOCBITS -1>
		  <SETG GL-P-SLOCBITS .XBITS>
		  <SET OLEN .LEN>
		  <PUT .TBL ,K-P-MATCHLEN <- <GET .TBL ,K-P-MATCHLEN> .LEN>>
		  <AGAIN>)
		 (T
		  <PUT ,GL-P-NAMW ,GL-P-PHR ,GL-P-NAM>
		  <PUT ,GL-P-ADJW ,GL-P-PHR ,GL-P-ADJ>
		  <COND (<ZERO? .LEN>
			 <SET LEN .OLEN>)>
		  <COND (<AND <MC-T? ,GL-P-NAM>
			      <SET OBJ <GET .TBL <+ .TLEN 1>>>
			      <SET OBJ <APPLY <GETP .OBJ ,P?GENERIC>
					      .TBL .LEN>>>
			 <COND (<EQUAL? .OBJ ,TH-NOT-HERE-OBJECT>
				<RFALSE>)>
			 <PUT .TBL 1 .OBJ>
			 <PUT .TBL ,K-P-MATCHLEN 1>
			 <SETG GL-P-NAM <>>
			 <SETG GL-P-ADJ <>>
			 <RTRUE>)
			(<AND <MC-T? .VRB>
			      <NOT <EQUAL? ,GL-WINNER ,CH-PLAYER>>>
			 <TELL ,K-DONT-UNDERSTAND-MSG CR>
			 <RFALSE>)
			(<AND <MC-T? .VRB>
			      <MC-T? ,GL-P-NAM>>
			 <RT-WHICH-PRINT .TLEN .LEN .TBL>
			 <SETG GL-P-ACLAUSE
			       <COND (<EQUAL? .TBL ,GL-P-PRSO>
				      ,K-P-NC1)
				     (T
				      ,K-P-NC2)>>
			 <SETG GL-P-AADJ ,GL-P-ADJ>
			 <SETG GL-P-ANAM ,GL-P-NAM>
			 <RT-ORPHAN <> <>>
			 <SETG GL-P-ORPH T>)
			(<MC-T? .VRB>
			 <RT-NOT-IN-SENTENCE-MSG "enough nouns">)>
		  <SETG GL-P-NAM <>>
		  <SETG GL-P-ADJ <>>
		  <RFALSE>)>)
	  (<AND	<ZERO? .LEN>
		<MC-T? .GCHECK>>
	   <PUT ,GL-P-NAMW ,GL-P-PHR ,GL-P-NAM>
	   <PUT ,GL-P-ADJW ,GL-P-PHR ,GL-P-ADJ>
	   <COND (<MC-T? .VRB>
		  <SETG GL-P-SLOCBITS .XBITS>
		  <COND (<OR <MC-T? ,GL-NOW-LIT?>
			     <RT-TALK-VERB?>>
			 <RT-OBJ-FOUND ,TH-NOT-HERE-OBJECT .TBL>
			 <SETG GL-P-XNAM ,GL-P-NAM>
			 <SETG GL-P-NAM <>>
			 <SETG GL-P-XADJ ,GL-P-ADJ>
			 <SETG GL-P-ADJ <>>
			 <RTRUE>)
			(T
			 <TELL ,K-TOO-DARK-MSG CR>)>)>
	   <SETG GL-P-NAM <>>
	   <SETG GL-P-ADJ <>>
	   <RFALSE>)
	  (<ZERO? .LEN>
	   <SET GCHECK T>
	   <AGAIN>)>
    <SET X <GET .TBL <+ .TLEN 1>>>
    <COND (<AND <MC-T? ,GL-P-ADJ>
		<ZERO? ,GL-P-NAM>
		<MC-T? .X>>
	   <TELL "[" THE .X "]" CR CR>)>
    <SETG GL-P-SLOCBITS .XBITS>
    <PUT ,GL-P-NAMW ,GL-P-PHR ,GL-P-NAM>
    <PUT ,GL-P-ADJW ,GL-P-PHR ,GL-P-ADJ>
    <SETG GL-P-NAM <>>
    <SETG GL-P-ADJ <>>
    <RTRUE>>>

;------------------------------------------------------------------------------
; "RT-MOBY-FIND"
; "This RT-MOBY-FIND works in both ZIL and ZIP"
;------------------------------------------------------------------------------

<ROUTINE RT-MOBY-FIND (TBL "AUX" (OBJ 1) LEN FOO NAM ADJ (TTBL <>)
		       (COBJ-GOOD? <>) (CT 0))
	<SET NAM ,GL-P-NAM>
	<SET ADJ ,GL-P-ADJ>
	<SETG GL-P-NAM ,GL-P-XNAM>
	<SETG GL-P-ADJ ,GL-P-XADJ>
	<PUT .TBL ,K-P-MATCHLEN 0>
	<REPEAT ()
	    <COND
	     (<RT-THIS-IT? .OBJ>
	      <COND
	       (<OR <F? <LOC .OBJ>>
		    <F? <RT-THIS-IT? <LOC .OBJ>>>>
		<SET CT <ZGET .TBL ,K-P-MATCHLEN>>
		<COND (<OR <T? <LOC .OBJ>>
			   <FSET? .OBJ ,FL-PERSON>
			   <INTBL? .OBJ <ZREST ,FIND-NO-LOCS 2>
				   <ZGET ,FIND-NO-LOCS 0>>>
		       <COND (<AND <1? .CT>
				   <F? .COBJ-GOOD?>>
			      ; "We don't like what we've already found,
				 so kill it"
			      <SET COBJ-GOOD? T>
			      <ZPUT .TBL ,K-P-MATCHLEN 0>)
			     (<0? .CT>
			      ;"First thing found, so OK"
			      <SET COBJ-GOOD? T>)>
		       <RT-OBJ-FOUND .OBJ .TBL>)
		      (<0? .CT>
		       <SET FOO <RT-OBJ-FOUND .OBJ .TBL>>)>)
	       (<AND <IN? .OBJ ,ROOMS>
		     <0? <ZGET .TBL ,K-P-MATCHLEN>>
		     <RT-MATCH-PSEUDO .OBJ>>
		<SET FOO <RT-OBJ-FOUND .OBJ .TBL>>)>)>
	    <COND (<IGRTR? OBJ ,LAST-OBJECT>
		   <RETURN>)>>
	<COND (<OR <0? <SET CT <GET .TBL ,K-P-MATCHLEN>>>
		   <F? .COBJ-GOOD?>
		   <AND <MC-HERE? ,RM-DIOGENES-CLUB>
			<SET TTBL
			     <INTBL? ,CH-HOLMES <ZREST .TBL 2>
				     <ZGET .TBL ,K-P-MATCHLEN>>>>>
	       ; "See if it's one of the things that can only be asked
		  about"
	       <COND (<SET OBJ <RT-PARSE-EVENT? ,GL-P-NAM ,GL-P-ADJ>>
		      <COND (.TTBL
			     <ZPUT .TTBL 0 .OBJ>)
			    (T
			     <COND (<AND <F? .COBJ-GOOD?>
					 <G? .CT 0>>
				    <ZPUT .TBL ,K-P-MATCHLEN <- .CT 1>>)>
			     <RT-OBJ-FOUND .OBJ .TBL>)>
		      <SET COBJ-GOOD? T>)>)>
	<COND (<EQUAL? <SET LEN <GET .TBL ,K-P-MATCHLEN>> 1>
	       <COND (<F? .COBJ-GOOD?>
		      <SETG GL-P-MOBY-FOUND ,TH-NOT-HERE-OBJECT>)
		     (T
		      <SETG GL-P-MOBY-FOUND <GET .TBL 1>>)>)>
	<SETG GL-P-NAM .NAM>
	<SETG GL-P-ADJ .ADJ>
	<RETURN .LEN>>

<ROUTINE RT-MATCH-PSEUDO (OBJ "AUX" (RMG <GETP .OBJ ,P?PSEUDOS>)
			  RMGL)
  <COND (<F? .RMG> <RFALSE>)>
  <SET RMGL <GETB .RMG 0>>
  <SET RMG <REST .RMG>>
  <REPEAT (TTBL)
    <COND (<AND <SET TTBL <GET .RMG 1>>
		<INTBL? ,GL-P-NAM <REST .TTBL 1> <GETB .TTBL 0>>
		<OR <NOT ,GL-P-ADJ>
		    <AND <SET TTBL <GET .RMG 0>>
			 <INTBL? ,GL-P-ADJ <REST .TTBL 1>
				 <GETB .TTBL 0>>>>>
	   <RETURN .RMG>)>
    <SET RMG <REST .RMG 6>>
    <COND (<L? <SET RMGL <- .RMGL 1>> 1> <RFALSE>)>>>

;------------------------------------------------------------------------------
; "RT-GLOBAL-CHECK"
;------------------------------------------------------------------------------

<ROUTINE RT-GLOBAL-CHECK (TBL "AUX" LEN RMG RMGL (CNT 0) OBJ OBITS FOO) 
  <SET LEN <GET .TBL ,K-P-MATCHLEN>>
  <SET OBITS ,GL-P-SLOCBITS>
  <COND (<RT-THIS-IT? ,GL-PLACE-CUR>
	 <RT-OBJ-FOUND ,GL-PLACE-CUR .TBL>)>
  <COND (<SET RMG <GETPT ,GL-PLACE-CUR ,P?GLOBAL>>
	 ; "These are now byte tables"
	 <SET RMGL <PTSIZE .RMG>>
	 ; "To work correctly with the IGRTR? below"
	 <SET RMGL <- .RMGL 1>>
	 <REPEAT ()
	   <SET OBJ <GETB .RMG .CNT>>
	   <COND (<AND <FIRST? .OBJ>
		       <NOT <IN? .OBJ ,ROOMS>>>
		  ; "We don't want to accidentally search some
		     non-local room here..."
		  <RT-SEARCH-LIST .OBJ .TBL ,K-P-SRCALL>)>
	   <COND (<RT-THIS-IT? .OBJ>
		  <RT-OBJ-FOUND .OBJ .TBL>)>
	   <COND (<IGRTR? CNT .RMGL>
		  <RETURN>)>>)>
  <COND (<AND <0? <GET .TBL ,K-P-MATCHLEN>>
	      <SET RMG <RT-MATCH-PSEUDO ,GL-PLACE-CUR>>>
	 <SETG LAST-PSEUDO-LOC ,GL-PLACE-CUR>
	 <PUTP ,PSEUDO-OBJECT ,P?ACTION <GET .RMG 2>>
	 <RT-OBJ-FOUND ,PSEUDO-OBJECT .TBL>)>
  <COND (<EQUAL? <GET .TBL ,K-P-MATCHLEN> .LEN>
	 <SETG GL-P-SLOCBITS -1>
	 <SETG GL-P-TABLE .TBL>
	 <RT-DO-SL ,GLOBAL-OBJECTS 1 1>
	 <SETG GL-P-SLOCBITS .OBITS>
	 <COND (<ZERO? <GET .TBL ,K-P-MATCHLEN>>
		<COND (<AND <MC-VERB? EXAMINE LOOK-ON LOOK-INSIDE FIND FOLLOW
				 EXIT SEARCH SMELL WALK-TO THROUGH WAIT-FOR
				 WAIT>
			    <NOT ,INHIBIT-ROOMS>>
		       <RT-DO-SL ,ROOMS 1 1>)>)>)>>

;------------------------------------------------------------------------------
; "RT-DO-SL"
;------------------------------------------------------------------------------

<ROUTINE RT-DO-SL (OBJ BIT1 BIT2 "AUX" BITS) 
	<COND
		(<BTST ,GL-P-SLOCBITS <+ .BIT1 .BIT2>>
			<RT-SEARCH-LIST .OBJ ,GL-P-TABLE ,K-P-SRCALL>
		)
		(T
			<COND
				(<BTST ,GL-P-SLOCBITS .BIT1>
					<RT-SEARCH-LIST .OBJ ,GL-P-TABLE ,K-P-SRCTOP>
				)
				(<BTST ,GL-P-SLOCBITS .BIT2>
					<RT-SEARCH-LIST .OBJ ,GL-P-TABLE ,K-P-SRCBOT>
				)
				(T
					<RTRUE>
				)
			>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-SEARCH-LIST"
;------------------------------------------------------------------------------

<ROUTINE RT-SEARCH-LIST (OBJ TBL LVL)
  <SET OBJ <FIRST? .OBJ>>
  <COND (<MC-T? .OBJ>
	 <REPEAT ()
	   <COND (<AND <NOT <EQUAL? .LVL ,K-P-SRCBOT>>
		       <GETPT .OBJ ,P?SYNONYM>
		       <RT-THIS-IT? .OBJ>>
		  <RT-OBJ-FOUND .OBJ .TBL>)>
	   <COND (<AND	<OR <NOT <EQUAL? .LVL ,K-P-SRCTOP>>
			    <MC-IS? .OBJ ,FL-SURFACE>
			    <MC-IS? .OBJ ,FL-PERSON>>
			<FIRST? .OBJ>
			<RT-SEE-INSIDE? .OBJ>>
		  <RT-SEARCH-LIST .OBJ .TBL
				  <COND (<OR <MC-IS? .OBJ ,FL-SURFACE>
					     <MC-IS? .OBJ ,FL-PERSON>>
					 ,K-P-SRCALL)
					(<AND <MC-IS? .OBJ ,FL-CONTAINER>
					      <OR <MC-IS? .OBJ ,FL-OPENED>
						  <MC-IS? .OBJ
							  ,FL-TRANSPARENT>>>
					 ,K-P-SRCALL)
					(T
					 ,K-P-SRCTOP)>>)>
	   <SET OBJ <NEXT? .OBJ>>
	   <COND (<ZERO? .OBJ>
		  <RETURN>)>>)>>

;------------------------------------------------------------------------------
; "RT-THIS-IT?"
;------------------------------------------------------------------------------

<ROUTINE RT-THIS-IT? (OBJ
		      "AUX" (SYNS <>) SYNSIZE (ADJS <>) ADJSIZE) 
  <COND (<AND <MC-T? ,GL-P-NAM>
	      <OR <NOT <SET SYNS <GETPT .OBJ ,P?SYNONYM>>>
		  <NOT <INTBL? ,GL-P-NAM .SYNS <SET SYNSIZE
						    </ <PTSIZE .SYNS> 2>>>>>>
	 <RFALSE>)
	(<AND <MC-T? ,GL-P-ADJ>
	      <OR <NOT <SET ADJS <GETPT .OBJ ,P?ADJECTIVE>>>
		  <NOT <INTBL? ,GL-P-ADJ .ADJS <SET ADJSIZE
						    </ <PTSIZE .ADJS> 2>>>>>>
	 <RFALSE>)>
  <COND (<AND ,INHIBIT-ROOMS
	      <IN? .OBJ ,ROOMS>>
	 <RFALSE>)
	(<MC-T? ,GL-P-OF>
	 <COND (<AND .ADJS
		     <INTBL? ,GL-P-OF .ADJS .ADJSIZE>>
		<RTRUE>)>
	 <COND (<AND .SYNS
		     <INTBL? ,GL-P-OF .SYNS .SYNSIZE>>
		<RTRUE>)>
	 <RFALSE>)>
  <COND (<AND <MC-T? ,GL-P-GWIMBIT>
	      <NOT <FSET? .OBJ ,GL-P-GWIMBIT>>>
	 <RFALSE>)>
  <RTRUE>>

;------------------------------------------------------------------------------
; "RT-OBJ-FOUND"
;------------------------------------------------------------------------------

<ROUTINE RT-OBJ-FOUND (OBJ TBL "AUX" PTR) 
	<SET PTR <+ <GET .TBL ,K-P-MATCHLEN> 1>>
	<COND
		(<G=? .PTR ,K-P-OBJ-TBL-LEN>
			<SETG GL-P-OVERFLOW T>
			<RFALSE>
		)
		(<L? .PTR ,K-P-OBJ-TBL-LEN>
		 <SETG GL-P-OVERFLOW <>>
		 <PUT .TBL .PTR .OBJ>
		 <PUT .TBL ,K-P-MATCHLEN .PTR>
		 <COND (<FSET? .OBJ ,FL-NEEDS-IDENTITY>
			<PUTP .OBJ ,P?OBJ-ADJ ,GL-P-ADJ>
			<COND (<N==? .OBJ ,TH-EVENT>
			       <PUTP .OBJ ,P?OBJ-NOUN ,GL-P-NAM>)>)>)>
	<RTRUE>>

<ROUTINE RT-ITAKE ("OPTIONAL" (VB T) "AUX" L)
	<COND (<OR <MC-F? ,GL-PRSO>
		   <MC-F? <LOC ,GL-PRSO>>>
	       <RT-CANT-SEE-ANY-MSG>
	       <RFALSE>)>
	<SET L <LOC ,GL-PRSO>>
	<RT-THIS-IS-IT ,GL-PRSO>
	<COND (<MC-ISNOT? ,GL-PRSO ,FL-TAKEABLE>
	       <COND (<MC-T? .VB>
		      <RT-IMPOSSIBLE-MSG>)>
	       <RFALSE>)
	      (<AND <MC-IS? .L ,FL-CONTAINER>
		    <MC-IS? .L ,FL-OPENABLE>
		    <MC-ISNOT? .L ,FL-OPENED>>
	       <COND (<MC-T? .VB>
		      <RT-YOUD-HAVE-TO-MSG "open" .L>)>
	       <RFALSE>)
	      (<AND <NOT <IN? .L ,GL-WINNER>>
		    <RT-OBJ-TOO-HEAVY? ,GL-PRSO ,GL-WINNER>>
	       <COND (<MC-T? .VB>
		      <TELL CTHEO>
		      <RT-IS-ARE-MSG ,GL-PRSO>
		      <TELL "too heavy." CR>)>
	       <RFALSE>)
	      (<RT-OBJ-TOO-MANY? ,GL-PRSO ,GL-WINNER>
	       <COND (<MC-T? .VB>
		      <RT-CYOU-MSG "are" "is">
		      <TELL "holding too much already." CR>)>
	       <RFALSE>)
	      (T
	       <MC-MAKE ,GL-PRSO ,FL-SEEN>
	       <MC-MAKE ,GL-PRSO ,FL-TOUCHED>
	       <FCLEAR ,GL-PRSO ,FL-WORN>
	       <MC-UNMAKE ,GL-PRSO ,FL-NODESC>
	       <MC-UNMAKE ,GL-PRSO ,FL-NOALL>
	       <MOVE ,GL-PRSO ,GL-WINNER>
	       <RETURN .L>)>>
 

<ROUTINE RT-ITAKE-CHECK (TBL BITS "OPT" (PRSO? <>) "AUX" (PTR 1) LEN OBJ L GOT
			 (TRIED-TAKE? <>) (NEED-TAKE? <>))
  <SET LEN <GET .TBL ,K-P-MATCHLEN>>
  <COND (<ZERO? .LEN>
	 <RTRUE>)
	(<NOT <0? <ANDB .BITS <+ ,SHAVE ,STAKE>>>>
	 <REPEAT ()
	   <SET OBJ <GET .TBL .PTR>>
	   <COND (<EQUAL? .OBJ ,TH-IT>
		  <COND (<NOT <RT-ACCESSIBLE? ,GL-P-IT-OBJECT>>
			 <TELL ,K-BE-MORE-SPECIFIC-MSG CR>
			 <RFALSE>)>
		  <COND (<FSET? .OBJ ,FL-NEEDS-IDENTITY>
			 ; "Restore these settings if needed"
			 <PUTP .OBJ ,P?OBJ-NOUN <GETP ,TH-IT ,P?OBJ-NOUN>>
			 <PUTP .OBJ ,P?OBJ-ADJ <GETP ,TH-IT ,P?OBJ-ADJ>>)>
		  <SET OBJ ,GL-P-IT-OBJECT>)
		 (<EQUAL? .OBJ ,CH-THEM>
		  <COND (<NOT <RT-ACCESSIBLE? ,GL-P-THEM-OBJECT>>
			 <TELL ,K-BE-MORE-SPECIFIC-MSG CR>
			 <RFALSE>)>
		  <SET OBJ ,GL-P-THEM-OBJECT>)
		 (<EQUAL? .OBJ ,CH-HER>
		  <COND (<NOT <RT-ACCESSIBLE? ,GL-P-HER-OBJECT>>
			 <TELL ,K-BE-MORE-SPECIFIC-MSG CR>
			 <RFALSE>)>
		  <SET OBJ ,GL-P-HER-OBJECT>)
		 (<EQUAL? .OBJ ,CH-HIM>
		  <COND (<NOT <RT-ACCESSIBLE? ,GL-P-HIM-OBJECT>>
			 <TELL ,K-BE-MORE-SPECIFIC-MSG CR>
			 <RFALSE>)>
		  <SET OBJ ,GL-P-HIM-OBJECT>)>
	   <COND (<AND <NOT <EQUAL? .OBJ ,TH-POCKET ,TH-HANDS ,TH-FEET>>
		       <NOT <EQUAL? .OBJ ,CH-ME ,CH-PLAYER ,CH-YOU ,ROOMS
				    ,TH-PLAYER-BODY>>
		       <NOT <EQUAL? .OBJ ,TH-INTDIR ,TH-RIGHT ,TH-LEFT>>>
		  <COND (<AND <NOT <BTST .BITS ,SC>>
			      <BTST .BITS ,SH>>
			 ; "Wants held, not carried"
			 <COND (<NOT <IN? .OBJ ,GL-WINNER>>
				<SET NEED-TAKE? T>)>)
			(<NOT <RT-HELD? .OBJ>>
			 <COND (<AND <OR <AND .PRSO? <F? <ZGET ,GL-P-NAMW 0>>>
					 <AND <F? .PRSO?>
					      <F? <ZGET ,GL-P-NAMW 1>>>>
				     <IN? .OBJ ,TH-POCKET>> T)
			       (T
				<SET NEED-TAKE? T>)>)>
		  <COND
		   (.NEED-TAKE?
		    <SET NEED-TAKE? <>>
		    <SETG GL-PRSO .OBJ>
		    <SET L <LOC .OBJ>>
		    <COND (<ZERO? .L>
			   <SET GOT <>>)
			  (<AND <MC-IS? .OBJ ,FL-TRYTAKE>
				<NOT <MC-IS? .OBJ ,FL-TAKEABLE>>>
			   <SET GOT <>>)
			  (<NOT <EQUAL? ,GL-WINNER ,CH-PLAYER>>
			   <SET GOT <>>)
			  (<AND <EQUAL? .L ,GL-WINNER>
				<BTST .BITS ,SHAVE>>
			   <SET GOT T>)
			  (<AND <RT-META-IN? .L ,GL-WINNER>
				<ZERO? ,GL-P-MULT?>
				<BTST .BITS ,STAKE>>
			   <TELL "[taking " THE .OBJ>
			   <COND (<MC-T? .L>
				  <COND (<MC-IS? .L ,FL-CONTAINER>
					 <TELL " out of ">)
					(<MC-IS? .L ,FL-SURFACE>
					 <TELL " off ">)
					(T
					 <TELL " from ">)>
				  <TELL THE .L>)>
			   <TELL " first]." CR>
			   <SET NEED-TAKE? T>
			   <SET GOT <RT-ITAKE>>)
			  (T
			   <SET GOT <>>)>
		    <COND (<AND <ZERO? .GOT>
				;<NOT <EQUAL? .L ,TH-POCKET>>
				<BTST .BITS ,SHAVE>>
			   <COND
			    (<NOT .NEED-TAKE?>
			     <COND
			      (<AND <OR <N==? .LEN .PTR>
					<F? ,GL-P-MULT?>>
				    <N==? .OBJ ,TH-NOT-HERE-OBJECT>
				    <EQUAL? <LOC .OBJ> ,GLOBAL-OBJECTS
					    ,LOCAL-GLOBALS>>
			       <TELL "Don't be silly">)
			      (T
			       <RT-WINNER-NOT-HOLDING-MSG>
			       <COND (<AND <EQUAL? .LEN .PTR>
					   <MC-T? ,GL-P-MULT?>>
				      <TELL "all of those things">)
				     (<EQUAL? .OBJ ,TH-NOT-HERE-OBJECT>
				      <SETG GL-P-IT-OBJECT .OBJ>
				      <TELL D .OBJ>)
				     (T
				      <RT-THIS-IS-IT .OBJ>
				      <COND (<MC-IS? .OBJ ,FL-PLURAL>
					     <TELL "any " D .OBJ>)
					    (T
					     <TELL A .OBJ>)>)>)>
			     <TELL "." CR>)>
			   <RFALSE>)>)>)>
	   <COND (<IGRTR? PTR .LEN>
		  <RTRUE>)>>)>
	 <RTRUE>>

<ROUTINE RT-MANY-CHECK ("AUX" (LOSS <>) TMP) 
	<COND (<AND <G? <GET ,GL-P-PRSO ,K-P-MATCHLEN> 1>
		    <NOT <BTST <GETB ,GL-P-SYNTAX ,K-P-SLOC1> ,SMANY>>>
	       <SET LOSS 1>)
	      (<AND <G? <GET ,GL-P-PRSI ,K-P-MATCHLEN> 1>
		    <NOT <BTST <GETB ,GL-P-SYNTAX ,K-P-SLOC2> ,SMANY>>>
	       <SET LOSS 2>)>
	<COND (<MC-T? .LOSS>
	       <TELL "[You cannot refer to more than one object at a time with \"">
	       <SET TMP <GET ,GL-P-ITBL ,K-P-VERBN>>
	       <COND (<ZERO? .TMP>
		      <TELL "tell">)
		     (<OR <MC-T? ,GL-P-ORPH>
			  <MC-T? ,GL-P-MERGED>>
		      <PRINTB <GET .TMP 0>>)
		     (T
		      <RT-WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>)>
	       <TELL ".\"]" CR>
	       <RFALSE>)
	      (T
	       <RTRUE>)>>

<ROUTINE RT-IS-LIT? ("OPTIONAL" (RM <>) (RMFLG T) "AUX" OHERE (LIT <>))
  <COND (<MC-F? .RM>
	 <SET RM ,GL-PLACE-CUR>)>
  <COND (<AND <MC-T? .RMFLG>
	      <MC-IS? .RM ,FL-LIGHTED>>
	 <RTRUE>)
	(<AND <MC-T? ,GL-ALW-LIT?>
	      <EQUAL? ,GL-WINNER ,CH-PLAYER>>
	 <RTRUE>)>
  <COND (<MC-ISNOT? .RM ,FL-INDOORS>
	 <COND (<MC-NOTZERO? <RT-TIME-OF-DAY>>
		<RTRUE>)>)>
  <SETG GL-P-GWIMBIT ,FL-LIGHTED>
  <SET OHERE ,GL-PLACE-CUR>
  <SETG GL-PLACE-CUR .RM>
  <PUT ,GL-P-MERGE ,K-P-MATCHLEN 0>
  <SETG GL-P-TABLE ,GL-P-MERGE>
  <SETG GL-P-SLOCBITS -1>
  <SETG GL-P-OF <>>
  <COND (<EQUAL? .OHERE .RM>
	 <RT-DO-SL ,GL-WINNER 1 1>
	 <COND (<AND <NOT <EQUAL? ,GL-WINNER ,CH-PLAYER>>
		     <IN? ,CH-PLAYER .RM>>
		<RT-DO-SL ,CH-PLAYER 1 1>)>)>
  <RT-DO-SL .RM 1 1>
  <COND (<G? <GET ,GL-P-TABLE ,K-P-MATCHLEN> 0>
	 <SET LIT T>)>
  <SETG GL-PLACE-CUR .OHERE>
  <SETG GL-P-GWIMBIT 0>
  <RETURN .LIT>>

<GLOBAL WINNER-IS-WIGGINS <>>

<ROUTINE RT-PERFORM (A "OPTIONAL" (O <>) (I <>)
		     "AUX" W-ROOM W-LOC I-LOC O-LOC V OA OO OI ONP WHO)
  <COND (<AND ,WINNER-IS-WIGGINS   ; "beg - winner is not person processing"
	      <==? ,GL-WINNER ,CH-PLAYER>
	      <NOT <MC-VERB? TELL>>>
	 <SETG GL-WINNER ,CH-WIGGINS>
	 <RT-SPOKEN-TO-MSG ,GL-WINNER>)>
  <SETG WINNER-IS-WIGGINS <>>
  <COND (<MC-ISNOT? ,GL-WINNER ,FL-ALIVE>
	 <RT-NOT-LIKELY-MSG ,GL-WINNER "would respond">
	 <RT-P-CLEAR>
	 <RFATAL>)>
  <COND (<AND <INTBL? .A <REST ,GL-SEE-VERBS 2> <GET ,GL-SEE-VERBS 0>>
	      <MC-F? ,GL-NOW-LIT?>>  ; "beg - verb is a 'see' processing"
	 <TELL ,K-TOO-DARK-MSG CR>
	 <RFATAL>)>
  <SET OA ,GL-PRSA> ;"save globals for potential recursive call of rt-perform"
  <SET OO ,GL-PRSO>
  <SET OI ,GL-PRSI>
  <SET ONP ,GL-NOW-PRSI?>
  <SET WHO <RT-ANYONE-HERE?>>  ; "set up some locals need below"
  <SET V 0>
  <COND (<NOT <EQUAL? .A ,V?WALK>>
	 <COND (<AND <EQUAL? ,GL-WINNER ,CH-PLAYER>
		     <MC-VERB? WHO WHAT WHERE>>
		<COND (<ZERO? .WHO>
		       <RT-NOBODY-TO-ASK-MSG>
		       <RFATAL>)
		      (T
		       <SETG GL-WINNER .WHO>
		       <RT-SPOKEN-TO-MSG .WHO>)>)
	       (<AND <EQUAL? ,GL-WINNER ,CH-PLAYER>
		     <MC-VERB? ASK-FOR-1 ASK-ABOUT-1>>
		<COND (<MC-F? .WHO>
		       <RT-NOBODY-TO-ASK-MSG>
		       <RFATAL>)
		      (T
		       <RT-SPOKEN-TO-MSG .WHO>
		       <SETG GL-PRSI ,GL-PRSO>
		       <SETG GL-PRSO .WHO>
		       <COND (<MC-VERB? ASK-FOR-1>
			      <SETG GL-PRSA ,V?ASK-FOR>)
			     (<MC-VERB? ASK-ABOUT-1>
			      <SETG GL-PRSA ,V?ASK-ABOUT>)>
		       <SET A ,GL-PRSA>
		       <SET O ,GL-PRSO>
		       <SET I ,GL-PRSI>)>)
	       (<AND <EQUAL? ,GL-WINNER ,CH-PLAYER>
		     <EQUAL? .O ,CH-ME ,CH-PLAYER>
		     <MC-VERB? TELL TELL-ABOUT ASK-ABOUT ASK-FOR QUESTION
			       REPLY THANK YELL HELLO GOODBYE SAY ALARM
			       PASSWORD>>
		<COND (<ZERO? .WHO>
		       <RT-TALK-TO-SELF-MSG>
		       <RFATAL>)
		      (T
		       <SETG GL-WINNER .WHO>
		       <RT-SPOKEN-TO-MSG .WHO>)>)>
	 <COND (<EQUAL? ,CH-YOU .I .O>
		<COND (<EQUAL? ,GL-WINNER ,CH-PLAYER>
		       <COND (<ZERO? .WHO>
			      <RT-TALK-TO-SELF-MSG>
			      <RFATAL>)
			     (T
			      <SETG GL-WINNER .WHO>
			      <RT-SPOKEN-TO-MSG .WHO>)>)
		      (T
		       <SETG GL-P-QCONTEXT-TH ,GL-WINNER>
		       <SETG GL-P-QCONTEXT-RM ,GL-PLACE-CUR>
		       <SET WHO ,GL-WINNER>)>
		<COND (<EQUAL? .I ,CH-YOU>
		       <SET I .WHO>)>
		<COND (<EQUAL? .O ,CH-YOU>
		       <SET O .WHO>)>)>
	 <COND (<AND <EQUAL? ,TH-IT .I .O>
		     <NOT <RT-ACCESSIBLE? ,GL-P-IT-OBJECT>>>
		<COND (<ZERO? .I>
		       <RT-FAKE-ORPHAN-MSG>)
		      (T
		       <RT-CANT-SEE-ANY-MSG ,GL-P-IT-OBJECT>)>
		<RFATAL>)>
	 <COND (<EQUAL? ,CH-THEM .I .O>
		<COND (<RT-VISIBLE? ,GL-P-THEM-OBJECT>
		       <COND (<EQUAL? ,CH-THEM .O>
			      <SET O ,GL-P-THEM-OBJECT>)>
		       <COND (<EQUAL? ,CH-THEM .I>
			      <SET I ,GL-P-THEM-OBJECT>)>)
		      (T
		       <COND (<ZERO? .I>
			      <RT-FAKE-ORPHAN-MSG>)
			     (T
			      <RT-CANT-SEE-ANY-MSG ,GL-P-THEM-OBJECT>)>
		       <RFATAL>)>)>
	 <COND (<EQUAL? ,CH-HER .I .O>
		<COND (<RT-VISIBLE? ,GL-P-HER-OBJECT>
		       <COND (<AND <EQUAL? ,GL-P-HER-OBJECT ,GL-WINNER>
				   <RT-NO-OTHER? T>>
			      <RFATAL>)>
		       <COND (<EQUAL? ,CH-HER .O>
			      <SET O ,GL-P-HER-OBJECT>)>
		       <COND (<EQUAL? ,CH-HER .I>
			      <SET I ,GL-P-HER-OBJECT>)>)
		      (T
		       <COND (<ZERO? .I>
			      <RT-FAKE-ORPHAN-MSG>)
			     (T 
			      <RT-CANT-SEE-ANY-MSG ,GL-P-HER-OBJECT>)>
		       <RFATAL>)>)>
	 <COND (<EQUAL? ,CH-HIM .I .O>
		<COND (<RT-VISIBLE? ,GL-P-HIM-OBJECT>
		       <COND (<AND <EQUAL? ,GL-P-HIM-OBJECT ,GL-WINNER>
				   <RT-NO-OTHER?>>
			      <RFATAL>)>
		       <COND (<EQUAL? ,CH-HIM .O>
			      <SET O ,GL-P-HIM-OBJECT>)>
		       <COND (<EQUAL? ,CH-HIM .I>
			      <SET I ,GL-P-HIM-OBJECT>)>)
		      (T
		       <COND (<ZERO? .I>
			      <RT-FAKE-ORPHAN-MSG>)
			     (T 
			      <RT-CANT-SEE-ANY-MSG ,GL-P-HIM-OBJECT>)>
		       <RFATAL>)>)>
	 <COND (<EQUAL? .O ,TH-IT>
		<SET O ,GL-P-IT-OBJECT>)>
	 <COND (<EQUAL? .I ,TH-IT>
		<SET I ,GL-P-IT-OBJECT>)>)>
  ; "FCW - temp fix for TAKE OBJECT syntax to supply implied FROM object"
  <COND (<AND <EQUAL? .A ,V?TAKE>
	      <MC-T? .O>
	      <MC-F? .I>
	      <MC-T? <LOC .O>>>
	 <SET I <LOC .O>>)>
  <SETG GL-PRSA .A>
  <SETG GL-PRSI .I>
  <SETG GL-PRSO .O>
  <COND (<AND <NOT <EQUAL? .A ,V?WALK>>
	      <EQUAL? ,TH-NOT-HERE-OBJECT .O .I>>
	 <COND (<SET V <APPLY ,RT-TH-NOT-HERE-OBJECT>>
		<SETG GL-P-GOOD <>>)>)>
  <RT-THIS-IS-IT ,GL-PRSI>
  <RT-THIS-IS-IT ,GL-PRSO>
  <SET I ,GL-PRSI>
  <SET O ,GL-PRSO>
  <COND (<EQUAL? .O ,ROOMS>
	 <SET O <>>)>
  <SET W-LOC <LOC ,GL-WINNER>>
  <COND (<OR <MC-IS? .W-LOC ,FL-VEHICLE>
	     <MC-IS? .W-LOC ,FL-CONTAINER>
	     <MC-IS? .W-LOC ,FL-SURFACE>>
	 <SET W-ROOM <LOC .W-LOC>>)
	(T
	 <SET W-ROOM .W-LOC>)>
  <COND (<ZERO? .V>
	 <SET V <APPLY <GETP ,GL-WINNER ,P?ACTION> ,K-M-WINNER>>)>
  <COND (<ZERO? .V>
	 <SET V <APPLY <GETP .W-ROOM ,P?ACTION> ,K-M-BEG>>)>
  <COND (<ZERO? .V>
	 <SET V <APPLY <GET ,PREACTIONS .A>>>)>
  <COND (<AND <ZERO? .V>
	      <EQUAL? ,GL-WINNER ,CH-PLAYER>
	      <OR <MC-IS? .W-LOC ,FL-VEHICLE>
		  <MC-IS? .W-LOC ,FL-CONTAINER>
		  <MC-IS? .W-LOC ,FL-SURFACE>>>
	 <SET V <APPLY <GETP .W-LOC ,P?CONTFCN> ,K-M-CANT>>)>
  <COND (<AND <ZERO? .V>
	      <NOT <EQUAL? .A ,V?WALK>>
	      <NOT <EQUAL? .A ,V?TELL-ABOUT ,V?ASK-ABOUT ,V?ASK-FOR>>>
	 <COND (<AND <MC-T? .I>
		     <SET I-LOC <LOC .I>>
		     <OR <MC-IS? .I-LOC ,FL-VEHICLE>
			 <MC-IS? .I-LOC ,FL-CONTAINER>
			 <MC-IS? .I-LOC ,FL-SURFACE>
			 <MC-IS? .I-LOC ,FL-ALIVE>>>
		<SETG GL-NOW-PRSI? T>
		<SET V <APPLY <GETP .I-LOC ,P?CONTFCN> ,K-M-CONT>>)>
	 <COND (<AND <MC-T? .O>
		     <SET O-LOC <LOC .O>>
		     <OR <MC-IS? .O-LOC ,FL-VEHICLE>
			 <MC-IS? .O-LOC ,FL-CONTAINER>
			 <MC-IS? .O-LOC ,FL-SURFACE>
			 <MC-IS? .O-LOC ,FL-ALIVE>>>
		<SETG GL-NOW-PRSI? <>>
		<SET V <APPLY <GETP .O-LOC ,P?CONTFCN> ,K-M-CONT>>)>
	 <COND (<MC-T? .I>
		<SETG GL-NOW-PRSI? T>
		<SET V <APPLY <GETP .I ,P?ACTION>>>)>)>
  ; "if v is 0 & verb is not walk & there is an o-object call o-object action routine"
  <COND (<AND <ZERO? .V>
	      <MC-T? .O>
	      <NOT <EQUAL? .A ,V?WALK>>>
	 <SETG GL-NOW-PRSI? <>>
	 <SET V <APPLY <GETP .O ,P?ACTION>>>)>
  ; "if v is 0 call verb routine"
  <COND (<ZERO? .V>
	 <SET V <APPLY <GET ,ACTIONS .A>>>)>
  ; "if v is 0 call the location action routine with the end context"
  <COND (<ZERO? .V>
	 <SET V <APPLY <GETP .W-LOC ,P?ACTION> ,K-M-END>>)>
  ; "restore globals from locals saved for potential recursive call"
  <COND (<AND ,GL-PRSI
	      <FSET? ,GL-PRSI ,FL-LOSE-IDENTITY>>
	 <PUTP ,GL-PRSI ,P?OBJ-NOUN <>>
	 <PUTP ,GL-PRSI ,P?OBJ-ADJ <>>)>
  <COND (<AND ,GL-PRSO
	      <FSET? ,GL-PRSO ,FL-LOSE-IDENTITY>>
	 <PUTP ,GL-PRSO ,P?OBJ-NOUN <>>
	 <PUTP ,GL-PRSO ,P?OBJ-ADJ <>>)>
  <SETG GL-PRSA .OA>
  <SETG GL-PRSO .OO>
  <SETG GL-PRSI .OI>
  <SETG GL-NOW-PRSI? .ONP>
  ; "return value of first routine above which returned other than zero"
  <RETURN .V>>

<ROUTINE RT-SET-GL-PLACE-CUR ()
	<COND
		(<MC-IS? <LOC ,GL-WINNER> ,FL-VEHICLE>
			<SETG GL-PLACE-CUR <LOC <LOC ,GL-WINNER>>>
		)
		(T
			<SETG GL-PLACE-CUR <LOC ,GL-WINNER>>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-PARSER"
; "Grovel down the input finding the verb, prepositions, and noun clauses."
; "If the input is <direction> or <walk> <direction>, fall out immediately"
; "setting PRSA to ,V?WALK and PRSO to <direction>.  Otherwise, perform"
; "all required orphaning, syntax checking, and noun clause lookup."
;------------------------------------------------------------------------------

<ROUTINE RT-PARSER ("AUX" (PTR ,K-P-LEXSTART) WRD (VAL 0) (VERB <>)
		    (OF-FLAG <>) (LEN 0) (DIR <>) (NW 0) (LW 0) (CNT 0)
		    OWINNER OMERGED (TMP1 0))
  <SETG GL-FUNNY-CLAUSE? <>>
  <COND (<F? ,GL-P-ORPH>
	 <COPYT ,GL-P-ITBL ,GL-P-OTBL <* 2 <+ ,K-P-ITBLLEN 1>>>)>
  <COPYT ,GL-P-ITBL 0 <* 2 <+ ,K-P-ITBLLEN 1>>>
  <SETG GL-P-NAM			<>>
  <SETG GL-P-ADJ			<>>
  <SETG GL-P-XNAM		<>>
  <SETG GL-P-XADJ		<>>
  <SETG GL-P-DIR-WORD	<>>
  <COND (<MC-F? ,GL-P-ORPH>
	 <PUT ,GL-P-NAMW 0 <>>
	 <PUT ,GL-P-NAMW 1 <>>
	 <PUT ,GL-P-ADJW 0 <>>
	 <PUT ,GL-P-ADJW 1 <>>
	 <PUT ,GL-P-OFW  0 <>>
	 <PUT ,GL-P-OFW  1 <>>)>
  <SET OMERGED ,GL-P-MERGED>
  <SET OWINNER ,GL-WINNER>
  <SETG GL-P-MERGED			<>>
  <SETG GL-P-END-ON-PREP	<>>
  <PUT ,GL-P-PRSO ,K-P-MATCHLEN 0>
  <PUT ,GL-P-PRSI ,K-P-MATCHLEN 0>
  <PUT ,GL-P-BUTS ,K-P-MATCHLEN 0>
  <COND (<AND <ZERO? ,GL-P-QUOT>
	      <NOT <EQUAL? ,GL-WINNER ,CH-PLAYER>>>
	 <SETG GL-WINNER ,CH-PLAYER>
	 <RT-SET-GL-PLACE-CUR>
	 <SETG GL-NOW-LIT? <RT-IS-LIT?>>)>
  <COND (<MC-T? ,GL-RESERVE-PTR>
	 <SET PTR ,GL-RESERVE-PTR>
	 <RT-STUFF ,GL-P-P-LEX ,GL-P-T-LEX>
	 <COPYT ,GL-P-RIBUF ,GL-P-PIBUF ,K-P-INBUF-SIZE>
	 <COND (<AND <MC-T? ,GL-DESC-LEVEL>
		     <EQUAL? ,CH-PLAYER ,GL-WINNER>>
		<CRLF>)>
	 <SETG GL-RESERVE-PTR <>>
	 <SETG GL-P-CONT <>>)
	(<MC-T? ,GL-P-CONT>
	 <SET PTR ,GL-P-CONT>
	 <SETG GL-P-CONT <>>
	 <COND (<AND <MC-T? ,GL-DESC-LEVEL>
		     <EQUAL? ,CH-PLAYER ,GL-WINNER>>
		<CRLF>)>)
	(T
	 <SETG GL-WINNER ,CH-PLAYER>
	 <SETG GL-P-QUOT <>>
	 <RT-SET-GL-PLACE-CUR>
	 <SETG GL-NOW-LIT? <RT-IS-LIT?>>
	 <COND (<BTST <LOWCORE FLAGS> 4>
		<LOWCORE FLAGS <BAND <LOWCORE FLAGS> -5>>
		<RT-INIT-SCREEN>)>
	 <RT-UPDATE-STATUS-LINE>
	 <COND (,GL-WHERE-TO-PROMPT?
		<TELL CR "\"Where to, guv'nor?\"" CR>)>
	 <COND (,GL-WHERE-TO-ORPH?
		<SETG GL-WINNER ,CH-PLAYER>
		<RT-ORPHAN-VERB ,W?DRIVE ,ACT?DRIVE>)>
	 <TELL CR ">">
	 <PUTB ,GL-P-P-LEX 0 59>
	 <PUTB ,GL-P-PIBUF 1 0>
	 <READ ,GL-P-PIBUF ,GL-P-P-LEX>)>
  <SETG GL-P-LEN <GETB ,GL-P-P-LEX ,K-P-LEXWORDS>>
  <COND (<EQUAL? <GET ,GL-P-P-LEX .PTR>
		 ,W?QUOTE
		 ,W?PERIOD
		 ,W?THEN
		 ,W?PLEASE
		 ,W?SO>
	 <SET PTR <+ .PTR ,K-P-LEXELEN>>
	 <SETG GL-P-LEN <- ,GL-P-LEN 1>>)>
  <SET TMP1 <GET ,GL-P-P-LEX .PTR>>
  ; "if first word is GO followed by a verb, ignore it"
  <COND (<AND <L? 1 ,GL-P-LEN>
	      <EQUAL? <GET ,GL-P-P-LEX .PTR> ,W?GO>
	      <SET NW <GET ,GL-P-P-LEX <+ .PTR ,K-P-LEXELEN>>>
	      <WT? .NW ,PS?VERB ;,P1?VERB>>
	 <SET PTR <+ .PTR ,K-P-LEXELEN>>
	 <SETG GL-P-LEN <- ,GL-P-LEN 1>>)>
  <COND (<ZERO? ,GL-P-LEN>
	 <TELL "[What?]" CR>
	 <RFALSE>)>
  <COND (<EQUAL? <GET ,GL-P-P-LEX .PTR> ,W?UNDO>
	 <V-UNDO>
	 <RFALSE>)
	(T
	 <SETG GL-CAN-UNDO <ISAVE>>
	 <COND (<EQUAL? ,GL-CAN-UNDO 2>
		<V-REFRESH>
		<IFSOUND <SETG SOUND-QUEUED? <>>
			 <COND (,SOUND-ON?
				<CHECK-LOOPING>)>>
		<TELL "[UNDO completed.]" CR>
		<AGAIN>)>)>
  <COND (<EQUAL? <GET ,GL-P-P-LEX .PTR> ,W?OOPS W?O>
	 <COND (<EQUAL? <GET ,GL-P-P-LEX <+ .PTR ,K-P-LEXELEN>>
			,W?PERIOD ,W?COMMA>
		<SET PTR <+ .PTR ,K-P-LEXELEN>>
		<SETG GL-P-LEN <- ,GL-P-LEN 1>>)>
	 <COND (<NOT <G? ,GL-P-LEN 1>>
		<TELL "[You cannot use OOPS that way.]" CR>
		<RFALSE>)
	       (<GET ,GL-OOPS-TABLE ,K-O-PTR>
		<COND
		 (<G? ,GL-P-LEN 2>
		  <TELL "[Only the first word after OOPS is used.]" CR>)>
		<PUT ,GL-P-S-LEX <GET ,GL-OOPS-TABLE ,K-O-PTR>
		     <GET ,GL-P-P-LEX <+ .PTR ,K-P-LEXELEN>>>
		<SETG GL-WINNER .OWINNER>
		<RT-INBUF-ADD <GETB ,GL-P-P-LEX <+ <* .PTR ,K-P-LEXELEN> 6>>
			      <GETB ,GL-P-P-LEX <+ <* .PTR ,K-P-LEXELEN> 7>>
			      <+ <* <GET ,GL-OOPS-TABLE ,K-O-PTR> ,K-P-LEXELEN> 3>>
		<RT-STUFF ,GL-P-P-LEX ,GL-P-S-LEX>
		<SETG GL-P-LEN <GETB ,GL-P-P-LEX ,K-P-LEXWORDS>>
		<SET PTR <GET ,GL-OOPS-TABLE ,K-O-START>>
		<COPYT ,GL-OOPS-INBUF ,GL-P-PIBUF ,K-P-INBUF-SIZE>)
	       (T
		<PUT ,GL-OOPS-TABLE ,K-O-END <>>
		<TELL "[There was no word to replace in that sentence.]" CR>
		<RFALSE>)>)
	(T
	 <PUT ,GL-OOPS-TABLE ,K-O-END <>>)>
  <COND (<EQUAL? <GET ,GL-P-P-LEX .PTR> ,W?AGAIN ,W?G>
	 <COND (<OR  <MC-T? ,GL-P-ORPH>
		     <ZERO? ,GL-P-GOOD>
		     <ZERO? <GETB ,GL-OOPS-INBUF 1>>>
		<TELL "[You cannot use AGAIN that way.]" CR>
		<RFALSE>)
	       (<G? ,GL-P-LEN 1>
		<COND (<OR <EQUAL? <GET ,GL-P-P-LEX <+ .PTR ,K-P-LEXELEN>>
				   ,W?PERIOD ,W?COMMA ,W?THEN>
			   <EQUAL? <GET ,GL-P-P-LEX <+ .PTR ,K-P-LEXELEN>>
				   ,W?AND>>
		       <SET PTR <+ .PTR <* 2 ,K-P-LEXELEN>>>
		       <PUTB ,GL-P-P-LEX ,K-P-LEXWORDS
			     <- <GETB ,GL-P-P-LEX ,K-P-LEXWORDS> 2>>)
		      (T
		       <TELL ,K-DONT-UNDERSTAND-MSG CR>
		       <RFALSE>)>)
	       (T
		<SET PTR <+ .PTR ,K-P-LEXELEN>>
		<PUTB ,GL-P-P-LEX ,K-P-LEXWORDS 
		      <- <GETB ,GL-P-P-LEX ,K-P-LEXWORDS> 1>>)>
	 <COND (<G? <GETB ,GL-P-P-LEX ,K-P-LEXWORDS> 0>
		<RT-STUFF ,GL-P-T-LEX ,GL-P-P-LEX>
		<COPYT ,GL-P-PIBUF ,GL-P-RIBUF ,K-P-INBUF-SIZE>
		<SETG GL-RESERVE-PTR .PTR>)
	       (T
		<SETG GL-RESERVE-PTR <>>)>
	 ; "Following cond per discussion with SWG."
	 <COND (<RT-VISIBLE? .OWINNER>
		<SETG GL-WINNER .OWINNER>)
	       (T
		<TELL CTHE .OWINNER>
		<RT-ISNT-ARENT-MSG .OWINNER>
		<TELL "here anymore." CR>
		<RFALSE>)>
	 <SETG GL-P-MERGED .OMERGED>
	 <COPYT ,GL-OOPS-INBUF ,GL-P-PIBUF ,K-P-INBUF-SIZE>
	 <RT-STUFF ,GL-P-P-LEX ,GL-P-S-LEX>
	 <SET CNT -1>
	 <SET DIR ,GL-AGAIN-DIR>
	 <COPYT ,GL-P-OTBL ,GL-P-ITBL <* 2 <+ 1 ,K-P-ITBLLEN>>>)
	(T
	 ; "This COND created around the SETG per SWG to prevent the number
	    value from disappearing when the parser orphans something.
	    I.e. Which # do you mean?"
	 <COND (<NOT ,GL-P-ORPH>
		<SETG GL-P-NUMBER -1>)>
	 <RT-STUFF ,GL-P-S-LEX ,GL-P-P-LEX>
	 <COPYT ,GL-P-PIBUF ,GL-OOPS-INBUF ,K-P-INBUF-SIZE>
	 <PUT ,GL-OOPS-TABLE ,K-O-START .PTR>
	 <PUT ,GL-OOPS-TABLE ,K-O-LENGTH <* 4 ,GL-P-LEN>>
	 <SET LEN <* 2 <+ .PTR <* ,K-P-LEXELEN
				  <GETB ,GL-P-P-LEX ,K-P-LEXWORDS>>>>>
	 <PUT ,GL-OOPS-TABLE ,K-O-END <+ <GETB ,GL-P-P-LEX <- .LEN 1>>
					 <GETB ,GL-P-P-LEX <- .LEN 2>>>>
	 <SETG GL-RESERVE-PTR <>>
	 <SET LEN ,GL-P-LEN>
	 <SETG GL-P-DIR <>>
	 <SETG GL-P-NCN 0>
	 <SETG GL-P-GET-FLAGS 0>
	 <PUT ,GL-P-ITBL ,K-P-VERBN 0>
	 <REPEAT ()
	    <COND (<L? <SETG GL-P-LEN <- ,GL-P-LEN 1>> 0>
		   <SETG GL-P-QUOT <>>
		   <RETURN>)
		  (<OR <MC-T? <SET WRD <GET ,GL-P-P-LEX .PTR>>>
		       <SET WRD <RT-NUMBER? .PTR>>>
		   <COND (<0? ,GL-P-LEN>
			  <SET NW 0>)
			 (T
			  <SET NW <GET ,GL-P-P-LEX <+ .PTR ,K-P-LEXELEN>>>)>
		   <COND (<AND <EQUAL? .WRD ,W?TO>
			       <EQUAL? .VERB ,ACT?TELL ,ACT?ASK>>
			  <PUT ,GL-P-ITBL ,K-P-VERB ,ACT?TELL>
			  <SET WRD ,W?QUOTE>)
			 (<AND <EQUAL? .WRD ,W?THEN ; ,W?PERIOD>
			       <G? ,GL-P-LEN 0>
			       <ZERO? .VERB>
			       <ZERO? ,GL-P-QUOT>>
			  <PUT ,GL-P-ITBL ,K-P-VERB ,ACT?TELL>
			  <PUT ,GL-P-ITBL ,K-P-VERBN 0>
			  <SET WRD ,W?QUOTE>
			  <SETG GL-P-ORPH <>> ; "PER SWG 8/28/87")
			 (<AND <EQUAL? .WRD ,W?PERIOD>
			       <OR <EQUAL? .LW ,W?MR ,W?MRS ,W?MISS>
				   <EQUAL? .LW ,W?DR>>>
			  <SETG GL-P-NCN <- ,GL-P-NCN 1>>
			  <RT-CHANGE-LEXV .PTR .LW T>
			  <SET WRD .LW>
			  <SET LW 0>)>
		   <COND (<EQUAL? .WRD ,W?THEN ,W?PERIOD ,W?QUOTE>
			  <COND (<EQUAL? .WRD ,W?QUOTE>
				 <COND
				  (<MC-T? ,GL-P-QUOT>
				   <SETG GL-P-QUOT <>>)
				  (T
				   <SETG GL-P-QUOT T>)>)>
			  <OR <ZERO? ,GL-P-LEN>
			      <SETG GL-P-CONT <+ .PTR ,K-P-LEXELEN>>>
			  <PUTB ,GL-P-P-LEX ,K-P-LEXWORDS ,GL-P-LEN>
			  <RETURN>)
			 (<AND <SET VAL
				    <WT? .WRD ,PS?DIRECTION ,P1?DIRECTION>>
			       <EQUAL? .VERB <> ,ACT?WALK ,ACT?GO>
			       <OR <EQUAL? .LEN 1>
				   <AND  <EQUAL? .LEN 2>
					 <EQUAL? .VERB ,ACT?WALK ,ACT?GO>>
				   <AND  <EQUAL? .NW ,W?THEN ,W?PERIOD ,W?QUOTE>
					 <G? .LEN 1 ;2>>
				   <AND  <MC-T? ,GL-P-QUOT>
					 <EQUAL? .LEN 2>
					 <EQUAL? .NW ,W?QUOTE>>
				   <AND  <G? .LEN 2>
					 <EQUAL? .NW ,W?COMMA ,W?AND>>>>
			  <SET DIR .VAL>
			  <SETG GL-P-DIR-WORD .WRD>
			  <COND (<EQUAL? .NW ,W?COMMA ,W?AND>
				 <RT-CHANGE-LEXV <+ .PTR ,K-P-LEXELEN>
						 ,W?THEN>)>
			  <COND (<NOT <G? .LEN 2>>
				 <SETG GL-P-QUOT <>>
				 <RETURN>)>)
			 (<AND <SET VAL <WT? .WRD ,PS?VERB ,P1?VERB>>
			       <ZERO? .VERB>>
			  <SETG GL-P-PRSA-WORD .WRD>
			  <SET VERB .VAL>
			  <PUT ,GL-P-ITBL ,K-P-VERB .VAL>
			  <PUT ,GL-P-ITBL ,K-P-VERBN ,GL-P-VTBL>
			  <PUT ,GL-P-VTBL 0 .WRD>
			  <PUTB ,GL-P-VTBL 2 <GETB ,GL-P-P-LEX
						   <SET TMP1 <+ <* .PTR 2> 2>>>>
			  <PUTB ,GL-P-VTBL 3 <GETB ,GL-P-P-LEX
						   <+ .TMP1 1>>>)
			 (<OR	<SET VAL <WT? .WRD ,PS?PREPOSITION 0>>
				<EQUAL? .WRD ,W?A ,W?EVERYTHING>
				<EQUAL? .WRD ,W?BOTH ,W?ALL>
				<WT? .WRD ,PS?ADJECTIVE <> ,PS?OBJECT>>
			  <COND
			   (<AND <G? ,GL-P-LEN 1>
				 <EQUAL? .NW ,W?OF>
				 <NOT <EQUAL? .VERB ,ACT?TAKE>>
				 <ZERO? .VAL>
				 <NOT <EQUAL? .WRD ,W?A>>
				 <NOT <EQUAL? .WRD ,W?ALL ,W?BOTH
					      ,W?EVERYTHING>>>
			    <PUT ,GL-P-OFW ,GL-P-NCN .WRD>
			    <SET OF-FLAG T>)
			   (<AND <MC-T? .VAL>
				 <OR <ZERO? ,GL-P-LEN>
				     <EQUAL? .NW ,W?THEN ,W?PERIOD>>>
			    <SETG GL-P-END-ON-PREP T>
			    <COND
			     (<L? ,GL-P-NCN 2>
			      <PUT ,GL-P-ITBL ,K-P-PREP1 .VAL>
			      <PUT ,GL-P-ITBL ,K-P-PREP1N .WRD>)>)
			   (<EQUAL? ,GL-P-NCN 2>
			    <TELL
			     "[There are too many nouns in that sentence.]" CR>
			    <RFALSE>)
			   (T
			    <SETG GL-P-NCN <+ ,GL-P-NCN 1>>
			    <OR <SET PTR <RT-CLAUSE .PTR .VAL .WRD>>
				<RFALSE>>
			    <COND
			     (<L? .PTR 0>
			      <SETG GL-P-QUOT <>>
			      <RETURN>)>)>)
			 (<EQUAL? .WRD ,W?OF>
			  <COND
			   (<OR  <ZERO? .OF-FLAG>
				 <EQUAL? .NW ,W?PERIOD ,W?THEN>>
			    <RT-DONT-KNOW-WORD-USE-MSG .PTR>
			    <RFALSE>)
			   (T
			    <SET OF-FLAG <>>)>)
			 (<OR <WT? .WRD ,PS?BUZZ-WORD>
			      <==? .WRD ,W?MARX>>)
			 (<AND <EQUAL? .VERB ,ACT?TELL>
			       <WT? .WRD ,PS?VERB ;,P1?VERB>>
			  <RT-WAY-TO-TALK-MSG>
			  <RFALSE>)
			 (T
			  <RT-DONT-KNOW-WORD-USE-MSG .PTR>
			  <RFALSE>)>)
		  (T
		   <RT-DONT-KNOW-WORD-MSG .PTR>
		   <RFALSE>)>
	    <SET LW .WRD>
	    <SET PTR <+ .PTR ,K-P-LEXELEN>>>)>
  <PUT ,GL-OOPS-TABLE ,K-O-PTR <>>
  <COND
   (<MC-T? .DIR>
    <SETG GL-PRSA ,V?WALK>
    <SETG GL-P-WALK-DIR .DIR>
    <SETG GL-AGAIN-DIR .DIR>
    <SETG GL-PRSO .DIR>
    <SETG GL-P-ORPH <>>
    <RTRUE>)>
  <SETG GL-P-WALK-DIR <>>
  <SETG GL-AGAIN-DIR <>>
  <COND (<AND <MC-T? ,GL-P-ORPH>
	      <RT-ORPHAN-MERGE>
	      <F? ,GL-WHERE-TO-ORPH?>>
	 <SETG GL-WINNER .OWINNER>)>
  <COND (<AND <RT-SYNTAX-CHECK>
	      <RT-SNARF-OBJECTS>
	      <RT-MANY-CHECK>>
	 <SET TMP1 <P-SONUMS ,GL-P-SYNTAX>>
	 <COND (<G? .TMP1 0>
		<COND (<RT-ITAKE-CHECK ,GL-P-PRSO
				       <GETB ,GL-P-SYNTAX ,K-P-SLOC1>
				       T>
		       <COND (<G? .TMP1 1>
			      <RT-ITAKE-CHECK ,GL-P-PRSI
					      <GETB ,GL-P-SYNTAX ,K-P-SLOC2>>)
			     (T
			      <RTRUE>)>)>)
	       (T <RTRUE>)>)>>

;------------------------------------------------------------------------------
; "RT-WHICH-PRINT"
;------------------------------------------------------------------------------

<ROUTINE RT-WHICH-PRINT (TLEN LEN TBL "AUX" OBJ RLEN)
	<SET RLEN .LEN>
	<TELL "Which">
	<COND
		(<OR	<MC-T? ,GL-P-ORPH>
				<MC-T? ,GL-P-MERGED>
				<MC-T? ,GL-P-AND>
				>
					<TELL " ">
					<PRINTB ,GL-P-NAM>
		)
		(<EQUAL? .TBL ,GL-P-PRSO>
			<RT-CLAUSE-PRINT ,K-P-NC1 ,K-P-NC1L <>>
		)
		(T
			<RT-CLAUSE-PRINT ,K-P-NC2 ,K-P-NC2L <>>
		)
	>
	<TELL " do you mean,">
	<REPEAT ()
		<SET TLEN <+ .TLEN 1>>
		<SET OBJ <GET .TBL .TLEN>>
		<TELL " " THE .OBJ>
		<COND
			(<EQUAL? .LEN 2>
				<COND
					(<NOT <EQUAL? .RLEN 2>>
						<TELL ",">
					)
				>
				<TELL " or">
			)
			(<G? .LEN 2>
				<TELL ",">
			)
		>
		<COND
			(<L? <SET LEN <- .LEN 1>> 1>
				<TELL "?" CR>
				<RETURN>
			)
		>
	>
>

;------------------------------------------------------------------------------
; "RT-FIND-NOT-HERE"
;------------------------------------------------------------------------------

<ROUTINE RT-FIND-NOT-HERE (TBL PRSO? "AUX" M-F OBJ)
	<SET M-F <RT-MOBY-FIND .TBL>>
	<COND
		(<ZERO? .M-F>
			<TELL "[There is no">
			<RT-NOT-HERE-PRINT .PRSO?>
			<TELL " in this story.]" CR>
			<RTRUE>
		)
		(<EQUAL? .M-F 1>
			<COND
				(<MC-T? .PRSO?>
					<SETG GL-PRSO ,GL-P-MOBY-FOUND>
				)
				(T
					<SETG GL-PRSI ,GL-P-MOBY-FOUND>
				)
			>
			<RFALSE>
		)
		(<AND	<G? .M-F 1>
				<SET OBJ <APPLY <GETP <SET OBJ <GET .TBL 1>> ,P?GENERIC> .TBL>>
				>
					<COND
						(<EQUAL? .OBJ ,TH-NOT-HERE-OBJECT>
							<RTRUE>
						)
						(<MC-T? .PRSO?>
							<SETG GL-PRSO .OBJ>
						)
						(T
							<SETG GL-PRSI .OBJ>
						)
					>
					<RFALSE>
		)
		(<MC-VERB? ASK-ABOUT TELL-ABOUT ASK-FOR SAY DRIVE CALL MAKE WHO WHAT WHERE FIND FOLLOW TELL PASSWORD>
			<RFALSE>
		)
		(<ZERO? .PRSO?>
			<RT-CYOU-MSG>
			<TELL "would not find any">
			<RT-NOT-HERE-PRINT .PRSO?>
			<TELL " there." CR>
			<RTRUE>
		)
		(T
			,TH-NOT-HERE-OBJECT
		)
	>
>

;------------------------------------------------------------------------------
; "RT-NOT-HERE-PRINT"
;------------------------------------------------------------------------------

<ROUTINE RT-NOT-HERE-PRINT ("OPTIONAL" (PRSO? <>))
  <COND (<OR <MC-T? ,GL-P-ORPH>
	     <MC-T? ,GL-P-MERGED>>
	 <COND (<MC-T? ,GL-P-XADJ>
		<PRINTC 32>
		<PRINTB ,GL-P-XADJ>)>
	 <COND (<MC-T? ,GL-P-XNAM>
		<PRINTC 32>
		<PRINTB ,GL-P-XNAM>)>)
	(<MC-T? .PRSO?>
	 <RT-BUFFER-PRINT <GET ,GL-P-ITBL ,K-P-NC1>
			  <GET ,GL-P-ITBL ,K-P-NC1L> <>>)
	(T
	 <RT-BUFFER-PRINT <GET ,GL-P-ITBL ,K-P-NC2>
			  <GET ,GL-P-ITBL ,K-P-NC2L> <>>)>>


