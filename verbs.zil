;*****************************************************************************
; "game : SHERLOCK!"
; "file : VERBS1.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   28 Oct 1987 16:55:00  $"
; "rev  : $Revision:   1.111  $"
; "vers : 1.00"
;*****************************************************************************

<DEFAULTS-DEFINED SOUND-CODE>

<DEFAULT-DEFINITION SOUND-CODE T>

<ROUTINE PRE-CALL ()
	 <DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-CALL">>
	 <COND (<MC-PRSI? ,TH-CAB-WHISTLE>
		<RFALSE>)
	       (<MC-PRSO? ,ROOMS>
		<COND (<EQUAL? ,GL-P-PRSA-WORD ,W?HAIL>
		       <TELL "Greetings, O strange one." CR>)
		      (T
		       <TELL "Helllloooooooo." CR>)>)
	       (<AND <EQUAL? <GET ,GL-P-ADJW 0> ,W?MARY>
		     <EQUAL? ,GL-P-PRSA-WORD ,W?HAIL>>
		<TELL "Praying isn't a bad idea. But if you really need help,
simply type HINT." CR>)
	       (<EQUAL? <GET ,GL-P-NAMW 0> ,W?CAB>
		<COND (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
		       <RT-CYOU-MSG>
		       <TELL "can't " VW " a cab while indoors." CR>)
		      (<MC-HERE? <LOC ,TH-GROWLER-CAB> <LOC ,TH-HANSOM-CAB>>
		       <TELL ,K-CAB-HERE-MSG CR>)
		      (T
		       <COND  (<EQUAL? ,GL-P-PRSA-WORD ,W?HAIL>
			       <RT-CYOU-MSG "wave" "waves">
			       <TELL "a hand in the air">)
			      (T
			       <RT-CYOU-MSG "shout" "shouts">
			       <TELL "for a few moments">)>
		       <TELL ", but nothing happens. Apparently that isn't how
Victorians " VW " cabs." CR>)>)
	       (<OR <MC-ISNOT? ,GL-PRSO ,FL-ALIVE>
		    <NOT <RT-VISIBLE? ,GL-PRSO>>>
		<TELL "Nothing happens." CR>)>>

<ROUTINE PRE-DROP ()
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-DROP">>
	<COND (<OR <MC-PRSO? ,TH-ANCHOR>
		   <IN? ,GL-PRSO ,GL-WINNER>>
	       <RFALSE>)
	      (<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
	       <RT-IMPOSSIBLE-MSG>)
              (<MC-IS? ,GL-PRSO ,FL-BODYPART>
	       <RT-IMPOSSIBLE-MSG>)
	      (T
	       <RT-CYOU-MSG "are" "is">
	       <TELL "not holding " THEO "." CR>
	       <RFATAL>)>>

<ROUTINE PRE-DUMB-EXAMINE ()
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-DUMB-EXAMINE">>
	<COND (<PRE-EXAMINE>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE PRE-EXAMINE ()
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-EXAMINE">>
	<COND (<MC-F? ,GL-NOW-LIT?>
	       <TELL ,K-TOO-DARK-MSG CR>
	       <RFATAL>)
	      (<MC-PRSO? ,TH-INTDIR>
	       <COND (<==? ,GL-P-DIRECTION ,P?UP>
		      <RT-PERFORM ,V?LOOK-UP ,ROOMS>
		      <RTRUE>)
		     (<==? ,GL-P-DIRECTION ,P?DOWN>
		      <RT-PERFORM ,V?LOOK-DOWN ,ROOMS>
		      <RTRUE>)>
	       <TELL
"You peer off into the middle distance, but then return your attention to
the matters at hand." CR>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE PRE-FEED ()
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-FEED">>
	<COND (<PRE-GIVE T>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE PRE-GIVE ("OPTIONAL" (FEED? <>))
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-GIVE">>
	<COND (<OR <MC-F? ,GL-PRSO>
		   <MC-F? ,GL-PRSI>>
	       <TELL ,K-REFERRING-MSG CR>
	       <RTRUE>)
	      (<OR <EQUAL? ,GL-PRSO ,GL-PRSI>
		   <IN? ,GL-PRSI ,GLOBAL-OBJECTS>>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (<MC-ISNOT? ,GL-PRSI ,FL-ALIVE>
	       <RT-CYOU-MSG>
	       <TELL "cannot ">
	       <COND (<MC-T? .FEED?>
		      <TELL "feed ">)
		     (T
		      <TELL "give ">)>
	       <TELL "anything to " A ,GL-PRSI "." CR>
	       <RTRUE>)
	      (<AND <MC-PRSI? ,CH-ME ,CH-PLAYER>
		    <IN? ,GL-PRSO ,CH-PLAYER>>
	       <RT-ALREADY-HAVE-PRSO-MSG>
	       <RTRUE>)
	      (<AND <NOT <MC-PRSI? ,CH-ME ,CH-PLAYER>>
		    <RT-DONT-HAVE-MSG ,GL-PRSO>>
	       <RTRUE>)
	      (<AND <MC-IS? ,GL-PRSO ,FL-WORN>
		    <IN? ,GL-PRSO ,CH-PLAYER>>
	       <RT-TAKE-OFF-PRSO-FIRST-MSG>
	       <RFALSE>)
	      (T
	       <RFALSE>)>>

<ROUTINE PRE-LISTEN ()
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-LISTEN">>
	<COND (<MC-IS? ,TH-COTTON-BALLS ,FL-WORN>
	       <RT-CYOU-MSG>
	       <TELL
"can't hear anything very clearly, but then what did you expect with those
huge wads of cotton plugging up your ears?" CR>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE PRE-POCKET ()
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-POCKET">>
	<COND (<N==? ,GL-WINNER ,CH-PLAYER>
	       <TELL "[You cannot tell characters to do that.]" CR>
	       <RTRUE>)
	      (<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (<IN? ,GL-PRSO ,TH-POCKET>
	       <TELL CTHEO>
	       <RT-IS-ARE-MSG>
	       <TELL "already in " D ,TH-POCKET "." CR>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE PRE-PUT ("AUX" PTR OLOC CNT)
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-PUT">>
	<COND (<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
	       <RFALSE>)
	      (<AND <NOT <MC-PRSO? ,TH-ANCHOR>>
		    <NOT <IN? ,GL-PRSO ,GL-WINNER>>>
	       <RT-CYOU-MSG "are" "is">
	       <TELL "not holding " THEO "." CR>
	       <RFATAL>)
	      (<MC-PRSO? ,TH-CLOTHES>
	       <TELL ,K-INAPPROPRIATE-MSG CR>
	       <RTRUE>)
	      (<MC-PRSO? GL-PRSI>
	       <TELL ,K-HOW-TO-MSG CR>
	       <RTRUE>)
	      (<MC-PRSI? ,TH-INTDIR ,TH-RIGHT ,TH-LEFT>
	       <TELL "[You must specify an object.]" CR>
	       <RTRUE>)
	      (<MC-PRSI? ,TH-HANDS>
	       <RT-NOT-LIKELY-MSG ,GL-PRSO "would fit very well">
	       <RTRUE>)
	      (<EQUAL? ,TH-FEET ,GL-PRSO ,GL-PRSI>
	       <TELL "That would">
	       <RT-WASTE-OF-TIME-MSG>
	       <RTRUE>)
	      (<EQUAL? ,TH-EARS ,GL-PRSO ,GL-PRSI>
	       <RFALSE>)
	      (<MC-PRSO? ,TH-HANDS>
	       <RT-PERFORM ,V?REACH-IN ,GL-PRSI>
	       <RTRUE>)
	      (<IN? ,GL-PRSI ,GLOBAL-OBJECTS>
	       <RFALSE>)
	      (<AND <MC-PRSO? ,TH-PIPE>
		    <MC-PRSI? ,W?MOUTH ,W?LIPS>>
	       <RT-PERFORM ,V?SMOKE ,TH-PIPE>)
	      (<MC-IS? ,GL-PRSO ,FL-BODYPART>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (<IN? ,GL-PRSO ,GL-PRSI>
	       <TELL CTHEO>
	       <RT-IS-ARE-MSG>
	       <TELL "already">
	       <RT-IN-ON-MSG ,GL-PRSI>
	       <TELL THEI "." CR>
	       <RTRUE>)
	      (<OR <EQUAL? ,GL-PRSO ,GL-PRSI>
		   <IN? ,GL-PRSO ,GLOBAL-OBJECTS>
		   <MC-ISNOT? ,GL-PRSO ,FL-TAKEABLE>>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (<NOT <RT-ACCESSIBLE? ,GL-PRSI>>
	       <RT-CANT-SEE-ANY-MSG ,GL-PRSI>
	       <RTRUE>)
	      (<AND <MC-PRSO? ,TH-STETHOSCOPE>
		    <MC-IS? ,GL-PRSI ,FL-PERSON>>
	       <RFALSE>)
	      (<RT-CHECK-MOVE-MSG? ,GL-PRSO ,GL-PRSI>
	       <RTRUE>)
	      (<AND <MC-IS? ,GL-PRSO ,FL-WORN>
		    <IN? ,GL-PRSO ,CH-PLAYER>
		    <NOT <MC-PRSI? ,CH-ME ,CH-PLAYER>>>
	       <RT-TAKE-OFF-PRSO-FIRST-MSG>
	       <RFALSE>)>>

<ROUTINE PRE-PUT-ON ()
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-PUT-ON">>
	<COND (<PRE-PUT>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSI ,FL-ALIVE>
	       <RFALSE>)
	      (<MC-ISNOT? ,GL-PRSI ,FL-SURFACE>
	       <RT-NO-GOOD-SURFACE-MSG>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE PRE-SHOW ()
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-SHOW">>
	<COND (<EQUAL? <> ,GL-PRSO ,GL-PRSI>
	       <TELL ,K-REFERRING-MSG CR>)
	      (<MC-PRSI? ,CH-ME ,CH-PLAYER>
	       <COND (<RT-META-IN? ,GL-PRSO ,CH-PLAYER>
		      <RT-PERFORM ,V?EXAMINE ,GL-PRSO>)>)
	      (<OR <EQUAL? ,GL-PRSO ,GL-PRSI>
		   <IN? ,GL-PRSI ,GLOBAL-OBJECTS>>
	       <RT-IMPOSSIBLE-MSG>)
	      (<MC-ISNOT? ,GL-PRSI ,FL-ALIVE>
	       <RT-CYOU-MSG>
	       <TELL "cannot show things to " A ,GL-PRSI "." CR>)
	      ;(<MC-IS? ,GL-PRSI ,FL-ASLEEP>
		<TELL CTHEI " isn't in any condition to appreciate " THEO "." CR>)
	      ;(<AND <NOT <MC-PRSI? CH-ME>>
		     <RT-DONT-HAVE-MSG ,GL-PRSO>>
		<RTRUE>)>>

<ROUTINE PRE-SHOOT ()
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-SHOOT">>
	<COND (<NOT <MC-PRSI? <> ,TH-GUN>>
	       <RT-CYOU-MSG>
	       <TELL "cannot shoot anything with " THEI "." CR>)
	      (<MC-PRSI? ,GL-PRSO>
	       <TELL ,K-HOW-TO-MSG CR>)
	      (<NOT <IN? ,TH-GUN ,CH-PLAYER>>
	       <TELL "Clever thinking. If only you had something to shoot with!" CR>)
	      (<MC-PRSO? ,CH-ME ,TH-EARS ,CH-PLAYER ,TH-HEAD ,TH-WATSONS-HEART>
	       <TELL ,K-SUICIDE-MSG CR>)
	      (<MC-PRSO? ,TH-BREATH> <RFALSE>)
	      (<MC-IS? ,GL-PRSO ,FL-BODYPART>
	       <TELL "Is this how you got sent home from the Afghan Campaign?"
		     CR>)
	      (<AND <NOT <MC-PRSO? ,TH-GUN>>
		    <RT-META-IN? ,GL-PRSO ,CH-PLAYER>>
	       <TELL ,K-DROP-IT-FIRST-MSG CR>)
	      (<ZERO? ,TH-GUN-AUX1>
	       <TELL "Click!" CR>)
	      (T
	       <SETG TH-GUN-AUX1 <- ,TH-GUN-AUX1 1>>
	       <RFALSE>)>>

<ROUTINE PRE-TAKE ("AUX" L)
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-TAKE">>
	<COND (<AND <MC-PRSO? ,TH-BREATH>
		    <EQUAL? ,GL-WINNER ,CH-PLAYER>>
	       <V-INHALE>
	       <RTRUE>)>
	<COND (<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
	       <RFALSE>)>
	<COND (<==? ,GL-PRSO <LOC ,GL-WINNER>>
	       <RT-CYOU-MSG>
	       <TELL "are already inside " THEO "." CR>
	       <RTRUE>)>
	<SET L <LOC ,GL-PRSO>>
	<COND (<MC-IS? ,GL-PRSO ,FL-BODYPART>
	       <RT-IMPOSSIBLE-MSG>)
	      (<AND <MC-PRSO? ,TH-STETHOSCOPE ,TH-WATSONS-HAT
			      ,TH-COTTON-BALLS>
		    <MC-IS? ,GL-PRSO ,FL-WORN>>
	       <RFALSE>)
	      (<EQUAL? .L ,GL-WINNER>
	       <RT-CYOU-MSG "are" "is">
	       <TELL "already ">
	       <COND (<MC-IS? ,GL-PRSO ,FL-WORN>
		      <TELL "wearing ">)
		     (T
		      <TELL "holding ">)>
	       <TELL THEO "." CR>)
	      (<AND <MC-T? .L>
		    <MC-IS? .L ,FL-CONTAINER>
		    <MC-IS? .L ,FL-OPENABLE>
		    <MC-ISNOT? .L ,FL-OPENED>>
	       <RT-CYOU-MSG>
	       <TELL "can't reach into " THE .L ". It is closed." CR>)
	      (<MC-T? ,GL-PRSI>
	       <COND (<MC-PRSO? GL-PRSI>
		      <COND (<OR <EQUAL? <GET ,GL-P-NAMW 0> <GET ,GL-P-NAMW 1>>
				 <EQUAL? <GET ,GL-P-ADJW 0> <GET ,GL-P-ADJW 1>>>
			     <RT-IMPOSSIBLE-MSG>)>)
		     (<MC-PRSI? ,CH-ME ,CH-PLAYER>
		      <COND (<EQUAL? ,GL-WINNER ,CH-PLAYER>
			     <RT-NOBODY-TO-ASK-MSG>
			     <RTRUE>)
			    (<NOT <EQUAL? .L ,CH-PLAYER>>
			     <RT-CYOU-MSG "do not" "does not">
			     <TELL "have " THEO "." CR>)>)
		     (<AND <MC-PRSI? ,CH-BANK-GUARD>
			   <EQUAL? .L ,TH-GUARDS-POCKET>>
		      <RT-PERFORM ,V?TAKE ,GL-PRSO ,TH-GUARDS-POCKET>)
		     (<NOT <EQUAL? .L ,GL-PRSI>>
		      <TELL CTHEO>
		      <RT-ISNT-ARENT-MSG>
		      <RT-IN-ON-MSG ,GL-PRSI <>>
		      <TELL THEI "." CR>)>)>>

<ROUTINE PRE-THROW ()
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-THROW">>
	<COND (<PRE-PUT>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE PRE-THROW-OVER ()
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-THROW-OVER">>
	<COND (<PRE-THROW>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE PRE-WATCH ()
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-WATCH">>
	<COND (<PRE-EXAMINE>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE V-ADJUST ()
	<DEBUGGING? <RT-DEBUG-VERB "V-ADJUST">>
	<COND (<EQUAL? ,GL-P-PRSA-WORD ,W?ADJUST>
	       <TELL CTHEO>
	       <RT-DONT-DOESNT-MSG ,GL-PRSO>
	       <TELL "need adjustment." CR>
	       <RTRUE>)
	      (T 
	       <RT-CYOU-MSG>
	       <TELL "cannot focus " A ,GL-PRSO "." CR>
	       <RTRUE>)>>

<ROUTINE V-ALARM ()
	<DEBUGGING? <RT-DEBUG-VERB "V-ALARM">>
	<COND (<RT-FOOLISH-TO-TALK-MSG>
	       <RFATAL>)
	      (<MC-PRSO? ,ROOMS>
	       <RT-CYOU-MSG "are" "is">
	       <TELL "already wide awake." CR>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-ALIVE>
	       <TELL CTHEO>
	       <RT-IS-ARE-MSG ,GL-PRSO>
	       <COND (<MC-IS? ,GL-PRSO ,FL-ASLEEP>
		      <TELL "unconscious, not asleep." CR>)
		     (T
		      <TELL "already wide awake." CR>)>
	       <RTRUE>)
	      (T
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)>>

<ROUTINE V-ARREST ()
	<DEBUGGING? <RT-DEBUG-VERB "V-ARREST">>
	<TELL "Unfortunately,">
	<RT-YOU-MSG "do" "does">
	<TELL "not have the authority to arrest any">
	<COND (<MC-IS? ,GL-PRSO ,FL-PERSON>
	       <TELL "one">)
	      (T
	       <TELL "thing">)>
	<TELL "." CR>>

<ROUTINE V-ASK-ABOUT-1 ()
	<DEBUGGING? <RT-DEBUG-VERB "V-ASK-ABOUT-1">>
	<RTRUE>>

<ROUTINE V-ASK-ABOUT ()
	<DEBUGGING? <RT-DEBUG-VERB "V-ASK-ABOUT">>
	<COND (<RT-FOOLISH-TO-TALK-MSG>
	       <RFATAL>)
	      (<EQUAL? ,GL-WINNER ,GL-PRSI>
	       <TELL "That would">
	       <RT-WASTE-OF-TIME-MSG>
	       <RFATAL>)
	      (<MC-PRSO? ,CH-ME ,CH-PLAYER>
	       <RT-TALK-TO-SELF-MSG>
	       <RTRUE>)
	      (T
	       <RT-NO-RESPONSE-MSG>
	       <RTRUE>)>>

<ROUTINE V-ASK-FOR-1 ()
	<DEBUGGING? <RT-DEBUG-VERB "V-ASK-FOR-1">>
	<RTRUE>>

<ROUTINE V-ASK-FOR ("AUX" WHO)
	<DEBUGGING? <RT-DEBUG-VERB "V-ASK-FOR">>
	<COND (<RT-FOOLISH-TO-TALK-MSG>
	       <RFATAL>)
	      (<EQUAL? ,GL-WINNER ,GL-PRSI>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (<MC-ISNOT? ,GL-PRSI ,FL-TAKEABLE>
	       <TELL CTHE ,GL-PRSO " say">
	       <RT-S-NOS-MSG ,GL-PRSO>
	       <TELL ", \"Unfortunately, ">
	       <COND (<MC-ISNOT? ,GL-PRSO ,FL-PLURAL>
		      <TELL "I">)
		     (T
		      <TELL "we">)>
	       <TELL " can't help you with that.\"" CR>
	       <RTRUE>)
	      (T
	       <RT-NO-RESPONSE-MSG>
	       <RTRUE>)>>

<ROUTINE V-BLOW-INTO ()
	<DEBUGGING? <RT-DEBUG-VERB "V-BLOW-INTO">>
	<COND (<MC-IS? ,GL-PRSO ,FL-PERSON>
	       <RT-PERFORM ,V?USE ,GL-PRSO>
	       <RTRUE>)
	      (T
	       <RT-NO-POINT-MSG "Blowing">
	       <RTRUE>)>>

<ROUTINE V-BOW ()
	<DEBUGGING? <RT-DEBUG-VERB "V-BOW">>
	<RT-NO-POINT-MSG "Paying respect to">
	<RTRUE>>

<ROUTINE V-BURN ("AUX" OBJ (FIX-LAMP? <>))
	<COND (<AND <RT-META-IN? ,TH-LAMP ,GL-WINNER>
		    <FSET? ,TH-LAMP ,FL-LIGHTED>>
	       <SET FIX-LAMP? T>
	       <FCLEAR ,TH-LAMP ,FL-LIGHTED>)>
	<COND (<AND <SET OBJ <RT-GET-WHAT-I-MEAN ,FL-LIGHTED <+ ,SH ,SC ,SHAVE>
						 ,PR?WITH T T>>
		    <N==? .OBJ ,TH-LAMP>>
	       <COND (.FIX-LAMP? <FSET ,TH-LAMP ,FL-LIGHTED>)>
	       <TELL "[with " THE .OBJ "]" CR>
	       <RT-PERFORM ,V?BURN-WITH ,GL-PRSO .OBJ>
	       <RTRUE>)
	      (T
	       <COND (.FIX-LAMP? <FSET ,TH-LAMP ,FL-LIGHTED>)>
	       <PUT ,GL-P-ITBL ,K-P-PREP2 ,PR?WITH>
	       <RT-SYNTAX-CHECK>
	       <SETG GL-P-GOOD <>>
	       <RFATAL>)>>

<ROUTINE V-BURN-WITH ()
   <DEBUGGING? <RT-DEBUG-VERB "V-BURN-WITH">>
   <COND (<MC-IS? ,GL-PRSO ,FL-BURNABLE>
	  <COND (<AND <MC-IS? ,GL-PRSI ,FL-BURNABLE>
		      <MC-IS? ,GL-PRSI ,FL-LIGHTED>>
		 <COND (<AND <RT-META-IN? ,TH-ETHERIUM-AMPOULE ,GL-PRSO>
			     <NOT <FSET? ,TH-ETHERIUM-AMPOULE ,FL-BROKEN>>>
			<TELL CTHEO " catches fire, and quickly generates
enough heat to affect the etherium you left inside it.">
			<RT-PERFORM ,V?BURN-WITH ,TH-ETHERIUM-AMPOULE ,GL-PRSI>
			<RTRUE>)>
		 <REMOVE ,GL-PRSO>
		 <FCLEAR ,GL-PRSO ,FL-WORN>
		 <TELL CTHEO " catches fire and is quickly consumed." CR>)
		(T
		 <TELL CTHEI>
		 <RT-ISNT-ARENT-MSG ,GL-PRSI>
		 <TELL "burning." CR>)>)
	 (T
	  <RT-CYOU-MSG>
	  <TELL "can't " VW " " THEO "." CR>)>>

<ROUTINE V-BUY ()
	<DEBUGGING? <RT-DEBUG-VERB "V-BUY">>
	<COND (<NOT <RT-VISIBLE? ,GL-PRSO>>
	       <RT-CANT-SEE-ANY-MSG ,GL-PRSO>
	       <RFATAL>)
	      (<RT-HELD? ,GL-PRSO>
	       <RT-ALREADY-HAVE-PRSO-MSG>
	       <RTRUE>)
	      (<MC-ISNOT? ,GL-PRSO ,FL-BUYABLE>
	       <TELL CTHEO>
	       <RT-ISNT-ARENT-MSG>
	       <TELL "for sale." CR>
	       <RTRUE>)	       
	      (<AND <EQUAL? ,GL-WINNER ,CH-PLAYER>
		    <IN? ,GL-PRSO ,TH-POCKET>>
	       <RT-SAY-ITS-MSG>
	       <TELL "in " THE ,TH-POCKET "." CR>
	       <RTRUE>)
	      (<MC-T? ,GL-PRSI>
	       <RT-CYOU-MSG "could not" "cannot">
	       <TELL "buy " THEO " with " A ,GL-PRSI "." CR>
	       <RTRUE>)
	      (T
	       <RT-NO-MONEY-MSG>
	       <RTRUE>)>>

<ROUTINE V-BUY-FROM ()
	<DEBUGGING? <RT-DEBUG-VERB "V-BUY-FROM">>
	<TELL "It's not for sale." CR>
	<RFATAL>>

<ROUTINE V-CALL ()
	<DEBUGGING? <RT-DEBUG-PRE-VERB "V-CALL">>
	<COND (<EQUAL? <LOC ,GL-PRSO> ,GL-PLACE-CUR>
	       <TELL CTHEO>
	       <RT-IS-ARE-MSG ,GL-PRSO>
	       <TELL "right in front of you." CR>)
	      (T
	       <TELL "Nothing happens." CR>)>
	<RTRUE>>

<ROUTINE V-CAST-OFF ()
	<DEBUGGING? <RT-DEBUG-VERB "V-CAST-OFF">>
	<COND (<NOT <MC-PRSO? ,ROOMS ,TH-BOAT>>
	       <V-DROP>)
	      (<OR <IN? ,CH-PLAYER ,TH-BOAT>
		   <EQUAL? <LOC ,CH-PLAYER> <LOC ,TH-BOAT>>>
	       <RT-LAUNCH-BOAT>)
	      (T
	       <TELL
"Clever idea. Now, if only you were in a boat...." CR>)>
	<RTRUE>>

<ROUTINE V-CLEAN ()
	<DEBUGGING? <RT-DEBUG-VERB "V-CLEAN">>
	<TELL "Sorry. You get no points for neatness." CR>
	<RFATAL>>

<ROUTINE V-CLEAN-OFF ()
	<DEBUGGING? <RT-DEBUG-VERB "V-CLEAN-OFF">>
	<COND (<MC-PRSO? GL-PRSI>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (T
	       <RT-CYOU-MSG>
	       <TELL "cannot ">
	       <PRINTB ,GL-P-PRSA-WORD>
	       <TELL " " THEO " on " THEI "." CR>
	       <RTRUE>)>>

<ROUTINE V-CLIMB-DOWN ()
	<DEBUGGING? <RT-DEBUG-VERB "V-CLIMB-DOWN">>
	<COND (<EQUAL? ,GL-P-PRSA-WORD ,W?JUMP ,W?LEAP>
	       <RT-PERFORM ,V?DIVE ,GL-PRSO>
	       <RTRUE>)
	      (<MC-PRSO? ,ROOMS>
	       <RT-DO-WALK ,P?DOWN>
	       <RTRUE>)
	      (T
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)>>

<ROUTINE V-CLIMB-ON ()
	<DEBUGGING? <RT-DEBUG-VERB "V-CLIMB-ON">>
	<COND (<EQUAL? ,GL-P-PRSA-WORD ,W?TAKE>
	       <RT-NOT-LIKELY-MSG ,GL-PRSO "is looking for a fight">
	       <RTRUE>)
	      (T
	       <RT-CYOU-MSG>
	       <TELL "cannot ">
	       <PRINTB ,GL-P-PRSA-WORD>
	       <TELL " onto ">
	       <RT-SAY-HIM-HER-THEM-IT-MSG>
	       <TELL "." CR>
	       <RTRUE>)>>

<ROUTINE V-CLIMB-OVER ()
	<DEBUGGING? <RT-DEBUG-VERB "V-CLIMB-OVER">>
	<COND (<MC-PRSO? ,ROOMS>
	       <V-WALK-AROUND>
	       <RTRUE>)
	      (T
	       <RT-CYOU-MSG>
	       <TELL "cannot climb over ">
	       <RT-SAY-HIM-HER-THEM-IT-MSG>
	       <TELL "." CR>
	       <RTRUE>)>>

<ROUTINE V-CLIMB-UP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-CLIMB-UP">>
	<COND (<MC-PRSO? ,ROOMS>
	       <RT-DO-WALK ,P?UP>
	       <RTRUE>)
	      (T
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)>>

<ROUTINE V-CLOSE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-CLOSE">>
	<COND (<MC-IS? ,GL-PRSO ,FL-OPENABLE>
	       <COND (<MC-ISNOT? ,GL-PRSO ,FL-OPENED>
		      <RT-ITS-ALREADY-MSG "closed">)
		     (<MC-IS? ,GL-PRSO ,FL-LOCKED>
		      <TELL
"The door is fixed in the open position. It cannot be closed." CR>) 
		     (T
		      <RT-YOU-CLOSE-MSG>)>
	       <RTRUE>)
	      (T
	       <RT-CANT-CLOSE-THAT-MSG>
	       <RTRUE>)>>

<ROUTINE V-COUNT ()
	<DEBUGGING? <RT-DEBUG-VERB "V-COUNT">>
	<COND (<==? <GET ,GL-P-NAMW 0> ,W?ARMS ,W?EARS ,W?EYES
		    ,W?FEET ,W?HANDS ,W?LEGS ,W?LIPS> 
	       <TELL "Two." CR>)
	      (<OR <MC-IS? ,GL-PRSO ,FL-PLURAL>
		   <EQUAL? ,GL-PRSO ,TH-BANK-OF-CANDLES>>
	       <RT-CYOU-MSG "become" "becomes">
	       <TELL "distracted and lose">
	       <COND (<NOT <EQUAL? ,GL-WINNER ,CH-PLAYER>>
		      <TELL "s">)>
	       <TELL " count." CR>)
	      (T
	       <RT-CYOU-MSG "see" "sees">
	       <TELL "only one." CR>)>
	<RTRUE>>

<ROUTINE V-COVER ()
	<DEBUGGING? <RT-DEBUG-VERB "V-COVER">>
	<RT-PERFORM ,V?PUT-ON ,GL-PRSI ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-CROSS ()
	<DEBUGGING? <RT-DEBUG-VERB "V-CROSS">>
	<RT-CYOU-MSG>
	<TELL "cannot cross ">
	<RT-SAY-HIM-HER-THEM-IT-MSG>
	<TELL "." CR>
	<RTRUE>>

<ROUTINE V-CUT ()
	<DEBUGGING? <RT-DEBUG-VERB "V-CUT">>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>>

<ROUTINE V-DETONATE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-DETONATE">>
	<RT-IMPOSSIBLE-MSG>
	<RTRUE>>

<ROUTINE V-DIAGNOSE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-DIAGNOSE">>
	<COND (<MC-ISNOT? ,GL-PRSO ,FL-ALIVE>
	       <TELL "Don't be ridiculous." CR>)
	      (<MC-IS? ,GL-PRSO ,FL-ASLEEP>
	       <TELL CTHEO>
	       <RT-IS-ARE-MSG ,GL-PRSO>
	       <TELL "asleep." CR>)
	      (<EQUAL? ,GL-PRSO ,CH-PLAYER ,CH-ME>
	       <TELL "You're doing fine. Now quit fooling around and get back
to solving the game." CR>)
	      (T
	       <TELL CTHEO " appear">
	       <RT-S-NOS-MSG ,GL-PRSO>
	       <TELL " to be in good health." CR>)>
	<RTRUE>>

;<ROUTINE V-DIG ()
	<DEBUGGING? <RT-DEBUG-VERB "V-DIG">>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>>

;<ROUTINE V-DIG-SWP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-DIG-SWP">>
	<RT-PERFORM ,V?DIG ,GL-PRSI ,GL-PRSO>
	<RFATAL>>

<ROUTINE V-DIVE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-DIVE">>
	<COND (<AND <MC-PRSO? ,ROOMS>
		    <MC-HERE? ,RM-THE-EMBANKMENT ,RM-SWAN-LANE ,RM-LONDON-BRIDGE>>
	       <TELL "Yuck! Have you looked at that water?" CR>)
	      (T
	       <TELL "That would be a foolish thing to do." CR>)>
	<RFATAL>>

<ROUTINE V-DRESS ()
	<DEBUGGING? <RT-DEBUG-VERB "V-DRESS">>
	<COND (<MC-PRSO? ,ROOMS>
	       <TELL "You are already dressed." CR>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-PERSON>
	       <RT-CYOU-MSG "are" "is">
	       <TELL "already dressed." CR>
	       <RTRUE>)
	      (T
	       <RT-CYOU-MSG>
	       <TELL "cannot dress " A ,GL-PRSO "." CR>
	       <RTRUE>)>>

<ROUTINE V-DRINK ("OPTIONAL" (FROM? <>))
	<DEBUGGING? <RT-DEBUG-VERB "V-DRINK">>
	<RT-CYOU-MSG>
	<TELL "cannot drink ">
	<COND (<MC-T? .FROM?>
	       <TELL "from ">)>
	<TELL D ,TH-NOT-HERE-OBJECT "." CR>
	<RTRUE>>

<ROUTINE V-DRINK-FROM ()
	<DEBUGGING? <RT-DEBUG-VERB "V-DRINK-FROM">>
	<V-DRINK T>
	<RTRUE>>

<ROUTINE V-DRIVE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-DRIVE">>
	<COND (<EQUAL? <LOC ,GL-WINNER> ,TH-HANSOM-CAB ,TH-GROWLER-CAB>
	       <COND (<MC-PRSO? ,ROOMS>
		      <RTRUE>)
		     (T
		      <SETG GL-WHERE-TO-PROMPT? <>>
		      <TELL
"\"Sorry, guv. Could you be a little more specific?\"" CR>)>)
	      (T
	       <RT-CYOU-MSG "are" "is">
	       <TELL "not in a cab." CR>)>>

<ROUTINE V-DROP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-DROP">>
	<COND (<RT-IDROP-MSG>
	       <RT-SAY-DROPPED-MSG>)>
	<RTRUE>>

<ROUTINE V-DUMB-EXAMINE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-DUMB-EXAMINE">>
	<COND (<V-EXAMINE>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE V-EAT ()
	<DEBUGGING? <RT-DEBUG-VERB "V-EAT">>
	<COND (<EQUAL? ,GL-WINNER ,CH-PLAYER>
	       <RT-NOT-LIKELY-MSG ,GL-PRSO "would agree with you">
	       <RTRUE>)
	      (T
	       <TELL "\"It" <RT-PICK-NEXT ,GL-NOT-LIKELY-TXT>
		     " that " THEO " would agree with me.\"" CR>
	       <RTRUE>)>>

<ROUTINE V-EMPTY ("OPTIONAL" (DEST <>))
	<DEBUGGING? <RT-DEBUG-VERB "V-EMPTY">>
	<COND (<MC-F? .DEST>
	       <SET DEST ,CH-PLAYER>)>
	<COND (<MC-IS? ,GL-PRSO ,FL-SURFACE>
	       <RT-EMPTY-PRSO-MSG .DEST>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-CONTAINER>
	       <COND (<MC-IS? ,GL-PRSO ,FL-OPENED>
		      <RT-EMPTY-PRSO-MSG .DEST>
		      <RTRUE>)
		     (T
		      <RT-ITS-CLOSED-MSG ,GL-PRSO>)>
	       <RTRUE>)
	      (T
	       <RT-CYOU-MSG>
	       <TELL "cannot possibly empty " THEO "." CR>
	       <RTRUE>)>>

<ROUTINE V-EMPTY-INTO ()
	<DEBUGGING? <RT-DEBUG-VERB "V-EMPTY-INTO">>
	<COND (<MC-PRSI? ,TH-HANDS ,CH-ME ,CH-PLAYER>
	       <V-EMPTY ,CH-PLAYER>)
	      (<OR <RT-IDENTIFY-FLOOR? ,W?GROUND ,GL-PRSI>
		   <RT-IDENTIFY-FLOOR? ,W?FLOOR ,GL-PRSI>>
	       <V-EMPTY ,GL-PRSI>)
	      (<MC-IS? ,GL-PRSI ,FL-SURFACE>
	       <V-EMPTY ,GL-PRSI>)
	      (<MC-IS? ,GL-PRSI ,FL-CONTAINER>
	       <COND (<MC-IS? ,GL-PRSI ,FL-OPENED>
		      <COND (<MC-IS? ,GL-PRSI ,TH-WATSONS-COAT>
			     <V-EMPTY ,TH-POCKET>)
		            (T
			     <V-EMPTY ,GL-PRSI>)>)
		     (T
		      <RT-ITS-CLOSED-MSG ,GL-PRSI>)>)
	      (T
	       <RT-CYOU-MSG>
	       <TELL "cannot empty " THEO " into " THEI "." CR>)>>

<ROUTINE V-ENTER ("AUX" VEH)
	<DEBUGGING? <RT-DEBUG-VERB "V-ENTER">>
	<COND (<==? ,GL-PRSO ,GL-PLACE-CUR>
	       ; "Enter the room you're in"
	       <RT-ALREADY-IN-ROOM-MSG>
	       <RTRUE>)
	      (<SET VEH <RT-FIND-IN? ,GL-PLACE-CUR ,FL-VEHICLE>>
	       <COND (<NOT <MC-PRSO? ,ROOMS .VEH>> T)
		     (<IN? ,GL-WINNER .VEH> 
		      <RT-CYOU-MSG "are" "is">
		      <TELL "already in " THE .VEH "." CR>
		      <RTRUE>)
		     (T
		      <RT-PERFORM ,V?ENTER .VEH>
		      <RTRUE>)>)>
	<COND (<MC-PRSO? ,ROOMS>
	       <RT-DO-WALK ,P?IN>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-CLOTHING>
	       <TELL "[Presumably, you mean WEAR " THEO ".]" CR>
	       <RT-PERFORM ,V?WEAR ,GL-PRSO>
	       <RTRUE>)
	      (T
	       <RT-IMPOSSIBLE-MSG>)>
	<RTRUE>>

<ROUTINE V-ESCAPE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-ESCAPE">>
	<V-WALK-AROUND>
	<RTRUE>>

<ROUTINE V-EXAMINE ("AUX" (ODF <>) NUM (DRES 0))
  <DEBUGGING? <RT-DEBUG-VERB "V-EXAMINE">>
  <COND (<FSET? ,GL-PRSO ,FL-HAS-DESCFCN>
	 <SET ODF <GETP ,GL-PRSO ,P?ACTION>>)>
  <COND (<MC-T? <SET NUM <RT-HOLE? ,GL-PRSO>>>
	 <TELL "There ">
	 <COND (<EQUAL? .NUM 1>
		<TELL "is one">)
	       (T
		<TELL "are ">
		<COND (<EQUAL? .NUM 2>
		       <TELL "two">)
		      (<EQUAL? .NUM 3>
		       <TELL "three">)
		      (<EQUAL? .NUM 4>
		       <TELL "four">)
		      (<EQUAL? .NUM 5>
		       <TELL "five">)
		      (T
		       <TELL "six">)>)>
	 <TELL " bullet hole">
	 <COND (<G? .NUM 1>
		<TELL "s">)>
	 <TELL " in " THEO "." CR>)>
  <COND (<AND <MC-T? .ODF>
	      <==? <SET DRES <APPLY .ODF ,K-M-DESCFCN>> 1>>
	 <MC-MAKE ,GL-PRSO ,FL-SEEN>
	 <RTRUE>)
	(<MC-IS? ,GL-PRSO ,FL-OPENABLE>
	 <RT-OPEN-CLOSED-MSG>
	 <CRLF>
	 <MC-MAKE ,GL-PRSO ,FL-SEEN>
	 <RTRUE>)
	(<MC-IS? ,GL-PRSO ,FL-SURFACE>
	 <TELL "On " THEO " can be seen ">
	 <RT-PRINT-CONTENTS-2 ,GL-PRSO>
	 <TELL "." CR>
	 <MC-MAKE ,GL-PRSO ,FL-SEEN>
	 <RTRUE>)
	(<MC-IS? ,GL-PRSO ,FL-CONTAINER>
	 <COND (<OR <MC-IS? ,GL-PRSO ,FL-OPENED>
		    <MC-IS? ,GL-PRSO ,FL-TRANSPARENT>>
		<V-LOOK-INSIDE>
		<MC-MAKE ,GL-PRSO ,FL-SEEN>
		<RTRUE>)
	       (T
		<RT-ITS-CLOSED-MSG ,GL-PRSO>
		<CRLF>
		<MC-MAKE ,GL-PRSO ,FL-SEEN>
		<RTRUE>)>)
	(<AND <MC-IS? ,GL-PRSO ,FL-PERSON>
	      <RT-SEE-ANYTHING-IN? ,GL-PRSO>>
	 <TELL CTHEO>
	 <RT-IS-ARE-MSG ,GL-PRSO>
	 <TELL "holding ">
	 <RT-PRINT-CONTENTS-2 ,GL-PRSO>
	 <TELL "." CR>
	 <MC-MAKE ,GL-PRSO ,FL-SEEN>
	 <RTRUE>)
	(<MC-T? .NUM>
	 <RTRUE>)
	(<T? .DRES>
	 <RTRUE>)
	(T
	 <RT-NOTHING-INTERESTING-MSG>
	 <TELL " about " THEO "." CR>
	 <MC-MAKE ,GL-PRSO ,FL-SEEN>
	 <RTRUE>)>>

<ROUTINE V-EXHALE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-EXHALE">>
	<COND (<NOT <MC-PRSO? ,TH-BREATH ,ROOMS>>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (<MC-ISNOT? ,TH-BREATH ,FL-LOCKED>
	       <RT-CYOU-MSG>
	       <RT-WOULD-HAVE-TO-MSG "inhale first.|">
	       <RTRUE>)
	      (T
	       <MC-UNMAKE ,TH-BREATH ,FL-LOCKED>
	       <TELL "You begin to breathe normally." CR>
	       <RT-ALARM-CLR ,RT-I-EXHALE>
	       <RT-ALARM-CLR ,RT-I-INHALE>
	       <RT-SMELL-ETHERIUM?>)>
	<RTRUE>>

<ROUTINE V-EXIT ("AUX" VEH L)
	<DEBUGGING? <RT-DEBUG-VERB "V-EXIT">>
	<COND (<SET VEH <RT-FIND-IN? ,GL-PLACE-CUR ,FL-VEHICLE>>
	       <COND (<NOT <MC-PRSO? ,ROOMS .VEH>> T)
		     (<AND <MC-PRSO? ,ROOMS>
			   <MC-IS? <LOC ,GL-WINNER> ,FL-VEHICLE>>
		      <RT-PERFORM ,V?EXIT <LOC ,GL-WINNER>>
		      <RTRUE>)
		     (<NOT <IN? ,GL-WINNER .VEH>> 
		      <RT-CYOU-MSG "are" "is">
		      <TELL "not in " THE .VEH "." CR>
		      <RTRUE>)
		     (T
		      <RT-PERFORM ,V?EXIT .VEH>
		      <RTRUE>)>)>
	<SET L <LOC ,GL-PRSO>>
	<COND (<MC-PRSO? ,ROOMS>
	       <RT-DO-WALK ,P?OUT>
	       <RTRUE>)
	      (<==? ,GL-PRSO ,GL-PLACE-CUR>
	       ; "EXIT ROOM"
	       <TELL ,K-SPECIFY-DIR-MSG CR>
	       <RTRUE>)
	      (<==? .L ,ROOMS>
	       ; "EXIT ROOM when not in ROOM"
	       <RT-NOT-IN-ROOM-MSG>
	       <RTRUE>)
	      (<AND 
		<MC-IS? .L ,FL-CONTAINER>
		<RT-VISIBLE? ,GL-PRSO>>
	       <TELL "[from " D .L "]" CR>
	       <RT-PERFORM ,V?TAKE ,GL-PRSO>
	       <RTRUE>)
	      (T
	       <RT-IMPOSSIBLE-MSG>)>
	<RTRUE>>

<ROUTINE V-FEED ()
	<DEBUGGING? <RT-DEBUG-VERB "V-FEED">>
	<COND (<EQUAL? ,GL-PRSI ,GL-WINNER>
	       <RT-CYOU-MSG>)
	      (T
	       <TELL CTHE ,GL-PRSI " ">)>
	<TELL "cannot eat " THE ,GL-PRSO "." CR>
	<RTRUE>>

<ROUTINE V-FEED-SWP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-FEED-SWP">>
	<RT-PERFORM ,V?FEED ,GL-PRSI ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-FILL ()
	<DEBUGGING? <RT-DEBUG-VERB "V-FILL">>
	<RT-PERFORM ,V?PUT ,GL-PRSI ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-FIND ("AUX" L)
	<DEBUGGING? <RT-DEBUG-VERB "V-FIND">>
	<SET L <LOC ,GL-PRSO>>
	<COND (<MC-F? .L>
	       <TELL ,K-DO-IT-YOURSELF-MSG CR>
	       <RTRUE>)
	      (<MC-PRSO? ,CH-ME ,CH-PLAYER ,TH-HANDS ,TH-WATSONS-HEART
			 ,TH-FEET ,TH-EARS ,TH-HEAD ,TH-PLAYER-BODY
			 ,TH-BREATH ,TH-CLOTHES>
	       <TELL "You're right here." CR>
	       <RTRUE>)
	      (<IN? ,GL-PRSO ,CH-PLAYER>
	       <TELL "You're ">
	       <COND (<MC-IS? ,GL-PRSO ,FL-WORN>
		      <TELL "wearing">)
		     (T
		      <TELL "holding">)>
	       <TELL " ">
	       <RT-SAY-HIM-HER-THEM-IT-MSG>
	       <TELL "." CR>
	       <RTRUE>)
	      (<OR <IN? ,GL-PRSO ,GL-PLACE-CUR>
		   <==? ,GL-PRSO ,GL-PLACE-CUR>
		   <AND <OR <IN? ,GL-PRSO ,LOCAL-GLOBALS>
			    <IN? ,GL-PRSO ,ROOMS>>
			<RT-GLOBAL-IN? ,GL-PRSO ,GL-PLACE-CUR>>>
	       <RT-ITS-RIGHT-HERE-MSG>
	       <RTRUE>)
	      (<AND <OR <MC-IS? .L ,FL-PERSON>
			<MC-IS? .L ,FL-ALIVE>>
		    <RT-VISIBLE? .L>>
	       <TELL CTHE .L " ha">
	       <COND (<MC-ISNOT? .L ,FL-PLURAL>
		      <TELL "s">)
		     (T
		      <TELL "ve">)>
	       <TELL " it." CR>
	       <RTRUE>)
	      (<AND <RT-SEE-INSIDE? .L>
		    <RT-VISIBLE? .L>>
	       <RT-SAY-ITS-MSG>
	       <RT-IN-ON-MSG .L <>>
	       <TELL THE .L "." CR>
	       <RTRUE>)
	      (T
	       <TELL ,K-DO-IT-YOURSELF-MSG CR>)>
	<RTRUE>>

<ROUTINE V-FLIP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-FLIP">>
	<COND (<AND <MC-ISNOT? ,GL-PRSO ,FL-TAKEABLE>
		    <MC-ISNOT? ,GL-PRSO ,FL-TRYTAKE>>
	       <RT-IMPOSSIBLE-MSG>)
	      (T
	       <RT-NO-POINT-MSG "Flipping">)>
	<RTRUE>>

<ROUTINE V-FLY ()
	<DEBUGGING? <RT-DEBUG-VERB "V-FLY">>
	<RT-CYOU-MSG>
	<TELL "cannot possibly do that." CR>>

<ROUTINE V-FOCUS-ON ()
	<DEBUGGING? <RT-DEBUG-VERB "V-FOCUS-ON">>
	<COND (<MC-F? ,GL-PRSI>
	       <COND (<MC-PRSO? ,TH-TELESCOPE>
		      <RT-IMPOSSIBLE-MSG>)
		     (<IN? ,TH-TELESCOPE ,CH-PLAYER>
		      <RT-PERFORM ,V?LOOK-THRU ,GL-PRSO ,TH-TELESCOPE>)
		     (T
		      <TELL ,K-HOW-TO-MSG CR>)>)
	      (T
	       <COND (<MC-PRSO? ,TH-TELESCOPE>
		      <RT-PERFORM ,V?LOOK-THRU ,GL-PRSI ,GL-PRSO>)
		     (T
		      <RT-CYOU-MSG>
		      <TELL "cannot focus " THEO " on " THEI "." CR>)>)>
	<RTRUE>>

<ROUTINE V-FOLD ()
	<DEBUGGING? <RT-DEBUG-VERB "V-FOLD">>
	<RT-NO-POINT-MSG "Folding">
	<RTRUE>>

<ROUTINE V-FOLLOW ()
	<DEBUGGING? <RT-DEBUG-VERB "V-FOLLOW">>
	<COND (<MC-F? ,GL-PRSO>
	       <RT-CANT-SEE-ANY-MSG>
	       <RFATAL>)
	      (<AND <NOT <RT-META-IN? ,GL-PRSO ,GL-PLACE-CUR>>
		    <NOT <EQUAL? <LOC ,GL-PRSO> ,LOCAL-GLOBALS
				 ,GLOBAL-OBJECTS>>>
	       <RT-CANT-SEE-ANY-MSG ,GL-PRSO>
	       <RFATAL>)>
	<TELL "But ">
	<COND (<MC-PRSO? ,CH-ME ,CH-PLAYER>
	       <TELL "you're right here." CR>
	       <RTRUE>)
	      (T
	       <TELL THEO>
	       <RT-IS-ARE-MSG ,GL-PRSO>
	       <COND (<OR <RT-VISIBLE? ,GL-PRSO>
			  <IN? ,GL-PRSO ,GLOBAL-OBJECTS>>
		      <TELL "right here">)
		     (T
		      <TELL "not visible at the moment">)>)>
	<TELL "." CR>
	<RTRUE>>

<ROUTINE V-FOO ()
	<DEBUGGING? <RT-DEBUG-VERB "V-FOO">>
	<COND (<MC-VERB-WORD? RENT>
	       <TELL CTHEO>
	       <RT-ISNT-ARENT-MSG>
	       <TELL "for rent." CR>)
	      (<MC-PRSO? ,ROOMS>
	       <TELL "Same to you, fella." CR>)>>

<ROUTINE V-GET-FOR ()
	<DEBUGGING? <RT-DEBUG-VERB "V-GET-FOR">>
	<RT-PERFORM ,V?TAKE ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-GET-FOR-SWP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-GET-FOR-SWP">>
	<RT-PERFORM ,V?TAKE ,GL-PRSI>
	<RTRUE>>

<ROUTINE V-GIN ("AUX" WHO)
	<DEBUGGING? <RT-DEBUG-VERB "V-GIN">>
	<COND (<MC-HERE? ,RM-BYWARD-TOWER>
	       <TELL
CTHE ,CH-TOWER-GUARD " takes a quick look around and says, \"Thanks. Don't
mind if I do,\" whereupon he whips out a hip flask and takes a quick
slug. Just as quickly, he tucks it away and resumes staring at you." CR>)
	      (T
	       <SET WHO <RT-WHO-SAYS?>>
	       <COND (<EQUAL? .WHO ,CH-HOLMES>
		      <TELL
"Holmes shakes his head and says, \"No drinks for you until we recover the
Crown Jewels.\"" CR>)
		     (<EQUAL? .WHO ,CH-WIGGINS>
		      <TELL
"Wiggins says, \"Good idea. I could use a belt.\"" CR>)
		     (T
		      <TELL "Wrong game, dummy." CR>)>)>
	<RTRUE>>

<ROUTINE V-GIVE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-GIVE">>
	<COND (<MC-PRSI? ,CH-ME ,CH-PLAYER>
	       <RT-NOBODY-TO-ASK-MSG>)
	      (<AND <EQUAL? ,GL-PRSI ,CH-TOWER-GUARD ,CH-PALACE-GUARD
							 ,CH-TUSSAUDS-GUARD>
		    <MC-IS? ,GL-PRSO ,FL-MONEY>>
	       <TELL 
CTHEI " doesn't even glance at " THEO ". Clearly he cannot be bribed." CR>)
	      (<MC-IS? ,GL-PRSI ,FL-PERSON>
	       <TELL CTHEI " show">
	       <RT-S-NOS-MSG ,GL-PRSI>
	       <TELL " little interest in your offer." CR>)
	      (T
	       <RT-NOT-LIKELY-MSG ,GL-PRSI "would accept your offer">)>
	<RTRUE>>

<ROUTINE V-GIVE-SWP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-GIVE-SWP">>
	<RT-PERFORM ,V?GIVE ,GL-PRSI ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-GOODBYE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-GOODBYE">>
	<RT-HI-BYE-MSG>>

<ROUTINE V-GUESS ("AUX" WHO)
	<DEBUGGING? <RT-DEBUG-VERB "V-GUESS">>
	<SET WHO <RT-WHO-SAYS?>>
	<COND (<EQUAL? .WHO ,CH-WIGGINS>
	       <TELL
"Wiggins says, \"Mr 'Olmes doesn't like people guessing about things.\"" CR>
	       <RTRUE>)>
	<COND (<EQUAL? ,GL-WINNER ,CH-HOLMES>
	       <TELL "Holmes looks at you in shock and says, \"I never">)
	      (<EQUAL? .WHO ,CH-HOLMES>
	       <TELL "Holmes shakes his head and says, \"Never">)
	      (T
	       <TELL "Holmes's words come back to you, \"Never">)>
	<TELL " guess, Watson. It is a shocking habit - destructive
to the logical faculty.\"" CR>
	<RTRUE>>

<ROUTINE V-HAGGLE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-HAGGLE">>
	<COND (<MC-ISNOT? ,GL-PRSO ,FL-PERSON>
	       <RT-CYOU-MSG>
	       <TELL "cannot " VW " with " AO "." CR>)
	      (<MC-PRSO? ,CH-HOLMES>
	       <TELL
"There is nothing to negotiate with " THE ,CH-HOLMES " about." CR>)
	      (<MC-PRSO? ,CH-ME ,CH-PLAYER>
	       <TELL "You have nothing to negotiate." CR>)
	      (T
	       <TELL CTHEO " refuse">
	       <RT-S-NOS-MSG ,GL-PRSO>
	       <TELL " to negotiate." CR>)>
	<RTRUE>>

<ROUTINE V-HAUL ()
	<DEBUGGING? <RT-DEBUG-VERB "V-HAUL">>
	<TELL "You're a doctor, not a sailor." CR>
	<RTRUE>>

<ROUTINE V-HEAT ()
	<DEBUGGING? <RT-DEBUG-VERB "V-HEAT">>
	<RT-NO-POINT-MSG "Heating">>

<ROUTINE V-HELLO ()
	<DEBUGGING? <RT-DEBUG-VERB "V-HELLO">>
	<RT-HI-BYE-MSG>>

;<ROUTINE V-ASK-FOR-HELP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-ASK-FOR-HELP">>
	<TELL "Wimp." CR>
	<RTRUE>>

<ROUTINE V-HIDE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-HIDE">>
	<TELL "You can run, but you cannot hide." CR>
	<RTRUE>>

<ROUTINE V-HIT ()
	<DEBUGGING? <RT-DEBUG-VERB "V-HIT">>
	<TELL "Attacking " THEO>
	<COND (<AND <MC-T? ,GL-PRSI>
		    <NOT <MC-PRSI? ,TH-HANDS>>>
	       <TELL " with " A ,GL-PRSI>)>
	<TELL ,K-WONT-HELP-MSG CR>
	<RTRUE>>

<ROUTINE V-HOLD-OVER ()
	<DEBUGGING? <RT-DEBUG-VERB "V-HOLD-OVER">>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>>

<ROUTINE V-HUSH ()
	<DEBUGGING? <RT-DEBUG-VERB "V-HUSH">>
	<TELL "Silence is golden." CR>
	<RTRUE>>

<ROUTINE V-INHALE ()
      <DEBUGGING? <RT-DEBUG-VERB "V-INHALE">>
      <COND (<NOT <MC-PRSO? ,TH-BREATH ROOMS>>
	     <RT-IMPOSSIBLE-MSG>
	     <RTRUE>)
	    (<MC-IS? ,TH-BREATH ,FL-LOCKED>
	     <COND (<EQUAL? ,GL-P-PRSA-WORD ,W?BREATHE>
		    <V-EXHALE>
		    <RTRUE>)
		   (T
		    <TELL "You are already holding " THE ,TH-BREATH "." CR>
		    <RTRUE>)>)
	    (T
	     <TELL "You take a deep breath.">
	     <COND (<EQUAL? ,GL-PUPPY ,CH-HOLMES>
		    <TELL " " CTHE ,CH-HOLMES
" notices your action and surreptitiously does likewise.">)>
	     <CRLF>)>
      <RT-ALARM-SET-REL ,RT-I-EXHALE <RT-PARM-SET 0 2 0>>
      <MC-MAKE ,TH-BREATH ,FL-LOCKED>
      <SETG GL-CLOCK-WAIT T>
      <RTRUE>>

<ROUTINE V-KICK ()
	<DEBUGGING? <RT-DEBUG-VERB "V-KICK">>
	<RT-NO-POINT-MSG "Kicking">
	<RTRUE>>

<ROUTINE V-KILL ()
	<DEBUGGING? <RT-DEBUG-VERB "V-KILL">>
	<TELL "Calm down." CR>
	<RTRUE>> 

<ROUTINE V-KISS ()
    <DEBUGGING? <RT-DEBUG-VERB "V-KISS">>
    <TELL "You really can't wait for the Victorian Era to end, can you?" CR>>

<ROUTINE V-KNOCK ()
	<DEBUGGING? <RT-DEBUG-VERB "V-KNOCK">>
	<COND (<MC-IS? ,GL-PRSO ,FL-DOOR>
	       <COND (<MC-IS? ,GL-PRSO ,FL-OPENED>
		      <RT-ITS-ALREADY-MSG "open">
		      <RTRUE>)>
	       <TELL "There's no answer." CR>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-PERSON>
	       <RT-PERFORM ,V?USE ,GL-PRSO>
	       <RTRUE>)>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>>

<ROUTINE V-LEAP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LEAP">>
	<COND (<NOT <MC-PRSO? ,ROOMS>>
	       <TELL "No." CR>
	       <RTRUE>)
	      (T
	       <TELL "That would">
	       <RT-WASTE-OF-TIME-MSG>
	       <RTRUE>)>
	<RTRUE>>

<ROUTINE V-LIE-DOWN ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LIE-DOWN">>
	<TELL "With so much at stake, resting is out of the question." CR>
	<RTRUE>>

<ROUTINE V-LIGHT ("AUX" OBJ (FIX-LAMP? <>))
	<COND (<AND <RT-META-IN? ,TH-LAMP ,GL-WINNER>
		    <FSET? ,TH-LAMP ,FL-LIGHTED>>
	       <SET FIX-LAMP? T>
	       <FCLEAR ,TH-LAMP ,FL-LIGHTED>)>
	<COND (<AND <SET OBJ <RT-GET-WHAT-I-MEAN ,FL-LIGHTED <+ ,SH ,SC ,SHAVE>
						 ,PR?WITH T T>>
		    <N==? .OBJ ,TH-LAMP>>
	       <COND (.FIX-LAMP? <FSET ,TH-LAMP ,FL-LIGHTED>)>
	       <TELL "[with " THE .OBJ "]" CR>
	       <RT-PERFORM ,V?LIGHT-WITH ,GL-PRSO .OBJ>
	       <RTRUE>)
	      (T
	       <COND (.FIX-LAMP? <FSET ,TH-LAMP ,FL-LIGHTED>)>
	       <PUT ,GL-P-ITBL ,K-P-PREP2 ,PR?WITH>
	       <RT-SYNTAX-CHECK>
	       <SETG GL-P-GOOD <>>
	       <RFATAL>)>>

<ROUTINE V-LIGHT-WITH ("AUX" OBJ)
	<DEBUGGING? <RT-DEBUG-VERB "V-LIGHT-WITH">>
	<COND (<MC-PRSI? ,TH-LAMP>
	       <COND (<MC-PRSI? GL-PRSO>
		      <RT-IMPOSSIBLE-MSG>
		      <RTRUE>)>
	       <RT-PERFORM ,V?SHINE-AT ,GL-PRSI ,GL-PRSO>
	       <RTRUE>)>
	<V-BURN-WITH>
	<RTRUE>>

<ROUTINE V-LISTEN ("AUX" (OBJ <>))
	<DEBUGGING? <RT-DEBUG-VERB "V-LISTEN">>
	<COND (<MC-PRSO? ,ROOMS>
	       <COND (<MC-IS? ,GL-PLACE-CUR ,RM-DIOGENES-CLUB>
		      <TELL CTHE ,CH-MEMBERS " are all asleep." CR>)
		     (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
		      <TELL "From afar you">)
		     (T
		      <TELL "You">)>
	       <TELL " hear the sounds of the ">
	       <COND (<IN? ,CH-PLAYER ,TH-BOAT>
		      <TELL "river ">)
		     (T
		      <TELL "city ">)>
	       <COND (<EQUAL? <RT-TIME-OF-DAY> 0>
		      <TELL "at night">)
		     (<EQUAL? <RT-TIME-OF-DAY> 1>
		      <TELL "waking up">)
		     (<EQUAL? <RT-TIME-OF-DAY> 2>
		      <TELL "going about its business">)
		     (<EQUAL? <RT-TIME-OF-DAY> 3>
		      <TELL "going to sleep">)>
	       <TELL "." CR>)
	      (<NOT <MC-PRSI? <> ,TH-STETHOSCOPE ,TH-EARS>>
	       <RT-CYOU-MSG>
	       <TELL "cannot listen to anything with " THEI "." CR>)
	      (<AND <MC-PRSI? ,TH-STETHOSCOPE>
		    <MC-ISNOT? ,TH-STETHOSCOPE ,FL-WORN>>
	       <TELL CTHEI " is not in " THE ,TH-EARS "." CR>)
	      (<AND <MC-IS? ,GL-PRSO ,FL-ALIVE>
		    <MC-PRSI? ,TH-STETHOSCOPE>>
	       <COND (<AND <MC-PRSO? ,CH-HOLMES>
			   <FSET? ,CH-HOLMES ,FL-ASLEEP>>
		      <TELL THEO " is suffering from a mental, not physical,
malaise." CR>)
	             (T
		      <TELL
"You don't need to. Your experienced eye tells you there
is nothing wrong with " THEO "." CR>)>)
	      (T
	       <TELL "At the moment, ">
	       <COND (<MC-PRSO? ,CH-PLAYER ,CH-ME>
	              <TELL "you">)
                     (T
                      <TELL THEO>)>
	       <RT-IS-ARE-MSG>
	       <TELL "silent." CR>
	       <SETG GL-LISTEN-OBJ ,GL-PRSO>)>
	<RTRUE>>

<ROUTINE V-LOCK ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LOCK">>
	<COND (<OR <MC-IS? ,GL-PRSO ,FL-OPENABLE>
		   <MC-IS? ,GL-PRSO ,FL-CONTAINER>>
	       <COND (<MC-IS? ,GL-PRSO ,FL-OPENED>
		      <RT-YOUD-HAVE-TO-MSG "close" ,GL-PRSO>
		      <RTRUE>)
		     (<MC-IS? ,GL-PRSO ,FL-LOCKED>
		      <TELL CTHEO>
		      <RT-IS-ARE-MSG>
		      <TELL "already locked." CR>
		      <RTRUE>)
		     (T
		      <RT-THING-WONT-LOCK-MSG ,GL-PRSI ,GL-PRSO>)>)
	      (T
	       <RT-CANT-LOCK-MSG>)>
	<RTRUE>>

;<ROUTINE V-LOO ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LOO">>
	<TELL "There isn't one nearby. You'll just have to wait." CR>
	<RFATAL>>

<ROUTINE V-LOOK ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LOOK">>
	<RT-DESC-ALL <> T>
	<RTRUE>>

<ROUTINE V-LOOK-BEHIND ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LOOK-BEHIND">>
	<COND (<MC-F? ,GL-NOW-LIT?>
	       <TELL ,K-TOO-DARK-MSG CR>
	       <RFATAL>)
	      (<MC-IS? ,GL-PRSO ,FL-DOOR>
	       <COND (<MC-IS? ,GL-PRSO ,FL-OPENED>
		      <RT-CANT-SEE-MUCH-MSG>)
		     (T
		      <RT-ITS-CLOSED-MSG ,GL-PRSO>)>
	       <RTRUE>)
	      (T
	       <TELL "There's nothing behind " THEO "." CR>
	       <RTRUE>)>>

<ROUTINE V-LOOK-DOWN ("AUX" (X <>))
	<DEBUGGING? <RT-DEBUG-VERB "V-LOOK-DOWN">>
	<COND (<MC-F? ,GL-NOW-LIT?>
	       <TELL ,K-TOO-DARK-MSG CR>
	       <RFATAL>)
	      (<MC-PRSO? ,ROOMS>
	       ;<SET X <GETP ,GL-PLACE-CUR ,P?LOOKDN>>
	       ; "LOOKDN is only used once"
		 <COND (<MC-HERE? ,RM-CLOCK-TOWER>
			<RT-PERFORM ,V?EXAMINE ,TH-SHAFT>)
		       (T
			<RT-NOTHING-INTERESTING-MSG>
			<TELL " down there." CR>)>
		 <RTRUE>)
	      (T
	       <TELL "You cannot look down " AO "." CR>
	       <RTRUE>)>>

<ROUTINE V-LOOK-INSIDE ("AUX" ODF)
	<DEBUGGING? <RT-DEBUG-VERB "V-LOOK-INSIDE">>
	<COND (<MC-T? .ODF>
	       <COND (<MC-T? <APPLY .ODF>>
		      <RTRUE>)>)>
	<COND (<MC-F? ,GL-NOW-LIT?>
	       <TELL ,K-TOO-DARK-MSG CR>
	       <RFATAL>)
	      (<MC-IS? ,GL-PRSO ,FL-PERSON>
	       <RT-YOURE-NOT-A-MSG "surgeon">
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-ALIVE>
	       <RT-YOURE-NOT-A-MSG "veterinarian">
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-CONTAINER>
	       <COND (<AND 
		       <MC-ISNOT? ,GL-PRSO ,FL-OPENED>
		       <MC-ISNOT? ,GL-PRSO ,FL-TRANSPARENT>>
		      <RT-YOUD-HAVE-TO-MSG "open" ,GL-PRSO>
		      <RTRUE>)
		     (T
		      <TELL "In " THEO " you see ">
		      <RT-PRINT-CONTENTS-2 ,GL-PRSO>
		      <TELL "." CR>)>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-DOOR>
	       <COND (<MC-IS? ,GL-PRSO ,FL-OPENED>
		      <RT-CANT-SEE-MUCH-MSG>)
		     (T
		      <RT-ITS-CLOSED-MSG ,GL-PRSO>)>
	       <RTRUE>)
	      (T
	       <TELL "You cannot look inside " AO "." CR>
	       <RTRUE>)>>

<ROUTINE V-LOOK-ON ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LOOK-ON">>
	<COND (<MC-F? ,GL-NOW-LIT?>
	       <TELL ,K-TOO-DARK-MSG CR>
	       <RFATAL>)
	      (<MC-IS? ,GL-PRSO ,FL-SURFACE>
	       <TELL "On " THEO " you see ">
	       <RT-PRINT-CONTENTS-2 ,GL-PRSO>
	       <TELL "." CR>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-READABLE>
	       <TELL CTHEO " has something written on it." CR>
	       <RTRUE>)
	      (T
	       <RT-NOTHING-INTERESTING-MSG>
	       <TELL " on " THEO "." CR>
	       <RTRUE>)>>

<ROUTINE V-LOOK-OUTSIDE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LOOK-OUTSIDE">>
	<COND (<MC-F? ,GL-NOW-LIT?>
	       <TELL ,K-TOO-DARK-MSG CR>
	       <RFATAL>)
	      (<MC-PRSO? ,ROOMS>
	       <COND (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
		      <RT-NOTHING-INTERESTING-MSG>
		      <TELL " outside." CR>)
		     (T
		      <TELL "You are outside." CR>)>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-DOOR>
	       <COND (<MC-IS? ,GL-PRSO ,FL-OPENED>
		      <RT-CANT-SEE-MUCH-MSG>)
		     (T
		      <RT-ITS-CLOSED-MSG ,GL-PRSO>)>
	       <RTRUE>)
	      (T
	       <TELL "You cannot look out of " AO "." CR>
	       <RTRUE>)>>

<ROUTINE V-LOOK-THRU ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LOOK-THRU">>
	<COND (<MC-F? ,GL-NOW-LIT?>
	       <TELL ,K-TOO-DARK-MSG CR>
	       <RFATAL>)
	      (<AND <EQUAL? ,GL-P-PRSA-WORD ,W?EXAMINE ,W?X>
		    <MC-PRSI? ,TH-STETHOSCOPE>
		    <MC-IS? ,GL-PRSO ,FL-PERSON>>
	       <RT-PERFORM ,V?LISTEN ,GL-PRSO ,GL-PRSI>)
	      (<AND <MC-T? ,GL-PRSI>
		    <MC-ISNOT? ,GL-PRSI ,FL-TRANSPARENT>>
	       <TELL "You can't look through " THEI "." CR>
	       <RTRUE>)
	      (<AND <MC-T? ,GL-PRSI>
		    <MC-IS? ,GL-PRSI ,FL-TRANSPARENT>>
	       <RT-NOTHING-INTERESTING-MSG>
	       <TELL " through " THEI "." CR>
	       <RTRUE>)
	      (T
	       <RT-NOTHING-INTERESTING-MSG>
	       <TELL "at all." CR>
	       <RTRUE>)>>

<ROUTINE V-LOOK-THRU-SWP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LOOK-THRU-SWP">>
	<RETURN <RT-PERFORM ,V?LOOK-THRU ,GL-PRSI ,GL-PRSO>>>

<ROUTINE V-LOOK-UNDER ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LOOK-UNDER">>
	<COND (<MC-F? ,GL-NOW-LIT?>
	       <TELL ,K-TOO-DARK-MSG CR>
	       <RFATAL>)
	      (<IN? ,GL-PRSO ,CH-PLAYER>
	       <TELL "You are already ">
	       <COND (<MC-IS? ,GL-PRSO ,FL-WORN>
		      <TELL "wearing">)
		     (T
		      <TELL "holding">)>
	       <TELL " that." CR>
	       <RTRUE>)
	      (T
	       <RT-NOTHING-INTERESTING-MSG>
	       <TELL " under " THEO "." CR>
	       <RTRUE>)>>

<ROUTINE V-LOOK-UP ("AUX" (X <>))
	<DEBUGGING? <RT-DEBUG-VERB "V-LOOK-UP">>
	<COND (<MC-F? ,GL-NOW-LIT?>
	       <TELL ,K-TOO-DARK-MSG CR>
	       <RFATAL>)
	      (<MC-PRSO? ,ROOMS>
	       <COND (<FSET? ,GL-PLACE-CUR ,FL-INDOORS>
		      <PUTP ,TH-FLOOR-ETC ,P?OBJ-NOUN ,W?CEILING>
		      <RT-PERFORM ,V?EXAMINE ,TH-FLOOR-ETC>
		      <RTRUE>)>
	       <RT-NOTHING-INTERESTING-MSG>
	       <TELL " up there." CR>
	       <RTRUE>)
	      (T
	       <TELL "You cannot look up " AO "." CR>
	       <RTRUE>)>>

<ROUTINE V-LOOSEN ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LOOSEN">>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>>

<ROUTINE V-LOWER ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LOWER">>
	<COND (<MC-PRSO? ,ROOMS>
	       <RT-DO-WALK ,P?DOWN>
	       <RTRUE>)
	      (T
	       <V-RAISE>)>
	<RTRUE>>

<ROUTINE V-LAND ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LAND">>
	<COND (<MC-PRSO? ,ROOMS>
	       <COND (<IN? ,CH-PLAYER ,TH-BOAT>
		      <RT-LAND-BOAT>)
		     (T
		      <TELL "Very good. Next week, we'll learn the word for
water." CR>)>
	       <RTRUE>)
	      (<MC-PRSO? ,TH-BOAT>
	       <COND (<IN? ,CH-PLAYER ,TH-BOAT>
		      <RT-LAND-BOAT>)
		     (T
		      <TELL ,K-MUST-BE-IN-BOAT-MSG "land it." CR>)>)
	      (T
	       <TELL "You can't land " THEO "!" CR>)>
	<RTRUE>>

<ROUTINE RT-LAND-BOAT ()
	<COND (<IN? ,TH-BOAT ,RM-THE-EMBANKMENT>
	       <TELL "The boat is already on the Embankment." CR>)
	      (<IN? ,TH-BOAT ,RM-OUTSIDE-TRAITORS-GATE>
	       <TELL "The boat is already at Traitors Gate." CR>)
	      (<NOT <IN? ,TH-ANCHOR ,TH-BOAT>>
	       <TELL
"You can't land the boat. The anchor seems to be doing its job." CR>)
	      (<IN? ,TH-BOAT ,RM-THAMES-ONE>
	       <IFSOUND <SOUNDS ,S-BOATING ,S-STOP>>
	       <TELL "You land the boat on the Embankment." CR>
	       <MOVE ,TH-BOAT ,RM-THE-EMBANKMENT>
	       <RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>)
	      (<IN? ,TH-BOAT ,RM-THAMES-FOUR>
	       <IFSOUND <SOUNDS ,S-BOATING ,S-STOP>>
	       <TELL "You land the boat outside Traitors Gate." CR>
	       <MOVE ,TH-BOAT ,RM-OUTSIDE-TRAITORS-GATE>
	       <RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>)
	      (T
	       <TELL
"There doesn't seem to be any place to land the boat." CR>
	       <RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>)>
	<RTRUE>>

<ROUTINE V-LAMP-OFF ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LAMP-OFF">>
	<V-LAMP-ON T>
	<RTRUE>>

<ROUTINE V-LAMP-ON ("OPTIONAL" (OFF? <>))
	<DEBUGGING? <RT-DEBUG-VERB "V-LAMP-ON">>
	<RT-CYOU-MSG>
	<TELL "couldn't ">
	<COND (<==? ,GL-P-PRSA-WORD ,W?EXTINGUISH>
	       <TELL "extinguish">)
	      (T
	       <TELL VW>)>
	<TELL " that">
	<COND (<AND .OFF?
		    <MC-VERB-WORD? CLOSE SHUT TURN>>
	       <TELL " off">)
	      (<AND .OFF?
		    <MC-VERB-WORD? BLOW PUT>>
	       <TELL " out">)
	      (<AND <NOT .OFF?>
		    <MC-VERB-WORD? TURN>>
	       <TELL " on">)>
	<COND (<NOT <EQUAL? ,GL-PRSI <> ,TH-HANDS>>
	       <TELL ", " D ,GL-PRSI " or no " D ,GL-PRSI>)>
	<TELL "." CR>
	<RTRUE>>

<ROUTINE V-LAUNCH ()
	<DEBUGGING? <RT-DEBUG-VERB "V-LAUNCH">>
	<COND (<MC-PRSO? ,ROOMS>
	       <COND (<OR <IN? ,CH-PLAYER ,TH-BOAT>
			  <EQUAL? <LOC ,CH-PLAYER> <LOC ,TH-BOAT>>>
		      <RT-LAUNCH-BOAT>)
		     (T
		      <TELL
"That usually works better when one is in a boat." CR>)>
	       <RTRUE>)
	      (<MC-PRSO? ,TH-BOAT>
	       <RT-LAUNCH-BOAT>)
	      (T
	       <TELL
"You can't launch " THEO ". Perhaps you meant to throw it?" CR>)>
	<RTRUE>>

<ROUTINE RT-LAUNCH-BOAT ()
	<COND (<NOT <IN? ,TH-ANCHOR ,TH-BOAT>>
	       <RT-THIS-IS-IT ,TH-ANCHOR>
	       <TELL "The anchor is restraining the boat." CR>)
	      (<NOT <IN? ,CH-PLAYER ,TH-BOAT>>
	       <TELL
"You push the boat into the Thames, and then watch as it slowly floats
away. Too bad you weren't in it." CR>
	       <REMOVE ,TH-BOAT>)
	      (<IN? ,TH-BOAT ,RM-THE-EMBANKMENT>
	       <TELL
"The boat slips away from the Embankment. You are now in the middle of
the Thames." CR>
	       <IFSOUND <SOUNDS ,S-BOATING ,S-START>>
	       <MOVE ,TH-BOAT ,RM-THAMES-ONE>)
	      (<IN? ,TH-BOAT ,RM-OUTSIDE-TRAITORS-GATE>
	       <TELL "The boat slips out into the river." CR>
	       <IFSOUND <SOUNDS ,S-BOATING ,S-START>>
	       <MOVE ,TH-BOAT ,RM-THAMES-FOUR>)
	      (T
	       <TELL "You are already on the Thames. You don't need to
launch the boat again." CR>)>
	<RTRUE>>

<ROUTINE V-MAKE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-MAKE">>
	<COND (<MC-PRSO? ,TH-RUBBINGS>
	       <TELL
"[To make a rubbing, put a blank piece of paper on a tomb, and then rub
the paper with the crayon.]" CR>
	       <RFATAL>)
	      (T
	       <TELL ,K-HOW-TO-MSG CR>)>
	<RTRUE>>

<ROUTINE V-ECHO ;V-MARX ()
	<DEBUGGING? <RT-DEBUG-VERB "V-ECHO">>
	<COND (<EQUAL? ,GL-P-PRSA-WORD ,W?MARX>
	       <TELL "Cocoanuts." CR>)
	      (<EQUAL? ,GL-P-PRSA-WORD ,W?CHICO>
	       <TELL
"\"Wattsa matta you? You needa de password? I sell it you.\"" CR>)
	      (<EQUAL? ,GL-P-PRSA-WORD ,W?GROUCHO>
	       <TELL
"\"Say the secret woid, and the guy will let you in.\"" CR>)
	      (<EQUAL? ,GL-P-PRSA-WORD ,W?GUMMO>
	       <TELL "This isn't a trivia game. Get back to work." CR>)
	      (<EQUAL? ,GL-P-PRSA-WORD ,W?HARPO>
	       <CRLF>)
	      (<EQUAL? ,GL-P-PRSA-WORD ,W?ZEPPO>
	       <TELL
"Did you really think saying \"Zeppo\" was going to get you anywhere?" CR>)
	      (<EQUAL? ,GL-P-PRSA-WORD ,W?PUNT>
	       <TELL
"But it's not even fourth down!" CR>)
	      (<EQUAL? ,GL-P-PRSA-WORD ,W?HUM ,W?WHISTLE ,W?SING>
	       <TELL
"You " VW " tunelessly for a few moments until you remember that
you're tone deaf and know next to nothing about music." CR>)
	      (<EQUAL? ,GL-P-PRSA-WORD ,W?ECHO>
	       <TELL "ECHO...Echo...echo...." CR>)>>

<ROUTINE V-MELT ()
	<DEBUGGING? <RT-DEBUG-VERB "V-MELT">>
	<TELL ,K-HOW-TO-MSG CR>
	<RTRUE>>

<ROUTINE V-MOVE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-MOVE">>
	<COND (<MC-PRSO? ,ROOMS>
	       <V-WALK-AROUND>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-TAKEABLE>
	       <TELL "Moving " THEO " would" <RT-PICK-NEXT ,GL-NO-POINT-TXT> "." CR>
	       <RTRUE>)
	      (T
	       <TELL "You cannot possibly move " THEO "." CR>)>
	<RTRUE>>

<ROUTINE V-MUNG ()
	<DEBUGGING? <RT-DEBUG-VERB "V-MUNG">>
	<RT-NO-POINT-MSG "Trying to destroy">
	<RTRUE>>

<ROUTINE V-OPEN ()
	<DEBUGGING? <RT-DEBUG-VERB "V-OPEN">>
	<COND (<MC-ISNOT? ,GL-PRSO ,FL-OPENABLE>
	       <RT-CANT-OPEN-PRSO-MSG>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-OPENED>
	       <RT-ITS-ALREADY-MSG "open">
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-LOCKED>
	       <RT-OBJECT-IS-LOCKED-MSG>
	       <RTRUE>)
	      (T
	       <RT-YOU-OPEN-MSG>
	       <COND (<MC-IS? ,GL-PRSO ,FL-CONTAINER>
		      <COND (<MC-F? ,GL-NOW-LIT?>
			     <TELL "It is too dark to see inside." CR>)
			    (T
			     <TELL "Inside you see ">
			     <RT-PRINT-CONTENTS-2 ,GL-PRSO>
			     <TELL "." CR>)>)>)>
	<RTRUE>>

<ROUTINE V-OPEN-WITH ()
	<DEBUGGING? <RT-DEBUG-VERB "V-OPEN-WITH">>
	<COND (<NOT <MC-IS? ,GL-PRSO ,FL-OPENABLE>>
	       <RT-CANT-OPEN-PRSO-MSG>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-OPENED>
	       <RT-ITS-ALREADY-MSG "open">
	       <RTRUE>)>
	<RT-CYOU-MSG>
	<TELL "cannot " VW " " THEO " with " THEI "." CR>
	<RTRUE>>

<ROUTINE V-PADDLE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-PADDLE">>
	<COND (<IN? ,GL-WINNER ,TH-BOAT>
	       <COND (<MC-PRSO? ,TH-BOAT ,TH-INTDIR>
		      <TELL ,K-BETTER-SUCCESS-MSG CR>)
		     (T
		      <V-HIT>)>)
	      (<MC-PRSO? ,TH-INTDIR>
	       <RT-CYOU-MSG "are" "is">
	       <TELL "not in a boat." CR>)
	      (T
	       <V-HIT>)>>

<ROUTINE V-PADDLE-WITH ()
	<DEBUGGING? <RT-DEBUG-VERB "V-PADDLE-WITH">>
	<COND (<MC-PRSI? ,TH-VIOLIN>
	       <TELL
"How could you even THINK of using such a beautiful instrument in such a
manner?" CR>)
	      (<IN? ,GL-WINNER ,TH-BOAT>
	       <COND (<MC-PRSO? ,TH-INTDIR>
		      <RT-CYOU-MSG "are" "is">
		      <TELL "not in a boat." CR>)
		     (T
		      <TELL ,K-BETTER-SUCCESS-MSG CR>)>)
	      (<MC-PRSO? ,TH-INTDIR>
	       <RT-CYOU-MSG>
	       <TELL "can't paddle anywhere with " THEI "." CR>)
	      (T
	       <V-HIT>)>>

<ROUTINE V-PASSWORD ("AUX" WRD)
	<DEBUGGING? <RT-DEBUG-VERB "V-PASSWORD">>
	<SET WRD <GET ,GL-P-NAMW 0>>
	<COND (<EQUAL? .WRD ,W?SWORDFISH>
	       <RT-PERFORM ,V?SWORDFISH>)
	      (<EQUAL? .WRD ,W?PARR>
	       <RT-PERFORM ,V?PARR>)
	      (<EQUAL? .WRD ,W?CLEVES>
	       <RT-PERFORM ,V?CLEVES>)
	      (<EQUAL? .WRD ,W?ARAGON>
	       <RT-PERFORM ,V?ARAGON>)
	      (<EQUAL? .WRD ,W?HOWARD>
	       <RT-PERFORM ,V?HOWARD>)
	      (<EQUAL? .WRD ,W?SEYMOUR>
	       <RT-PERFORM ,V?SEYMOUR>)
	      (<EQUAL? .WRD ,W?BOLEYN>
	       <RT-PERFORM ,V?BOLEYN>)
	      (<EQUAL? .WRD ,W?GIN>
	       <RT-PERFORM ,V?GIN>)
	      (T
	       <TELL "\"No, it isn't.\"" CR>)>>

<ROUTINE V-PAY ()
	<DEBUGGING? <RT-DEBUG-VERB "V-PAY">>
	<RT-PERFORM ,V?GIVE ,GL-PRSI ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-PICK ()
	<DEBUGGING? <RT-DEBUG-VERB "V-PICK">>
	<COND (<MC-IS? ,GL-PRSO ,FL-OPENABLE>
	       <RT-YOURE-NOT-A-MSG "locksmith">)
	      (T
	       <RT-IMPOSSIBLE-MSG>)>
	<RTRUE>>

<ROUTINE V-PLAY ()
	<DEBUGGING? <RT-DEBUG-VERB "V-PLAY">>
	<COND (<MC-PRSO? ,ROOMS>
	       <TELL "That would">
	       <RT-WASTE-OF-TIME-MSG>)
	      (T
	       <RT-NO-POINT-MSG "Playing with">)>
	<RTRUE>>

<ROUTINE V-PLUG ()
	<DEBUGGING? <RT-DEBUG-VERB "V-PLUG">>
	<RT-CYOU-MSG>
	<TELL "cannot ">
	<PRINTB ,GL-P-PRSA-WORD>
	<TELL " " THEO " into ">
	<COND (<MC-T? ,GL-PRSI>
	       <TELL THEI>)
	      (T
	       <TELL "anything">)>
	<TELL "." CR>
	<RTRUE>>

<ROUTINE V-POCKET ()
	<DEBUGGING? <RT-DEBUG-VERB "V-POCKET">>
	<RT-PERFORM ,V?PUT ,GL-PRSO ,TH-POCKET>
	<RTRUE>>

<ROUTINE V-POINT ()
	<DEBUGGING? <RT-DEBUG-VERB "V-POINT">>
	<RT-NO-POINT-MSG "Pointing at">
	<RTRUE>>

<ROUTINE V-POINT-AT ()
	<DEBUGGING? <RT-DEBUG-VERB "V-POINT-AT">>
	<RT-NO-POINT-MSG "Pointing">
	<RTRUE>>

<ROUTINE V-POINT-AT-SWP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-POINT-AT-SWP">>
	<RT-NO-POINT-MSG "Pointing">
	<RFATAL>>

<ROUTINE V-POUR ()
	<DEBUGGING? <RT-DEBUG-VERB "V-POINT">>
	<COND (<MC-PRSO? ,TH-HANDS>
	       <TELL "[To do that, just DROP EVERYTHING.]" CR>
	       <RFATAL>)
	      (<MC-PRSO? ,TH-POCKET>
	       <RT-YOUD-HAVE-TO-MSG "take off" ,TH-CLOTHES>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-SURFACE>
	       <RT-EMPTY-PRSO-MSG <>>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-CONTAINER>
	       <COND (<MC-IS? ,GL-PRSO ,FL-OPENED>
		      <RT-EMPTY-PRSO-MSG <>>
		      <RTRUE>)>
	       <RT-ITS-CLOSED-MSG>
	       <RTRUE>)
	      (T
	       <RT-CYOU-MSG>
	       <TELL "cannot empty ">
	       <RT-SAY-HIM-HER-THEM-IT-MSG>
	       <TELL "." CR>)>
	<RTRUE>>

<ROUTINE V-POUR-FROM ()
	<DEBUGGING? <RT-DEBUG-VERB "V-POUR-FROM">>
	<COND (<MC-PRSI? ,TH-HANDS>
	       <RT-PERFORM ,V?DROP ,GL-PRSO>
	       <RTRUE>)
	      (<MC-PRSI? ,TH-POCKET>
	       <RT-YOUD-HAVE-TO-MSG "take off" ,TH-CLOTHES>
	       <RTRUE>)
	      (<AND <NOT <MC-IS? ,GL-PRSI ,FL-CONTAINER>>
		    <NOT <MC-IS? ,GL-PRSI ,FL-SURFACE>>>
	       <TELL "You cannot">
	       <PRINTB ,GL-P-PRSA-WORD>
	       <TELL " things from " A ,GL-PRSI "." CR>
	       <RTRUE>)
	      (<AND <MC-IS? ,GL-PRSI ,FL-CONTAINER>
		    <NOT <MC-IS? ,GL-PRSI ,FL-OPENED>>>
	       <RT-ITS-CLOSED-MSG ,GL-PRSI>
	       <RTRUE>)
	      (<IN? ,GL-PRSO ,GL-PRSI>
	       <COND (<MC-IS? ,GL-PRSO ,FL-TAKEABLE>
		      <TELL CTHEO " ">
		      <RT-LANDS-AT-YOUR-FEET-MSG>
		      <RTRUE>)>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (T
	       <TELL CTHEO>
	       <RT-ISNT-ARENT-MSG ,GL-PRSO>
	       <TELL "in " THEI "." CR>)>
	<RTRUE>>

<ROUTINE V-PRAY ()
	<DEBUGGING? <RT-DEBUG-VERB "V-PRAY">>
	<TELL "Good idea. You could use the help." CR>
	<RTRUE>>

<ROUTINE V-PULL ()
	<DEBUGGING? <RT-DEBUG-VERB "V-PULL">>
	<RT-NO-POINT-MSG "Pulling on">
	<RTRUE>>

<ROUTINE V-PUSH ()
	<DEBUGGING? <RT-DEBUG-VERB "V-PUSH">>
	<RT-NO-POINT-MSG "Pushing around">
	<RTRUE>>

<ROUTINE V-PUSH-TO ()
	<DEBUGGING? <RT-DEBUG-VERB "V-PUSH-TO">>
	<COND (<AND <MC-PRSO? ,TH-HANDS>
		    <MC-T? ,GL-PRSI>>
	       <RT-PERFORM ,V?REACH-IN ,GL-PRSI>
	       <RTRUE>)>
	<RT-CYOU-MSG>
	<TELL "cannot push " THEO " around like that." CR>
	<RTRUE>>

<ROUTINE V-PUT ("AUX" L WRD)
	<DEBUGGING? <RT-DEBUG-VERB "V-PUT">>
	<SET L <LOC ,GL-PRSO>>
	<COND (<EQUAL? .L ,GLOBAL-OBJECTS>
	       <TELL "That would">
	       <RT-WASTE-OF-TIME-MSG>)
	      (<MC-IS? ,GL-PRSO ,FL-BODYPART>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (<AND <OR <RT-IDENTIFY-FLOOR? ,W?FLOOR ,GL-PRSI>
			<RT-IDENTIFY-FLOOR? ,W?GROUND ,GL-PRSI>>>
	       <MOVE ,GL-PRSO ,GL-PLACE-CUR>
	       <COND (<MC-T? ,GL-P-MULT?>
		      <TELL "Done." CR>)
		     (T
		      <RT-CYOU-MSG "put" "puts">
		      <TELL THEO>
		      <RT-IN-ON-MSG ,GL-PRSI>
		      <TELL THEI "." CR>)>
	       <RTRUE>)
	      (<OR <MC-F? .L>
		   <AND <MC-T? ,GL-PRSI>
			<MC-ISNOT? ,GL-PRSI ,FL-SURFACE>
			<MC-ISNOT? ,GL-PRSI ,FL-CONTAINER>
			<MC-ISNOT? ,GL-PRSI ,FL-OPENED>
			<MC-ISNOT? ,GL-PRSI ,FL-OPENABLE>>>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (<AND <MC-ISNOT? ,GL-PRSI ,FL-OPENED>
		    <MC-ISNOT? ,GL-PRSI ,FL-SURFACE>>
	       <TELL CTHEI>
	       <RT-ISNT-ARENT-MSG ,GL-PRSI>
	       <TELL "open." CR>
	       <RTRUE>)
	      (<RT-ROOM-IN-ON-MSG? ,GL-PRSO ,GL-PRSI> T)
	      (<NOT <EQUAL? .L ,GL-WINNER>>
	       <TELL "Maybe">
	       <RT-YOU-MSG>
	       <TELL "should take " THEO>
	       <RT-OUT-OFF-MSG .L>
	       <TELL THE .L " first." CR>
	       <RTRUE>)
	      (T
	       <MOVE ,GL-PRSO ,GL-PRSI>
	       <MC-MAKE ,GL-PRSO ,FL-TOUCHED>
	       <COND (<AND <MC-IS? ,GL-PRSI ,FL-CONTAINER>
			   <RT-PUT-OUT ,GL-PRSO>>
		      <RTRUE>)
		     (<MC-T? ,GL-P-MULT?>
		      <TELL "Done." CR>)
		     (T
		      <RT-CYOU-MSG "put" "puts">
		      <TELL THEO>
		      <RT-IN-ON-MSG ,GL-PRSI>
		      <TELL THEI "." CR>)>)>>

<ROUTINE V-PUT-BEHIND ()
	<DEBUGGING? <RT-DEBUG-VERB "V-PUT-BEHIND">>
	<TELL "That hiding place is too obvious." CR>
	<RTRUE>>

<ROUTINE V-PUT-ON ()
	<DEBUGGING? <RT-DEBUG-VERB "V-PUT-ON">>
	<COND (<MC-PRSI? ,CH-ME ,CH-PLAYER>
	       <RT-PERFORM ,V?WEAR ,GL-PRSO>
	       <RTRUE>)>
	<V-PUT>
	<RTRUE>>

<ROUTINE V-PUT-UNDER ()
	<DEBUGGING? <RT-DEBUG-VERB "V-PUT-UNDER">>
	<RT-CYOU-MSG>
	<TELL "cannot put anything under ">
	<RT-SAY-HIM-HER-THEM-IT-MSG>
	<TELL "." CR>
	<RTRUE>>

<ROUTINE V-QUESTION ()
	<DEBUGGING? <RT-DEBUG-VERB "V-QUESTION">>
	<COND (<EQUAL? ,GL-WINNER ,CH-PLAYER>
	       <RT-TO-DO-THING-USE-MSG "ask about" "ASK CHARACTER ABOUT">
	       <RFATAL>)>
	<RT-NO-RESPONSE-MSG>
	<RTRUE>>

<ROUTINE V-RAISE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-RAISE">>
	<COND (<MC-PRSO? ,ROOMS>
	       <V-STAND>
	       <RTRUE>)
	      (T
	       <RT-NO-POINT-MSG "Toying in this way with">)>
	<RTRUE>>

<ROUTINE V-REACH-IN ("AUX" OBJ)
	<DEBUGGING? <RT-DEBUG-VERB "V-REACH-IN">>
	<SET OBJ <FIRST? ,GL-PRSO>>
	<COND (<OR <MC-IS? ,GL-PRSO ,FL-PERSON>
		   <MC-IS? ,GL-PRSO ,FL-ALIVE>>
	       <RT-YOURE-NOT-A-MSG "surgeon">
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-DOOR>
	       <COND (<MC-IS? ,GL-PRSO ,FL-OPENED>
		      <TELL "You reach into " THEO ", but experience nothing "
<RT-PICK-NEXT ,GL-BORING-TXT> "." CR>
		      <RTRUE>)>
	       <RT-ITS-CLOSED-MSG>
	       <RTRUE>)
	      (<NOT <MC-IS? ,GL-PRSO ,FL-CONTAINER>>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (<NOT <MC-IS? ,GL-PRSO ,FL-OPENED>>
	       <TELL "It's not open." CR>
	       <RTRUE>)
	      (<OR <MC-F? .OBJ>
		   <NOT <MC-IS? .OBJ ,FL-TAKEABLE>>>
	       <COND (<AND <MC-IS? ,GL-PRSO ,FL-PLURAL>
			   <MC-ISNOT? ,GL-PRSO ,FL-COLLECTIVE>>
		      <TELL "They're">)
		     (T
		      <TELL "It's">)>
	       <TELL " empty." CR>
	       <RTRUE>)
	      (T
	       <SETG GL-P-IT-OBJECT .OBJ>
	       <TELL "You ">
	       <COND (<MC-PRSO? ,TH-EARS>
		      <TELL "put your hands to ">)
		     (T
		      <TELL "reach into ">)>
	       <TELL THEO ". There's something in there." CR>)>
	<RTRUE>>

<ROUTINE V-READ ()
	<DEBUGGING? <RT-DEBUG-VERB "V-READ">>
	<COND (<MC-F? ,GL-NOW-LIT?>
	       <TELL ,K-TOO-DARK-MSG CR>
	       <RFATAL>)
	      (<NOT <MC-IS? ,GL-PRSO ,FL-READABLE>>
	       <RT-HOW-READ-MSG>
	       <TELL "?" CR>
	       <RTRUE>)
	      (T
	       <TELL "There's nothing written on it." CR>)>
	<RTRUE>>

<ROUTINE V-READ-TO ()
	<DEBUGGING? <RT-DEBUG-VERB "V-READ-TO">>
	<COND (<MC-F? ,GL-NOW-LIT?>
	       <TELL ,K-TOO-DARK-MSG CR>
	       <RFATAL>)
	      (<NOT <MC-IS? ,GL-PRSO ,FL-READABLE>>
	       <RT-HOW-READ-MSG>
	       <TELL " to " A ,GL-PRSI "?" CR>
	       <RTRUE>)
	      (<EQUAL? ,GL-WINNER ,CH-PLAYER>
	       <RT-NOT-LIKELY-MSG ,GL-PRSI "would appreciate your reading">
	       <RTRUE>)
	      (T
	       <TELL "Maybe you ought to do it." CR>)>
	<RTRUE>>

<ROUTINE V-READ-TO-SWP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-READ-TO-SWP">>
	<RT-PERFORM ,V?READ-TO ,GL-PRSI ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-REFUSE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-REFUSE">>
	<COND (<NOT <MC-IS? ,GL-PRSO ,FL-TAKEABLE>>
	       <TELL "That would">
	       <RT-WASTE-OF-TIME-MSG>
	       <RTRUE>)>
	<TELL "How could you turn down such a tempting " D ,GL-PRSO "?" CR>
	<RTRUE>>

<ROUTINE V-RELEASE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-RELEASE">>
	<COND (<IN? ,GL-PRSO ,GL-WINNER>
	       <RT-PERFORM ,V?DROP ,GL-PRSO>
	       <RTRUE>)
	      (T
	       <COND (<MC-PRSO? ,CH-ME ,CH-PLAYER>
		      <TELL "You aren't ">)
		     (T
		      <TELL CTHEO>
		      <RT-ISNT-ARENT-MSG>)>
	       <TELL "confined by anything." CR>)>
	<RTRUE>>

<ROUTINE V-REPAIR ()
	<DEBUGGING? <RT-DEBUG-VERB "V-REPAIR">>
	<COND (<AND <MC-PRSO? ,TH-LAMP ,TH-ETHERIUM-AMPOULE>
		    <MC-IS? ,GL-PRSO ,FL-BROKEN>>
	       <TELL CTHEO " is hopelessly beyond repair." CR>
	       <RTRUE>)
	      (<MC-PRSO? ,CH-ME ,CH-PLAYER>
	       <TELL "You aren't ">)
	      (T
	       <TELL CTHEO>
	       <RT-ISNT-ARENT-MSG>)>
	<TELL "in need of repair." CR>
	<RTRUE>>

<ROUTINE V-REPLACE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-REPLACE">>
	<COND (<MC-PRSO? ,CH-ME ,CH-PLAYER>
	       <TELL "Easily done." CR>
	       <RTRUE>)
	      (T
	       <TELL CTHEO>
	       <RT-DONT-DOESNT-MSG ,GL-PRSO>
	       <TELL "need replacement." CR>)>
	<RTRUE>>

<ROUTINE V-REPLY ("AUX" WHO)
	<DEBUGGING? <RT-DEBUG-VERB "V-REPLY">>
	<COND (<RT-FOOLISH-TO-TALK-MSG>
	       <RFATAL>)>
	<RT-NO-RESPONSE-MSG>
	<RTRUE>>

<ROUTINE V-RESCUE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-RESCUE">>
	<COND (<MC-PRSO? ,CH-ME ,CH-PLAYER>
	       <COND 
		(<EQUAL? ,GL-WINNER ,CH-PLAYER>
		 <V-HINT>
		 <RTRUE>)>
	       <TELL ,K-HOW-TO-MSG CR>
	       <RTRUE>)>
	<TELL CTHEO>
	<RT-DONT-DOESNT-MSG ,GL-PRSO>
	<TELL "need any help." CR>
	<RTRUE>>

<ROUTINE V-RIDE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-RIDE">>
	<COND (<MC-IS? ,GL-PRSO ,FL-ALIVE>
	       <RT-NOT-LIKELY-MSG ,GL-PRSO "wants to play piggyback">
	       <RTRUE>)
	      (T
	       <TELL "You cannot ride that." CR>)>
	<RTRUE>>

<ROUTINE V-RING ()
	<DEBUGGING? <RT-DEBUG-VERB "V-RING">>
	<COND (<MC-PRSO? ,TH-BELL>
	       <COND 
		(<RT-ALARM-SET? ,RT-I-SWING-BELL>
		 <TELL "The bell is already ringing." CR>)
		(T
		 <TELL "The bell is too heavy for you to move,
but your effort makes it vibrate softly." CR>)>)
	      (T
	       <RT-IMPOSSIBLE-MSG>)>
	<RTRUE>>

<ROUTINE V-RIP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-RIP">>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>>

<ROUTINE V-ROB ()
	<DEBUGGING? <RT-DEBUG-VERB "V-ROB">>
	<RT-PERFORM ,V?STEAL ,GL-PRSI ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-ROW ()
  <DEBUGGING? <RT-DEBUG-VERB "V-ROW">>
  <COND (<IN? ,CH-PLAYER ,TH-BOAT>
	 <TELL "You'd have better success if you launched the boat first."
	       CR>)
	(<MC-PRSO? ,TH-INTDIR>
	 <RT-CYOU-MSG "are" "is">
	 <TELL "not in a boat." CR>)
	(T
	 <RT-IMPOSSIBLE-MSG>)>
  <RTRUE>>

<ROUTINE V-RUB-WITH ()
	<DEBUGGING? <RT-DEBUG-VERB "V-RUB-WITH">>
	<RT-NO-POINT-MSG "Rubbing">
	<RTRUE>>

<ROUTINE V-SAY ("AUX" WRD)
	<DEBUGGING? <RT-DEBUG-VERB "V-SAY">>
	<COND (<EQUAL? ,GL-WINNER ,CH-PLAYER>
	       <COND (<RT-ANYONE-HERE?>
		      <SET WRD <GET ,GL-P-NAMW 0>>
		      <COND 
		       (<EQUAL? .WRD ,W?SWORDFISH>
			<RT-PERFORM ,V?SWORDFISH>)
		       (<EQUAL? .WRD ,W?PARR>
			<RT-PERFORM ,V?PARR>)
		       (<EQUAL? .WRD ,W?CLEVES>
			<RT-PERFORM ,V?CLEVES>)
		       (<EQUAL? .WRD ,W?ARAGON>
			<RT-PERFORM ,V?ARAGON>)
		       (<EQUAL? .WRD ,W?HOWARD>
			<RT-PERFORM ,V?HOWARD>)
		       (<EQUAL? .WRD ,W?SEYMOUR>
			<RT-PERFORM ,V?SEYMOUR>)
		       (<EQUAL? .WRD ,W?BOLEYN>
			<RT-PERFORM ,V?BOLEYN>)
		       (<EQUAL? .WRD ,W?GIN>
			<RT-PERFORM ,V?GIN>)
		       (T
			<RT-WAY-TO-TALK-MSG>)>
		      <RTRUE>)>
	       <RT-TALK-TO-SELF-MSG>
	       <RTRUE>)>
	<RT-NO-RESPONSE-MSG>
	<RTRUE>>

<ROUTINE V-SEARCH ()
	<DEBUGGING? <RT-DEBUG-VERB "V-SEARCH">>
	<COND (<MC-IS? ,GL-PRSO ,FL-CONTAINER>
	       <COND (<AND <NOT <MC-IS? ,GL-PRSO ,FL-OPENED>>
			   <NOT <MC-IS? ,GL-PRSO ,FL-TRANSPARENT>>>
		      <RT-YOUD-HAVE-TO-MSG "open" ,GL-PRSO>
		      <RTRUE>)
		     (T
		      <TELL "You see ">
		      <RT-PRINT-CONTENTS-2 ,GL-PRSO>
		      <TELL " inside " THEO "." CR>)>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-SURFACE>
	       <TELL "You see ">
	       <RT-PRINT-CONTENTS-2 ,GL-PRSO>
	       <TELL " on " THEO "." CR>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-PERSON>
	       <RT-PERFORM ,V?USE ,GL-PRSO>
	       <RTRUE>) 
	      (T
	       <RT-NOTHING-INTERESTING-MSG>
	       <TELL "." CR>)>
	<RTRUE>>

<ROUTINE V-SELL ()
      <DEBUGGING? <RT-DEBUG-VERB "V-SELL">>
      <COND (<NOT <EQUAL? ,GL-WINNER ,CH-PLAYER>>
	     <RT-NOT-LIKELY-MSG ,GL-WINNER "is interested in selling anything">
	     <RTRUE>)
	    (<MC-PRSI? ,GL-PRSO ,CH-ME ,CH-PLAYER ,GL-WINNER>
	     <RT-IMPOSSIBLE-MSG>
	     <RTRUE>)
	    (<NOT <MC-IS? ,GL-PRSI ,FL-PERSON>>
	     <RT-NOT-LIKELY-MSG ,GL-PRSI "would buy anything">
	     <RTRUE>)>
      <RT-YOURE-NOT-A-MSG "salesperson">
      <RTRUE>>

<ROUTINE V-SELL-SWP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-SELL-SWP">>
	<RT-PERFORM ,V?SELL ,GL-PRSI ,GL-PRSO>
	<RTRUE>>


<ROUTINE V-SHAKE ("AUX" X)
	<DEBUGGING? <RT-DEBUG-VERB "V-SHAKE">>
	<COND (<MC-IS? ,GL-PRSO ,FL-PERSON>
	       <RT-PERFORM ,V?ALARM ,GL-PRSO>)
	      (<AND <NOT <MC-IS? ,GL-PRSO ,FL-TAKEABLE>>
		    <NOT <MC-IS? ,GL-PRSO ,FL-TRYTAKE>>>
	       <RT-NO-POINT-MSG "Shaking">)
	      (T
	       <TELL "That would">
	       <RT-WASTE-OF-TIME-MSG>)>
	<RTRUE>>

<ROUTINE V-SHINE-AT ()
	<DEBUGGING? <RT-DEBUG-VERB "V-SHINE-AT">>
	<TELL "You cannot illuminate anything with " A ,GL-PRSO "." CR>
	<RTRUE>>

<ROUTINE V-SHINE-AT-SWP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-SHINE-AT-SWP">>
	<RT-PERFORM ,V?SHINE-AT ,GL-PRSI ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-SHOOT ("AUX" NUM)
	<DEBUGGING? <RT-DEBUG-VERB "V-SHOOT">>
	<COND (<MC-PRSO? ,TH-GUN>
	       <TELL "BANG!! The bullet barely misses your foot." CR>
	       <RTRUE>)
	      (<OR <MC-IS? ,GL-PRSO ,FL-PERSON>
		   <==? ,GL-PRSO ,TH-GENERIC-BODY>>
	       <COND (<FSET? ,GL-PRSO ,FL-NEEDS-IDENTITY>
		      <PUTP ,GL-PRSO ,P?OBJ-NOUN 0>
		      <PUTP ,GL-PRSO ,P?OBJ-ADJ 0>)>
	       <TELL "You shoot ">
	       <COND (<N==? ,GL-PRSO ,TH-GENERIC-BODY>
		      <TELL "and kill ">)>
	       <TELL THE ,GL-PRSO ". Inspector Lestrade ">
	       <COND  (<IN? ,CH-PLAYER ,TH-BOAT>
		       <TELL "pulls up alongside you in a Scotland Yard launch">)
		      (T
		       <TELL "appears out of nowhere">)>
	       <TELL " and says,">
	       <COND (<MC-PRSO? ,CH-HOLMES>
		      <TELL ,K-PLUG-HIM-MYSELF-MSG>)
		     (T
		      <TELL
" \"You may be on our side, doctor, but killing people is still against
the law. I'm afraid I'm going to have to arrest you.\"">)>
	       <TELL CR CR ,K-LESTRADE-ARRESTS-MSG CR CR>
	       <RT-QSR>)
	      (<MC-PRSO? ,TH-SAPPHIRE ,TH-EMERALD ,TH-OPAL 
			 ,TH-RUBY ,TH-TOPAZ ,TH-GARNET>
	       <REMOVE ,GL-PRSO>
	       <TELL "You shoot " THEO ", which shatters and disappears." CR>)
	      (<MC-PRSO? ,TH-CROWN-JEWELS>
	       <TELL 
"The jewels shatter and Holmes throws up his arms in exasperation.
\"That's it, Watson. You have pushed me to the limit.\" He leaps for
your throat, and the ensuing struggle attracts the attention of the
local constabulary, with what should by now be predictable results." CR CR>
	       <RT-QSR>)
	      (<OR <MC-PRSO? ,TH-SHAFT>
		   <AND <MC-PRSO? ,PSEUDO-OBJECT>
			<==? <GETP ,PSEUDO-OBJECT ,P?ACTION>
			     ,RT-AC-TH-FIREPLACE>>>
	       <TELL "The bullet disappears into " THEO "." CR>)
	      (<OR <MC-PRSO? ,TH-INTNUM ,TH-INTDIR>
		   <IN? ,GL-PRSO ,ROOMS>>
	       <RT-IMPOSSIBLE-MSG>)
	      (<MC-IS? ,GL-PRSO ,FL-PLURAL>
	       <TELL "There are so many of them, you don't know where to begin." CR>)
	      (<MC-IS? ,GL-PRSO ,FL-MONEY>
	       <TELL
"You take aim at " THEO ", but your frugal nature prevents you from going
through with it." CR>)
	      (T
	       <SET NUM <GET ,GL-HOLES 0>>
	       <PUT ,GL-HOLES <+ <* .NUM 2> 1> ,GL-PRSO>
	       <COND (<EQUAL? <LOC ,GL-PRSO> ,LOCAL-GLOBALS ,ROOMS
					 		,GLOBAL-OBJECTS>
		      <PUT ,GL-HOLES <+ <* .NUM 2> 2> ,GL-PLACE-CUR>)>
	       <PUT ,GL-HOLES 0 <+ .NUM 1>>
	       <TELL "The bullet puts a neat hole in " THEO "." CR>)>>

<ROUTINE V-SHOOT-SWP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-SHOOT-SWP">>
	<RT-PERFORM ,V?SHOOT ,GL-PRSI ,GL-PRSO>
	<RTRUE>>
	
<ROUTINE V-SHOW ()
	<DEBUGGING? <RT-DEBUG-VERB "V-SHOW">>
	<COND (<MC-IS? ,GL-PRSI ,FL-ASLEEP>
	       <TELL CTHEI>
	       <RT-IS-ARE-MSG ,GL-PRSI>
	       <TELL
"in no condition to appreciate " THEO "." CR>)
	      (<MC-PRSI? ,CH-ME ,CH-PLAYER>
	       <RT-PERFORM ,V?EXAMINE ,GL-PRSO>)
	      (T
	       <TELL CTHEI " glance">
	       <RT-S-NOS-MSG ,GL-PRSI>
	       <TELL " at " THEO ", but makes no comment." CR>)>
	<RTRUE>>

<ROUTINE V-SHOW-SWP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-SHOW-SWP">>
	<RT-PERFORM ,V?SHOW ,GL-PRSI ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-SIT ()
	<DEBUGGING? <RT-DEBUG-VERB "V-SIT">>
	<COND (<OR <RT-IDENTIFY-FLOOR? ,W?GROUND ,GL-PRSO>
		   <RT-IDENTIFY-FLOOR? ,W?FLOOR ,GL-PRSO>
		   <MC-PRSO? ,ROOMS>
		   <MC-IS? ,GL-PRSO ,FL-SURFACE>>
	       <TELL ,K-NO-RESTING-MSG CR>)
	      (T
	       <RT-IMPOSSIBLE-MSG>)>
	<RTRUE>>

<ROUTINE V-SMELL ("AUX" (OBJ <>))
     <DEBUGGING? <RT-DEBUG-VERB "V-SMELL">>
     <COND (<OR <RT-IDENTIFY-FLOOR? ,W?SKY ,GL-PRSO>
		<EQUAL? ,GL-PRSO ,ROOMS>>
	    ;<SET OBJ <GETP ,GL-PLACE-CUR ,P?ODOR>>
	    ;"ODOR property never used"
	    <TELL "You do not smell anything " <RT-PICK-NEXT ,GL-BORING-TXT>
"." CR>
	    <RTRUE>
	    ;<COND (<MC-F? .OBJ>
		    <TELL "You do not smell anything "
			  <RT-PICK-NEXT ,GL-BORING-TXT> "." CR>
		    <RTRUE>)
		   (T
		    <RT-PERFORM ,V?SMELL .OBJ>
		    <RTRUE>)>)
	   (<MC-PRSO? ,TH-BUNG ,TH-MALMSEY ,TH-MALMSEY-POOL ,TH-BUTT-OF-MALMSEY ;,TH-EMPTY-BUTT-OF-MALMSEY ,TH-GARNET>
	    <TELL ,K-EAU-DE-MSG CR>)
	   (T
	    <TELL "It smells just like " A ,GL-PRSO "." CR>)>
     <RTRUE>>

<ROUTINE V-SMOKE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-SMOKE">>
	<RT-CYOU-MSG>
	<TELL "cannot smoke " THEO "." CR>
	<RTRUE>>

<ROUTINE V-SPIN ()
	<DEBUGGING? <RT-DEBUG-VERB "V-SPIN">>
	<COND (<MC-PRSO? ,ROOMS>
	       <TELL ,K-DIZZY-MSG CR>
	       <RTRUE>)
	      (T
	       <TELL "You cannot spin ">
	       <RT-SAY-HIM-HER-THEM-IT-MSG>
	       <TELL "." CR>)>
	<RTRUE>>

<ROUTINE V-STAND ()
	<DEBUGGING? <RT-DEBUG-VERB "V-STAND">>
	<TELL "You are already standing." CR>
	<RTRUE>>

<ROUTINE V-STAND-ON ()
	<DEBUGGING? <RT-DEBUG-VERB "V-STAND-ON">>
	<TELL "Standing on " THEO " would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>>

<ROUTINE V-STAND-UNDER ()
	<DEBUGGING? <RT-DEBUG-VERB "V-STAND-UNDER">>
	<RT-IMPOSSIBLE-MSG>
	<RTRUE>>

<ROUTINE V-STEAL ()
	<DEBUGGING? <RT-DEBUG-VERB "V-STEAL">>
	<TELL ,K-THEFT-MSG CR>
	<RTRUE>>

<ROUTINE V-STRIKE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-STRIKE">>
	<V-HIT>
	<RTRUE>>

<ROUTINE V-SWIM ()
	<DEBUGGING? <RT-DEBUG-VERB "V-SURFACE">>
	<COND (<MC-PRSO? ,ROOMS>
	       <COND (<MC-HERE? ,RM-THE-EMBANKMENT ,RM-SWAN-LANE ,RM-LONDON-BRIDGE>
		      <TELL "Yuck! Have you looked at that water?" CR>)
		     (T
		      <TELL ,K-NO-SWIM-MSG CR>
		      <RTRUE>)>)
	      (<AND <MC-PRSO? ,TH-INTDIR>
		    <MC-T? ,GL-P-DIRECTION>
		    <EQUAL? ,GL-WINNER ,CH-PLAYER>>
	       <TELL "You cannot ">
	       <PRINTB ,GL-P-PRSA-WORD>
	       <TELL " that way from here." CR>
	       <RTRUE>)
	      (T
	       <RT-IMPOSSIBLE-MSG>)> 
	<RTRUE>>

<ROUTINE V-SWING ()
	<DEBUGGING? <RT-DEBUG-VERB "V-SWING">>
	<COND (<MC-F? ,GL-PRSI>
	       <TELL "That would">
	       <RT-WASTE-OF-TIME-MSG>
	       <RTRUE>)
	      (T
	       <RT-PERFORM ,V?KILL ,GL-PRSI ,GL-PRSO>)>
	<RTRUE>>

<ROUTINE V-TAKE ("AUX" L)
	<DEBUGGING? <RT-DEBUG-VERB "V-TAKE">>
	<COND (<EQUAL? ,GLOBAL-OBJECTS <LOC ,GL-PRSO>>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (,GL-PRSI
	       <COND (<EQUAL? ,GLOBAL-OBJECTS <LOC ,GL-PRSI>>
		      <RT-IMPOSSIBLE-MSG>
		      <RTRUE>)>)
	      (<MC-IS? ,GL-PRSO ,FL-WORN>
	       <RT-PERFORM ,V?TAKE-OFF ,GL-PRSO>
	       <RTRUE>)>
	<SET L <RT-ITAKE>>
	<COND (<MC-T? .L>
	       <COND (<MC-T? ,GL-P-MULT?>
		      <TELL "Taken." CR>)
		     (<OR <MC-IS? .L ,FL-CONTAINER>
			  <MC-IS? .L ,FL-SURFACE>
			  <MC-IS? .L ,FL-PERSON>
			  <MC-IS? .L ,FL-ALIVE>>
		      <RT-CYOU-MSG "take" "takes">
		      <TELL THEO>
		      <RT-OUT-OFF-MSG .L>
		      <TELL THE .L "." CR>)
		     (T
		      <RT-CYOU-MSG "take" "takes">
		      <TELL THEO "." CR>)>
	       <SET L <GETP ,GL-PRSO ,P?VALUE>>
	       <COND (<MC-T? .L>
		      <PUTP ,GL-PRSO ,P?VALUE 0>
		      <RT-TOPAZ-MSG>
		      <RT-UPDATE-SCORE .L>
		      <RT-UPDATE-STATUS-LINE>)>)>
	<RTRUE>>

<ROUTINE V-TAKE-OFF ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TAKE-OFF">>
	<COND (<MC-PRSO? ,TH-CLOTHES ,TH-FEET>
	       <TELL ,K-INAPPROPRIATE-MSG CR>
	       <RTRUE>)
	      (<MC-IS? ,GL-PRSO ,FL-TAKEABLE>
	       <COND (<AND <IN? ,GL-PRSO ,GL-WINNER>
			   <MC-IS? ,GL-PRSO ,FL-WORN>>
		      <MC-UNMAKE ,GL-PRSO ,FL-WORN>
		      <TELL "You take off " THEO "." CR>
		      <RTRUE>)
		     (T
		      <RT-PERFORM ,V?TAKE ,GL-PRSO>
		      <RTRUE>)>)
	      (<MC-IS? ,GL-PRSO ,FL-VEHICLE>
	       <RT-PERFORM ,V?EXIT ,GL-PRSO>
	       <RTRUE>)
	      (T
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)>>

<ROUTINE V-TAKE-WITH ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TAKE-WITH">>
	<TELL ,K-HOW-TO-MSG CR>
	<RTRUE>>

<ROUTINE V-TASTE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TASTE">>
	<RT-PERFORM ,V?EAT ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-TELL ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TELL">>
	<COND (<RT-FOOLISH-TO-TALK-MSG>
	       <RFATAL>)
	      (<MC-PRSO? ,CH-ME ,CH-PLAYER>
	       <COND (<EQUAL? ,GL-WINNER ,CH-PLAYER>
		      <RT-TALK-TO-SELF-MSG>
		      <RTRUE>)
		     (T
		      <RT-NO-RESPONSE-MSG>
		      <RTRUE>)>)
	      (T
	       <SETG GL-P-QCONTEXT-TH ,GL-PRSO>
	       <SETG GL-P-QCONTEXT-RM <LOC ,GL-PRSO>>
	       <COND (<MC-T? ,GL-P-CONT>
		      <SETG GL-WINNER ,GL-PRSO>
		      <RT-THIS-IS-IT ,GL-PRSO>
		      <SETG GL-CLOCK-WAIT T>
		      ; "Turn quotes into buzzwords, the better to parse
			 this crap with"
		      <REPEAT ((N ,GL-P-CONT) (M ,GL-P-LEN) WRD)
		        <COND (<==? <SET WRD <ZGET ,GL-P-P-LEX .N>> ,W?QUOTE>
			       <ZPUT ,GL-P-P-LEX .N ,W?THE>)
			      (<EQUAL? .WRD ,W?THEN ,W?PERIOD>
			       <RETURN>)>
			<SET N <+ .N ,K-P-LEXELEN>>
			<COND (<L? <SET M <- .M 1>> 1>
			       <RETURN>)>>
		      <RTRUE>)
		     (T
		      <RT-NO-RESPONSE-MSG>
		      <RTRUE>)>)>>

<ROUTINE V-TELL-ABOUT ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TELL-ABOUT">>
	<COND (<RT-WHO-WHAT-WHERE-MSG>
	       <RFATAL>)
	      (T
	       <RTRUE>)>>

<ROUTINE V-TELL-WHO ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TELL-WHO">>
	<TELL "You must use TELL ME ABOUT SOMETHING or TELL CHARACTER ABOUT SOMETHING." CR>
	<RTRUE>>

<ROUTINE V-THANK ()
	<DEBUGGING? <RT-DEBUG-VERB "V-THANK">>
	<COND (<MC-F? <RT-ANYONE-HERE?>>
	       <TELL "[There's nobody here to thank.]" CR>
	       <RTRUE>)
	      (<EQUAL? ,GL-WINNER ,CH-PLAYER>
	       <COND 
		(<MC-PRSO? ,CH-ME ,CH-PLAYER>
		 <TELL "Patting yourself on the back" ,K-WONT-HELP-MSG CR>
		 <RTRUE>)
		(<MC-IS? ,GL-PRSO ,FL-ASLEEP>
		 <TELL CTHEO>
		 <RT-ISNT-ARENT-MSG ,GL-PRSO>
		 <TELL "in any condition to accept your thanks." CR>)
		(T
		 <TELL "\"You're welcome.\"" CR>
		 <RTRUE>)>)
	      (T
	       <RT-FOOLISH-TO-TALK-MSG>
	       <RTRUE>)>>

<ROUTINE V-THROUGH ()
	<DEBUGGING? <RT-DEBUG-VERB "V-THROUGH">>
	<COND (<MC-PRSO? ,ROOMS>
	       <RT-DO-WALK ,P?IN>
	       <RTRUE>)
	      (T
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)>>

<ROUTINE V-THROW ()
	<DEBUGGING? <RT-DEBUG-VERB "V-THROW">>
	<COND (<AND <MC-VERB-WORD? PUT>
		    <MC-PRSO? ,TH-HANDS ,TH-FEET>>
	       <COND (<MC-IS? ,GL-PRSI ,FL-DOOR>
		      <COND (<MC-IS? ,GL-PRSI ,FL-OPENED>
			     <RT-CYOU-MSG "put" "puts">
			     <TELL
THEO " through " THEI ", but can't reach anything on the other side." CR>)
			    (T
			     <TELL CTHEI>
			     <RT-IS-ARE-MSG ,GL-PRSI>
			     <TELL "closed." CR>)>)
		    (T
		     <RT-IMPOSSIBLE-MSG>)>)
	      (<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
	       <RT-IMPOSSIBLE-MSG>)
	      (<RT-IDROP-MSG>
	       <COND (<AND <MC-IS? ,CH-HOLMES ,FL-ASLEEP>
			   <MC-PRSI? ,CH-HOLMES ,TH-PHIAL, TH-SYRINGE ,TH-MOROCCO-CASE>>
		      <COND (<MC-PRSO? ,TH-KNIFE>
			     <COND (<MC-PRSI? ,CH-HOLMES>
				    <TELL "Holmes absentmindedly dodges the knife">)
				   (<MC-PRSI? ,TH-PHIAL ,TH-SYRINGE ,TH-MOROCCO-CASE>
				    <TELL "Holmes casually moves " THEI
" out of harm's way">)>
			     <TELL " and continues staring at the phial." CR>
			     <RTRUE>)
			    (T
			     <TELL "Holmes absentmindedly catches " THEO
" with his free hand and bops you over the head with it before letting it fall
to the ground. He then continues staring at the phial." CR>
			     <RTRUE>)>)>
	       <TELL CTHEO " miss">
	       <RT-ES-NOES-MSG ,GL-PRSO>
	       <TELL " " THEI " by a mile and land">
	       <RT-S-NOS-MSG ,GL-PRSI>
	       <COND (<MC-HERE? ,RM-THAMES-ONE ,RM-THAMES-TWO ,RM-THAMES-THREE
				,RM-THAMES-FOUR ,RM-THAMES-FIVE>
		      <TELL " in the water.">
		      <MOVE ,GL-PRSO ,LG-WATER>
		      <COND (<MC-PRSO? ,CH-TRAINED-PIGEON>
			     <RT-KILL-PIGEON>)>
		      <TELL " Plop." CR>)
		     (T
		      <TELL " on the ">
		      <COND (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
			     <TELL "floor">)
			    (T
			     <TELL "ground">)>
		      <TELL " nearby." CR>)>)>
	      <RTRUE>>

<ROUTINE V-THROW-SWP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-THROW-SWP">>
	<RT-PERFORM ,V?THROW ,GL-PRSI ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-THROW-OVER ()
	<DEBUGGING? <RT-DEBUG-VERB "V-THROW-OVER">>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>>

<ROUTINE V-TIE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TIE">>
	<RT-CYOU-MSG>
	<TELL "cannot possibly tie " THEO>
	<COND (<MC-T? ,GL-PRSI>
	       <TELL " to " THEI>)>
	<TELL "." CR>
	<RTRUE>>

<ROUTINE V-TIE-UP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TIE-UP">>
	<RT-CYOU-MSG>
	<TELL "cannot tie up ">
	<COND (<MC-PRSI? <> ,ROOMS>
	       <TELL "that">)
	      (T
	       <TELL "anything with " THEI>)>
	<TELL "." CR>>

<ROUTINE V-TIP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TIP">>
	<COND (<MC-IS? ,GL-PRSO ,FL-PERSON>
	       <RT-CYOU-MSG "whisper" "whispers">
	       <TELL "confidentially, \"Buy low, sell high.\"" CR CR CTHEO>
	       <RT-DONT-DOESNT-MSG ,GL-PRSO>
	       <TELL "look impressed." CR>
	       <RTRUE>)
	      (T
	       <RT-CYOU-MSG>
	       <TELL "can't do that." CR>
	       <RTRUE>)>>

<ROUTINE V-TOUCH ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TOUCH">>
	<RT-NO-POINT-MSG "Fiddling with">
	<RTRUE>>

<ROUTINE V-TOUCH-TO ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TOUCH-TO">>
	<COND (<MC-PRSO? ,TH-HANDS>
	       <RT-PERFORM ,V?TOUCH ,GL-PRSI>
	       <RTRUE>)>
	<RT-CYOU-MSG "put" "puts">
	<TELL THEO " next to " THEI ", but nothing " <RT-PICK-NEXT ,GL-BORING-TXT> " happens." CR>
	<RTRUE>>

<ROUTINE V-TOUCH-TO-SWP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TOUCH-TO-SWP">>
	<RT-PERFORM ,V?TOUCH-TO ,GL-PRSI ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-TRANSLATE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TRANSLATE">>
	<TELL ,K-HOW-TO-MSG CR>
	<RTRUE>>

<ROUTINE V-TUNE-TO ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TUNE-TO">>
	<RT-IMPOSSIBLE-MSG>
	<RTRUE>>

<ROUTINE V-TURN ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TURN">>
	<COND (<AND <MC-ISNOT? ,GL-PRSO ,FL-TAKEABLE>
		    <MC-ISNOT? ,GL-PRSO ,FL-TRYTAKE>>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (T
	       <RT-NO-POINT-MSG "Turning">
	       <RTRUE>)>>

<ROUTINE V-TURN-DOWN ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TURN-DOWN">>
	<V-REFUSE>
	<RTRUE>>

<ROUTINE V-TURN-TO ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TURN-TO">>
	<COND (<RT-VISIBLE? ,GL-PRSO>
	       <RT-PERFORM ,V?WATCH ,GL-PRSO>
	       <RTRUE>)
	      (T
	       <RT-CYOU-MSG "do not" "does not">
	       <TELL "see " THEO "." CR>
	       <RTRUE>)>>

<ROUTINE V-TURN-UP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-TURN-UP">>
	<V-LOOK-UNDER>
	<RTRUE>>

<ROUTINE V-UNDRESS ()
	<DEBUGGING? <RT-DEBUG-VERB "V-UNDRESS">>
	<COND (<OR <MC-PRSO? ,ROOMS>
		   <MC-IS? ,GL-PRSO ,FL-PERSON>>
	       <TELL ,K-INAPPROPRIATE-MSG CR>
	       <RTRUE>)
	      (T
	       <RT-CYOU-MSG>
	       <TELL "cannot undress " A ,GL-PRSO "." CR>
	       <RTRUE>)>>

<ROUTINE V-UNFOLD ()
	<DEBUGGING? <RT-DEBUG-VERB "V-UNFOLD">>
	<TELL CTHEO>
	<RT-ISNT-ARENT-MSG>
	<TELL "folded up." CR>
	<RTRUE>>

<ROUTINE V-UNLOCK ()
	<DEBUGGING? <RT-DEBUG-VERB "V-UNLOCK">>
	<COND (<OR <MC-IS? ,GL-PRSO ,FL-OPENABLE>
		   <MC-IS? ,GL-PRSO ,FL-CONTAINER>>
	       <COND (<OR <MC-IS? ,GL-PRSO ,FL-OPENED>
			  <NOT <MC-IS? ,GL-PRSO ,FL-LOCKED>>>
		      <TELL CTHEO>
		      <RT-ISNT-ARENT-MSG>
		      <TELL "locked." CR>
		      <RTRUE>)
		     (T
		      <RT-THING-WONT-LOCK-MSG ,GL-PRSI ,GL-PRSO T>
		      <RTRUE>)>)
	      (T
	       <RT-CANT-LOCK-MSG T>
	       <RTRUE>)>>

<ROUTINE V-UNPLUG ()
	<DEBUGGING? <RT-DEBUG-VERB "V-UNPLUG">>
	<TELL CTHEO>
	<RT-ISNT-ARENT-MSG>
	<TELL "connected to ">
	<COND (<MC-T? ,GL-PRSI>
	       <TELL THEI>)
	      (T
	       <TELL "anything">)>
	<TELL "." CR>
	<RTRUE>>

<ROUTINE V-UNSCREW-FROM ()
	<DEBUGGING? <RT-DEBUG-VERB "V-UNSCREW-FROM">>
	<COND (<MC-PRSO? GL-PRSI>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (<NOT <IN? ,GL-PRSO ,GL-PRSI>>
	       <COND (<MC-IS? ,GL-PRSI ,FL-ALIVE>
		      <TELL CTHEI>
		      <RT-DONT-DOESNT-MSG ,GL-PRSI>
		      <TELL "have " THEO "." CR>
		      <RTRUE>)>
	       <TELL CTHEO>
	       <RT-ISNT-ARENT-MSG>
	       <RT-IN-ON-MSG ,GL-PRSI <>>
	       <TELL THEI "." CR>
	       <RTRUE>)
	      (T
	       <RT-CYOU-MSG>
	       <TELL "cannot unscrew " THEO "." CR>
	       <RTRUE>)>>

<ROUTINE V-UNTIE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-UNTIE">>
	<RT-CYOU-MSG>
	<TELL "cannot untie " A ,GL-PRSO "." CR>
	<RTRUE>>

<ROUTINE V-USE ()
       <DEBUGGING? <RT-DEBUG-VERB "V-USE">>
       <COND (<MC-IS? ,GL-PRSO ,FL-PERSON>
	      <TELL CTHEO " might resent that." CR>
	      <RTRUE>)
	     (T
	      <TELL "[You must specify what you want to do with " THEO ".]" CR>
	      <RTRUE>)>>

<ROUTINE V-USE-ON ()
	<DEBUGGING? <RT-DEBUG-VERB "V-USE-ON">>
	<TELL "Using " THEO " on " THEI " would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>>

<ROUTINE V-WAIT ("AUX" H M S N)
	<DEBUGGING? <RT-DEBUG-VERB "V-WAIT">>
	<COND (<EQUAL? ,GL-P-NUMBER -1>
	       <SET N 1>)
	      (T
	       <SET N ,GL-P-NUMBER>)>
	<COND (<MC-PRSO? ,TH-TIME>
	       <COND (<EQUAL? <GETP ,GL-PRSO ,P?OBJ-NOUN>
			      ,W?MINUTE ,W?MINUTES>
		      <SET H 0>
		      <SET M .N>)
		     (T
		      <SET H .N>
		      <SET M 0>)>)
	      (<MC-PRSO? ,TH-INTNUM>
	       <SET H 0>
	       <SET M .N>
	       <TELL "[" N .M " minute">
	       <COND (<NOT <EQUAL? .M 1>>
		      <TELL "s">)>
	       <TELL "]" CR CR>)
	      (<NOT <MC-PRSO? ,ROOMS>>
	       <RT-CYOU-MSG>
	       <TELL "can't wait for that." CR>
	       <RTRUE>)
	      (T
	       <SET H 0>
	       <SET M 10>)>
	<SET S 0>
	<TELL "Time passes..." CR>
	<RT-CLOCK-JMP .H .M .S>
	<RT-TIME-OF-DAY-MSG T>
	<RTRUE>>

<ROUTINE V-WALK ("AUX" PT PTS STR OBJ RM)
	<DEBUGGING? <RT-DEBUG-VERB "V-WALK">>
	<SET PT <GETPT ,GL-PLACE-CUR ,GL-PRSO>>
	<COND (<MC-F? ,GL-P-WALK-DIR>
	       <TELL "[You must specify a direction.]" CR>)
	      (<MC-T? .PT>
	       <SET PTS <PTSIZE .PT>>
	       ; "All rooms are stored as BYTEs, so we sometimes
		  need to do GETBs or funny rests..."
	       <COND (<EQUAL? .PTS ,K-UEXIT>
		      <COND (<FSET? <LOC ,GL-WINNER> ,FL-VEHICLE>
			     ; "If you're in a vehicle, get out of it
				first"
			     <RT-PERFORM ,V?EXIT <LOC ,GL-WINNER>>
			     <COND (<FSET? <LOC ,GL-WINNER> ,FL-VEHICLE>
				    <RFATAL>)>)>
		      <SET RM <MC-GET-RM-EXIT-DEST .PT>>
		      <RT-GOTO .RM>
		      <RTRUE>)
		     (<EQUAL? .PTS ,K-NEXIT>
		      <SET STR <GET .PT ,K-NEXITSTR>>
		      <TELL .STR CR>
		      <RFATAL>)
		     (<EQUAL? .PTS ,K-PEXIT>
		      <SET RM <APPLY <GET .PT ,K-PEXITRTN>>>
		      <COND (<MC-T? .RM>
			     <RT-GOTO .RM>
			     <RTRUE>)
			    (T
			     <RFATAL>)>)
		     (<EQUAL? .PTS ,K-CEXIT>
		      <COND (<VALUE <GETB .PT ,K-CEXITFLG>>
			     <SET RM <MC-GET-RM-EXIT-DEST .PT>>
			     <RT-GOTO .RM>
			     <RTRUE>)>
		      <RT-CYOU-MSG>
		      <TELL "cannot go that way." CR>
		      <RFATAL>)
		     (<EQUAL? .PTS ,K-DEXIT>
		      <COND (<FSET? <LOC ,GL-WINNER> ,FL-VEHICLE>
			     ; "If you're in a vehicle, get out of it
				first"
			     <RT-PERFORM ,V?EXIT <LOC ,GL-WINNER>>
			     <COND (<FSET? <LOC ,GL-WINNER> ,FL-VEHICLE>
				    <RFATAL>)>)>
		      <SET OBJ <MC-GET-RM-EXIT-DOOR .PT>>
		      <COND (<MC-IS? .OBJ ,FL-OPENED>
			     <SET RM <MC-GET-RM-EXIT-DEST .PT>>
			     <RT-GOTO .RM>
			     <RTRUE>)
			    (T
			     <TELL "The door is not open." CR>
			     <RFATAL>)>)>)
	      (<AND <EQUAL? ,GL-P-WALK-DIR ,P?OUT>
		    <MC-ISNOT? ,GL-PLACE-CUR ,FL-INDOORS>>
	       <RT-CYOU-MSG "are" "is">
	       <TELL "already outside." CR>
	       <RFATAL>)
	      (<AND <EQUAL? ,GL-P-WALK-DIR ,P?IN>
		    <MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>>
	       <RT-CYOU-MSG "are" "is">
	       <TELL "already inside." CR>
	       <RFATAL>)
	      (T
	       <TELL "You cannot go that way." CR>
	       <RFATAL>)>>

<ROUTINE V-WALK-AROUND ()
	<DEBUGGING? <RT-DEBUG-VERB "V-WALK-AROUND">>
	<TELL "[Which way do you want to go?]" CR>
	<RFATAL>>

<ROUTINE V-WALK-TO ()
	<DEBUGGING? <RT-DEBUG-VERB "V-WALK-TO">>
	<COND (<MC-PRSO? ,TH-INTDIR>
	       <RT-DO-WALK ,GL-P-DIRECTION>
	       <RTRUE>)
	      (<OR <MC-PRSO? ,TH-RIGHT ,TH-LEFT>
		   <IN? ,GL-PRSO ,ROOMS>>
	       <TELL ,K-BE-MORE-SPECIFIC-MSG CR>
	       <RTRUE>)
	      (T
	       <V-FOLLOW>
	       <RTRUE>)>>

<ROUTINE V-WATCH ()
       <DEBUGGING? <RT-DEBUG-VERB "V-WATCH">>
       <COND (<MC-IS? ,GL-PRSO ,FL-PERSON>
	      <TELL CTHEO>
	      <RT-ISNT-ARENT-MSG>
	      <TELL "doing anything " <RT-PICK-NEXT ,GL-BORING-TXT>>)
	     (T
	      <TELL "Nothing " <RT-PICK-NEXT ,GL-BORING-TXT> " is happening">)>
       <TELL "." CR>
       <RTRUE>>

<ROUTINE V-WAVE-AT ()
	<DEBUGGING? <RT-DEBUG-VERB "V-WAVE-AT">>
	<COND (<RT-WHO-WHAT-WHERE-MSG>
	       <RFATAL>)
	      (T
	       <RTRUE>)>>

<ROUTINE V-WEAR ()
	<DEBUGGING? <RT-DEBUG-VERB "V-WEAR">>
	<COND (<OR <AND <IN? ,GL-PRSO ,GL-WINNER>
			<MC-IS? ,GL-PRSO ,FL-WORN>>
		   <MC-PRSO? ,TH-CLOTHES>>
	       <RT-CYOU-MSG "are" "is">
	       <TELL "already wearing " THEO "." CR>
	       <RTRUE>)
	      (<MC-ISNOT? ,GL-PRSO ,FL-CLOTHING>
	       <RT-CYOU-MSG>
	       <TELL "cannot wear " THEO "." CR>
	       <RTRUE>)
	      (<RT-DONT-HAVE-MSG ,GL-PRSO>
	       <RTRUE>)
	      (T
	       <MC-MAKE ,GL-PRSO ,FL-WORN>
	       <RT-CYOU-MSG "put" "puts">
	       <TELL "on " THEO "." CR>
	       <RTRUE>)>>

<ROUTINE V-WEDGE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-WEDGE">>
	<RT-PERFORM ,V?LOOSEN ,GL-PRSI ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-WEIGH ()
	<DEBUGGING? <RT-DEBUG-VERB "V-WEIGH">>
	<TELL "You haven't got any scales to weigh things with." CR>
	<RTRUE>>

<ROUTINE V-WHAT ()
	<DEBUGGING? <RT-DEBUG-VERB "V-WHAT">>
	<COND (<RT-WHO-WHAT-WHERE-MSG>
	       <RFATAL>)
	      (T
	       <RTRUE>)>>

<ROUTINE V-WHERE ()
	<DEBUGGING? <RT-DEBUG-VERB "V-WHERE">>
	<COND (<RT-WHO-WHAT-WHERE-MSG>
	       <RFATAL>)
	      (T
	       <RTRUE>)>>

<ROUTINE V-WHO ()
	<DEBUGGING? <RT-DEBUG-VERB "V-WHO">>
	<COND (<RT-WHO-WHAT-WHERE-MSG>
	       <RFATAL>)
	      (T
	       <RTRUE>)>>

<ROUTINE V-WIND ()
	<DEBUGGING? <RT-DEBUG-VERB "V-WIND">>
	<RT-CYOU-MSG>
	<TELL "cannot wind " A ,GL-PRSO "." CR>
	<RTRUE>>

<ROUTINE V-WRAP-AROUND ()
	<DEBUGGING? <RT-DEBUG-VERB "V-WRAP-AROUND">>
	<RT-CYOU-MSG>
	<TELL "could not possibly ">
	<PRINTB ,GL-P-PRSA-WORD>
	<TELL " " THEO " around " THEI "." CR>
	<RTRUE>>

<ROUTINE V-WRAP-AROUND-SWP ()
	<DEBUGGING? <RT-DEBUG-VERB "V-WRAP-AROUND-SWP">>
	<RT-PERFORM ,V?WRAP-AROUND ,GL-PRSI ,GL-PRSO>
	<RTRUE>>

<ROUTINE V-YELL ()
	<DEBUGGING? <RT-DEBUG-VERB "V-YELL">>
	<COND (<MC-PRSO? ,ROOMS>
	       <COND (<EQUAL? ,GL-P-PRSA-WORD ,W?CRY>
		      <TELL
"Awww. Don't cry. You'll figure it out eventually." CR>
		      <RTRUE>)
		     (T
		      <TELL
"The idea of the primal scream as a technique to relieve anxiety will not be
discovered for eighty years. But if it makes you feel better, go right ahead."
CR>
		      <RTRUE>)>)
	      (T
	       <RT-NOT-LIKELY-MSG ,GL-PRSO "would respond">
	       <RTRUE>)>>

;<GLOBAL GL-BREATH-HELD? <>>	; "is player holding his breath"

<ROUTINE RT-CANT-SEE-MUCH-MSG ()
	<RT-CYOU-MSG>
	<TELL "cannot see much from here." CR>
	<RTRUE>>

<ROUTINE RT-NO-MONEY-MSG ()
	<RT-CYOU-MSG "do not" "does not">
	<TELL "have any money." CR>
	<RTRUE>>

<ROUTINE RT-IN-VEHICLE-MSG ()
	<COND (<OR <IN? ,CH-PLAYER ,TH-HANSOM-CAB>
		   <IN? ,CH-PLAYER ,TH-GROWLER-CAB>>
	       <TELL " in a cab ">)
	      (<IN? ,CH-PLAYER ,TH-BOAT>
	       <TELL " in a boat ">)
	      (T
	       <TELL " standing ">)>>

<ROUTINE RT-DRIVE-WALK-MSG? ()
	<COND (<OR <IN? ,CH-PLAYER ,TH-HANSOM-CAB>
		   <IN? ,CH-PLAYER ,TH-GROWLER-CAB>>
	       <TELL " drive ">)
	      (T
	       <TELL " walk ">)>>

<ROUTINE RT-ALREADY-IN-ROOM-MSG ()
	<TELL "You are already in " THEO "." CR>>

<ROUTINE RT-NOT-IN-ROOM-MSG ()
	<TELL "You are not in " THEO "." CR>>

<ROUTINE RT-OBJECT-IS-LOCKED-MSG ()
	<RT-CYOU-MSG>
	<TELL "cannot do that. It is locked." CR>
	<RTRUE>>

<ROUTINE RT-NOTHING-INTERESTING-MSG ()
	<RT-CYOU-MSG "do" "does">
	<TELL "not see anything " <RT-PICK-NEXT ,GL-BORING-TXT>>
	<RTRUE>>

<ROUTINE RT-WASTE-OF-TIME-MSG ()
	<TELL <RT-PICK-NEXT ,GL-NO-POINT-TXT> "." CR>
	<RTRUE>>

<ROUTINE RT-FOG-MSG ()
	<TELL <RT-PICK-NEXT ,GL-FOG-TXT> "." CR>
	<RTRUE>>

<ROUTINE RT-ITS-RIGHT-HERE-MSG ()
	<RT-SAY-ITS-MSG>
	<TELL "right here in front of you." CR>
	<RTRUE>>

<ROUTINE RT-WHO-WHAT-WHERE-MSG ()
	<COND (<RT-FOOLISH-TO-TALK-MSG>
	       <RTRUE>)
	      (T
	       <RT-NO-RESPONSE-MSG <COND (<MC-VERB? WHO WHAT WHERE> ,GL-WINNER)>>
	       <RFALSE>)>>

<ROUTINE RT-HI-BYE-MSG ()
	<COND (<RT-FOOLISH-TO-TALK-MSG>
	       <RFATAL>)
	      (<MC-PRSO? ,ROOMS>
	       <RT-TALK-TO-SELF-MSG>
	       <RTRUE>)
	      (T
	       <RT-NO-RESPONSE-MSG>
	       <RTRUE>)>>

<ROUTINE RT-NO-RESPONSE-MSG ("OPTIONAL" (WHO <>))
	<COND (<MC-F? .WHO>
	       <SET WHO ,GL-PRSO>)>
	<TELL CTHE .WHO>
	<RT-DONT-DOESNT-MSG .WHO>
	<TELL "respond." CR>
	<RTRUE>>

<ROUTINE RT-TAKE-OFF-PRSO-FIRST-MSG ()
	<TELL "[taking off " THEO " first]" CR>
	<MC-UNMAKE ,GL-PRSO ,FL-WORN>
	<COND (<MC-PRSO? ,TH-WATSONS-HAT>
	       <MC-MAKE ,TH-WATSONS-HAT ,FL-OPENED>)
	      (<MC-PRSO? ,TH-SUIT-OF-ARMOUR>
	       <MOVE ,TH-SUIT-OF-ARMOUR ,GL-PLACE-CUR>)>
	<RTRUE>>

<ROUTINE RT-SAY-DROPPED-MSG ()
	<COND (<MC-T? ,GL-P-MULT?>
	       <TELL "Dropped." CR>
	       <RTRUE>)
	      (T
	       <RT-CYOU-MSG "drop" "drops">
	       <TELL THEO "." CR>
	       <RTRUE>)>>

<ROUTINE RT-FOOLISH-TO-TALK-MSG ()
	<COND (<N==? ,GL-WINNER ,CH-ME ,CH-PLAYER>
	       <TELL CTHE ,GL-WINNER>
	       <RT-DONT-DOESNT-MSG ,GL-WINNER>
	       <TELL "respond." CR>
	       <RTRUE>)
	      (<EQUAL? ,GL-PRSO <> ,ROOMS>
	       <RFALSE>)
	      (<MC-ISNOT? ,GL-PRSO ,FL-ALIVE>
	       <RT-NOT-LIKELY-MSG ,GL-PRSO "would respond">
	       <RT-P-CLEAR>
	       <RTRUE>)
	      (<MC-PRSO? ,CH-ME ,CH-PLAYER ,GL-PRSI ,GL-WINNER>
	       <TELL "That would">
	       <RT-WASTE-OF-TIME-MSG>
	       <RT-P-CLEAR>
	       <RTRUE>)
	      (T
	       <RT-THIS-IS-IT ,GL-PRSO>
	       <RFALSE>)>>

<ROUTINE RT-YOU-MSG ("OPTIONAL" (WRD1 <>) (WRD2 <>) (PRONOUN? <>))
	<COND (<EQUAL? ,GL-WINNER ,CH-PLAYER>
	       <TELL " you ">
	       <COND (<MC-T? .WRD1>
		      <TELL .WRD1 " ">)>)
	      (T
	       <TELL " ">
	       <COND (.PRONOUN?
		      <COND (<AND <MC-IS? ,GL-WINNER ,FL-PLURAL>
				  <MC-ISNOT? ,GL-WINNER ,FL-COLLECTIVE>>
			     <TELL "they">)
			    (<MC-IS? ,GL-WINNER ,FL-PERSON>
			     <COND (<MC-IS? ,GL-WINNER ,FL-FEMALE>
				    <TELL "she">)
				   (T
				    <TELL "he">)>)
			    (T
			     <TELL "it">)>)
		     (T
		      <TELL THE ,GL-WINNER>)>
	       <TELL " ">
	       <COND (<MC-T? .WRD2>
		      <TELL .WRD2 " ">)>)>>

<ROUTINE RT-CYOU-MSG ("OPTIONAL" (WRD1 <>) (WRD2 <>) (PRONOUN? <>))
	<COND (<EQUAL? ,GL-WINNER ,CH-PLAYER>
	       <TELL "You ">
	       <COND (<MC-T? .WRD1>
		      <TELL .WRD1 " ">)>)
	      (T
	       <COND (.PRONOUN? <COND (<AND <MC-IS? ,GL-WINNER ,FL-PLURAL>
					    <MC-ISNOT? ,GL-WINNER ,FL-COLLECTIVE>>
				       <TELL "They">)
				      (<MC-IS? ,GL-WINNER ,FL-PERSON>
				       <COND (<MC-IS? ,GL-WINNER ,FL-FEMALE>
					      <TELL "She">)
					     (T
					      <TELL "He">)>)
				      (T
				       <TELL "It">)>)
		     (T
		      <TELL CTHE ,GL-WINNER>)>
	       <TELL " ">
	       <COND (<MC-T? .WRD2>
		      <TELL .WRD2 " ">)>)>>

<ROUTINE RT-ITS-ALREADY-MSG (STR)
	<TELL "It is already " .STR "." CR>
	<RTRUE>>

<ROUTINE RT-YOURE-NOT-A-MSG (STR)
	<TELL "You're a general practitioner, not a " .STR "." CR>
	<RTRUE>>

<ROUTINE RT-NO-POINT-MSG (STR)
	<TELL .STR " " THEO " would" <RT-PICK-NEXT ,GL-NO-POINT-TXT> "." CR>
	<RTRUE>>

<ROUTINE RT-IS-ARE-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<COND (<OR <EQUAL? .THING ,CH-ME ,CH-PLAYER>
		   <AND <MC-IS? .THING ,FL-PLURAL>
			<MC-ISNOT? .THING ,FL-COLLECTIVE>>>
	       <TELL " are ">)
	      (T
	       <TELL " is ">)>
	<RTRUE>>

<ROUTINE RT-ISNT-ARENT-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<COND (<OR <EQUAL? .THING ,CH-ME ,CH-PLAYER>  
	           <AND <MC-IS? .THING ,FL-PLURAL>
		        <MC-ISNOT? .THING ,FL-COLLECTIVE>>>
	       <TELL " are not ">)
	      (T
	       <TELL " is not ">)>
	<RTRUE>>

<ROUTINE RT-S-NOS-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<COND (<NOT <OR <EQUAL? .THING ,CH-ME ,CH-PLAYER>  
			<AND <MC-IS? .THING ,FL-PLURAL>
			     <MC-ISNOT? .THING ,FL-COLLECTIVE>>>>
	       <TELL "s">)>
	<RTRUE>>

<ROUTINE RT-ES-NOES-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<COND (<NOT <OR <EQUAL? .THING ,CH-ME ,CH-PLAYER>  
			<AND <MC-IS? .THING ,FL-PLURAL>
			     <MC-ISNOT? .THING ,FL-COLLECTIVE>>>>
	       <TELL "es">)>
	<RTRUE>>

<ROUTINE RT-DONT-DOESNT-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<COND (<OR <EQUAL? .THING ,CH-ME ,CH-PLAYER>  
	           <AND <MC-IS? .THING ,FL-PLURAL>
		        <MC-ISNOT? .THING ,FL-COLLECTIVE>>>
	       <TELL " do not ">)
	      (T
	       <TELL " does not ">)>
	<RTRUE>>

<ROUTINE RT-SAY-ITS-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<COND (<AND <MC-IS? .THING ,FL-PLURAL>
		    <MC-ISNOT? .THING ,FL-COLLECTIVE>>
	       <TELL "They are ">
	       <RTRUE>)
	      (<AND <MC-IS? .THING ,FL-PERSON>
		    <MC-IS? .THING ,FL-FEMALE>>
	       <TELL "She is ">
	       <RTRUE>)
	      (<AND <MC-IS? .THING ,FL-PERSON>
		    <MC-ISNOT? .THING ,FL-FEMALE>>
	       <TELL "He is ">
	       <RTRUE>)
	      (T
	       <TELL "It is ">
	       <RTRUE>)>>

<ROUTINE RT-SAY-HIM-HER-THEM-IT-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<COND (<EQUAL? .THING ,CH-PLAYER ,CH-ME>
	       <COND (<EQUAL? ,GL-WINNER ,CH-PLAYER ,CH-ME>
		      <TELL "yourself">)
		     (T
		      <TELL "you">)>)
	      (<AND <MC-IS? .THING ,FL-PLURAL>
		    <MC-ISNOT? .THING ,FL-COLLECTIVE>>
	       <TELL "them">)
	      (<MC-IS? .THING ,FL-PERSON>
	       <COND (<MC-IS? .THING ,FL-FEMALE>
		      <TELL "her">)
		     (T
		      <TELL "him">)>)
	      (T
	       <TELL "it">)>>

<ROUTINE RT-YOUR-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-WINNER>)>
	<COND (<EQUAL? .THING ,CH-PLAYER ,CH-ME>
	       <TELL "your ">)
	      (<AND <MC-IS? .THING ,FL-PLURAL>
		    <MC-ISNOT? .THING ,FL-COLLECTIVE>>
	       <TELL "their ">)
	      (<MC-IS? .THING ,FL-PERSON>
	       <COND 
		(<MC-IS? .THING ,FL-FEMALE>
		 <TELL "her ">)
		(T
		 <TELL "his ">)>)
	      (T
	       <TELL "its ">)>>

<ROUTINE RT-ITS-CLOSED-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<TELL CTHE .THING>
	<RT-IS-ARE-MSG .THING>
	<TELL "closed." CR>
	<RTRUE>>

<ROUTINE RT-WHY-SHOOT-MSG ("OPTIONAL" (OBJ <>))
	<COND (<MC-F? .OBJ>
	       <SET OBJ ,GL-PRSO>)>
	<TELL "Why would">
	<RT-YOU-MSG>
	<TELL "want to shoot the poor, little, innocent " D .OBJ "?" CR>>

<ROUTINE RT-HOW-READ-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<TELL "How can">
	<RT-YOU-MSG>
	<TELL "read " A .THING>
	<RTRUE>>

<ROUTINE RT-ALREADY-HAVE-PRSO-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<RT-CYOU-MSG "already have" "already has">
	<TELL A .THING "." CR>
	<RTRUE>>

<ROUTINE RT-CANT-OPEN-PRSO-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<RT-CYOU-MSG>
	<TELL "could not possibly open " THE .THING "." CR>
	<RTRUE>>

<ROUTINE RT-CANT-CLOSE-THAT-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<RT-CYOU-MSG>
	<TELL "cannot close ">
	<COND (<MC-T? .THING>
	       <TELL THE .THING>)
	      (T
	       <TELL D ,TH-NOT-HERE-OBJECT>)>
	<TELL "." CR>
	<RTRUE>>

<ROUTINE RT-NO-GOOD-SURFACE-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSI>)>
	<TELL "There is no good surface on " THE .THING "." CR>
	<RTRUE>>

<ROUTINE RT-LANDS-AT-YOUR-FEET-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<TELL "land">
	<RT-S-NOS-MSG .THING>
	<TELL " at your feet." CR>
	<MOVE .THING ,GL-PLACE-CUR>
	<RTRUE>>

<ROUTINE RT-OPEN-CLOSED-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<TELL CTHE .THING>
	<RT-IS-ARE-MSG .THING>
	<COND (<MC-IS? .THING ,FL-OPENED>
	       <TELL "open">)
	      (T
	       <TELL "closed">)>
	<TELL ".">
	<RTRUE>>

<ROUTINE RT-YOU-OPEN-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<MC-MAKE .THING ,FL-OPENED>
	<RT-CYOU-MSG "open" "opens">
	<TELL THE .THING "." CR>>

<ROUTINE RT-YOU-CLOSE-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<MC-UNMAKE .THING ,FL-OPENED>
	<RT-CYOU-MSG "close" "closes">
	<TELL THE .THING "." CR>>

<ROUTINE RT-IN-ON-MSG ("OPTIONAL" (THING <>) (SPACE? T))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<COND (<MC-T? .SPACE?>
	       <TELL " ">)>
	<COND (<MC-IS? .THING ,FL-CONTAINER>
	       <TELL "in">)
	      (<MC-IS? .THING ,FL-SURFACE>
	       <TELL "on">)
	      (T
	       <TELL "held by">)>
	<TELL " ">>

<ROUTINE RT-CIN-CON-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<COND (<MC-IS? .THING ,FL-SURFACE>
	       <TELL "On ">)
	      (<MC-IS? .THING ,FL-CONTAINER>
	       <TELL "In ">)
	      (T
	       <TELL "Held by ">)>>

<ROUTINE RT-OUT-OFF-MSG ("OPTIONAL" (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<COND (<MC-IS? .THING ,FL-SURFACE>
	       <TELL " off of ">)
	      (<MC-IS? .THING ,FL-CONTAINER>
	       <TELL " out of ">)
	      (T
	       <TELL " from ">)>>

<ROUTINE RT-CANT-LOCK-MSG ("OPTIONAL" (UN? <>) (THING <>))
	<COND (<MC-F? .THING>
	       <SET THING ,GL-PRSO>)>
	<RT-CYOU-MSG>
	<TELL "cannot ">
	<COND (<MC-T? .UN?>
	       <TELL "un">)>
	<TELL "lock " A .THING "." CR>
	<RTRUE>>

<ROUTINE RT-THING-WONT-LOCK-MSG (THING CLOSED-THING "OPTIONAL" (UN? <>))
	<RT-CYOU-MSG>
	<TELL "cannot ">
	<COND (<MC-T? .UN?>
	       <TELL "un">)>
	<TELL "lock " THE .CLOSED-THING " with " THE .THING "." CR>
	<RTRUE>>

<ROUTINE RT-DONT-HAVE-MSG (OBJ "AUX" L O)
	<SET L <LOC .OBJ>>
	<COND (<MC-F? .L> T)
	      (<EQUAL? .L ,GL-WINNER>
	       <RFALSE>)
	      (<AND <IN? .L ,CH-PLAYER>
		    <EQUAL? ,GL-WINNER ,CH-PLAYER>>
	       <SET O ,GL-PRSO>
	       <SETG GL-PRSO .OBJ>
	       <COND (<RT-ITAKE <>>
		      <TELL "[taking " THEO>
		      <RT-OUT-OFF-MSG .L>
		      <TELL THE .L " first]" CR>
		      <SETG GL-PRSO .O>
		      <RT-THIS-IS-IT ,GL-PRSO>
		      <RFALSE>)
		     (T
		      <SETG GL-PRSO .O>
		      <RT-CYOU-MSG>
		      <RT-WOULD-HAVE-TO-MSG "take" .OBJ>
		      <RT-OUT-OFF-MSG .L>
		      <TELL THE .L " first." CR>
		      <RTRUE>)>)>
	<RT-WINNER-NOT-HOLDING-MSG>
	<COND (<MC-T? .OBJ>
	       <COND ;(<AND <MC-IS? .OBJ ,FL-PLURAL>
			    <MC-ISNOT? .OBJ ,FL-NOARTC>>
		       <TELL "any " D .OBJ>)
		     (T
		      <TELL THE .OBJ>)>)
	      (T
	       <TELL THE ,TH-NOT-HERE-OBJECT>)>
	<TELL "." CR>
	<RTRUE>>

<ROUTINE RT-ROOM-IN-ON-MSG? (OBJ1 OBJ2)
	<COND (<RT-OBJ-TOO-LARGE? .OBJ1 .OBJ2>
	       <TELL "There is not enough room">
	       <RT-IN-ON-MSG .OBJ2>
	       <TELL THE .OBJ2 "." CR>)>>

<ROUTINE RT-IMPOSSIBLE-PUT-IN-ON-MSG ("OPTIONAL" OBJ)
	<COND (<MC-F? .OBJ>
	       <SET OBJ ,GL-PRSI>)>
	<COND (<AND <MC-VERB? PUT PUT-ON>
		    <MC-PRSI? .OBJ>>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE RT-CANT-PUT-IN-ON-MSG ("OPTIONAL" OBJ)
	<COND (<MC-F? .OBJ>
	       <SET OBJ ,GL-PRSI>)>
	<COND (<AND <MC-VERB? PUT PUT-ON>
		    <MC-PRSI? .OBJ>>
	       <RT-CYOU-MSG>
	       <TELL "cannot put " THEO " ">
	       <COND (<MC-IS? ,GL-PRSO ,FL-CONTAINER>
		      <TELL "in">)
		     (<MC-IS? ,GL-PRSO ,FL-SURFACE>
		      <TELL "on">)
		     (<MC-VERB? PUT>
		      <TELL "in">)
		     (T
		      <TELL "on">)>
	       <TELL " " THEI "." CR>)>>

<ROUTINE RT-CHECK-MOVE-MSG? (SRC DEST "AUX" PTR OLOC CNT)
	<COND (<MC-T? .DEST>
	       <SET PTR ,GL-LOC-TRAIL>
	       <SET OLOC .DEST>
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
		       <COND (<EQUAL? .OLOC .DEST>
			      <RETURN>)>>
	       <COND (<INTBL? .SRC ,GL-LOC-TRAIL .CNT>
		      <RT-CYOU-MSG>
		      <TELL "cannot put " THE .SRC>
		      <RT-IN-ON-MSG .SRC>
		      <TELL "itself, or">
		      <RT-IN-ON-MSG .SRC>
		      <TELL "something that is already">
		      <RT-IN-ON-MSG .SRC>
		      <TELL "it." CR>
		      <RTRUE>)>)>>

<ROUTINE RT-EMPTY-PRSO-MSG (DEST "AUX" OBJ NXT X)
	<SET OBJ <FIRST? ,GL-PRSO>>
	<COND (<MC-F? .OBJ>
	       <TELL "There is nothing">
	       <RT-IN-ON-MSG ,GL-PRSO>
	       <TELL THEO "." CR>
	       <RTRUE>)>
	<SETG GL-P-MULT? T>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)>
		<TELL CTHE .OBJ ": ">
		<SET NXT <NEXT? .OBJ>>
		<COND (<EQUAL? .DEST ,CH-PLAYER>
		       <SET X <RT-PERFORM ,V?TAKE .OBJ ,GL-PRSO>>
		       <COND (<EQUAL? .X ,FATAL-VALUE>
			      <RETURN>)>)
		      (<NOT .DEST>
		       <COND (<AND <MC-IS? ,GL-PRSO ,FL-PLURAL>
				   <MC-ISNOT? ,GL-PRSO ,FL-COLLECTIVE>>
			      <TELL "They ">)
			     (T
			      <TELL "It ">)>
		       <RT-LANDS-AT-YOUR-FEET-MSG>)
		      (<RT-ROOM-IN-ON-MSG? .OBJ .DEST> T)
		      (<RT-CHECK-MOVE-MSG? .OBJ .DEST>
		       <RETURN>)
		      (T
		       <MOVE .OBJ .DEST>
		       <TELL "Done." CR>)>
		<SET OBJ .NXT>>
	<SETG GL-P-MULT? <>>
	<RTRUE>>

<ROUTINE RT-IDROP-MSG ("AUX" L)
	<SET L <LOC ,GL-PRSO>>
	<COND (<OR <MC-F? .L>
		   <MC-PRSO? ,GL-WINNER ,CH-ME ,CH-PLAYER>>
	       <RT-IMPOSSIBLE-MSG>
	       <RFALSE>)
	      (<NOT <EQUAL? .L ,GL-WINNER>>
	       <RT-CYOU-MSG>
	       <RT-WOULD-HAVE-TO-MSG "take" ,GL-PRSO>
	       <RT-OUT-OFF-MSG .L>
	       <TELL THE .L " first." CR>
	       <RFALSE>)
	      (<AND <MC-IS? ,GL-PRSO ,FL-WORN>
		    <IN? ,GL-PRSO ,GL-WINNER>>
	       <RT-TAKE-OFF-PRSO-FIRST-MSG>)>
	<COND (<MC-VERB? THROW>
	       <MOVE ,GL-PRSO <RT-META-LOC ,GL-WINNER>>)
	      (T
	        <MOVE ,GL-PRSO <LOC ,GL-WINNER>>)>
	<RTRUE>>	

<ROUTINE RT-PRINT-CONTENTS-1 (THING "AUX" OBJ (CNT 0) TMP)
	<RT-MOVE-NODESC-OBJS .THING ,TH-Y-OBJECT>
	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)>
		<MC-MAKE .OBJ ,FL-SEEN>
		<TELL "  " A .OBJ>
		<COND (<MC-IS? .OBJ ,FL-LIGHTED>
		       <TELL " (providing light)">)>
		<TELL "." CR>
		<INC CNT>
		<SET OBJ <NEXT? .OBJ>>>
	<COND (<ZERO? .CNT>
	       <TELL "  nothing." CR>)>
	<RT-MOVE-ALL ,TH-Y-OBJECT .THING>
	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)
		      (T
		       <COND (<RT-SEE-INSIDE? .OBJ>
			      <RT-PRINT-CONTENTS-3 .OBJ>)>
		       <SET OBJ <NEXT? .OBJ>>)>>
	<RTRUE>>

<ROUTINE RT-PRINT-CONTENTS-2 (THING "AUX" OBJ (CNT 0))
	<RT-MOVE-NODESC-OBJS .THING ,TH-Y-OBJECT>
	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)>
		<MC-MAKE .OBJ ,FL-SEEN>
		<TELL A .OBJ>
		<COND (<MC-IS? .OBJ ,FL-LIGHTED>
		       <TELL " (providing light)">)>
		<INC CNT>
		<SET OBJ <NEXT? .OBJ>>
		<COND (<MC-T? .OBJ>
		       <COND (<MC-F? <NEXT? .OBJ>>
			      <TELL " and ">)
			     (T
			      <TELL ", ">)>)>>
	<COND (<ZERO? .CNT>
	       <TELL "nothing">)>
	<RT-MOVE-ALL ,TH-Y-OBJECT .THING>
	<RTRUE>>

<ROUTINE RT-PRINT-CONTENTS-3 (THING "AUX" OBJ (FIRST T) (CNT 0))
	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)
		      (<MC-ISNOT? .OBJ ,FL-NODESC>
		       <COND (<MC-T? .FIRST>
			      <SET FIRST <>>
			      <RT-CIN-CON-MSG <LOC .OBJ>>
			      <TELL THE <LOC .OBJ> " you see:" CR>)>
		       <TELL "  " A .OBJ CR>)>
		<SET OBJ <NEXT? .OBJ>>>
	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)
		      (T
		       <COND (<RT-SEE-INSIDE? .OBJ>
			      <RT-PRINT-CONTENTS-3 .OBJ>)>
		       <SET OBJ <NEXT? .OBJ>>)>>>

<ROUTINE RT-DO-WALK (DIR1 "OPTIONAL" (DIR2 <>) (DIR3 <>) "AUX" X)
	<SETG GL-P-WALK-DIR .DIR1>
	<SET X <RT-PERFORM ,V?WALK .DIR1>>
	<COND (<AND <MC-T? .DIR2>
		    <NOT <EQUAL? .X <> ,FATAL-VALUE>>>
	       <SETG GL-P-WALK-DIR .DIR2>
	       <SET X <RT-PERFORM ,V?WALK .DIR2>>
	       <COND (<AND <MC-T? .DIR3>
			   <NOT <EQUAL? .X <> ,FATAL-VALUE>>>
		      <SETG GL-P-WALK-DIR .DIR3>
		      <SET X <RT-PERFORM ,V?WALK .DIR3>>)>)>
	<RETURN .X>>

<ROUTINE RT-WHO-SAYS? ()
	<COND (<AND <MC-HERE? <RT-META-LOC ,CH-HOLMES>>
		    <MC-ISNOT? ,CH-HOLMES ,FL-ASLEEP>
		    <MC-ISNOT? ,CH-HOLMES ,FL-LOCKED>>
	       <RETURN ,CH-HOLMES>)
	      (<AND <MC-HERE? <RT-META-LOC ,CH-WIGGINS>>
		    <MC-ISNOT? ,CH-WIGGINS ,FL-ASLEEP>
		    <MC-ISNOT? ,CH-WIGGINS ,FL-LOCKED>>
	       <RETURN ,CH-WIGGINS>)
	      (T
	       <RFALSE>)>>

<ROUTINE RT-TRANSCRIPT (STR)
	<DIROUT ,K-D-SCR-OFF>
	<TELL CR "Transcript: " .STR CR>
	<RT-VERSION-MSG>
	<DIROUT ,K-D-SCR-ON>>

<ROUTINE RT-QSR ("AUX" KEY)
	<IFSOUND <KILL-SOUNDS>>
	<TELL "The game is no longer afoot." CR CR>
	<REPEAT ()
		<TELL "Do you wish to: (1) Quit, (2) Restart, (3) Restore, (4) Hints">
		<COND (<MC-T? ,GL-CAN-UNDO>
		       <TELL ", (5) Undo">)>
		<TELL " ?" CR>
		<SET KEY <INPUT 1>>
		<COND (<EQUAL? .KEY 49>
		       <QUIT>
		       <TELL "Quit failed." CR>)
		      (<EQUAL? .KEY 50>
		       <RESTART>
		       <TELL "Restart failed." CR>)
		      (<EQUAL? .KEY 51>
		       <COND (<MC-T? ,GL-DEBUG-FLAG>
			      <V-REFRESH>)>
		       <RT-P-CLEAR>
		       <PUTB ,GL-OOPS-INBUF 1 0>
		       <RESTORE>
		       <TELL "Restore failed." CR>)
		      (<EQUAL? .KEY 52>
		       <V-HINT>
		       <V-REFRESH>
		       <AGAIN>)
		      (<AND <EQUAL? .KEY 53>
			    <MC-T? ,GL-CAN-UNDO>>
		       <V-UNDO>)>>>

<ROUTINE V-YES ()
	<TELL ,K-GOOD-SHOW-MSG CR>
	<RFATAL>> 

<ROUTINE V-NO ()
	<TELL ,K-PITY-MSG CR>
	<RFATAL>> 

<ROUTINE V-MAYBE ()
	<TELL ,K-MAYBE-MSG CR> 
	<RFATAL>>

<ROUTINE V-DESC-LEVEL ()
	<TELL "[">
	<COND (<MC-VERB-WORD? VERBOSE>
	       <SETG GL-DESC-LEVEL 2>
	       <TELL "Verbose">)
	      (<MC-VERB-WORD? BRIEF>
	       <SETG GL-DESC-LEVEL 1>
	       <TELL "Brief">)
	      (<MC-VERB-WORD? SUPER SUPERBRIEF>
	       <SETG GL-DESC-LEVEL 0>
	       <TELL "Superbrief">)>
	<TELL " descriptions]" CR>
	<RFATAL>>

<ROUTINE V-QUIT ()
	<TELL "[Your score is " N ,GL-SCORE-CUR " out of " N ,GL-SCORE-MAX
", which earns you a ranking of " <RT-RANK-STR ,GL-SCORE-CUR> ".]" CR CR>
	<TELL "Are you sure you want to quit?">
	<COND (<RT-GET-YES-NO?>
	       <QUIT>
	       ;<TELL "Quit failed." CR>  ;"QUIT never returns"
	       ;<RFATAL>)
	      (T
	       <TELL CR "Continuing." CR>
	       <RFATAL>)>>
		      
<ROUTINE V-RESTART ()
	<TELL "Are you sure you want to restart?">
	<COND (<RT-GET-YES-NO?>
	       <IFSOUND <KILL-SOUNDS>>
	       <RESTART>
	       ;<TELL "Restart failed." CR>  ;"RESTART never returns"
	       ;<RFATAL>)
	      (T
	       <TELL CR "Continuing." CR>
	       <RFATAL>)>>

<ROUTINE V-SAVE ("AUX" X WHO)
	<SET WHO <RT-WHO-SAYS?>>
	<COND (<EQUAL? .WHO ,CH-HOLMES>
	       <TELL
CTHE ,CH-HOLMES " nods in approval and says, \"A wise move, Watson. These are
dangerous times.\"" CR CR>)
	      (<EQUAL? .WHO ,CH-WIGGINS>
	       <TELL
CTHE ,CH-WIGGINS " glances around in alarm and says, \"Do you know somefing I
don't know?\"" CR CR>)>
	<COND (<MC-T? ,GL-DEBUG-FLAG>
	       <V-REFRESH>)>
	<SETG GL-SCORE-STS  -1>
	<SETG GL-MOVES-STS  -1>
	<SETG GL-PLACE-STS  -1>
	<RT-P-CLEAR>
	<PUTB ,GL-OOPS-INBUF 1 0>
	<IFSOUND <SETG SOUND-QUEUED? <>>
		 <KILL-SOUNDS>>
	<SET X <SAVE>>
	<IFSOUND <COND (,SOUND-ON?
			<CHECK-LOOPING>)>>
	<RT-UPDATE-STATUS-LINE>
	<COND (<ZERO? .X>
	       <TELL "Save failed." CR>
	       <RFATAL>)
	      (<EQUAL? .X 1>
	       <TELL "Save completed." CR>
	       <RFATAL>)
	      (T
	       ;<V-REFRESH>
	       <TELL "Restore completed." CR CR>
	       <SET WHO <RT-WHO-SAYS?>>
	       <COND (<EQUAL? .WHO ,CH-HOLMES>
		      <TELL
CTHE ,CH-HOLMES " looks up and says impatiently, \"Where have you been,
Watson? We have work to do.\"" CR CR>)
		     (<EQUAL? .WHO ,CH-WIGGINS>
		      <TELL
CTHE ,CH-WIGGINS " jumps nervously and then says, \"Crikey! You scared me.
Don't sneak up on people that way.\"" CR CR>)>
	       <RT-DESC-ALL <> T>
	       <RFATAL>)>>

<ROUTINE V-RESTORE ()
	<IFSOUND ;<SET X <GET ,SOUND-FLAG 0>>
	         <SETG SOUND-QUEUED? <>>
		 <KILL-SOUNDS>>
	<COND (<MC-T? ,GL-DEBUG-FLAG>
	       <V-REFRESH>)>
	<RT-P-CLEAR>
	<PUTB ,GL-OOPS-INBUF 1 0>
	<RESTORE>
	<COND (<BTST <LOWCORE FLAGS> 4>
	       <RT-INIT-SCREEN T>
	       <RT-UPDATE-STATUS-LINE>
	       <LOWCORE FLAGS <BAND <LOWCORE FLAGS> -5>>)>
	<TELL "Restore failed." CR>
	<IFSOUND <COND (,SOUND-ON?
			<CHECK-LOOPING>)>>
	;<IFSOUND <COND (<G? .X 1>
			<SOUNDS </ .X 16> ,S-START <MOD .X 16>>)>>
	<RFATAL>>

<ROUTINE V-SCRIPT ()
	<TELL "[Scripting ">
	<COND (<MC-VERB-WORD? SCRIPT>
	       <TELL "on">)
	      (T
	       <TELL "off">)>
	<TELL "]" CR>
	<COND (<MC-VERB-WORD? SCRIPT>
	       <DIROUT ,K-D-PRN-ON>
	       <RT-TRANSCRIPT "ON">)
	      (T
	       <RT-TRANSCRIPT "OFF">
	       <DIROUT ,K-D-PRN-OFF>)>
	<RFATAL>>

<ROUTINE V-VERSION ()
	<RT-VERSION-MSG>
	<RFATAL>>

<ROUTINE V-INVENTORY ("AUX" (POCKET <>) PLOC OBJ NXT OLDIT)
	<SET OLDIT ,GL-P-IT-OBJECT>  ;"get and save current 'it' object"
	<SET PLOC <LOC ,TH-POCKET>>	;"get and save pointer to first object"
	<SET POCKET <FIRST? ,TH-POCKET>> ;"in pocket and then remove pocket"
	<REMOVE ,TH-POCKET>
	<SET OBJ <FIRST? ,CH-PLAYER>>   ;"save all objects being worn"
	<REPEAT ()			;" in the TH-X-OBJECT object"
		<COND (<MC-F? .OBJ>
		       <RETURN>)
		      (T
		       <SET NXT <NEXT? .OBJ>>
		       <COND (<AND <MC-IS? .OBJ ,FL-WORN>
				   <N==? .OBJ ,TH-COTTON-BALLS ,TH-STETHOSCOPE>>
			      <MOVE .OBJ ,TH-X-OBJECT>)>
		       <SET OBJ .NXT>)>>
	<COND (<FIRST? ,TH-X-OBJECT>   ; "describe what player is wearing"
	       <TELL "You are wearing:" CR>
	       <RT-PRINT-CONTENTS-1 ,TH-X-OBJECT>)>
	<COND (<OR <MC-IS? ,TH-COTTON-BALLS ,FL-WORN>
		   <MC-IS? ,TH-STETHOSCOPE ,FL-WORN>>
	       <TELL "You have in your ears:" CR "  ">
	       <COND (<MC-IS? ,TH-COTTON-BALLS ,FL-WORN>
		      <MOVE ,TH-COTTON-BALLS ,TH-X-OBJECT>
		      <TELL A ,TH-COTTON-BALLS "." CR>)
		     (T
		      <MOVE ,TH-STETHOSCOPE ,TH-X-OBJECT>
		      <TELL A ,TH-STETHOSCOPE "." CR>)>)>
	<COND (<AND <MC-IS? ,TH-WATSONS-COAT ,FL-WORN>
		    <FIRST? ,TH-POCKET>>
	       ;"describe what is in pocket"
	       <TELL "Your pocket contains:" CR>
	       <RT-PRINT-CONTENTS-1 ,TH-POCKET>)>
	<TELL "You are holding:" CR>	; "describe what player is holding"
	<RT-PRINT-CONTENTS-1 ,CH-PLAYER>
; "describe any objects in/on any container/surface objects the player has"
	;<SET OBJ <FIRST? ,CH-PLAYER>>
	;<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)
		      (T
		       <COND (<AND <RT-SEE-INSIDE? .OBJ>
				   <RT-SEE-ANYTHING-IN? .OBJ>>
			      <RT-CIN-CON-MSG .OBJ>
			      <TELL THE .OBJ " you see:" CR>
			      <RT-PRINT-CONTENTS-1 .OBJ>)>
		       <SET OBJ <NEXT? .OBJ>>)>>
; "move all worn objects saved in the TH-X-OBJECT object back to player"
	<RT-MOVE-ALL ,TH-X-OBJECT ,CH-PLAYER>
; "move the pocket object back to it's original location"
	<MOVE ,TH-POCKET .PLOC>
	<SETG GL-P-IT-OBJECT .OLDIT>    ; "restore the previous 'it' object"
	<RFATAL>>			; "return fatal"

<ROUTINE V-NOTIFY ()
	<SETG GL-SCORE-MSG <NOT ,GL-SCORE-MSG>>
	<TELL "[Score Notification ">
	<COND (,GL-SCORE-MSG
	       <TELL "Enabled">)
	      (T
	       <TELL "Disabled">)>
	<TELL "]" CR>
	<RFATAL>>

<ROUTINE V-SCORE ()
	<TELL
"[You have " N ,GL-SCORE-CUR " out of " N ,GL-SCORE-MAX " points, which earns
you a ranking of " <RT-RANK-STR ,GL-SCORE-CUR> ".]" CR>
	<RFATAL>>

<ROUTINE V-UNDO ()
	<IFSOUND ;<SET X <GET ,SOUND-FLAG 0>>
	         <SETG SOUND-QUEUED? <>>
		 <KILL-SOUNDS>>
	<SETG GL-PLACE-STS 0>
	<COND (<ZERO? <IRESTORE>>
	       <TELL "[UNDO failed.]" CR>)
	      (T
	       <TELL "[UNDO is not available.]" CR>)>
	<IFSOUND <COND (,SOUND-ON?
			<CHECK-LOOPING>)>>
	;<IFSOUND <COND (<G? .X 1>
			<SOUNDS </ .X 16> ,S-START <MOD .X 16>>)>>>

