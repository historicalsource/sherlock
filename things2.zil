; "game : SHERLOCK!"
; "file : THINGS2.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   28 Oct 1987  4:36:08  $"
; "rev  : $Revision:   1.144  $"
; "vers : 1.00"

<ROUTINE RT-DF-TH-ROOM ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-DF "TH-ROOM">>
	<COND (<N==? .CONTEXT ,K-M-DESCFCN> <RFALSE>)>
	<COND (<MC-ISNOT? ,GL-PLACE-CUR ,FL-INDOORS>
	       <TELL "You're not inside a room." CR>)
	      (T
	       <V-LOOK>)>>

<ROUTINE RT-AC-TH-NOT-HERE-OBJECT ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-NOT-HERE-OBJECT">>
	<RT-TH-NOT-HERE-OBJECT>>

<ROUTINE RT-AC-TH-INTDIR ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-INTDIR">>
	<COND (<MC-VERB? SHOOT>
	       <RT-WASTE-OF-BULLETS-MSG>)
	      (<RT-TOUCH-VERB?>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-TIME ("OPT" (CONTEXT <>))
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <COND (<EQUAL? <GETP ,TH-TIME ,P?OBJ-NOUN>
			      ,W?MINUTE ,W?MINUTES>
		      <TELL "minute">)
		     (T
		      <TELL "hour">)>)
	      (<T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? SHOOT>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (<RT-TOUCH-VERB?>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)
	      (<INTBL? ,GL-PRSA <REST ,GL-SEE-VERBS 2> <GET ,GL-SEE-VERBS 0>>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-HANDS ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-HANDS">>
	<COND (<MC-THIS-PRSO?>
	       <COND (<AND <MC-PRSI? <>>
			   <MC-VERB? TAKE TAKE-OFF>
			   <MC-IS? ,TH-HANDS ,FL-LOCKED>>
		      <MC-UNMAKE ,TH-HANDS ,FL-LOCKED>
		      <RT-CYOU-MSG "take" "takes">
		      <SETG HEARD-SWING? <>>
		      <TELL THE ,TH-HANDS " off of " THE ,TH-EARS "." CR>)
		     (<MC-PRSI? ,TH-EARS>
		      <COND (<MC-VERB? TAKE>
			     <COND (<MC-ISNOT? ,TH-HANDS ,FL-LOCKED>
				    <TELL "Your hands are not on " THE ,TH-EARS "." CR>)
				   (T
				    <MC-UNMAKE ,TH-HANDS ,FL-LOCKED>
				    <RT-CYOU-MSG "take" "takes">
				    <SETG HEARD-SWING? <>>
				    <TELL THE ,TH-HANDS " off of "
					  THE ,TH-EARS "." CR>)>)
			    (<MC-VERB? PUT-ON>
			     <COND (<MC-IS? ,TH-HANDS ,FL-LOCKED>
				    <TELL "Your hands are already on "
					  THE ,TH-EARS "." CR>)
				   (T
				    <MC-MAKE ,TH-HANDS ,FL-LOCKED>
				    <RT-CYOU-MSG "put" "puts">
				    <TELL THE ,TH-HANDS " on "
					  THE ,TH-EARS "." CR>)>
			     <RTRUE>)>)>)
	      (<MC-THIS-PRSI?>
	       <COND (<MC-PRSO? ,TH-EARS>
		      <COND (<MC-VERB? COVER>
			     <COND (<MC-IS? ,TH-HANDS ,FL-LOCKED>
				    <TELL "Your hands are already on " THE ,TH-EARS "." CR>)
				   (T
				    <MC-MAKE ,TH-HANDS ,FL-LOCKED>
				    <RT-CYOU-MSG "put" "puts">
				    <TELL THE ,TH-HANDS " on " THE ,TH-EARS "." CR>)>
			     <RTRUE>)>)>)>>

<ROUTINE RT-AC-TH-WATSONS-HEART ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-WATSONS-HEART">>
	<COND (<MC-VERB? LISTEN>
	       <COND (<MC-IS? ,TH-COTTON-BALLS ,FL-WORN>
	              <RT-CYOU-MSG>
		      <TELL
"cannot hear a thing with " THE ,TH-COTTON-BALLS " in " THE ,TH-EARS>)
		     (<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
		      <IFSOUND <SOUNDS ,S-HEART2 ,S-START <COND (<MC-HERE?
			        ,RM-BAR-OF-GOLD ,RM-LAIR ,RM-SWAN-LANE> 8)
					       			(T 6)> 8>>
		      <TELL "Your heart is beating ">
		      <COND (<MC-HERE? ,RM-BAR-OF-GOLD ,RM-LAIR ,RM-SWAN-LANE>
			     <TELL "so loudly you're surprised everyone can't hear it">)
			    (T
			     <TELL "normally">)>)
		     (T
		      <RT-CYOU-MSG>
		      <TELL "should wear the stethoscope, first">)>
	       <TELL "." CR>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-EARS ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-EARS">>
	<COND (<MC-THIS-PRSI?>
	       <COND (<MC-VERB? PUT>
		      <COND (<MC-PRSO? ,TH-HANDS ,TH-STETHOSCOPE>
			     <RFALSE>)
			    ;(<IN? ,GL-PRSO ,TH-EARS>
			     <TELL CTHEO>
			     <RT-IS-ARE-MSG>
			     <TELL "already in " THEI "." CR>)
			    (<MC-PRSO? ,TH-COTTON-BALLS>
			     <COND (<FSET? ,GL-PRSO ,FL-WORN>
				    <TELL CTHEO>
				    <RT-IS-ARE-MSG>
				    <TELL "already in " THEI "." CR>)
				   (<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
				    <RT-CYOU-MSG>
				    <RT-WOULD-HAVE-TO-MSG "take out" ,TH-STETHOSCOPE>
				    <TELL " first." CR>
				    <RTRUE>)
				   (T
				    <SETG GL-LISTEN-OBJ <>>
				    <MC-MAKE ,TH-COTTON-BALLS ,FL-WORN>
				    <RT-CYOU-MSG "put" "puts">
				    <TELL THEO " in " THEI "." CR>)>)
			    (T
			     <TELL "You cannot put that in " THE ,TH-EARS "." CR>)>)
		     (<MC-VERB? TAKE>
		      <COND (<MC-PRSO? ,TH-HANDS ,TH-STETHOSCOPE>
			     <RFALSE>)
			    ;(<NOT <IN? ,GL-PRSO ,TH-EARS>>
			     <TELL CTHEO>
			     <RT-ISNT-ARENT-MSG>
			     <TELL "in " THEI "." CR>)
			    (<MC-PRSO? ,TH-COTTON-BALLS>
			     <SETG GL-LISTEN-OBJ <>>
			     <MC-UNMAKE ,TH-COTTON-BALLS ,FL-WORN>
			     <TELL "You take the cotton balls out of your ears." CR>)
			    ;(T
			     <RT-CYOU-MSG>
			     <TELL "cannot take that out of " THEI "." CR>)>)
		     (<MC-VERB? EMPTY EMPTY-INTO>
		      <RT-CYOU-MSG>
		      <TELL "cannot empty anything into " THEI "." CR>)>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? LOOK-INSIDE LOOK-ON EXAMINE>
		      <TELL ,K-EYES-HINGED-MSG CR>)
		     (<MC-VERB? REACH-IN SEARCH>
		      <COND (<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
			     <RT-CYOU-MSG "feel" "feels">
			     <TELL THE ,TH-STETHOSCOPE "." CR>)
			    (<MC-IS? ,TH-COTTON-BALLS ,FL-WORN>
			     <RT-CYOU-MSG "feel" "feels">
			     <TELL THE ,TH-COTTON-BALLS "." CR>)>)>)>>

<ROUTINE RT-AC-TH-HEAD ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-HEAD">>
	<COND (<MC-THIS-PRSI?>
	       <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<AND <MC-VERB? TOUCH SEARCH>
			   <MC-IS? ,TH-WATSONS-HAT ,FL-WORN>>
		      <TELL "You are wearing " THE ,TH-WATSONS-HAT "." CR>)
		     (<MC-VERB? EXAMINE LOOK-ON>
		      <TELL ,K-EYES-HINGED-MSG CR>)>)>>

<ROUTINE RT-AC-TH-BREATH ()
  <DEBUGGING? <RT-DEBUG-OB-AC "TH-BREATH">>
  <COND (<MC-THIS-PRSI?>
	 <RFALSE>)
	(<MC-THIS-PRSO?>
	 <COND (<MC-VERB? EXAMINE LOOK-INSIDE SEARCH> 
		<TELL "It is not cold enough to see " THEO "." CR>)
	       (<MC-VERB? SMELL>
		<TELL "It smells no worse than usual." CR>)
	       (<MC-VERB? RELEASE>
		<V-EXHALE>)
	       ;(<MC-VERB? TAKE ;SUCK>  ;"Handled in PRE-TAKE"
		<COND (<NOT <MC-PRSI? <> ,ROOMS>>
		       <RT-IMPOSSIBLE-MSG>)
		      (<N==? ,GL-WINNER ,CH-PLAYER>
		       <TELL CTHE ,GL-WINNER " look">
		       <RT-S-NOS-MSG ,GL-WINNER>
		       <TELL " at you strangely, but otherwise ignore">
		       <RT-S-NOS-MSG ,GL-WINNER>
		       <TELL " you." CR>
		       <RTRUE>)
		      (<MC-VERB-WORD? HOLD TAKE CATCH GET GRAB PINCH ;SUCK>
		       <V-INHALE>)
		      (T
		       <TELL "You cannot " VW " " THE ,TH-BREATH "." CR>)>)
	       (<MC-VERB? SHOOT>
		<TELL "It's bad, but it doesn't deserve to die." CR>)>)>>

<ROUTINE RT-AC-TH-CLOTHES ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-CLOTHES">>
	<COND (<MC-VERB? LOOK-INSIDE SEARCH>
	       <RT-PERFORM ,V?LOOK-INSIDE ,TH-POCKET>
	       <RTRUE>)
	      (<AND <MC-VERB? PUT>
		    <MC-PRSI? ,TH-CLOTHES>>
	       <TELL "[in " THE ,TH-POCKET "]" CR>
	       <RT-PERFORM ,V?PUT ,GL-PRSO ,TH-POCKET>
	       <RTRUE>)
	      (<MC-VERB? WEAR>
	       <TELL "You are already wearing them." CR>
	       <RTRUE>)
	      (<MC-VERB? TAKE-OFF DROP RAISE>
	       <TELL ,K-INAPPROPRIATE-MSG CR>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE RT-AC-TH-WATERMARK ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-WATERMARK">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<OR <RT-VISIBLE? ,TH-GREEN-PAPER>
			  <RT-VISIBLE? ,TH-WHITE-PAPER>
			  <RT-VISIBLE? ,TH-BLUE-PAPER>
			  <RT-VISIBLE? ,TH-ORANGE-PAPER>
			  <RT-VISIBLE? ,TH-YELLOW-PAPER>
			  <RT-VISIBLE? ,TH-BROWN-PAPER>>
		      <RFALSE>)
		     (T
		      <RT-CYOU-MSG "do" "does">
		      <TELL "not see any " D ,TH-WATERMARK "here." CR>
		      <RTRUE>)>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<OR <RT-VISIBLE? ,TH-GREEN-PAPER>
		   <RT-VISIBLE? ,TH-WHITE-PAPER>
		   <RT-VISIBLE? ,TH-BLUE-PAPER>
		   <RT-VISIBLE? ,TH-ORANGE-PAPER>
		   <RT-VISIBLE? ,TH-YELLOW-PAPER>
		   <RT-VISIBLE? ,TH-BROWN-PAPER>>
	       <COND (<MC-VERB? SHOOT>
		      <RT-WASTE-OF-BULLETS-MSG>)>)
	      (T
	       <RT-CYOU-MSG "do" "does">
	       <TELL "not see any " D ,TH-WATERMARK " here." CR>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-SESAME ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-SESAME">>
	<COND (<MC-VERB? OPEN>
	       <TELL "Ali Baba you're not." CR>
	       <RTRUE>)
	      (<NOT <RT-TALK-VERB?>>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-RIGHT ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-RIGHT">>
	<COND (<MC-THIS-PRSO?>
	       <COND (<RT-TOUCH-VERB?>
		      <RT-IMPOSSIBLE-MSG>)
		     (<INTBL? ,GL-PRSA <REST ,GL-SEE-VERBS 2> <GET ,GL-SEE-VERBS 0>>
		      <RT-IMPOSSIBLE-MSG>)
		     (<MC-VERB? SHOOT>
		      <RT-IMPOSSIBLE-MSG>)>)>>

<ROUTINE RT-AC-TH-LEFT ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-LEFT">>
	<COND (<MC-THIS-PRSO?>
	       <COND (<RT-TOUCH-VERB?>
		      <RT-IMPOSSIBLE-MSG>)
		     (<INTBL? ,GL-PRSA <REST ,GL-SEE-VERBS 2> <GET ,GL-SEE-VERBS 0>>
		      <RT-IMPOSSIBLE-MSG>)
		     (<MC-VERB? SHOOT>
		      <RT-IMPOSSIBLE-MSG>)>)>>

<ROUTINE RT-AC-TH-BULLET-HOLE ("AUX" (NUM 0) OFF (HOLE <>) PLACE)
       <DEBUGGING? <RT-DEBUG-OB-AC "TH-BULLET-HOLE">>
       <REPEAT ()
	       <SET OFF <* .NUM 2>>
	       <COND (<EQUAL? .NUM <GET ,GL-HOLES 0>>
		      <RETURN>)
		     (<RT-VISIBLE? <GET ,GL-HOLES <+ .OFF 1>>>
		      <COND (<OR <MC-F? <SET PLACE <GET ,GL-HOLES <+ .OFF 2>>>>
				 <MC-HERE? .PLACE>>
			     <SET HOLE T>
			     <RETURN>)>)>
	       <INC NUM>>
       <COND (<MC-F? .HOLE>
	      <RT-CANT-SEE-ANY-MSG ,TH-BULLET-HOLE>)
	     (<MC-VERB? SHOOT>
	      <TELL ,K-ANNIE-OAKELEY-MSG CR>)>>

<ROUTINE RT-AC-TH-GENERIC-BODY ("OPT" (CONTEXT <>) (CLASS <>) "AUX"
			 (ADJ <GETP ,TH-GENERIC-BODY ,P?OBJ-ADJ>) S1 S2
			 (WHICH ,CH-PLAYER))
	 <COND (<EQUAL? .ADJ ,W?WIGGINS\'>
	       <SET WHICH ,CH-WIGGINS>)
	      (<EQUAL? .ADJ ,W?HOLMES\' ,W?HOLMES\'S>
	       <SET WHICH ,CH-HOLMES>)
	      (<EQUAL? .ADJ ,W?HUDSON\'S>
	       <SET WHICH ,CH-HUDSON>)
	      (<EQUAL? .ADJ ,W?ELIZA\'S ,W?GIRL\'S>
	       <SET WHICH ,CH-ELIZA-DOOLITTLE>)
	      (<EQUAL? .ADJ ,W?HER>
	       <COND (<RT-VISIBLE? ,CH-HUDSON>
		      <SET WHICH ,CH-HUDSON>)
		     (T
		      <SET WHICH ,CH-ELIZA-DOOLITTLE>)>)
	      (<EQUAL? .ADJ ,W?LEFT ,W?RIGHT>
	       <COND (<RT-VISIBLE? ,CH-WIGGINS>
		      <SET WHICH ,CH-WIGGINS>)
		     (<RT-VISIBLE? ,CH-HOLMES>
		      <SET WHICH ,CH-HOLMES>)
		     (<RT-VISIBLE? ,CH-HUDSON>
		      <SET WHICH ,CH-HUDSON>)
		     (<RT-VISIBLE? ,CH-ELIZA-DOOLITTLE>
		      <SET WHICH ,CH-ELIZA-DOOLITTLE>)>)>
	<COND (<==? .WHICH ,CH-WIGGINS>
	       <SET S1 "Wiggins">
	       <SET S2 "Wiggins's">)
	      (<==? .WHICH ,CH-HOLMES>
	       <SET S1 "Holmes">
	       <SET S2 "Holmes's">)
	      (<==? .WHICH ,CH-HUDSON>
	       <SET S1 "Mrs Hudson">
	       <SET S2 "Mrs Hudson's">)
	      (<==? .WHICH ,CH-ELIZA-DOOLITTLE>
	       <SET S1 "the girl">
	       <SET S2 "the girl's">)
	      (<==? .WHICH ,CH-PLAYER>
	       <SET S1 "yourself">
	       <SET S2 "your">)>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <TELL .S1>
	       <RTRUE>)
	      (<T? .CONTEXT> <RFALSE>)>
	<COND (<NOT <RT-VISIBLE? .WHICH>>
	       <RT-CANT-SEE-ANY-MSG <> .S1 T>
	       <RFATAL>)
	      (<==? .WHICH ,CH-ELIZA-DOOLITTLE>
	       <TELL "[You do not need to refer to">
	       <RT-CLAUSE-PRINT ,K-P-NC1 ,K-P-NC1L>
	       <TELL ".]" CR>
	       <RFATAL>)
	      (T
	       <TELL
"[You do not need to refer to any part of " .S2 " body.]" CR>
	       <RFATAL>)>>

<ROUTINE RT-AC-TH-POCKET ()
	<COND (<AND <MC-VERB? PUT>
		    <MC-THIS-PRSI?>
		    <MC-PRSO? TH-PADDLE
			      TH-MACE
			      TH-ANCHOR
			      TH-LAMP
			      TH-VIOLIN
			      TH-PACKET-OF-PAPER
			      TH-SUIT-OF-ARMOUR
			      TH-OAR-1
			      TH-OAR-2
			      TH-TORCH
			      TH-WAX-AX
			      TH-WAX-HEAD>>
	       <RT-CANT-PUT-IN-ON-MSG ,TH-POCKET>)>>

<ROUTINE RT-AC-TH-GUN ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-GUN">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "The gun is a six-shot revolver." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? OPEN LOOK-INSIDE SEARCH>
	       <TELL "The gun is jammed shut. You can't open it." CR>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE RT-AC-TH-KNIFE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-KNIFE">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It's a nasty-looking jackknife." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT>
	       <RFALSE>)
	      (<MC-VERB? CUT>
	       <COND (<MC-ISNOT? ,TH-KNIFE ,FL-OPENED>
		      <TELL CTHE ,TH-KNIFE " isn't open." CR>)>)
	      (<MC-VERB? TAKE>
	       <SETG KNIFE-COLD? <>>
	       <RFALSE>)>>

<ROUTINE RT-AC-TH-MAGNIFYING-GLASS ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-MAGNIFYING-GLASS">>
; "DEB -- I put this COND in so that the gem action routine would handle"
; "looking at the gem with the magnifying glass."
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It is of Swiss manufacture, with a precision-ground lens." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-PRSO? ,TH-SAPPHIRE ,TH-EMERALD ,TH-OPAL ,TH-RUBY ,TH-TOPAZ
                         ,TH-GARNET ,TH-WESTMINSTER-CLUE ,TH-JEWEL-CASE>
	       <RFALSE>)>
	<SETG GL-P-IT-OBJECT ,TH-MAGNIFYING-GLASS>
	<COND (<MC-THIS-PRSI?>
	       <COND (<MC-VERB? LOOK-THRU>
		      <COND (<NOT <IN? ,GL-PRSI ,CH-PLAYER>>
			     <RT-YOUD-HAVE-TO-MSG "be holding" ,GL-PRSI>
			     <RTRUE>)
			    (<EQUAL? ,GL-PRSO ,TH-MAGNIFYING-GLASS>
			     <RT-IMPOSSIBLE-MSG>
			     <RTRUE>)
			    (<NOT <EQUAL? ,GL-LASTFOC ,GL-PRSO>>
			     <SETG GL-LASTFOC ,GL-PRSO>
			     <TELL "You train the magnifying glass on " THEO "." CR>)>
		      <COND (<AND <MC-IS? ,GL-PRSO ,FL-PLURAL>
				  <MC-ISNOT? ,GL-PRSO ,FL-COLLECTIVE>>
			     <TELL "They appear ">)
			    (<AND <MC-IS? ,GL-PRSO ,FL-PERSON>
				  <MC-IS? ,GL-PRSO ,FL-FEMALE>>
			     <TELL "She appears ">)
			    (<AND <MC-IS? ,GL-PRSO ,FL-PERSON>
				  <MC-ISNOT? ,GL-PRSO ,FL-FEMALE>>
			     <TELL "He appears ">)
			    (T
			     <TELL "It appears ">)>
		      <TELL "much larger now." CR>
		      <RTRUE>)
		     (T
		      <RFALSE>)>)
	      (<MC-VERB? SHOOT>
	       <TELL CTHEO ,K-SHATTER-MSG CR>)
	      (<MC-VERB? LOOK-INSIDE>
	       <TELL "Everything appears much larger." CR>
	       <RTRUE>)
	      (<MC-VERB? ADJUST PLAY>
	       <TELL "You cannot adjust a magnifying glass." CR>
	       <RTRUE>)
	      ;(<MC-VERB? OPEN OPEN-WITH CLOSE REACH-IN>
		<TELL "You cannot do that with a magnifying glass." CR>
		<RTRUE>)
	      (T
	       <RFALSE>)>>

<ROUTINE RT-AC-TH-VIOLIN ("OPT" (CONTEXT <>) "AUX" WHO)
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-VIOLIN">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It is a Stradivarius violin of exceptional quality." CR>)
	      (<T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? PLAY>
	       <COND (<NOT <IN? ,TH-VIOLIN ,GL-WINNER>>
		      <RT-CYOU-MSG "are" "is">
		      <TELL "not holding " THEO "." CR>
		      <RTRUE>)>
	       <IFSOUND <SOUNDS ,S-BADVIOL>>
	       <COND (<AND <IN? ,TH-PHIAL ,CH-HOLMES>
			   <MC-HERE? ,RM-HOLMES-STUDY>>
		      <TELL "Even the grotesque noises">
		      <RT-YOU-MSG "make" "makes">
		      <TELL "with the violin aren't enough to
distract Holmes's attention from the phial." CR>
		      <RTRUE>)>
	       <SET WHO <RT-ANYONE-HERE?>>
	       <COND (<MC-T? .WHO>
		      <MC-MAKE .WHO ,FL-ASLEEP>
		      <COND (<RT-ANYONE-HERE?>
			     <TELL "Everyone">)
			    (T
			     <TELL CTHE .WHO>)>
		      <MC-UNMAKE .WHO ,FL-ASLEEP>
		      <TELL " grimace">
		      <RT-S-NOS-MSG .WHO>
		      <TELL " in pain and glare">
		      <RT-S-NOS-MSG .WHO>
		      <TELL " at you." CR>)
		     (T
		      <TELL
"Even you cannot abide the grotesque screeches that emanate from the tortured
instrument, so you quickly stop." CR>)>)>>

<ROUTINE RT-AC-TH-PHIAL ("AUX" HITS)
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-PHIAL">>
	<COND (<MC-VERB? SHOOT>
	       <SET HITS ,TH-PHIAL-AUX1>
	       <SETG TH-PHIAL-AUX1 <+ 1 .HITS>>
	       <COND (<ZERO? .HITS>
		      <TELL
"Nice shot! The phial explodes. You hear a muffled scream from downstairs
as Mrs Hudson lets out a shriek." CR CR
,K-HOLMES-LICKS-MSG
"eyes begin to cloud over from the small dose you have caused him to take."
CR CR ,K-ANOTHER-PHIAL-MSG CR>
		      <RTRUE>)
		     (<EQUAL? 1 .HITS>
		      <TELL
"The phial explodes. From downstairs you hear a dull thud as Mrs Hudson
faints and hits the floor." CR CR ,K-HOLMES-LICKS-MSG
"body stiffens as the increased dosage of the drug enters his system."
CR CR ,K-ANOTHER-PHIAL-MSG CR CR
"As a doctor, you know that another dose may be fatal." CR>
		      <RTRUE>)
		     (<EQUAL? 2 .HITS>
		      <TELL
"That persistent, are you? Too bad. The chill you caught from the damp air
outside causes you to sneeze just as you pull the trigger. You have shot and
killed Sherlock Holmes." CR CR
"Inspector Lestrade appears at the door and says,"
,K-PLUG-HIM-MYSELF-MSG CR CR ,K-LESTRADE-ARRESTS-MSG CR CR>
		      <RT-QSR>)>)
	      (<RT-TOUCH-VERB?>
	       <RT-HOLMES-HITS ,TH-PHIAL>
	       <RTRUE>)>
	<RFALSE>>

<ROUTINE RT-HOLMES-HITS (THING)
	<TELL
"Holmes is faster than you are. He moves " THE .THING " beyond your reach and
absentmindedly hits you on the head with his free hand." CR CR

"Holmes continues staring at the phial." CR>>

<ROUTINE RT-AC-TH-GREEN-PAPER ()
	 <DEBUGGING? <RT-DEBUG-OB-AC "TH-GREEN-PAPER">>
	 <RT-PROCESS-PAPER ,TH-GREEN-PAPER>>

<ROUTINE RT-AC-TH-WHITE-PAPER ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-WHITE-PAPER">>
	<RT-PROCESS-PAPER ,TH-WHITE-PAPER>>

<ROUTINE RT-AC-TH-BLUE-PAPER ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-BLUE-PAPER">>
	<RT-PROCESS-PAPER ,TH-BLUE-PAPER>>

<ROUTINE RT-AC-TH-ORANGE-PAPER ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-ORANGE-PAPER">>
	<RT-PROCESS-PAPER ,TH-ORANGE-PAPER>>

<ROUTINE RT-AC-TH-YELLOW-PAPER ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-YELLOW-PAPER">>
	<RT-PROCESS-PAPER ,TH-YELLOW-PAPER>>

<ROUTINE RT-AC-TH-BROWN-PAPER ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-BROWN-PAPER">>
	<RT-PROCESS-PAPER ,TH-BROWN-PAPER>>

<ROUTINE RT-AC-TH-ELIZABETH-TOMB ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-ELIZABETH-TOMB">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"The tomb is that of Elizabeth and her half-sister, Mary Tudor. It is
surrounded by twelve black marble pillars, and on the base is an inscription."
CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (T
	       <RT-PROCESS-TOMB 1>)>>

<ROUTINE RT-AC-TH-NEWTON-TOMB ("OPT" (CONTEXT <>) (CLASS <>)
			       "AUX" WRD)
  <COND (<EQUAL? <SET WRD <GETP ,TH-NEWTON-TOMB ,P?OBJ-NOUN>>
		 ,W?STATUE>
	 <COND (<==? .CONTEXT ,K-M-SDESC>
		; "First letter, base string, class, capitalize?,
		   setting of NOARTC for
		   this, setting of PLURAL for this"
		<PRINT-SDESC "statue of Sir Isaac Newton" .CLASS 
			     <> <>>)
	       (<==? .CONTEXT ,K-M-DESCFCN>
		<TELL
"The great mathematician is shown reclining in a pensive mood." CR>)
	       (T <RFALSE>)>)
	(<EQUAL? .WRD ,W?CHERUB ,W?ANGEL ,W?CHERUBS ,W?ANGELS>
	 <COND (<==? .CONTEXT ,K-M-SDESC>
		<PRINT-SDESC "cherubs" .CLASS <> T>)
	       (<==? .CONTEXT ,K-M-DESCFCN>
		<TELL "Cute, aren't they?" CR>)
	       (T
		<RFALSE>)>)
	(<EQUAL? .WRD ,W?DIAGRAM ,W?SYSTEM>
	 <COND (<==? .CONTEXT ,K-M-SDESC>
		<PRINT-SDESC "diagram" .CLASS <> <>>)
	       (T
		<RFALSE>)>)
	(T
	 <COND (<==? .CONTEXT ,K-M-SDESC>
		<PRINT-SDESC "Newton's tomb" .CLASS T <>>)
	       (<==? .CONTEXT ,K-M-DESCFCN>
		<TELL
"It's a white marble sarcophagus with \"ISAACVS NEWTON   Eques Auratus\"
written on the front. Above it is a marble statue of Newton, and a carving
of two cherubs who are holding a diagram of the solar system."	CR>)
	       (<MC-T? .CONTEXT> <RFALSE>)
	       (T
		<RT-PROCESS-TOMB 2>)>)>>

<ROUTINE PRINT-SDESC (BASE CLASS NOART? PLURAL? "OPT" (VOWEL? <>)
		      (PRINTB? <>)
		      "AUX" (IS <>))
  <COND (<F? .NOART?>
	 <COND (<==? .CLASS ,K-DESC-ANY>
		<SET IS "any">)
	       (<OR <==? .CLASS ,K-DESC-THE>
		    .PLURAL?>
		<SET IS "the">)
	       (.PLURAL?
		<SET IS "some">)
	       (T
		<COND (.VOWEL?
		       <SET IS "an">)
		      (T
		       <SET IS "a">)>)>
	 <COND (.IS <TELL .IS>)>
	 <PRINTC !\ >)>
  <COND (.PRINTB?
	 <PRINTB .BASE>)
	(T
	 <TELL .BASE>)>>

<ROUTINE RT-AC-TH-HENRY-V-TOMB ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-HENRY-V-TOMB">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"It's an old wooden coffin on a raised platform. On the top is an effigy of
Henry V, and there is an inscription carved into the side." CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (T
	       <RT-PROCESS-TOMB 3>)>>

<ROUTINE RT-AC-TH-EDWARD-TOMB ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-EDWARD-TOMB">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL 
"It's the tomb of Edward the Confessor, the founder of Westminster Abbey,
and the only English king ever to be canonized. Around the tomb is a frieze
that shows scenes from Edward's life, and on the base there is a faded
inscription." CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (T
	       <RT-PROCESS-TOMB 4>)>>

<ROUTINE RT-AC-TH-POPE-TOMB ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-POPE-TOMB">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL ,K-SIMPLE-TOMB-MSG CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (T
	       <RT-PROCESS-TOMB 5>)>>

<ROUTINE RT-AC-TH-DICKENS-TOMB ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-DICKENS-TOMB">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL ,K-SIMPLE-TOMB-MSG CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (T
	       <RT-PROCESS-TOMB 6>)>>

<ROUTINE RT-AC-TH-CHAUCER-TOMB ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-CHAUCER-TOMB">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"It's the tomb of Geoffrey Chaucer, who died in 1400 and became the first
person to be buried in Poet's Corner. The inscription above the sarcophagus
is so faded that it is almost illegible."  CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (T
	       <RT-PROCESS-TOMB 7>)>>

<ROUTINE RT-AC-TH-ANNE-OF-CLEVES-TOMB ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-ANNE-OF-CLEVES-TOMB">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL ,K-SIMPLE-TOMB-MSG CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (T
	       <RT-PROCESS-TOMB 8>)>>

<ROUTINE RT-AC-TH-LITTLE-PRINCES-TOMB ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-LITTLE-PRINCES-TOMB">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"According to the inscription, the urn contains the remains of the Little
Princes in the Tower." CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (T
	       <RT-PROCESS-TOMB 9>)>>

<ROUTINE RT-AC-TH-MARY-QUEEN-OF-SCOTS-TOMB ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-MARY-QUEEN-OF-SCOTS-TOMB">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"The tomb is a simple sarcophagus with a marble effigy of Mary, Queen of
Scots on it." CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (T
	       <RT-PROCESS-TOMB 10>)>>

<ROUTINE RT-AC-TH-HENRY-VII-TOMB ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-HENRY-VII-TOMB">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"It's an incredibly lavish tomb which is surmounted by gilt effigies of Henry
VII and his wife Elizabeth of York." CR>)
	      (<MC-T? .CONTEXT>
	       <RFALSE>)
	      (T
	       <RT-PROCESS-TOMB 11>)>>

<ROUTINE RT-AC-TH-PITT-TOMB ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-PITT-TOMB">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"It's a huge monument to William Pitt. On the base of the monument are five "
D ,TH-FIGURES " and an elaborate inscription." CR>)
	      (<MC-T? .CONTEXT>
	       <RFALSE>)
	      (T
	       <RT-PROCESS-TOMB 12>)>>

<ROUTINE RT-AC-TH-FIGURES ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-DF "TH-FIGURES">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"You've never understood allegorical figures before. What makes you think you
can start now?" CR>)
	      (T
	       <RFALSE>)>>

<ROUTINE RT-AC-TH-VERE-TOMB ("OPT" (CONTEXT <>) (CLASS <>) (CAP? <>) "AUX" WRD)
  <COND (<==? <SET WRD <GETP ,TH-VERE-TOMB ,P?OBJ-NOUN>> ,W?KNIGHT ,W?KNIGHTS>
	 <COND (<==? .CONTEXT ,K-M-SDESC>
		<PRINT-SDESC "knights" .CLASS <> T>)
	       (T
		<RFALSE>)>)
	(<==? .WRD ,W?SUIT ,W?ARMOUR ,W?ARMOR>
	 <COND (<==? .CONTEXT ,K-M-SDESC>
		<PRINT-SDESC "armour" .CLASS <> <> T>)
	       (<T? .CONTEXT> <RFALSE>)
	       (<MC-VERB? SHOOT>
		<TELL ,K-RICOCHET-MSG CR>)>)
	(<==? .CONTEXT ,K-M-SDESC>
	 <PRINT-SDESC "Sir Francis Vere's tomb" .CLASS T <>>)
	(<==? .CONTEXT ,K-M-DESCFCN>
	 <TELL
"It's an effigy of a man surrounded by four knights, who are holding up
a marble slab on their shoulders. On the slab is the dead man's armour." CR>)
	(<MC-T? .CONTEXT> <RFALSE>)
	(T
	 <RT-PROCESS-TOMB 13>)>>

<ROUTINE RT-AC-TH-LAMP ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-LAMP">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It is a battered old brass lamp that has accompanied
you on many adventures in the past." CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-THIS-PRSI?>
	       <COND (<MC-VERB? THROW>
		      <COND (<G? <GET-MASS ,GL-PRSO> 5>
			     <RT-BREAK-LAMP>
			     <TELL CR CTHEO " ">
			     <RT-LANDS-AT-YOUR-FEET-MSG>
			     <RTRUE>)>)
		     (<MC-VERB? PUT>
		      <RT-LAMP-SEALED>)>)
	      (T
	       <COND (<MC-VERB? SHOOT KICK MUNG>
		      <RT-BREAK-LAMP>)
		     (<MC-VERB? OPEN CLOSE OPEN-WITH ;UNSCREW LOOK-INSIDE
				SEARCH REACH-IN EMPTY EMPTY-INTO>
		      <RT-LAMP-SEALED>)
		     (<MC-VERB? LAMP-ON LIGHT-WITH TURN-UP LIGHT>
		      <COND (<MC-IS? ,TH-LAMP ,FL-BROKEN>
			     <MC-UNMAKE ,TH-LAMP ,FL-ASLEEP>
			     <TELL "Nothing happens." CR>)
			    (<MC-ISNOT? ,TH-LAMP ,FL-ASLEEP>
			     <TELL CTHE ,TH-LAMP " is already on." CR>)
			    (T
			     <MC-UNMAKE ,TH-LAMP ,FL-ASLEEP>
			     <MC-MAKE ,TH-LAMP ,FL-LIGHTED>
			     <TELL "You turn up the wick. " CTHE ,TH-LAMP
" emits a warm glow that lights up the area around you." CR>)>)
		     (<MC-VERB? LAMP-OFF TURN-DOWN>
		      <COND (<MC-IS? ,TH-LAMP ,FL-ASLEEP>
			     <TELL CTHE ,TH-LAMP " is already off." CR>)
			    (<MC-IS? ,TH-LAMP ,FL-BROKEN>
			     <MC-MAKE ,TH-LAMP ,FL-ASLEEP>
			     <TELL "Nothing happens." CR>)
			    (T
			     <MC-MAKE ,TH-LAMP ,FL-ASLEEP>
			     <MC-UNMAKE ,TH-LAMP ,FL-LIGHTED>
			     <TELL "You turn down the wick. " CTHE ,TH-LAMP
" goes dark." CR>)>)
		     (<MC-VERB? POINT-AT SHINE-AT>
		      <COND (<MC-IS? ,TH-LAMP ,FL-LIGHTED>
			     <COND (<EQUAL? ,GL-PRSO ,GL-PRSI>
				    <RT-CYOU-MSG>
				    <TELL "can't point the light at itself." CR>)
				   (T
				    <TELL "You point " THE ,TH-LAMP " at " THEI ", but it reveals nothing." CR>)>)
			    (T
			     <TELL CTHE ,TH-LAMP " is not on." CR>)>)>)>>

<ROUTINE RT-LAMP-SEALED ()
	<TELL
CTHE ,TH-LAMP " is firmly sealed. It can neither be opened nor closed." CR>>

<ROUTINE RT-BREAK-LAMP ()
	<COND (<MC-ISNOT? ,TH-LAMP ,FL-BROKEN>
	       <MC-MAKE ,TH-LAMP ,FL-BROKEN>
	       <TELL "It sounds as if something in " THE ,TH-LAMP " has shattered.">
	       <COND (<MC-IS? ,TH-LAMP ,FL-LIGHTED>
		      <MC-UNMAKE ,TH-LAMP ,FL-LIGHTED>
		      <TELL " " CTHE ,TH-LAMP " has gone out.">)>
	       <CRLF>)
	      (T
	       <TELL CTHE ,TH-LAMP " is already broken." CR>)>>

<ROUTINE RT-AC-TH-BLACK-BAG ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-BLACK-BAG">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"It's the black medical bag your aunt gave you when you graduated
from medical school." CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<AND <MC-VERB? PUT>
		    <MC-THIS-PRSI?>
		    <MC-PRSO? TH-PADDLE
			      TH-MACE
			      TH-ANCHOR
			      TH-PACKET-OF-PAPER
			      TH-SUIT-OF-ARMOUR
			      TH-OAR-1
			      TH-OAR-2
			      TH-TORCH
			      TH-WAX-AX
			      TH-LAMP
			      TH-VIOLIN
			      TH-WAX-HEAD>>
	       <TELL "You look at " THEO ". You look at the tiny bag.
You look at the tiny bag. You look at " THEO ". Slowly it dawns on you
that it's just not going to work." CR>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-CHARLES-STATUE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-DF "TH-CHARLES-STATUE">>
	<COND (<N==? .CONTEXT ,K-M-DESCFCN> <RFALSE>)>
	<MC-MAKE ,TH-WAX-AX ,FL-SEEN>
	<COND (<IN? ,TH-WAX-HEAD ,TH-CHARLES-STATUE>
	       <TELL
"Charles I is shown kneeling, with his head resting on a
chopping block. Above him stands a masked executioner">
	       <COND (<IN? ,TH-WAX-AX ,TH-CHARLES-STATUE>
		      <TELL ", with his axe held
high over his head, ready to strike the deathblow">)>
	       <TELL "." CR>)
	      (T
	       <TELL "The statue looks grotesque without the head." CR>)>>

<ROUTINE RT-AC-TH-WILLIAM-STATUE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-DF "TH-WILLIAM-STATUE">>
	<COND (<N==? .CONTEXT ,K-M-DESCFCN> <RFALSE>)>
	<TELL
"The statue is of William the Conqueror kneeling on the sand
at Pevensey, where he landed before the Battle of Hastings in 1066." CR>>

<ROUTINE RT-AC-TH-WALTER-STATUE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-DF "TH-WALTER-STATUE">>
	<COND (<N==? .CONTEXT ,K-M-DESCFCN> <RFALSE>)>
	<TELL
"The sculpture shows Sir Walter Raleigh spreading his cloak
across a mud puddle so Elizabeth could walk across without dirtying
her shoes." CR>>

<ROUTINE RT-AC-TH-ELIZABETH-STATUE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-DF "TH-ELIZABETH-STATUE">>
	<COND (<N==? .CONTEXT ,K-M-DESCFCN> <RFALSE>)>
	<TELL "She is smiling at Sir Walter." CR>>

<ROUTINE RT-AC-TH-THOMAS-STATUE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-DF "TH-THOMAS-STATUE">>
	<COND (<N==? .CONTEXT ,K-M-DESCFCN> <RFALSE>)>
	<TELL
"The sculpture shows four knights with swords drawn, advancing
on Thomas Becket as he stands before the High Altar of Canterbury
Cathedral." CR>>

<ROUTINE RT-AC-TH-DRAKE-STATUE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-DF "TH-DRAKE-STATUE">>
	<COND (<N==? .CONTEXT ,K-M-DESCFCN> <RFALSE>)>
	<TELL
"The statue is of Sir Francis Drake finishing his game of bowls
before sailing off to defeat the Spanish Armada." CR>>

<ROUTINE RT-AC-TH-JOHN-STATUE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-DF "TH-JOHN-STATUE">>
	<COND (<N==? .CONTEXT ,K-M-DESCFCN> <RFALSE>)>
	<TELL
"King John is depicted signing the Magna Carta in the
meadow at Runnymede in June of 1215." CR>>

<ROUTINE RT-AC-TH-FAWKES-STATUE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-DF "TH-FAWKES-STATUE">>
	<COND (<N==? .CONTEXT ,K-M-DESCFCN> <RFALSE>)>
	<TELL
"The statue depicts Guy Fawkes crouched behind some barrels of gunpowder. He
is awaiting the signal to light his torch and set off the trail of gunpowder
that will blow up Parliament">
	<COND (<IN? ,TH-TORCH ,TH-FAWKES-STATUE>
	       ;<OR <IN? ,TH-TORCH ,TH-FAWKES-STATUE>
		    <IN? ,TH-BURNT-TORCH ,TH-FAWKES-STATUE>>
	       <TELL ". The torch he holds looks like a real one">)
	      (T
	       <TELL " - but he seems to be missing the torch">)>
	<TELL "." CR>>

<ROUTINE RT-AC-TH-NELSON-COLUMN ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-DF "TH-NELSON-COLUMN">>
	<COND (<N==? .CONTEXT ,K-M-DESCFCN> <RFALSE>)>
	<TELL "The column has" ,K-NELSON-STATUE-MSG CR>>

<ROUTINE RT-AC-TH-BOAT ("OPTIONAL" (CONTEXT <>) "AUX" NUM)
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-BOAT" .CONTEXT>>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It's an incredibly old rowboat that ">
	       <COND (<AND <IN? ,TH-OAR-1 ,TH-BOAT>
			   <NOT <IN? ,TH-OAR-2 ,TH-OAR-LOCK>>>
		      <TELL "has one empty oarlock and ">)>
	       <TELL "probably leaks. But it looks as if it might float">
	       <COND (<NOT <OR <IN? ,TH-BOAT ,RM-THE-EMBANKMENT>
			       <IN? ,TH-BOAT ,RM-OUTSIDE-TRAITORS-GATE>>>
		      <TELL " a little while longer">)>
	       <TELL ". The boat's anchor is in the ">
	       <COND (<IN? ,TH-ANCHOR ,TH-BOAT>
		      <TELL "boat">)
		     (T
		      <TELL "water">)>
	       <TELL "." CR>
	       <RETURN 2>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<AND <MC-VERB? PUSH-TO> <MC-PRSI? ,LG-WATER>>
	       <RT-LAUNCH-BOAT>
	       <RTRUE>)
	      (<AND <MC-VERB? ENTER> <MC-PRSO? ,ROOMS ,TH-BOAT>>
	       <COND (<NOT <IN? ,CH-PLAYER ,TH-BOAT>>
		      <COND (<AND <MC-T? ,GL-PUPPY>
				  <EQUAL? ,GL-WINNER ,CH-PLAYER>>
			     <MOVE ,GL-PUPPY ,TH-BOAT>
			     <TELL "You and " THE ,GL-PUPPY " get ">)
			    (T
			     <RT-CYOU-MSG "get" "gets">)>
		      <TELL "into the boat." CR>
		      <MOVE ,CH-PLAYER ,TH-BOAT>
		      <COND (<MC-T? ,GL-PUPPY>
			     <MOVE ,GL-PUPPY ,TH-BOAT>)>
		      <MC-MAKE ,TH-BOAT ,FL-NODESC>
		      <RTRUE>)>)
	      (<AND <MC-VERB? EXIT> <MC-PRSO? ,ROOMS ,TH-BOAT>>
	       <COND (<IN? ,CH-PLAYER ,TH-BOAT>
		      <MOVE ,CH-PLAYER ,GL-PLACE-CUR>
		      <COND (<MC-T? ,GL-PUPPY>
			     <MOVE ,GL-PUPPY ,GL-PLACE-CUR>)>
		      <MC-UNMAKE ,TH-BOAT ,FL-NODESC>
		      <SET NUM ,TH-BOAT-AUX1>
		      <COND (<AND <NOT <ZERO? <LOC ,TH-OPAL>>>
				  <IN? ,TH-BOAT ,RM-THE-EMBANKMENT>
				  <EQUAL? .NUM 0>>
			     <TELL "As">
			     <COND (<AND <MC-T? ,GL-PUPPY>
					 <EQUAL? ,GL-WINNER ,CH-PLAYER>>
				    <MOVE ,GL-PUPPY ,GL-PLACE-CUR>
				    <TELL " you and " THE ,GL-PUPPY " get ">)
				   (T
				    <RT-YOU-MSG "get" "gets">)>
			     <TELL
"out of the boat, a man storms up to you and says, \"What in bloody 'ell are
you doing with my boat?\" Without waiting for a reply he ">
			     <COND (<OR	<IN? ,TH-OAR-2 ,TH-BOAT>
					<IN? ,TH-OAR-2 ,RM-THE-EMBANKMENT>
					<RT-META-IN? ,TH-OAR-2 ,CH-PLAYER>
					<RT-META-IN? ,TH-OAR-2 ,GL-PUPPY>>
				    <TELL "grabs the oar, ">)>
			     <MOVE ,TH-BOAT ,RM-OUTSIDE-TRAITORS-GATE>
			     <MOVE ,TH-ANCHOR ,LG-WATER>
			     <REMOVE ,TH-OAR-1>
			     <REMOVE ,TH-OAR-2>
			     <SETG TH-BOAT-AUX1 1>
			     <TELL
"jumps into the boat and rows off, muttering to himself that he'll
have to find a safer place to keep it." CR>)
			    (<AND <MC-IS? ,TH-GARNET ,FL-TOUCHED>
				  <IN? ,TH-BOAT ,RM-THE-EMBANKMENT>
				  <EQUAL? .NUM 1>>
			     <TELL "As">
			     <COND (<AND <MC-T? ,GL-PUPPY>
					 <EQUAL? ,GL-WINNER ,CH-PLAYER>>
				    <MOVE ,GL-PUPPY ,GL-PLACE-CUR>
				    <TELL " you and " THE ,GL-PUPPY " get ">)
				   (T
				    <RT-YOU-MSG "get" "gets">)>
			     <TELL
"out of the boat, its red-faced owner runs up and
yells, \"You again?!!\" He gives you a swift kick in the rear">
			     <COND (<MC-IS? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
				    <TELL
", then clutches his foot in agony as it bounces off your suit of armour">)>
			     <TELL "." CR CR "The man jumps into the boat">
			     <COND
			      (<IN? ,TH-PADDLE ,TH-BOAT>
			       <TELL
" and paddles away, cursing under his breath." CR>)
			      (T
			       <TELL
", launches it, and suddenly realizes he has no way to steer it. The last
you see of him, he is drifting down the Thames, screaming and shaking his
fist at you." CR>)>
			     <REMOVE ,TH-BOAT>
			     <SETG TH-BOAT-AUX1 2>)
			    (<IN? ,TH-ANCHOR ,TH-BOAT>
			     <TELL "As">
			     <COND (<AND <MC-T? ,GL-PUPPY>
					 <EQUAL? ,GL-WINNER ,CH-PLAYER>>
				    <MOVE ,GL-PUPPY ,GL-PLACE-CUR>
				    <TELL " you and " THE ,GL-PUPPY " get ">)
				   (T
				    <RT-YOU-MSG "get" "gets">)>
			     <TELL
"out of the boat it slides out from under your foot and drifts down the
river." CR>
			     <REMOVE ,TH-BOAT>)
			    (T
			     <COND (<AND <MC-T? ,GL-PUPPY>
					 <EQUAL? ,GL-WINNER ,CH-PLAYER>>
				    <MOVE ,GL-PUPPY ,GL-PLACE-CUR>
				    <TELL "You and " THE ,GL-PUPPY " get ">)
				   (T
				    <RT-CYOU-MSG "get" "gets">)>
			     <TELL "out of the boat." CR>)>
		      <RTRUE>)>)
	      (<AND <MC-VERB? SHOOT>
		    <MC-PRSO? ,TH-BOAT>>
	       <REMOVE ,TH-BOAT>
	       <TELL
"Bad idea. The bullet blows a hole in the boat, which promptly sinks." CR>
	       <COND (<IN? ,CH-PLAYER ,TH-BOAT>
		      <TELL
CR "Unable to swim, you cling to a piece of driftwood for several
hours, wondering what kind of idiot would shoot a boat out from
under himself." CR CR

"After a while, a Scotland Yard launch pulls alongside to rescue
you. Lestrade leans over the side and offers his assistance. You
decide you're better off in the water and politely decline."  CR CR>
		      <RT-QSR>)>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-OAR-1 ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-OAR-1">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "The oar is hopelessy jammed into the oarlock." CR>)
	      (<MC-T? .CONTEXT>
	       <RFALSE>)
	      (<MC-VERB? TAKE>
	       <RT-CYOU-MSG "try" "tries">
	       <TELL
"to extract the oar from the oarlock, but it seems to be jammed." CR>
	       <RTRUE>)
	      (<MC-VERB? RELEASE>
	       <RT-CYOU-MSG "struggle" "struggles">
	       <TELL 
"with the oar for a minute or two with no success... it really
is jammed in there." CR>)>>

<ROUTINE RT-AC-TH-OAR-LOCK ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-OAR-LOCK">>
	<COND (<AND <MC-VERB? PUT PUT-ON>
		    <MC-THIS-PRSI?>
		    <NOT <MC-PRSO? ,TH-OAR-2>>>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-CLAPPER ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-CLAPPER">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<IN? ,TH-SAPPHIRE ,TH-CLAPPER>
		      <TELL "The clapper hangs from the centre of the bell.
There is a beautiful blue sapphire glued to the end of it." CR>
		      <RTRUE>)
		     (T
		      <RFALSE>)>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? SHOOT>
	       <TELL ,K-RICOCHET-MSG CR>)
	      (<RT-IMPOSSIBLE-PUT-IN-ON-MSG ,TH-CLAPPER>
	       <RTRUE>)
	      (<MC-VERB? TOUCH TOUCH-TO TOUCH-TO-SWP>
	       <COND (<EQUAL? ,TH-BELL-AUX2 ,K-BELL-TOWARDS>
		      <RFALSE>)
		     (T
		      <TELL CTHEO>
		      <RT-ISNT-ARENT-MSG ,GL-PRSO>
		      <TELL "within reach." CR>)>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-COTTON-BALLS ("OPT" (CONTEXT <>) "AUX" VAL)
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-COTTON-BALLS">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<MC-IS? ,TH-COTTON-BALLS ,FL-WORN>
		      <TELL "You can't see them because they're in your ears."
			    CR>)
		     (T
		      <TELL "They're soft and fluffy." CR>)>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <SETG GL-P-IT-OBJECT ,GL-PRSO>
	       <COND (<OR <MC-VERB? WEAR>
			  <AND <MC-VERB? PUT>
			       <MC-PRSI? ,TH-EARS>>>
		      <COND (<MC-IS? ,GL-PRSO ,FL-WORN>
			     <TELL CTHEO>
			     <RT-IS-ARE-MSG>
			     <TELL "already in " THE ,TH-EARS "." CR>)
			    (<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
			     <TELL CTHE ,TH-STETHOSCOPE
				   " is in the way." CR>
			     <RTRUE>)
			    (T
			     <SETG GL-LISTEN-OBJ <>>
			     <MC-MAKE ,GL-PRSO ,FL-WORN>
			     <MOVE ,GL-PRSO ,CH-PLAYER>
			     <RT-CYOU-MSG "put" "puts">
			     <TELL THEO " in " THE ,TH-EARS "." CR>
			     <SET VAL <GETP ,GL-PRSO ,P?VALUE>>
			     <COND (<MC-T? .VAL>
				    <RT-UPDATE-SCORE .VAL>
				    <PUTP ,GL-PRSO ,P?VALUE 0>)>
			     <RTRUE>)>)
		     (<OR <AND <MC-VERB? TAKE>
			       <MC-PRSI? ,TH-EARS>>
			  <AND <MC-VERB? TAKE-OFF TAKE>
			       <MC-IS? ,GL-PRSO ,FL-WORN>>>
		      <COND (<MC-ISNOT? ,GL-PRSO ,FL-WORN>
			     <TELL CTHEO>
			     <RT-ISNT-ARENT-MSG>
			     <TELL "in " THE ,TH-EARS "." CR>)
			    (T
			     <COND (<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
				    <RT-PERFORM ,V?TAKE-OFF ,TH-STETHOSCOPE>)>
			     <SETG GL-LISTEN-OBJ <>>
			     <MC-UNMAKE ,GL-PRSO ,FL-WORN>
			     <RT-CYOU-MSG "take" "takes">
			     <TELL THEO>
			     <TELL " out of " THE ,TH-EARS "." CR>
			     <COND (<N==? ,GL-WINNER ,CH-PLAYER>
				    <MOVE ,GL-PRSO ,GL-WINNER>)>
			     <RTRUE>)>)
		     (<MC-VERB? DROP THROW THROW-OVER>
		      <COND (<MC-IS? ,GL-PRSO ,FL-WORN>
			     <RT-CYOU-MSG>
			     <TELL "cannot " VW " " THEO " while">
			     <RT-YOU-MSG "are" "is">
			     <TELL "wearing them." CR>)>)
		     (<MC-VERB? SHOOT>
		      <RT-WASTE-OF-BULLETS-MSG>)>)>>

<ROUTINE RT-AC-TH-BELL ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-BELL">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "The huge bell hangs over the hollow shaft of the tower."
		     CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? SHOOT>
	       <TELL ,K-RICOCHET-MSG CR>)
	      (<RT-IMPOSSIBLE-PUT-IN-ON-MSG ,TH-BELL>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-STETHOSCOPE ("OPT" (CONTEXT <>) "AUX" VAL)
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-STETHOSCOPE">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
		      <TELL "The stethoscope is hanging from your ears." CR>)
		     (T
		      <TELL "It looks just like any other late-Victorian-era
stethoscope." CR>)>
	       <RTRUE>)
	      (<MC-T? .CONTEXT>
	       <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<OR <MC-VERB? WEAR>
			  <AND <MC-VERB? PUT>
			       <MC-PRSI? ,TH-EARS>>>
		      <COND (<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
			     <TELL CTHEO>
			     <RT-IS-ARE-MSG>
			     <TELL "already in " THE ,TH-EARS "." CR>)
			    ;(<MC-IS? ,TH-COTTON-BALLS ,FL-WORN>
			     <TELL
"You should take the cotton balls out of your ears first." CR>)
			    (T
			     <SETG GL-LISTEN-OBJ <>>
			     <MC-MAKE ,TH-STETHOSCOPE ,FL-WORN>
			     <MOVE ,TH-STETHOSCOPE ,CH-PLAYER>
			     <RT-CYOU-MSG "put" "puts">
			     <TELL THEO " in " THE ,TH-EARS "." CR>
			     <SET VAL <GETP ,TH-STETHOSCOPE ,P?VALUE>>
			     <COND (<MC-T? .VAL>
				    <RT-UPDATE-SCORE .VAL>
				    <PUTP ,TH-STETHOSCOPE ,P?VALUE 0>)>
			     <RTRUE>)>)
		     (<OR <AND <MC-VERB? TAKE>
			       <MC-PRSI? ,TH-EARS>>
			  <AND <MC-VERB? TAKE-OFF TAKE>
			       <MC-IS? ,TH-STETHOSCOPE ,FL-WORN>>>
		      <COND (<MC-ISNOT? ,TH-STETHOSCOPE ,FL-WORN>
			     <TELL CTHEO>
			     <RT-ISNT-ARENT-MSG>
			     <TELL "in " THE ,TH-EARS "." CR>)
			    (T
			     <SETG GL-LISTEN-OBJ <>>
			     <MC-UNMAKE ,TH-STETHOSCOPE ,FL-WORN>
			     <RT-CYOU-MSG "take" "takes">
			     <TELL THEO>
			     <TELL " out of " THE ,TH-EARS "." CR>
			     <COND (<N==? ,GL-WINNER ,CH-PLAYER>
				    <MOVE ,GL-PRSO ,GL-WINNER>)>
			     <RTRUE>)>)
		     (<MC-VERB? DROP THROW THROW-OVER>
		      <COND (<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
			     <RT-CYOU-MSG>
			     <TELL "cannot " VW " " THEO " while">
			     <RT-YOU-MSG "are" "is">
			     <TELL "wearing it." CR>)>)
		     (<MC-VERB? PUT-ON>
		      <COND (<AND <MC-IS? ,GL-PRSI ,FL-PERSON>
				  <MC-IS? ,TH-STETHOSCOPE ,FL-WORN>>
			     <RT-PERFORM ,V?LISTEN ,GL-PRSI ,GL-PRSO>)>)>)
	      (<MC-THIS-PRSI?>
	       <RFALSE>)>>

<ROUTINE RT-AC-TH-WATSONS-HAT ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-WATSONS-HAT">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
		      <TELL
"You can't look at your hat while it's on the top of your head." CR>)
		     (T
		      <TELL
"It's a rather large hat with plenty of room inside it for your rather
large head." CR>)>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<OR <AND <MC-VERB? PUT-ON>
			       <MC-PRSI? ,TH-HEAD>>
			  <MC-VERB? WEAR>>
		      <COND (<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
			     <TELL "You are already wearing " THEO "." CR>)
			    (<RT-DONT-HAVE-MSG ,GL-PRSO>
			     <RTRUE>)
			    (T
			     <MC-UNMAKE ,TH-WATSONS-HAT ,FL-OPENED>
			     <MC-MAKE ,TH-WATSONS-HAT ,FL-WORN>
			     <TELL "You put on " THEO "." CR>)>)
		     (<OR <AND <MC-VERB? TAKE>
			       <OR <MC-PRSI? ,TH-HEAD>
				   <AND <MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
					<MC-PRSI? <> CH-PLAYER CH-ME>>>>
			  <MC-VERB? TAKE-OFF>>
		      <COND (<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
			     <MC-MAKE ,TH-WATSONS-HAT ,FL-OPENED>
			     <MC-UNMAKE ,TH-WATSONS-HAT ,FL-WORN>
			     <TELL "You take off " THEO>
			     <COND (<RT-VISIBLE? ,CH-AKBAR>
				    <TELL
". Disconcerted by your sacrilegious action, Akbar averts his gaze">)>
			     <COND (<FIRST? ,TH-WATSONS-HAT>
				    <TELL ". Inside you see ">
				    <RT-PRINT-CONTENTS-2 ,TH-WATSONS-HAT>)>
			     <TELL "." CR>)
			    (T
			     <TELL "You are not wearing " THEO "." CR>)>)
		     (<AND <MC-VERB? LOOK-INSIDE LOOK-UNDER>
			   <MC-IS? ,TH-WATSONS-HAT ,FL-WORN>>
		      <TELL
"You can't see inside " THE ,TH-WATSONS-HAT " while it's on " THE ,TH-HEAD
"." CR>)
		     (<AND <MC-VERB? REACH-IN SEARCH PUT PUT-ON>
			   <MC-IS? ,TH-WATSONS-HAT ,FL-WORN>>
		      <RT-CYOU-MSG>
		      <RT-WOULD-HAVE-TO-MSG "take off" ,GL-PRSO>
		      <TELL " first." CR>
		      <RTRUE>)>)
	      (<MC-THIS-PRSI?>
	       <COND (<AND <MC-VERB? PUT PUT-UNDER>
			   <MC-IS? ,TH-WATSONS-HAT ,FL-WORN>>
		      <RT-CYOU-MSG>
		      <RT-WOULD-HAVE-TO-MSG "take off" ,GL-PRSI>
		      <TELL " first." CR>
		      <RTRUE>)>)>>

<ROUTINE RT-AC-TH-ELIZAS-FLOWERS ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-ELIZAS-FLOWERS">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "In " THE ,TH-ELIZAS-FLOWERS " you see a carnation." CR>
	       <RTRUE>)>
	<COND (<MC-THIS-PRSI?>
	       <COND (<MC-VERB? PUT PUT-ON>
		      <RT-CANT-PUT-IN-ON-MSG ,TH-ELIZAS-FLOWERS>)>)>>

<ROUTINE RT-AC-TH-CARNATION ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-CARNATION">>
	<COND (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? WEAR>
		      <COND (<EQUAL? ,GL-WINNER ,CH-PLAYER>
			     <COND (<IN? ,TH-CARNATION ,TH-LAPEL>
				    <TELL CTHEO " is already in "
					  THE ,TH-LAPEL "." CR>)
				   (T
				    <MOVE ,TH-CARNATION ,TH-LAPEL>
				    <RT-CYOU-MSG "put" "puts">
				    <TELL THEO " in " THE ,TH-LAPEL "." CR>)>)
			    (T
			     <TELL CTHE ,GL-WINNER " say">
			     <RT-S-NOS-MSG ,GL-WINNER>
			     <TELL ", \"No thanks.\"" CR>)>)
		     (<MC-VERB? SHOOT>
		      <RT-WASTE-OF-BULLETS-MSG>)>)>>

<ROUTINE RT-AC-TH-EMERALD ("OPT" (CONTEXT <>))
  <COND (<==? <GETP ,TH-EMERALD ,P?OBJ-NOUN> ,W?SCRATCH>
	 <RT-HANDLE-SCRATCH ,TH-EMERALD .CONTEXT>)
	(T
	 <COND (<==? .CONTEXT ,K-M-SDESC>
		<TELL "emerald">)
	       (<EQUAL? .CONTEXT ,K-M-DESCFCN <>>
		<RT-EXAMINE-GEM ,TH-EMERALD>)
	       (T
		<RFALSE>)>)>>

<ROUTINE RT-AC-TH-SAPPHIRE ("OPTIONAL" (CONTEXT <>) "AUX" GRABS WHO)
  <COND (<==? <GETP ,TH-SAPPHIRE ,P?OBJ-NOUN> ,W?SCRATCH>
	 <RT-HANDLE-SCRATCH ,TH-SAPPHIRE .CONTEXT>)
	(T
	 <COND (<==? .CONTEXT ,K-M-SDESC>
		<TELL "sapphire">
		<RTRUE>)
	       (<==? .CONTEXT ,K-M-DESCFCN>
		<COND (<MC-T? <RT-EXAMINE-GEM ,TH-SAPPHIRE>>
		       <RTRUE>)>
		<RTRUE>)
	       (<MC-T? .CONTEXT>
		<RFALSE>)>
	 <SET GRABS ,TH-SAPPHIRE-AUX1>
	 <COND (<AND <MC-THIS-PRSO?>
		     <IN? ,TH-SAPPHIRE ,TH-CLAPPER>>
		<COND (<MC-VERB? TAKE>
		       <COND (<G? .GRABS 0>
			      <COND (<EQUAL? ,TH-BELL-AUX2 ,K-BELL-TOWARDS>
				     <DEC GRABS>
				     <SETG TH-SAPPHIRE-AUX1 .GRABS>
				     <COND (<ZERO? .GRABS>
					    <RT-CYOU-MSG "remove" "removes">
					    <TELL THEO " from "
						  THE ,TH-CLAPPER "." CR>
					    <MOVE ,TH-SAPPHIRE ,CH-PLAYER>
					    <MC-UNMAKE ,TH-SAPPHIRE ,FL-NODESC>
					    <MC-MAKE ,TH-SAPPHIRE ,FL-SEEN>
					    <MC-MAKE ,TH-SAPPHIRE ,FL-TOUCHED>
					    <SET WHO <RT-WHO-SAYS?>>
					    <COND (<EQUAL? .WHO ,CH-HOLMES>
						   <TELL CR
"Holmes beams at you and says, \"Good show, old fellow.\"" CR>)>
					    <RT-UPDATE-SCORE
					     <GETP ,TH-SAPPHIRE ,P?VALUE>>
					    <PUTP ,TH-SAPPHIRE ,P?VALUE 0>)
					   (T
					    <RT-CYOU-MSG "tug" "tugs">
					    <TELL "at " THEO
						  ", but you can't quite grab
it before it swings out of reach again." CR>)>)
				    (T
				     <TELL CTHEO>
				     <RT-ISNT-ARENT-MSG ,GL-PRSO>
				     <TELL "within reach." CR>)>
			      <RTRUE>)>)
		      (<MC-VERB? HIT>
		       <COND (<OR <EQUAL? ,TH-BELL-AUX2 ,K-BELL-TOWARDS>
				  <MC-PRSI? ,TH-OAR-2>>
			      <RT-CYOU-MSG "knock" "knocks">
			      <TELL
THEO " into the shaft. A long time later you hear " THEO " shatter." CR>
			      <FCLEAR ,GL-PRSO ,FL-WORN>
			      <REMOVE ,GL-PRSO>)
			     (T
			      <TELL CTHEO>
			      <RT-ISNT-ARENT-MSG ,GL-PRSO>
			      <TELL "within reach." CR>)>
		       <RTRUE>)
		      (<MC-VERB? TOUCH TOUCH-TO TOUCH-TO-SWP>
		       <COND (<EQUAL? ,TH-BELL-AUX2 ,K-BELL-TOWARDS>
			      <RFALSE>)
			     (T
			      <TELL CTHEO>
			      <RT-IS-ARE-MSG ,GL-PRSO>
			      <TELL "within reach." CR>)>
		       <RTRUE>)>)
	       (<AND <MC-THIS-PRSI?>
		     <IN? ,TH-SAPPHIRE ,TH-CLAPPER>>
		<COND (<MC-VERB? THROW>
		       <COND (<MC-PRSO? ,CH-TRAINED-PIGEON>
			      <RT-PIGEON-PANIC>
			      <SETG CH-TRAINED-PIGEON-AUX1 0>
			      <RTRUE>)
			     (T
			      <RT-CYOU-MSG "hit" "hits">
			      <TELL THEI " with " THEO ", and they both
disappear into the shaft. A long time later you hear " THEI " shatter." CR>
			      <REMOVE ,GL-PRSO>
			      <REMOVE ,GL-PRSI>
			      <RTRUE>)>)>)>
	 <RT-EXAMINE-GEM ,TH-SAPPHIRE>)>>

<ROUTINE RT-AC-TH-OPAL ("OPT" (CONTEXT <>))
  <COND (<==? <GETP ,TH-OPAL ,P?OBJ-NOUN> ,W?SCRATCH>
	 <RT-HANDLE-SCRATCH ,TH-OPAL .CONTEXT>)
	(<==? .CONTEXT ,K-M-SDESC>
	 <TELL "opal">)
	(<EQUAL? .CONTEXT ,K-M-DESCFCN <>>
	 <RT-EXAMINE-GEM ,TH-OPAL>)
	(T
	 <RFALSE>)>>

<ROUTINE RT-AC-TH-RUBY ("OPT" (CONTEXT <>))
  <COND (<==? <GETP ,TH-RUBY ,P?OBJ-NOUN> ,W?SCRATCH>
	 <RT-HANDLE-SCRATCH ,TH-RUBY .CONTEXT>)
	(T
	 <COND (<==? .CONTEXT ,K-M-DESCFCN>
		<RT-EXAMINE-GEM ,TH-RUBY>
		<RTRUE>)
	       (<==? .CONTEXT ,K-M-SDESC>
		<TELL "ruby">
		<RTRUE>)
	       (<MC-T? .CONTEXT> <RFALSE>)
	       (<MC-VERB? TAKE>
		<COND (<IN? ,TH-RUBY ,TH-NELSON-STATUE>
		       <TELL "You can't reach the ruby." CR>
		       <RTRUE>)
		      (<IN? ,TH-RUBY ,CH-SHERMAN>
		       <RT-IMPOLITE-MSG "take things" "asking">
		       <RTRUE>)>)>
	 <RT-EXAMINE-GEM ,TH-RUBY>)>>

<ROUTINE RT-AC-TH-TOPAZ ("OPT" (CONTEXT <>))
  <COND (<==? <GETP ,TH-TOPAZ ,P?OBJ-NOUN> ,W?SCRATCH>
	 <RT-HANDLE-SCRATCH ,TH-TOPAZ .CONTEXT>)
	(T
	 <COND (<==? .CONTEXT ,K-M-SDESC>
		<TELL "topaz">)
	       (<EQUAL? .CONTEXT ,K-M-DESCFCN <>>
		<RT-EXAMINE-GEM ,TH-TOPAZ>)>)>>

<ROUTINE RT-AC-TH-CRAYON ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-DF "TH-CRAYON">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It looks just like any other Victorian-era crayon." CR>)
	      (T
	       <RFALSE>)>>

<ROUTINE RT-AC-TH-WATSONS-COAT ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-WATSONS-COAT">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It's a wool greatcoat." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? LOOK-INSIDE SEARCH>
		      <RT-PERFORM ,V?LOOK-INSIDE ,TH-POCKET>)
		     (<MC-VERB? EMPTY EMPTY-INTO>
		      <TELL "[from " THE ,TH-POCKET "]" CR>
		      <RT-PERFORM ,GL-PRSA ,TH-POCKET ,GL-PRSO>)
		     (<AND <MC-VERB? WEAR TAKE-OFF>
			   <MC-IS? ,TH-SUIT-OF-ARMOUR ,FL-WORN>>
		      <RT-CYOU-MSG>
		      <RT-WOULD-HAVE-TO-MSG "take off" ,TH-SUIT-OF-ARMOUR>
		      <TELL " first." CR>)>)
	      (<MC-THIS-PRSI?>
	       <COND (<MC-VERB? TAKE>
		      <TELL "[from " THE ,TH-POCKET "]" CR>
		      <RT-PERFORM ,V?TAKE ,GL-PRSO ,TH-POCKET>)
		     (<MC-VERB? PUT>
		      <TELL "[in " THE ,TH-POCKET "]" CR>
		      <RT-PERFORM ,V?PUT ,GL-PRSO ,TH-POCKET>)
		     (<MC-VERB? EMPTY EMPTY-INTO>
		      <TELL "[in " THE ,TH-POCKET "]" CR>
		      <RT-PERFORM ,GL-PRSA ,GL-PRSO ,TH-POCKET>)>)>>

<ROUTINE RT-AC-TH-LAPEL ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-LAPEL">>
	<COND (<MC-THIS-PRSI?>
	       <COND (<AND <MC-VERB? PUT PUT-ON>
			   <NOT <MC-PRSO? ,TH-CARNATION>>>
		      <RT-CANT-PUT-IN-ON-MSG ,TH-LAPEL>)>)>>

<ROUTINE RT-AC-TH-CLUMP-OF-MOSS ("OPT" (CONTEXT <>) "AUX" WHO)
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-CLUMP-OF-MOSS">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "The clump of moss is a slightly different colour than the
other lichen that surrounds it." CR>)
	      (<MC-T? .CONTEXT>
	       <RFALSE>)
	      (<MC-VERB? LOOK>
	       <RT-AC-TH-CLUMP-OF-MOSS ,K-M-DESCFCN>
	       <RTRUE>)
	      (<ZERO? <RT-THAMES-TIDE>>
	       <COND (<RT-TOUCH-VERB?>
		      <TELL "As soon as">
		      <RT-YOU-MSG "touch" "touches">
		      <TELL THE ,TH-CLUMP-OF-MOSS ", it crumbles. ">
		      <RT-CYOU-MSG "are" "is">
		      <TELL "left holding a beautiful opal." CR>
		      <MOVE ,TH-OPAL ,GL-WINNER>
		      <MC-MAKE ,TH-OPAL ,FL-SEEN>
		      <MC-MAKE ,TH-OPAL ,FL-TOUCHED>
		      <MC-UNMAKE ,TH-OPAL ,FL-NODESC>
		      <SET WHO <RT-WHO-SAYS?>>
		      <COND (<EQUAL? .WHO ,CH-HOLMES>
			     <TELL CR "Holmes claps you on the shoulder and says, \"Capital, Watson. Capital!\"" CR>)>
		      <RT-UPDATE-SCORE <GETP ,TH-OPAL ,P?VALUE>>
		      <PUTP ,TH-OPAL ,P?VALUE 0>
		      <REMOVE ,TH-CLUMP-OF-MOSS>
		      <RTRUE>)
		     (T
		      <RFALSE>)>)
	      (<MC-VERB? TAKE>
	       <COND (<EQUAL? <RT-THAMES-TIDE> 2>
		      <TELL "The clump is well beyond ">
		      <RT-YOUR-MSG>
		      <TELL "grasp." CR>)
		     (T
		      <RT-CYOU-MSG>
		      <TELL "cannot quite reach it." CR>)>
	       <RTRUE>)
	      (<MC-VERB? HIT TOUCH TOUCH-TO CUT>
	       <COND (<OR <AND <MC-VERB? HIT TOUCH>
			       <MC-PRSI? ,TH-OAR-2>>
			  <AND <MC-VERB? TOUCH-TO>
			       <MC-PRSO? ,TH-OAR-2>>>
		      <RT-CYOU-MSG "knock" "knocks">
		      <TELL
THE ,TH-CLUMP-OF-MOSS " into the water. It dissolves upon impact and reveals
a beautiful opal, which slowly sinks into the murky depths." CR>
		      <REMOVE ,TH-CLUMP-OF-MOSS>)
		     (T
		      <RT-CYOU-MSG "try" "tries">
		      <TELL "to hit the moss">
		      <COND (<MC-VERB? TOUCH-TO>
			     <TELL " with " THEO>)
			    (<MC-T? ,GL-PRSI>
			     <TELL " with " THEI>)>
		      <TELL " but">
		      <RT-YOU-MSG "are" "is">
		      <TELL "not able to reach it." CR>)>
	       <RTRUE>)
	      (<MC-VERB? THROW>
	       <COND (<MC-PRSO? ,CH-TRAINED-PIGEON>
		      <RFALSE>)
	             (<RT-IDROP-MSG>
		      <TELL "Good throw! " CTHEO " hit">
		      <RT-S-NOS-MSG ,GL-PRSO>
		      <TELL " the clump, knock">
		      <RT-S-NOS-MSG ,GL-PRSO>
		      <TELL " it loose, and everything
falls into the water. " CTHEO " sink">
		      <RT-S-NOS-MSG ,GL-PRSO>
		      <TELL " immediately.
The moss, however, dissolves upon impact and reveals a beautiful opal,
which slowly follows " THEO " into the murky depths." CR>
		      <REMOVE ,TH-CLUMP-OF-MOSS>
		      <REMOVE ,GL-PRSO>
		      <FCLEAR ,GL-PRSO ,FL-WORN>)>
	       <RTRUE>)
	      (<MC-VERB? SHOOT>
	       <TELL
"The bullet dislodges the clump and knocks it into the water. The moss
dissolves upon impact and reveals a beautiful opal, which slowly sinks
into the murky depths." CR>
	       <REMOVE ,TH-CLUMP-OF-MOSS>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-BLIGH-BOAT ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-DF "TH-BLIGH-BOAT">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "The boat is a true-to-life replica of the rowboat that
Captain Bligh sailed to Pitcairn Island after the mutiny on the Bounty." CR>)
	      (T
	       <RFALSE>)>>

<ROUTINE RT-AC-TH-ANCHOR ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-ANCHOR">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<IN? ,TH-ANCHOR ,TH-BOAT>
		      <TELL "It's slimy and green and covered with river crud. Yuck!" CR>)
		     (T
		      <TELL "It's in the water." CR>)>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? SHOOT>
	       <TELL ,K-RICOCHET-MSG CR>)
	      (<NOT <IN? ,CH-PLAYER ,TH-BOAT>>
	       <TELL ,K-MUST-BE-IN-BOAT-MSG "do that." CR>)
	      (<MC-VERB? TAKE>
	       <COND (<IN? ,TH-ANCHOR ,TH-BOAT>
		      <TELL "Oomph! It's too heavy to carry." CR>)
		     (T
		      <MOVE ,TH-ANCHOR ,TH-BOAT>
		      <RT-SAY-RAISE-ANCHOR>)>)
	      (<MC-VERB? RAISE HAUL WEIGH PULL>
	       <COND (<IN? ,TH-ANCHOR ,LG-WATER>
		      <MOVE ,TH-ANCHOR ,TH-BOAT>
		      <RT-SAY-RAISE-ANCHOR>)
		     (T
		      <TELL ,K-ANCHOR-ALREADY-OUT-MSG CR>)>)
	      (<MC-VERB? LOWER DROP>
	       <COND (<IN? ,TH-ANCHOR ,LG-WATER>
		      <TELL "The anchor is already in the water." CR>)
		     (T
		      <MOVE ,TH-ANCHOR ,LG-WATER>
		      <RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>
		      <RT-SAY-LOWER-ANCHOR>)>)
	      (<MC-VERB? THROW PUT>
	       <COND (<MC-PRSI? ,LG-WATER>
		      <MOVE ,TH-ANCHOR ,LG-WATER>
		      <RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>
		      <RT-SAY-LOWER-ANCHOR>)
		     (<MC-PRSI? ,TH-BOAT>
		      <MOVE ,TH-ANCHOR ,TH-BOAT>
		      <RT-SAY-RAISE-ANCHOR>)
		     (T
		      <RT-IMPOSSIBLE-MSG>)>)>>

<ROUTINE RT-AC-TH-NELSON-STATUE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-NELSON-STATUE">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL CTHE ,TH-NELSON-STATUE
		     " is perched high above you, on top of the column.">
	       <COND (<AND <MC-IS? ,TH-NELSON-STATUE ,FL-OPENED>
			   <IN? ,TH-RUBY ,TH-NELSON-STATUE>>
		      <TELL " " ,K-GLINT-MSG>)>
	       <CRLF>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<RT-IMPOSSIBLE-PUT-IN-ON-MSG ,TH-NELSON-STATUE>
	       <RTRUE>)
	      (<MC-VERB? LOOK-INSIDE>
	       <RT-CYOU-MSG>
	       <TELL "can't see inside the statue." CR>)
	      (<MC-VERB? REACH-IN SEARCH>
	       <RT-CYOU-MSG>
	       <TELL "can't reach the statue." CR>)>>

<ROUTINE RT-AC-TH-CROWN-JEWELS ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-CROWN-JEWELS">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"Despite its adventures, the Regalia doesn't look any the worse for
wear." CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <SETG GL-P-IT-OBJECT ,TH-CROWN-JEWELS>
	       <RFALSE>)>>

<ROUTINE RT-AC-TH-ETHERIUM-AMPOULE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-ETHERIUM-AMPOULE">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <COND (<FSET? ,TH-ETHERIUM-AMPOULE ,FL-BROKEN>
		      <TELL "broken ampoule">)
		     (T
		      <TELL "ampoule of etherium">)>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)>
	<COND (<FSET? ,TH-ETHERIUM-AMPOULE ,FL-BROKEN>
	       <RT-AC-TH-BROKEN-AMPOULE>)
	      (<AND <MC-VERB? MUNG OPEN>
		    <MC-THIS-PRSO?>>
	       <COND (<NOT <IN? ,TH-ETHERIUM-AMPOULE ,GL-WINNER>>
		      <RT-CYOU-MSG>
		      <RT-WOULD-HAVE-TO-MSG "be holding" ,GL-PRSO>
		      <TELL " to do that." CR>
		      <RFATAL>)>
	       ; "Disallow breaking vial in public places, nicely if Holmes
		  is around, not nicely otherwise."
	       <COND (<FSET? ,GL-PLACE-CUR ,FL-NO-ETHERIUM>
		      <COND (<==? <RT-WHO-SAYS?> ,CH-HOLMES>
			     <TELL "Holmes stops you. \"Do try to be discreet,
old boy. My research is supposed to be kept secret.\"" CR>
			     <RFATAL>)>
		      <TELL "The etherium renders everyone quite
unconscious. Unfortunately, word of the unusual phenomenon soon leaks
out, the existence of the secret chemical is exposed, and you are arrested
for violating the Official Secrets Act.||
Because he thinks you are a traitor, even Lestrade refuses to visit you
in prison. His absence is the only bright spot of your twenty-year
incarceration." CR>
		      <RT-QSR>
		      <RFATAL>)
		     (<AND <NOT <MC-HERE? ,RM-LAIR>>
			   <==? <RT-WHO-SAYS?> ,CH-HOLMES>
			   <N==? ,GL-PLACE-CUR ,RM-BAR-OF-GOLD>
			   <NOT <OR <MC-HERE? ,RM-ENTRY-HALL ,RM-HOLMES-STUDY
					      ,RM-EVANGELIST-CHAPEL>
				    <RT-FIND-FLAME ,GL-PLACE-CUR>>>>
		      <TELL "Holmes stops you just in time. \"This is neither
the time nor the place for experimentation.\"" CR>
		      <RTRUE>)>
	       <CLEAR-ALL-FLAGS ,TH-ETHERIUM-AMPOULE>
	       <FSET ,TH-ETHERIUM-AMPOULE ,FL-TAKEABLE>
	       <FSET ,TH-ETHERIUM-AMPOULE ,FL-READABLE>
	       <FSET ,TH-ETHERIUM-AMPOULE ,FL-BROKEN>
	       <PUT <GETPT ,TH-ETHERIUM-AMPOULE ,P?ADJECTIVE> 0
		    ,W?BROKEN>
	       <TELL "You break open the ampoule.">
	       <COND (<MC-HERE? ,RM-BAR-OF-GOLD>
		      <TELL
" The etherium fumes mix with the heavy air of the opium den. No one seems to
notice." CR>)
		     (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
		      <COND (<OR <RT-FIND-FLAME ,GL-PLACE-CUR>
				 <MC-HERE? ,RM-ENTRY-HALL ,RM-HOLMES-STUDY
					   ,RM-EVANGELIST-CHAPEL>>
			     <TELL
" As soon as the volatile etherium comes in contact with the flame">
			     <COND (<MC-HERE? ,RM-ENTRY-HALL>
				    <TELL " of the gas light">)
				   (<MC-HERE? ,RM-HOLMES-STUDY>
				    <TELL " of the fireplace">)
				   (<MC-HERE? ,RM-EVANGELIST-CHAPEL>
				    <TELL " of the candles">)>
			     <TELL ", it explodes."

CR CR "B  O  O  M  !!!" CR CR

"You awaken several days later in the hospital. Inspector Lestrade is
there with flowers for your bedside table. He is full of news about
how he plans to solve the case. Upon hearing this, you lapse back into
a coma from which you have no particular desire to emerge." CR>
			     <RT-QSR>)
			    (T
			     <TELL " The etherium is released into the room.">
			     <COND (<MC-ISNOT? ,TH-BREATH ,FL-LOCKED>
				    <MC-MAKE ,CH-PLAYER ,FL-ASLEEP>
				    <TELL
" Suddenly, everything starts to spin. You pass out and fall to the
ground. Sometime later you awaken and stumble back to your feet." CR>
				    <RT-CLOCK-JMP 6 0 0>
				    <COND (<MC-HERE? ,RM-LAIR>
					   <RT-DOES-MORIARTY-WIN>)>)
				   (T
				    <COND (<RT-ETHERIUM-EFFECT T>
					   <TELL " You see everyone">
					   <COND (<RT-VISIBLE? ,CH-HOLMES>
						  <TELL " but Holmes">)>
					  <TELL " pass out.">)>
				    <CRLF>)>
			     <MOVE ,TH-ETHERIUM-GAS ,GL-PLACE-CUR>
			     <RT-ALARM-SET-REL ,RT-I-WAKE-UP
					       <RT-PARM-SET 6 0 0>>)>)
		     (T
		      <TELL
" The etherium fumes dissipate quickly." CR>)>
	       <RTRUE>)
	      (<AND <MC-THIS-PRSO?>
		    <OR <MC-VERB? SHOOT>
			<AND <MC-VERB? BURN-WITH>
			     <OR <F? ,GL-PRSI>
				 <AND <MC-IS? ,GL-PRSI ,FL-BURNABLE>
				      <MC-IS? ,GL-PRSI ,FL-LIGHTED>>>>>>
	       <COND (<MC-VERB? SHOOT>
		      <TELL "Couldn't resist it, could you?">)>
	       <TELL CR CR "B  O  O  M  !!!" CR CR
"Your nerves - already fragile from the Afghan campaign - snap like a
dry twig. You collapse into a babbling pile of jello, and white-coated
attendants take you away to a nice sunlit room where Lestrade visits
on alternate Tuesdays." CR>
	       <RT-QSR>)
	      (<AND <MC-VERB? READ EXAMINE LOOK-ON>
		    <MC-THIS-PRSO?>>
	       <TELL
"The label on the ampoule reads, \"Etherium. Extremely volatile. Do not open
in the presence of fire.\"" CR>)>>

<ROUTINE RT-AC-TH-BROKEN-AMPOULE ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-BROKEN-AMPOULE-GAS">>
	<COND (<MC-VERB? SHOOT>
	       <TELL CTHEO ,K-SHATTER-MSG CR>)>>

<ROUTINE RT-AC-TH-ETHERIUM-GAS ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-ETHERIUM-GAS">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "Etherium is a colourless gas, which">
	       <RT-YOU-MSG>
	       <TELL "cannot see." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? SMELL>
	       <COND (<AND <IN? ,TH-ETHERIUM-GAS ,GL-PLACE-CUR>
		           <MC-ISNOT? ,TH-BREATH ,FL-LOCKED>>
		      <RT-SMELL-ETHERIUM?>)
		     (T
		      <RT-CYOU-MSG>
		      <TELL "cannot smell it." CR>)>)
	      (<MC-VERB? SHOOT>
	       <RT-WASTE-OF-BULLETS-MSG>)>>

<ROUTINE RT-AC-TH-LAB-EQUIPMENT ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-LAB-EQUIPMENT">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "The equipment is a jumble of test tubes, beakers, and pipettes." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<RT-TOUCH-VERB?>
	       <RT-CYOU-MSG "reach" "reaches">
	       <TELL "towards the equipment, but then">
	       <RT-YOU-MSG "recall" "recalls" T>
	       <TELL 
"Holmes's oft-repeated admonition to leave undisturbed his various
experiments, and">
	       <RT-YOU-MSG "quickly withdraw" "quickly withdraws" T>
	       <RT-YOUR-MSG>
	       <TELL "hand." CR>)>>

<ROUTINE RT-AC-TH-ROPE ("OPT" (CONTEXT <>) "AUX" T1 T2)
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-ROPE">>
	<SET T1 ,TH-ROPE-AUX1>
	<SET T2 ,TH-ROPE-AUX2>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<EQUAL? .T1 -1>
		      <RFALSE>)
		     (T
		      <TELL CTHE ,TH-ROPE " is securely bound to " THE .T1>)>
	       <COND (<NOT <EQUAL? .T2 -1>>
		      <TELL " and " THE .T2>)>
	       <TELL "." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<AND <MC-VERB? TAKE>
			   <NOT <EQUAL? .T1 -1>>>
		      <TELL CTHE ,TH-ROPE " is securely bound to " THE .T1>
		      <COND (<NOT <EQUAL? .T2 -1>>
			     <TELL " and " THE .T2>)>
		      <TELL "." CR>)
		     (<OR <AND <MC-VERB? CUT>
			       <MC-PRSI? ,TH-KNIFE>>
			  <MC-VERB? UNTIE>>
		      <COND (<N==? .T1 -1>
			     <COND (<==? .T2 -1>
				    <RT-PERFORM ,V?UNTIE .T1>
				    <RTRUE>)>
			     <RT-CYOU-MSG "release" "releases">
			     <COND (<MC-VERB? UNTIE>
				    <RT-CYOU-MSG "untie" "unties">)
				   (T
				    <RT-CYOU-MSG "cut" "cuts">)>
			     <TELL THE .T1>
			     <COND (<N==? .T2 -1>
			            <TELL " and " THE .T2>)>
			     <TELL ", and">
			     <RT-YOU-MSG "are" "is">
			     <TELL "left holding the rope." CR>
			     <COND (<AND <MC-HERE? ,RM-LAIR>
					 <EQUAL? ,CH-MORIARTY .T1 .T2>
					 <MC-ISNOT? ,CH-MORIARTY ,FL-ASLEEP>>
				    <TELL CR CR
"Bad move. As soon as he is free, Moriarty unlocks his desk and pulls out a
pistol. \"Thank you for releasing me, gentlemen,\" he says, waving the gun at
you. \"Very sporting of you.\" He glances at his pocketwatch. \"We shouldn't
have too long to wait.\" Minutes later you hear newsboys running through the
streets shouting about the resignation of the Prime Minister." CR>
				    <RT-QSR>)>
			     <SETG TH-ROPE-AUX1 -1>
			     <MC-UNMAKE .T1 ,FL-LOCKED>
			     <COND (<N==? .T2 -1>
				    <SETG TH-ROPE-AUX2 -1>
				    <MC-UNMAKE .T2 ,FL-LOCKED>)>
			     <MOVE ,TH-ROPE ,GL-WINNER>)
			    (T
			     <TELL CTHEO "isn't tied to anyone." CR>)>
		      <RTRUE>)>)>>

<ROUTINE RT-AC-TH-LIQUID ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-LIQUID">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It's a clear, colourless liquid." CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? SHOOT>
	       <TELL "Sorry, you missed." CR>)
	      (<RT-TOUCH-VERB?>
	       <RT-HOLMES-HITS ,TH-LIQUID>)
	      (<AND <MC-VERB? SMELL>
		    <MC-THIS-PRSO?>>
	       <RT-HOLMES-HITS ,TH-LIQUID>)>>

<ROUTINE RT-AC-TH-SYRINGE ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-SYRINGE">>
	<COND (<MC-VERB? SHOOT>
	       <TELL ,K-ANNIE-OAKELEY-MSG CR>)
	      (<RT-TOUCH-VERB?>
	       <RT-HOLMES-HITS ,TH-SYRINGE>)>>

<ROUTINE RT-AC-TH-MOROCCO-CASE ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-MOROCCO-CASE">>
	<COND (<RT-TOUCH-VERB?>
	       <COND (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
		      <RT-HOLMES-HITS ,TH-MOROCCO-CASE>
		      <RTRUE>)>)>>

<ROUTINE RT-AC-TH-DEAD-PIGEON ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-DEAD-PIGEON">>
	<COND (<AND <MC-VERB? DROP RELEASE THROW>
		    <MC-PRSO? ,TH-DEAD-PIGEON>>
	       <TELL "Thud." CR>
	       <MOVE ,TH-DEAD-PIGEON ,GL-PLACE-CUR>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-PIGEONS ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-PIGEONS" .CONTEXT>>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "The pigeons strut around the square as if they own it."
		     CR>)
	      (<MC-THIS-WINNER?>
	       <TELL CTHE ,TH-PIGEONS " coo in response." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<AND <MC-VERB? TAKE>
		    <MC-PRSO? ,TH-PIGEONS>>
	       <TELL CTHE ,TH-PIGEONS " scurry out of reach." CR>
	       <RTRUE>)
	      (<AND <MC-VERB? SHOOT>
		    <MC-PRSO? ,TH-PIGEONS>>
	       <RT-SHOOT-BIRDS ,TH-PIGEONS "strutting around">
	       <RTRUE>)>>

<ROUTINE RT-SHOOT-BIRDS (THING STR)
	<TELL
CTHE .THING " all fly up into the air at the sound of the gunshot.
Fortunately, none of them was hit. They soon land and resume " .STR "." CR>>

<ROUTINE RT-AC-TH-RED-GLASS ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-RED-GLASS" .CONTEXT>>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It's just a worthless bauble." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? SHOOT>
	       <TELL CTHEO ,K-SHATTER-MSG CR>)
	      (<AND <MC-VERB? TAKE>
		    <IN? ,TH-RUBY ,CH-SHERMAN>>
	       <RT-IMPOLITE-MSG "take things" "asking">
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-BED ("AUX" WHO)
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-BED">>
	<COND (<MC-VERB? ENTER>
	       <TELL ,K-NO-RESTING-MSG CR>
	       <RTRUE>)
	      (<MC-VERB? LOOK-UNDER>
	       <SET WHO <RT-WHO-SAYS?>>
	       <COND (<EQUAL? .WHO ,CH-HOLMES>
		      <TELL
"Holmes gives you a swift kick in the rear and says, \"Watson! There are much
more important matters afoot.\"" CR>)
		     (<EQUAL? .WHO ,CH-WIGGINS>
		      <TELL
"Wiggins says, \"Would you get yer bleedin' arse in gear.\"" CR>)
		     (T
		      <TELL "Looking for monsters?" CR>)>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-MATCHBOOK ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-MATCHBOOK">>
	<COND (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? READ EXAMINE LOOK-ON>
		      <TELL CR
"Tired of your dull, boring job? Tired of the whole Victorian era? Become
a detective! Apply now to the LESTRADE school
of sleuthing. In just three short days, Inspector G. Lestrade will teach
you everything he knows of the art of detection. Here are just some of the
things you'll learn." CR CR

"*** Fifteen new and exciting ways to" WRAP "say \"'Ullo! Wot's this?\"" CR
"*** Modern obfuscatory locution" WRAP "eschewel techniques." CR
"*** How to insult private detectives." CR CR

"Included in your tuition is an official Scotland Yard
notebook, and a brand new bobby pin. Just send twenty-five pounds
to the LESTRADE, that's L-E-S-T-R-A-D-E school of sleuthing. Act now, and
the Inspector will tell you how he knows that people are guilty simply
by looking at them." CR>)
		     (<AND <MC-VERB? LIGHT-WITH BURN-WITH>
			   <MC-THIS-PRSO?>>
		      <COND (<OR <AND <MC-IS? ,GL-PRSI ,FL-LIGHTED>
				      <MC-IS? ,GL-PRSI ,FL-BURNABLE>>
				 <AND <MC-PRSI? ,TH-PIPE>
				      <MC-IS? ,TH-TOBACCO ,FL-LIGHTED>>>
			     <TELL CTHE ,TH-MATCHBOOK " catches fire." CR>
			     <MC-MAKE ,TH-MATCHBOOK ,FL-LIGHTED>
			     <RT-ALARM-SET-REL ,RT-I-MATCHBOOK-OUT
							  <RT-PARM-SET 0 1 0>>)
			    (T
			     <TELL CTHEI>
			     <RT-ISNT-ARENT-MSG ,GL-PRSI>
			     <TELL "burning." CR>)>)>)
	      (<MC-THIS-PRSI?>
	       <COND (<AND <MC-VERB? PUT PUT-ON>
			   <NOT <MC-PRSO? ,TH-MATCH ;,TH-BURNT-MATCH>>>
		      <RT-CANT-PUT-IN-ON-MSG ,TH-MATCHBOOK>)>)>>

<ROUTINE RT-AC-TH-PICTURES ("OPT" (CONTEXT <>) (CLASS <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-PICTURES">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <PRINT-SDESC "pictures" .CLASS <> T>
	       <RTRUE>)
	      (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "They look just like some of your relatives." CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? LOOK-BEHIND>
	       <TELL
		"Thorough, aren't you? There's nothing there."
		CR>)>>

<ROUTINE RT-AC-TH-CLUE-BOOK ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-CLUE-BOOK">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It looks like a very old book." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? READ EXAMINE>
		      <COND (<MC-IS? ,TH-CLUE-BOOK ,FL-OPENED>
			     <RT-READ-CLUE-BOOK>)
			    (T
			     <TELL "The title is, \"Secret Writing and Invisible Inks.\"" CR>)>
		      <RTRUE>)
		     (<MC-VERB? LOOK-INSIDE SEARCH>
		      <COND (<MC-IS? ,TH-CLUE-BOOK ,FL-OPENED>
			     <TELL "The pages are yellowed with age." CR>)
			    (T
			     <RT-CYOU-MSG>
			     <RT-WOULD-HAVE-TO-MSG "open it first.">
			     <CRLF>)>
		      <RTRUE>)
		     (<MC-VERB? OPEN>
		      <COND (<MC-IS? ,TH-CLUE-BOOK ,FL-OPENED>
			     <TELL "The book is already open." CR>)
			    (T
			     <MC-MAKE ,TH-CLUE-BOOK ,FL-OPENED>
			     <TELL "The book falls open to the introduction." CR>)>)
		     (<MC-VERB? LIGHT-WITH BURN-WITH>
		      <TELL
"Perfect example of a typically repressive Victorian mentality." CR>)>)>>

<ROUTINE RT-AC-TH-BOOK-PAGE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-BOOK-PAGE">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It has writing on it." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? READ EXAMINE>
	       <COND (<MC-IS? ,TH-CLUE-BOOK ,FL-OPENED>
		      <RT-READ-CLUE-BOOK>)
		     (T
		      <RT-CYOU-MSG>
		      <RT-WOULD-HAVE-TO-MSG "open">
		      <TELL "the book first." CR>
		      <RTRUE>)>
	       <RTRUE>)
	      (<MC-VERB? FLIP TURN>
			<COND (<MC-IS? ,TH-CLUE-BOOK ,FL-OPENED>
			       <TELL
"A quick review of the remainder of the book reveals nothing interesting." CR>)
			      (T
			       <RT-CYOU-MSG>
			       <RT-WOULD-HAVE-TO-MSG "open">
			       <TELL "the book first." CR>
			       <RTRUE>)>)>>

<ROUTINE RT-READ-CLUE-BOOK ()
	<TELL
"A few underlined sentences catch your eye." CR CR

"\"Invisible writing has a long and honorable history. It is used primarily
when it is felt that a code or cipher may be too easily broken.\"" CR CR

"\"Most invisible inks are somewhat sticky to the touch, and virtually all
of them become visible when exposed to moderate heat.\"" CR>>

<ROUTINE RT-AC-TH-BANK-OF-CANDLES ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-BANK-OF-CANDLES">>
	<COND (<MC-THIS-PRSO?>
	       <COND (<RT-TOUCH-VERB?>
		      <TELL
"After a moment's reflection you decide to leave undisturbed
the offerings that others have left behind." CR>
		      <RTRUE>)>)>>

<ROUTINE RT-AC-TH-PRAMS ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-PRAMS">>
	<COND (<OR <RT-TOUCH-VERB?>
		   <MC-VERB? LOOK-INSIDE SEARCH>>
	       <TELL
"The nannies move the prams beyond your reach and glare at you menacingly." CR>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-PARK-FLOWERS ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-PARK-FLOWERS">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"You see daisies, petunias, roses, peonies, marigolds, and a host of golden
daffodils." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? TAKE>
	       <TELL "Please don't pick the flowers." CR>
	       <RTRUE>)
	      (<MC-VERB? EAT>
	       <TELL "Please don't eat the daisies." CR>)
	      (<MC-VERB? SHOOT>
	       <RT-WASTE-OF-BULLETS-MSG>)>>

<ROUTINE RT-AC-TH-ARCH ("OPT" (CONTEXT <>) (CLASS <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-ARCH">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <PRINT-SDESC "triumphal arch" .CLASS <> <>>
	       <RTRUE>)
	      (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It's a large triumphal arch, surmounted by a bronze chariot." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? SHOOT>
	       <TELL ,K-RICOCHET-MSG CR>)>>

<ROUTINE RT-AC-TH-SHAFT ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-SHAFT">>
	<COND (<MC-VERB? EXAMINE LOOK-INSIDE LOOK-DOWN SEARCH>
	       <TELL "It's a long way down." CR>)
	      (<MC-VERB? ENTER LEAP>
	       <TELL ,K-SUICIDE-MSG CR>
	       <RTRUE>)
	      (<AND <MC-VERB? PUT>
		    <MC-THIS-PRSI?>>
	       <COND (<MC-PRSO? ,CH-TRAINED-PIGEON>
		      <RFALSE>)
		     (T
		      <REMOVE ,GL-PRSO>
		      <FCLEAR ,GL-PRSO ,FL-WORN>
		      <TELL CTHEO " disappear">
		      <RT-S-NOS-MSG ,GL-PRSO>
		      <TELL " into the shaft. A long time later you hear a faint \"thud.\"" CR>)>)>>

<ROUTINE RT-AC-TH-FIREPLACE ("OPT" (CONTEXT <>) (CLASS <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-FIREPLACE">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <PRINT-SDESC "fireplace" .CLASS <> <>>)
	      (<T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? EXAMINE LOOK-INSIDE SEARCH>
	       <TELL "In the fireplace is a roaring fire that would surely
consume anything you put into it." CR>)
	      (<MC-VERB? ENTER LEAP>
	       <TELL ,K-SUICIDE-MSG CR>
	       <RTRUE>)
	      (<AND <MC-VERB? PUT>
		    <MC-PRSI? ,PSEUDO-OBJECT>>
	       <COND (<MC-IS? ,GL-PRSO ,FL-BODYPART>
		      <TELL ,K-HOT-MSG CR>)
		     (<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
		      <RT-IMPOSSIBLE-MSG>
		      <RTRUE>)
		     (<AND <==? ,GL-PRSO ,TH-ETHERIUM-AMPOULE>
			   <NOT <FSET? ,GL-PRSO ,FL-BROKEN>>>
		      <RT-PERFORM ,V?MUNG ,GL-PRSO>
		      <RTRUE>)
		     (<AND <RT-META-IN? ,TH-ETHERIUM-AMPOULE ,GL-PRSO>
			   <NOT <FSET? ,TH-ETHERIUM-AMPOULE ,FL-BROKEN>>>
		      <TELL CTHEO " disappear">
		      <RT-S-NOS-MSG ,GL-PRSO>
		      <TELL " into the fire, which soon reaches the
etherium.">
		      <RT-PERFORM ,V?BURN-WITH ,TH-ETHERIUM-AMPOULE>
		      <RTRUE>)
		     (T
		      <REMOVE ,GL-PRSO>
		      <FCLEAR ,GL-PRSO ,FL-WORN>
		      <TELL CTHEO " disappear">
		      <RT-S-NOS-MSG ,GL-PRSO>
		      <TELL " into the fire and">
		      <RT-IS-ARE-MSG ,GL-PRSO>
		      <TELL "immediately consumed." CR>
		      <COND (<MC-PRSO? ,CH-TRAINED-PIGEON>
			     <RT-KILL-PIGEON>)>
		      <RTRUE>)>)
	      (<MC-VERB? REACH-IN>
	       <TELL ,K-HOT-MSG CR>
	       <RTRUE>)
	      (<MC-VERB? SHOOT>
	       <TELL ,K-RICOCHET-MSG CR>)>>

<ROUTINE RT-AC-TH-GAS-LIGHT ("OPT" (CONTEXT <>) (CLASS <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-GAS-LIGHT">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <PRINT-SDESC "gas light" .CLASS <> <> <>>)
	      (<T? .CONTEXT> <RFALSE>)
	      (<RT-TOUCH-VERB?>
	       <TELL "The gas light is out of reach." CR>
	       <RTRUE>)
	      (<MC-VERB? SHOOT>
	       <RT-WASTE-OF-BULLETS-MSG>)>>

<ROUTINE RT-AC-TH-CHARIOT ("OPT" (CONTEXT <>) (CLASS <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-CHARIOT">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <PRINT-SDESC "chariot" .CLASS <> <>>)
	      (<T? .CONTEXT> <RFALSE>)
	      (<RT-TOUCH-VERB?>
	       <TELL "The chariot is out of reach." CR>
	       <RTRUE>)
	      (<MC-VERB? SHOOT>
	       <TELL ,K-ANNIE-OAKELEY-MSG CR>)>>

<ROUTINE RT-AC-TH-JEWEL-CASE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-JEWEL-CASE">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL 
"The case is bent and twisted where the thief attacked it with the mace." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<AND <MC-VERB? LOOK-THRU>
		    <MC-PRSI? ,TH-MAGNIFYING-GLASS>>
	       <TELL "It's been wiped clean." CR>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-ELIZAS-MOUTH ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-ELIZAS-HEART">>
	<COND (<AND <MC-VERB? SHOOT>
		    <MC-THIS-PRSO?>>
	       <PUTP ,CH-ELIZA-DOOLITTLE ,P?OBJ-NOUN ,W?GIRL>
	       <PUTP ,CH-ELIZA-DOOLITTLE ,P?OBJ-ADJ 0>
	       <RT-PERFORM ,V?SHOOT ,CH-ELIZA-DOOLITTLE>
	       <RTRUE>)
	      (<NOT <AND <MC-VERB? PUT>
			 <MC-THIS-PRSI?>>>
	       <RFALSE>)
	      (<MC-ISNOT? ,TH-ELIZAS-MOUTH ,FL-OPENED>
	       <TELL CTHEI " is not open." CR>)
	      (<MC-PRSO? ,TH-ORANGE-PILL ,TH-YELLOW-PILL>
	       <RT-CURE-ELIZA ,GL-PRSO>)
	      (<NOT <FSET? ,GL-PRSO ,FL-FOOD>>
	       <TELL "It's hard to imagine that " AO
		       " would do your patient much good." CR>
	       <RTRUE>)
	      (<RT-ROOM-IN-ON-MSG? ,GL-PRSO ,GL-PRSI>
	       T)
	      ;(<OR <RT-META-IN? ,GL-PRSO ,LOCAL-GLOBALS>
		    <RT-META-IN? ,GL-PRSO ,GLOBAL-OBJECTS>
		    <IN? ,GL-PRSO ,ROOMS>>
		<TELL "Don't be silly." CR>)
	      ;(<MC-IS? ,CH-ELIZA-DOOLITTLE ,FL-ASLEEP>
		<REMOVE ,GL-PRSO>
		<RT-CYOU-MSG "put" "puts">
		<TELL THEO " into " THEI ". She swallows reflexively, gulping down " THEO "." CR>)>>

<ROUTINE RT-AC-TH-RUBBINGS ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-RUBBINGS">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"They are brass rubbings made from various inscriptions around
the abbey." CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? READ>
	       <RT-AC-TH-RUBBINGS ,K-M-DESCFCN>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-SOFA ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-SOFA">>
	<COND (<MC-VERB? ENTER>
	       <TELL ,K-NO-RESTING-MSG CR>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-MARQUEES ("OPT" (CONTEXT <>) (CLASS <>))
  <DEBUGGING? <RT-DEBUG-OB-AC "TH-MARQUEES">>
  <COND (<==? .CONTEXT ,K-M-SDESC>
	 <PRINT-SDESC "marquees" .CLASS <> T>
	 <RTRUE>)
	(<OR <==? .CONTEXT ,K-M-DESCFCN>
	     <AND <F? .CONTEXT>
		  <MC-VERB? READ LOOK-INSIDE LOOK-ON>>>
	 <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-MARQUEES>>
	 <RT-WINDOW ,GL-WINDOW>
	 <SETG GL-WINDOW <>>
	 <RTRUE>)>>

<ROUTINE RT-AC-TH-SUPPORTS ("OPT" (CONTEXT <>) (CLASS <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-SUPPORTS">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <PRINT-SDESC "supports" .CLASS <> T>)
	      (<T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? SHOOT>
	       <TELL ,K-RICOCHET-MSG CR>)>>

<ROUTINE RT-AC-TH-ASH ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-ASH">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It is dark, almost black, in colour, and quite flakey." CR>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? BLOW-INTO SHOOT>
	       <REMOVE ,TH-ASH>
	       <TELL CTHE ,TH-ASH " scatters and disappears." CR>)
	      (<MC-VERB? HAUL>
	       <TELL "Good idea. Let's get the flake out of here." CR>)
	      (<MC-VERB? KISS>
	       <TELL ,K-PROFANITY-MSG CR>) 
	      (<RT-TOUCH-VERB?>
	       <REMOVE ,TH-ASH>
	       <TELL "As soon as">
	       <RT-YOU-MSG "try" "tries">
	       <TELL "to touch the ash, it crumbles and disappears." CR>)>>

<ROUTINE RT-AC-TH-CIGARETTE ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-CIGARETTE">>
	<COND (<MC-VERB? SHOOT>
	       <TELL ,K-ANNIE-OAKELEY-MSG CR>)>>

<ROUTINE RT-AC-TH-TURBAN ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-TURBAN">>
	<COND (<OR <RT-TOUCH-VERB?>
		   <MC-VERB? LOOK-UNDER LOOK-INSIDE>>
	       <COND (<FSET? ,CH-AKBAR ,FL-ASLEEP>
		      <TELL "That's stooping pretty low." CR>
		      <RTRUE>)>
	       <TELL
"The native of India pulls away from you and says, \"As you must know,">
	       <COND (<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
		      <TELL " honourable sir,">)>
	       <TELL
" a man's head should never be uncovered. It is an affront to God.\"" CR>)
	      (<MC-VERB? SHOOT>
	       <RT-PERFORM ,V?SHOOT ,CH-AKBAR>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-ANCHOR-CHAIN ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-ANCHOR-CHAIN">>
	<COND (<MC-VERB? SHOOT>
	       <TELL ,K-RICOCHET-MSG CR>)
	      (<NOT <IN? ,CH-PLAYER ,TH-BOAT>>
	       <TELL ,K-MUST-BE-IN-BOAT-MSG "do that." CR>)
	      (<MC-VERB? TAKE>
	       <COND (<IN? ,TH-ANCHOR ,TH-BOAT>
		      <TELL "Oomph! It's too heavy to carry." CR>)
		     (T
		      <MOVE ,TH-ANCHOR ,TH-BOAT>
		      <RT-SAY-RAISE-ANCHOR>)>)
	      (<MC-VERB? RAISE HAUL WEIGH PULL>
	       <COND (<IN? ,TH-ANCHOR ,LG-WATER>
		      <MOVE ,TH-ANCHOR ,TH-BOAT>
		      <RT-SAY-RAISE-ANCHOR>)
		     (T
		      <TELL ,K-ANCHOR-ALREADY-OUT-MSG CR>)>)>>

<ROUTINE RT-SAY-LOWER-ANCHOR ()
  <RT-CYOU-MSG "lower" "lowers">
  <TELL "the anchor into the water." CR>>

<ROUTINE RT-SAY-RAISE-ANCHOR ()
  <RT-CYOU-MSG "raise" "raises">
  <TELL "the anchor and ">
  <COND (<==? ,GL-WINNER ,CH-PLAYER>
	 <TELL "drop">)
	(T
	 <TELL "drops">)>
  <TELL " it into the boat." CR>>

<ROUTINE RT-AC-TH-WAX-OBJECT-1 ("OPT" (CONTEXT <>) (CLASS <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-WAX-OBJECT-1">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <PRINT-SDESC "that part of the statue" .CLASS T <>>
	       <RTRUE>)
	      (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "You see nothing unusual about">
	       <RT-CLAUSE-PRINT ,K-P-NC1 ,K-P-NC1L>
	       <TELL "." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? SHOOT>
	       <RT-WASTE-OF-BULLETS-MSG>)>>

<ROUTINE RT-AC-TH-LIBRARY-OBJ ("OPT" (CONTEXT <>) (CLASS <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-LIBRARY-OBJ">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <PRINT-SDESC "things in the library" .CLASS <> T>
	       <RTRUE>)
	      (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "You see nothing unusual about">
	       <RT-CLAUSE-PRINT ,K-P-NC1 ,K-P-NC1L>
	       <TELL "." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB?  LOOK-INSIDE LOOK-OUTSIDE LOOK-THRU-SWP LOOK-UNDER
			  LOOK-BEHIND LOOK-ON LOOK-THRU SEARCH READ>
	       <TELL "You see nothing " <RT-PICK-NEXT ,GL-BORING-TXT>
		     "." CR>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-RAILING ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-RAILING">>
	<COND (<MC-VERB? CLIMB-OVER>
	       <TELL ,K-SUICIDE-MSG CR>
	       <RTRUE>)
	      (<MC-VERB? CLIMB-ON>
	       <TELL "It's much too dangerous. Besides, it wouldn't bring you
any closer to the clapper." CR>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-OPIUM-GAS ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-OPIUM-GAS">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "The fumes hang thick in the air." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? SMELL>
	       <TELL ,K-DIZZY-MSG CR>)
	      (<OR <MC-VERB? BUY BUY-FROM ASK-FOR>
		   <AND <EQUAL? ,GL-WINNER ,CH-DENKEEPER>
			<MC-VERB? ASK-FOR GIVE>>> 
	       <TELL
"The proprietor eyes you for a moment and says, \"A gent the likes of you
doesn't buy what I 'ave to sell, mate. What is it you really want?\"" CR>)
	      (<MC-VERB? SHOOT>
	       <RT-WASTE-OF-BULLETS-MSG>)>>

<ROUTINE RT-AC-TH-PRODUCE ("OPT" (CONTEXT <>) (CLASS <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-PRODUCE">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <PRINT-SDESC "produce" .CLASS <> T>
	       <RTRUE>)
	      (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"All the produce looks good. But the giant peas look especially delicious." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? SMELL>
	       <COND (<EQUAL? <RT-TIME-OF-DAY> 0>
		      <TELL "The produce smells country fresh." CR>)
		     (T
		      <TELL "The produce smells like it's been there a while."
			    CR>)>
	       <RTRUE>)
	      (<MC-VERB? BUY BUY-FROM>
	       <COND (<EQUAL? <GET ,GL-P-NAMW 0> ,W?FRUIT ,W?FRUITS>
		      <TELL "You">)
		     (T
		      <TELL "Although the giant peas look tempting, you">)>
	       <TELL
" decide to conserve your capital for more important purchases." CR>)
	      (<MC-VERB? TAKE STEAL>
	       <TELL ,K-THEFT-MSG CR>
	       <RTRUE>)
	      (<MC-VERB? SHOOT>
	       <RT-WASTE-OF-BULLETS-MSG>)>>

<ROUTINE RT-AC-TH-TRINKETS ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-TRINKETS">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"They're mostly just baubles. He's obviously charging way too much for them."
CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? BUY BUY-FROM>
	       <COND (<IN? ,TH-TELESCOPE ,CH-VENDOR>
		      <TELL
"The vendor says, \"I've got a loverly telescope you might be interested
in, guv'nor.\"" CR>)
		     (T
		      <TELL
"You glance at the rest of the vendor's wares and decide you can live
without them." CR>)>
	       <RTRUE>)
	      (<MC-VERB? TAKE STEAL>
	       <TELL ,K-THEFT-MSG CR>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-GUARDS-KEYS ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-GUARDS-KEYS">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <RT-CYOU-MSG>
	       <TELL "can't see them. They're in the guard's pocket." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<AND <MC-VERB? LISTEN>
		    <MC-THIS-PRSO?>>
	       <TELL
CTHE ,CH-BANK-GUARD " is idly jangling some keys in his pocket." CR>)>>

<ROUTINE RT-AC-TH-NELSON-EYE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-NELSON-EYE">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<AND <MC-IS? ,TH-NELSON-STATUE ,FL-OPENED>
			   <IN? ,TH-RUBY ,TH-NELSON-STATUE>>
		      <TELL " " ,K-GLINT-MSG>
		      <RTRUE>)>
	       <RFALSE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<RT-TOUCH-VERB?>
	       <TELL CTHE ,TH-NELSON-EYE " is too high." CR>
	       <RTRUE>)
	      (<MC-VERB? LOOK-INSIDE SEARCH>
	       <COND (<NOT <RT-AC-TH-NELSON-EYE ,K-M-DESCFCN>>
		      <TELL "It is too high up to get a good look." CR>)>)
	      (<MC-VERB? SHOOT>
	       <TELL ,K-ANNIE-OAKELEY-MSG CR>)>>

;<ROUTINE RT-AC-TH-UNINTERESTING-OBJECT ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-UNINTERESTING-OBJECT">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It's not very interesting." CR>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? TAKE RELEASE MOVE LOOK-UNDER PUSH-TO PUSH>
	       <RT-CYOU-MSG>
	       <TELL "can't seem to budge the object." CR>
	       <RTRUE>)
	      (<MC-VERB? MUNG SHOOT>
	       <RT-CYOU-MSG>
	       <TELL "can't seem to destroy the object." CR>
	       <RTRUE>)>>

<ROUTINE RT-AC-TH-PANELLING ("OPT" (CONTEXT <>) (CLASS <>))
	 <COND (<==? .CONTEXT ,K-M-SDESC>
		<PRINT-SDESC "walls" .CLASS <> T>)>>

<ROUTINE RT-AC-TH-INSTRUMENTS ("OPT" (CONTEXT <>) (CLASS <>))
	 <COND (<==? .CONTEXT ,K-M-SDESC>
		<PRINT-SDESC "instruments of torture" .CLASS <> T>)>>

<ROUTINE RT-AC-TH-PLAYER-BODY ()
  <COND (<AND <==? <GET ,GL-P-NAMW 0> ,W?NOSE>
	      <OR <AND <MC-VERB? TAKE>
		       <==? ,GL-P-PRSA-WORD ,W?HOLD>>
		  <AND <MC-VERB? STEAL>
		       <==? ,GL-P-PRSA-WORD ,W?PINCH>>>>
	 <RT-PERFORM ,V?TAKE ,TH-BREATH>
	 <RTRUE>)>>
