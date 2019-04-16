;*****************************************************************************
; "game : SHERLOCK!"
; "file : PUZZLES.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   28 Oct 1987 17:06:56  $"
; "rev  : $Revision:   1.115  $"
; "vers : 1.00"
;*****************************************************************************

<ROUTINE RT-EXAMINE-GEM (GEM)
    <COND (<AND <==? .GEM ,TH-SAPPHIRE>
		<IN? ,TH-SAPPHIRE ,TH-CLAPPER>>
	   <TELL "The sapphire is hanging from the end of the clapper."CR>
	   <RTRUE>)
	  (<EQUAL? <LOC .GEM> ,CH-PLAYER>
	   <COND (<MC-VERB? EXAMINE LOOK-ON>
		  <TELL "It looks as if there is a scratch on " THEO "." CR>)
		 (<MC-VERB? READ>
		  <TELL "All you can see on " THEO " is a scratch." CR>)
		 (<AND <MC-VERB? LOOK-THRU>
		       <MC-PRSI? ,TH-MAGNIFYING-GLASS>>
		  <COND (<IN? ,TH-MAGNIFYING-GLASS ,GL-WINNER>
			 <TELL "You see \"">
			 <COND (<EQUAL? .GEM ,TH-SAPPHIRE>
				<TELL "2:00 a.m.">)
			       (<EQUAL? .GEM ,TH-EMERALD>
				<TELL "20/6/87">)
			       (<EQUAL? .GEM ,TH-OPAL>
				<TELL "Password: Swordfish">)
			       (<EQUAL? .GEM ,TH-RUBY>
				<TELL "Wear a carnation">)
			       (<EQUAL? .GEM ,TH-TOPAZ>
				<TELL "Bar of Gold">)
			       (<EQUAL? .GEM ,TH-GARNET>
				<TELL "Give me to Akbar">)>
			 <TELL "\" scratched into the surface of " THEO "." CR>
			 <COND (<MC-F? <BAND ,CH-HOLMES-AUX1 ,K-HOLMES-GEM?>>
				<SETG CH-HOLMES-AUX1 <BOR ,CH-HOLMES-AUX1
							     ,K-HOLMES-GEM?>>
				<MOVE ,TH-RING ,CH-PLAYER>
				<MC-MAKE ,TH-RING ,FL-SEEN>
				<MC-MAKE ,TH-RING ,FL-TOUCHED>
				<MC-UNMAKE ,TH-RING ,FL-NODESC>
				<CRLF>
				<TELL "Holmes">
				<RT-HOLMES-SAYS-AGRA-MSG>
				<RT-UPDATE-SCORE <GETP ,TH-RING ,P?VALUE>>
				<PUTP ,TH-RING ,P?VALUE 0>)>)
			(T
			 <RT-YOUD-HAVE-TO-MSG "be holding" ,TH-MAGNIFYING-GLASS>)>
		  <RTRUE>)>)
	  (T
	    <COND (<MC-VERB? READ>
		    <RT-CYOU-MSG>
		    <RT-WOULD-HAVE-TO-MSG "be holding" ,GL-PRSO>
		    <TELL " to read ">
		    <RT-SAY-HIM-HER-THEM-IT-MSG ,GL-PRSO>
		    <TELL "." CR>)
		   (<AND <MC-VERB? LOOK-THRU>
			 <MC-PRSI? ,TH-MAGNIFYING-GLASS>>
		    <RT-CYOU-MSG>
		    <RT-WOULD-HAVE-TO-MSG "be holding" ,GL-PRSO>
		    <TELL ,K-GOOD-LOOK-MSG CR>)
		   (<MC-VERB? EXAMINE LOOK-ON>
		    <RT-CYOU-MSG>
		    <RT-WOULD-HAVE-TO-MSG "be holding" ,GL-PRSO>
		    <TELL ,K-GOOD-LOOK-MSG CR>)>)>>

<ROUTINE RT-HANDLE-SCRATCH (GEM "OPT" (CONTEXT <>))
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <PUTP .GEM ,P?OBJ-NOUN 0>
	       <TELL D .GEM>
	       <PUTP .GEM ,P?OBJ-NOUN ,W?SCRATCH>
	       <TELL "'s scratch">
	       <RTRUE>)
	      (<N==? .CONTEXT ,K-M-DESCFCN> RFALSE)>
	<COND (<EQUAL? <LOC .GEM> ,CH-PLAYER>
	       <COND (<MC-VERB? EXAMINE>
		      <TELL "It looks like very tiny writing." CR>)
		     (<MC-VERB? READ>
		      <TELL "It is too tiny." CR>)
		     (<AND <MC-VERB? LOOK-THRU>
			   <MC-PRSI? ,TH-MAGNIFYING-GLASS>>
		      <COND (<IN? ,TH-MAGNIFYING-GLASS ,GL-WINNER>
			     <TELL "You see \"">
			     <COND (<EQUAL? .GEM ,TH-SAPPHIRE>
				    <TELL "2:00 a.m">)
				   (<EQUAL? .GEM ,TH-EMERALD>
				    <TELL "20/6/87">)
				   (<EQUAL? .GEM ,TH-OPAL>
				    <TELL "Password: Swordfish">)
				   (<EQUAL? .GEM ,TH-RUBY>
				    <TELL "Wear a carnation">)
				   (<EQUAL? .GEM ,TH-TOPAZ>
				    <TELL "Bar of Gold">)
				   (<EQUAL? .GEM ,TH-GARNET>
				    <TELL "Give me to Akbar">)>
			     <TELL ".\"" CR>
			     <COND (<MC-F? <BAND ,CH-HOLMES-AUX1
						 ,K-HOLMES-GEM?>>
				    <SETG CH-HOLMES-AUX1 <BOR
							  ,CH-HOLMES-AUX1
							  ,K-HOLMES-GEM?>>
				    <MOVE ,TH-RING ,CH-PLAYER>
				    <MC-MAKE ,TH-RING ,FL-SEEN>
				    <MC-MAKE ,TH-RING ,FL-TOUCHED>
				    <MC-UNMAKE ,TH-RING ,FL-NODESC>
				    <CRLF>
				    <TELL "Holmes">
				    <RT-HOLMES-SAYS-AGRA-MSG>
				    <RT-UPDATE-SCORE <GETP ,TH-RING ,P?VALUE>>
				    <PUTP ,TH-RING ,P?VALUE 0>)>)
			    (T
			     <RT-YOUD-HAVE-TO-MSG "be holding"
						  ,TH-MAGNIFYING-GLASS>)>
		      <RTRUE>)>)
	      (T
	       <COND (<OR <AND <MC-VERB? LOOK-THRU>
			       <MC-PRSI? ,TH-MAGNIFYING-GLASS>>
			  <MC-VERB? EXAMINE READ>>
		      <RT-CYOU-MSG>
		      <RT-WOULD-HAVE-TO-MSG "be holding" .GEM>
		      <COND (<MC-VERB? READ>
			     <TELL " to read the scratch." CR>)
			    (T
			     <TELL ,K-GOOD-LOOK-MSG CR>)>)>)>>

; "GL-HOLES is used to store the room and object 'containing' each of the"
; "six bullet holes."

<CONSTANT GL-HOLES:TABLE
	<TABLE
		0	;"Next empty slot"
	;"Obj  Room"
		0		0
		0		0
		0		0
		0		0
		0		0
		0		0>>

<ROUTINE RT-HOLE? (OBJ "AUX" OFF (CNT 0) (NUM 0) PLACE)
	<REPEAT ()
	       <SET OFF <* .NUM 2>>
	       <COND (<EQUAL? .NUM <GET ,GL-HOLES 0>>
		      <RETURN>)
		     (<EQUAL? .OBJ <GET ,GL-HOLES <+ .OFF 1>>>
		      <COND (<OR <MC-F? <SET PLACE <GET ,GL-HOLES <+ .OFF 2>>>>
				 <MC-HERE? .PLACE>>
			     <INC CNT>)>)>
	       <INC NUM>>
	<RETURN .CNT>>

<ROUTINE RT-WASTE-OF-BULLETS-MSG ("AUX" WHO)
	<SET WHO <RT-WHO-SAYS?>>
	<COND (<EQUAL? .WHO ,CH-HOLMES>
	       <TELL
"Holmes glances at you and says, \"Save your ammunition, Watson. More danger
may lie ahead.\"" CR>)
	      (<EQUAL? .WHO ,CH-WIGGINS>
	       <TELL
"Wiggins looks at you impatiently and says, \"'Ow in the name of Dick
Whittington is shooting " AO " going to help Mr 'Olmes?\"" CR>)
	      (T
	       <TELL "That would be a waste of bullets." CR>)>
	<RTRUE>>

<ROUTINE RT-SHOOT-DEAD-MSG ("AUX" WHO)
	<SET WHO <RT-WHO-SAYS?>>
	<COND (<EQUAL? .WHO ,CH-HOLMES>
	       <TELL
"Holmes lifts an eyebrow and says sardonically, \"Is shooting dead people a
new trend in medical research, Doctor?\"" CR>)
	      (<EQUAL? .WHO ,CH-WIGGINS>
	       <TELL
"Wiggins tugs at your sleeve and whispers nervously, \"Everyone here is
already dead... aren't they?\"" CR>)
	      (T
	       <TELL
"Have you no decency? Have you no shame? No? Then a bright future awaits you
in the legal profession. Apply now to the law school of your choice." CR>)>>

<ROUTINE RT-READ-NEWSPAPER ()
	<TELL "It's the newspaper that came in your game package." CR>
	;<COND (<AND <OR <MC-IS? ,TH-NEWSPAPER ,FL-OPENED>
			 <EQUAL? <GETP ,TH-NEWSPAPER ,P?FLIPPED> 1>>
		     <MC-VERB? READ-TO SHOW>>
		<RT-CYOU-MSG "turn" "turns">
		<TELL THE ,TH-NEWSPAPER " to the front page." CR>
		<COND (<MC-IS? ,TH-NEWSPAPER ,FL-ASLEEP>
		       <CRLF>)>
		<MC-UNMAKE ,TH-NEWSPAPER ,FL-OPENED>
		<PUTP ,TH-NEWSPAPER ,P?FLIPPED 0>)>
	;<COND (<MC-IS? ,TH-NEWSPAPER ,FL-OPENED>
		<TELL "It's the newspaper that came in your game package." CR>)
	       (<EQUAL? <GETP ,TH-NEWSPAPER ,P?FLIPPED> 1>
		<TELL "It's the newspaper that came in your game package." CR>)
	       (<OR <MC-IS? ,TH-NEWSPAPER ,FL-ASLEEP>
		    <MC-VERB? READ>>
		<TELL "It's the newspaper that came in your game package." CR>
		<MC-UNMAKE ,TH-NEWSPAPER ,FL-ASLEEP>)>>

<ROUTINE RT-WAKE-UP-HOLMES ()
	<MC-UNMAKE ,CH-HOLMES ,FL-ASLEEP>
	<MC-MAKE ,LG-PARLOUR-DOOR ,FL-OPENED>
	<REMOVE ,TH-PHIAL>
	<REMOVE ,TH-MOROCCO-CASE>
	<REMOVE ,TH-SYRINGE>
	<RT-ALARM-SET-REL ,RT-I-PM-HALL <RT-PARM-SET 0 1 0>>
	<RT-ALARM-CLR ,RT-I-PM-QUITS>
	<TELL "Holmes ">
	<COND (<EQUAL? ,TH-NEWSPAPER ,GL-PRSO ,GL-PRSI>
	       <TELL
"glances at the paper and his eye falls on the notice about the Tower
of London. He ">)>
	<TELL
"immediately leaps to his feet and hurls the phial and the case
into the fireplace. The phial and the syringe shatter, and the liquid
evaporates instantly, but the detective does not even notice. ">
	<COND (<MC-PRSI? ,CH-PRIME-MINISTER>
	       <TELL
"\"A client?\" he exclaims. \"On government business? Most interesting.\"">)
	      (T
	       <TELL
"\"They've closed the Tower?\" he exclaims. \"Most singular.\"">)>
	<CRLF>
	<RT-UPDATE-SCORE 5>
	<TELL CR
"Holmes strides to the door and calls down to Mrs Hudson to bring up a tray
of food. Then he plops back down on the sofa, ">
	<COND (<AND <MC-PRSI? ,CH-PRIME-MINISTER>
		    <NOT <RT-META-IN? ,TH-NEWSPAPER ,CH-PLAYER>>
		    <EQUAL? <RT-META-LOC ,TH-NEWSPAPER> ,RM-HOLMES-STUDY>>
	       <TELL "glances at the newspaper, and then ">)>
	<TELL
"makes a steeple of his fingertips and focuses his intense gaze upon
you." CR>>

<ROUTINE RT-I-PM-HALL ()
	<MC-MAKE ,CH-HUDSON ,FL-NODESC>
	<MOVE ,CH-PRIME-MINISTER ,RM-ENTRY-HALL>
	<MOVE ,CH-HUDSON ,RM-ENTRY-HALL>
	<RT-ALARM-SET-REL ,RT-I-PM-VESTIBULE <RT-PARM-SET 0 1 0>>
	<COND (<MC-HERE? ,RM-VESTIBULE>
	       <TELL
CR "Mrs Hudson and the visitor emerge from the parlour and appear to be on
their way upstairs." CR>)>>

<ROUTINE RT-I-PM-VESTIBULE ()
	<MOVE ,CH-PRIME-MINISTER ,RM-VESTIBULE>
	<MOVE ,CH-HUDSON ,RM-VESTIBULE>
	<RT-ALARM-SET-REL ,RT-I-HUDSON <RT-PARM-SET 0 1 0>>
	<COND (<AND <MC-HERE? ,RM-VESTIBULE>
		    <NOT <EQUAL? ,GL-PLACE-PRV ,RM-ENTRY-HALL>>>
	       <TELL
CR "Mrs Hudson and the visitor arrive at the top of the stairs on their way
into Holmes's study." CR>)
	      (<AND <MC-HERE? ,RM-ENTRY-HALL>
		    <EQUAL? ,GL-PLACE-PRV ,RM-VESTIBULE>>
	       <TELL
CR "Mrs Hudson and the visitor passed you on the stairs." CR>)>>

<ROUTINE RT-I-HUDSON ("AUX" NUM)
	<MOVE ,CH-PRIME-MINISTER ,RM-HOLMES-STUDY>
	<REMOVE ,CH-HUDSON>
	<MC-UNMAKE ,CH-HUDSON ,FL-NODESC>
	<SET NUM ,RM-HOLMES-STUDY-AUX1>
	<COND (<EQUAL? .NUM 0>
	       <COND (<MC-HERE? ,RM-VESTIBULE>
		      <TELL
CR "Mrs Hudson ushers the visitor into " THE ,RM-HOLMES-STUDY " and goes
downstairs." CR>)
		     (<MC-HERE? ,RM-ENTRY-HALL>
		      <TELL
CR "You see Mrs Hudson come down the stairway." CR>)>)>
	<COND (<OR <MC-HERE? ,RM-HOLMES-STUDY>
		   <EQUAL? ,RM-HOLMES-STUDY-AUX1 3>>
	       <MOVE ,TH-WESTMINSTER-CLUE ,CH-PLAYER>
	       <MC-MAKE ,TH-WESTMINSTER-CLUE ,FL-SEEN>
	       <MC-MAKE ,CH-PRIME-MINISTER ,FL-SEEN>
	       <RT-ALARM-SET-REL ,RT-I-PM-LEAVE <RT-PARM-SET 0 3 0>>
	       <COND (<AND <MC-HERE? ,RM-HOLMES-STUDY>
			   <EQUAL? .NUM 0>>
		      <TELL
CR "Mrs Hudson appears at the door, accompanied by a worried-looking
gentleman." CR CR

"Holmes jumps up and ushers the gentleman to the armchair,
dismissing Mrs Hudson at the same time. \"Watson,\" he says, \"I am sure
you recognize our distinguished visitor. ">)
		     (<AND <MC-HERE? ,RM-HOLMES-STUDY>
			   <EQUAL? .NUM 1 2>>
		      <TELL
CR "Holmes has seated his visitor and is exchanging pleasantries with
him. As you walk in Holmes looks up and says, \"Ah, here you
are Watson. Now we can get down to business.\" He turns to the gentleman
seated in the armchair and says, \"">)
		     (T
		      <TELL
CR "Holmes appears and says, \"Come with me, Watson. We have an
important visitor.\" He takes you by the arm and ushers you back to his
study. Once inside, he gestures to the guest seated in the armchair
and says, \"">
		      <MOVE ,CH-PLAYER ,RM-HOLMES-STUDY>
		      <SETG GL-PLACE-PRV ,GL-PLACE-CUR>
		      <SETG GL-PLACE-CUR ,RM-HOLMES-STUDY>)>
	       <TELL
"I presume, sir, that you have come about the Jewels.\"" CR CR

"The visitor half rises from his chair in protest and
sputters, \"But...but, how...?\"" CR CR

"Holmes calms him with a glance. \"Come, sir. What else
could it be? The Tower is suddenly closed, and within hours I receive a
call from the highest official of Her Majesty's government. A simple
deduction. Now then, tell me about the theft.\"" CR CR

"The visitor settles back into his chair and says, \"We know very
little. Only that the Crown Jewels were stolen
from the Tower sometime Thursday night. The theft was discovered
Friday morning, and we immediately closed and searched the Tower. All we
found was this verse which was left behind in the empty jewel case.\"" CR CR

"The visitor removes a folded piece of paper from his pocket
and gives it to Holmes, who glances at it and passes it on to you." CR>
	       <RT-THIS-IS-IT ,TH-WESTMINSTER-CLUE>
	       <RT-THIS-IS-IT ,CH-PRIME-MINISTER>)
	      (T
	       <RT-ALARM-SET-REL ,RT-I-HUDSON <RT-PARM-SET 0 1 0>>
	       <SETG RM-HOLMES-STUDY-AUX1 <+ .NUM 1>>
	       <COND (<EQUAL? .NUM 0>
		      <TELL
CR "You hear Holmes call you to come back into his study..." CR>)>)>
	<RTRUE>>

<ROUTINE RT-I-PM-LEAVE ()
	<MC-UNMAKE ,LG-HOLMES-BEDROOM-DOOR ,FL-LOCKED>
	<MC-MAKE ,LG-HOLMES-BEDROOM-DOOR ,FL-OPENED>
	<REMOVE ,CH-PRIME-MINISTER>
	<MOVE ,CH-HOLMES ,RM-221B-BAKER-ST>
	<COND (<EQUAL? <LOC ,CH-PLAYER> ,RM-HOLMES-STUDY>
	       <TELL
CR "The visitor looks at his pocket watch and stands up. \"Thank
you, gentlemen. I must go now. Remember, this calamity can only be hidden
from the public until Monday morning at nine o'clock. If the Regalia is
not at Buckingham Palace in time for the Coronation Day festivities, then all
is lost.\"" CR CR

"The gentleman leaves, and Holmes unlocks the door to the
bedroom, goes in, and reappears moments later wearing his Inverness cape
and deerstalker hat." CR CR

"\"Come when you're ready, Watson. I'll wait for you outside.\"" CR>)
	      (<MC-HERE? ,RM-221B-BAKER-ST>
	       <TELL
CR "You see Holmes and the visitor emerge from the house. They confer
briefly, shake hands, and then the Minister walks off into the fog." CR>)
	      (T
	       <TELL CR
"Holmes and the visitor brush past you as they leave the house. Holmes
says to you, \"Come when you're ready, Watson. I'll wait for you
outside.\"" CR>)>
	<RTRUE>>

<ROUTINE RT-I-PM-QUITS ()
	<CRLF>
	<COND (<MC-HERE? ,RM-221B-BAKER-ST>
	       <TELL
"You see " THE ,LG-BAKER-ST-DOOR " open, and a dejected-looking man comes
out. He slowly walks away into the fog." CR CR>)
	      (<MC-HERE? ,RM-HOLMES-STUDY ,RM-VESTIBULE>
	       <TELL
"From downstairs you hear the sound of a door closing. You go down and open "
THE ,LG-BAKER-ST-DOOR " in time to see a dejected-looking man disappearing
into the fog." CR CR>)
	      (<MC-HERE? ,RM-ENTRY-HALL>
	       <TELL
"Suddenly " THE ,LG-PARLOUR-DOOR " opens and a dejected-looking man appears.
\"Thank you for trying, Mrs Hudson, but without Sherlock Holmes, there is no
hope.\" He opens " THE ,LG-BAKER-ST-DOOR " and disappears into the fog." CR CR>)>
	<TELL
"Moments later you see newsboys running through the streets shouting,
\"Crown Jewels stolen! Prime Minister resigns in disgrace!\"" CR CR>
	<RT-QSR>>

; "Routines also modified to support the Nelson puzzle:"
; "	RT-AC-TH-TELESCOPE"
; "	RT-AC-TH-RUBY"
; "	PRE-SHOW"
; "	SHOW Syntax"
; "	KILL Syntax"
; "	RT-PERFORM: Check for winner FL-ALIVE instead of FL-PERSON."
; "	RT-FOOLISH-TO-TALK: Same as RT-PERFORM."

; "Bits that describe the pigeon's state of attention"

<CONSTANT K-PIGEON-SHOWN-RUBY	1>
<CONSTANT K-PIGEON-GET-RUBY	2>
<CONSTANT K-PIGEON-TIRED	4>

; "Pigeon's state of attention is stored in the AUX1 property."
; "Number of times the pigeon has circled is stored in the AUX2 property."
; "Object that pigeon brings back is stored in the AUX3 property."

<ROUTINE RT-GET-PIGEON ("AUX" OBJ WHO)
	<COND (<BAND ,CH-TRAINED-PIGEON-AUX1 ,K-PIGEON-TIRED>
	       <TELL "\"He's too young to fly too often.">
	       <SET OBJ ,CH-TRAINED-PIGEON-AUX3>
	       <COND (<IN? .OBJ ,CH-SHERMAN>
		      <TELL
" He did come back with " A .OBJ ", however,\" he says, giving it to you." CR>
		      <MOVE .OBJ ,CH-PLAYER>
		      <RT-THIS-IS-IT .OBJ>
		      <MC-MAKE .OBJ ,FL-SEEN>
		      <MC-MAKE .OBJ ,FL-TOUCHED>
		      <MC-UNMAKE .OBJ ,FL-NODESC>
		      <COND (<MC-T? <GETP .OBJ ,P?VALUE>>
			     <SET WHO <RT-WHO-SAYS?>>
			     <COND (<EQUAL? .WHO ,CH-HOLMES>
				    <TELL CR ,K-BRAVO-MSG CR>)>
			     <RT-UPDATE-SCORE <GETP .OBJ ,P?VALUE>>
			     <PUTP .OBJ ,P?VALUE 0>)>)
		     (T
		      <TELL " Come back next week.\"" CR>)>)
	      (<IN? ,CH-TRAINED-PIGEON ,CH-SHERMAN>
	       <TELL "Sherman hands you the bird. \"Take good care of
him, now. I've grown fond of him.\"" CR>
	       <MOVE ,CH-TRAINED-PIGEON ,CH-PLAYER>
	       <MC-MAKE ,CH-TRAINED-PIGEON ,FL-SEEN>
	       <MC-MAKE ,CH-TRAINED-PIGEON ,FL-TOUCHED>
	       <MC-UNMAKE ,CH-TRAINED-PIGEON ,FL-NODESC>
	       <RT-UPDATE-SCORE <GETP ,CH-TRAINED-PIGEON ,P?VALUE>>
	       <PUTP ,CH-TRAINED-PIGEON ,P?VALUE 0>)
	      (T
	       <TELL "\"I've already given him to you.\"" CR>)>>

<ROUTINE RT-PIGEON-INTEREST (ATT-BIT)
	<COND (<AND <EQUAL? .ATT-BIT ,K-PIGEON-GET-RUBY>
		    <NOT <BAND ,CH-TRAINED-PIGEON-AUX1 ,K-PIGEON-SHOWN-RUBY>>>
	       <TELL
CTHE ,CH-TRAINED-PIGEON " doesn't seem to see the object to which you are
referring." CR>
	       <RTRUE>)>
	<SETG CH-TRAINED-PIGEON-AUX1 <BOR ,CH-TRAINED-PIGEON-AUX1 .ATT-BIT>>
	<RT-AC-CH-TRAINED-PIGEON ,K-M-DESCFCN>
	<RT-ALARM-CLR ,RT-I-PIGEON-LOSE-INTEREST>
	<RT-ALARM-SET-REL ,RT-I-PIGEON-LOSE-INTEREST <RT-PARM-SET 0 3 0>>
	<COND (<AND <BAND ,CH-TRAINED-PIGEON-AUX1 ,K-PIGEON-SHOWN-RUBY>
		    <BAND ,CH-TRAINED-PIGEON-AUX1 ,K-PIGEON-GET-RUBY>>
	       <COND (<RT-ALARM-SET? ,RT-I-PIGEON-IMPATIENT>
		      <RT-ALARM-CLR ,RT-I-PIGEON-IMPATIENT>)>
	       <RT-ALARM-SET-REL ,RT-I-PIGEON-IMPATIENT <RT-PARM-SET 0 1 0>>)>>

<ROUTINE RT-KILL-PIGEON ()
       <MC-UNMAKE ,CH-TRAINED-PIGEON ,FL-ALIVE>
       <SETG CH-TRAINED-PIGEON-AUX2 0>
       <COND (<NOT <0? <LOC ,CH-TRAINED-PIGEON>>>
	      <MOVE ,TH-DEAD-PIGEON <LOC ,CH-TRAINED-PIGEON>>
              <REMOVE ,CH-TRAINED-PIGEON>)>
       <RT-ALARM-CLR ,RT-I-PIGEON-LOSE-INTEREST>
       <RT-ALARM-CLR ,RT-I-PIGEON-IMPATIENT>
       <COND (<MC-HERE? ,RM-SHERMANS-HOUSE>
	      <RT-SHERMAN-RAGE <>>)
	     (T
	      <RT-ALARM-SET-REL ,RT-I-SHERMANS-REVENGE <RT-PARM-SET 0 30 0>>)>>

<ROUTINE RT-PIGEON-OBJ (P-OBJ "AUX" WHO)
	<MOVE .P-OBJ ,CH-PLAYER>
	<RT-THIS-IS-IT .P-OBJ>
	<MC-MAKE .P-OBJ ,FL-SEEN>
	<MC-MAKE .P-OBJ ,FL-TOUCHED>
	<MC-UNMAKE .P-OBJ ,FL-NODESC>
	<COND (<MC-T? <GETP .P-OBJ ,P?VALUE>>
	       <SET WHO <RT-WHO-SAYS?>>
	       <COND (<EQUAL? .WHO ,CH-HOLMES>
		      <TELL CR ,K-BRAVO-MSG CR>)>
	       <RT-UPDATE-SCORE <GETP .P-OBJ ,P?VALUE>>
	       <PUTP .P-OBJ ,P?VALUE 0>)>
	<RTRUE>>

<ROUTINE RT-SHERMAN-RAGE (WALK)
	<CRLF>
	<COND (<MC-T? .WALK>
	       <TELL "As you walk into the shop, ">)>
	<TELL
"Sherman sees you and flies into a rage. \"Animal hater!\" he cries. \"You
killed my bird! How could you do such a thing?\"" CR CR

"With a strength you didn't know he possessed, Sherman wrestles you into
one of the larger cages that line the walls of his shop." CR CR

"Over the next few days, no customers buy you. But then on Monday morning
Inspector Lestrade comes in looking for a pet for his wife. \"Did you
you hear about the Crown Jewels?\" he asks. \"I'm looking into it personally
and I don't mind telling you I've a few theories of my own. By the
way, isn't it a little cramped in there?\"" CR CR

"Lestrade leaves and you decide that with him handling the case, you'd
just as soon stay in the cage."
CR CR>
	<RT-QSR>>

<ROUTINE RT-I-PIGEON-LOSE-INTEREST ()
	<SETG CH-TRAINED-PIGEON-AUX1 0>
	<COND (<RT-VISIBLE? ,CH-TRAINED-PIGEON>
	       <TELL CR CTHE ,CH-TRAINED-PIGEON " seems to lose interest." CR>)>>

<ROUTINE RT-I-PIGEON-IMPATIENT ()
	<COND (<RT-VISIBLE? ,CH-TRAINED-PIGEON>
	       <TELL
CR CTHE ,CH-TRAINED-PIGEON " looks at you as if waiting for you to let him
go." CR>)>>

<ROUTINE RT-I-PIGEON-CIRCLE ("AUX" CIRCLE L)
	<SET CIRCLE ,CH-TRAINED-PIGEON-AUX2>
	<SET L <LOC ,CH-TRAINED-PIGEON>>
	<COND (<OR <AND <EQUAL? ,GL-WINNER ,CH-PLAYER>
			<MC-VERB? WALK>>
		   <EQUAL? .CIRCLE 3>>
	       <MOVE ,CH-TRAINED-PIGEON ,CH-SHERMAN>
	       <SETG CH-TRAINED-PIGEON-AUX1 ,K-PIGEON-TIRED>
	       <SETG CH-TRAINED-PIGEON-AUX2 0>
	       <MOVE ,CH-TRAINED-PIGEON-AUX3 ,CH-SHERMAN>
	       <COND (<AND <EQUAL? .L ,GL-PLACE-CUR>
			   <OR <NOT <EQUAL? ,GL-WINNER ,CH-PLAYER>>
			       <NOT <MC-VERB? WALK>>>>
		      <TELL CR CTHE ,CH-TRAINED-PIGEON " circles above you
for the last time, and flies out of sight." CR>)>)
	      (<EQUAL? .CIRCLE 1 2>
	       <RT-ALARM-SET-REL ,RT-I-PIGEON-CIRCLE <RT-PARM-SET 0 1 0>>
	       <SETG CH-TRAINED-PIGEON-AUX2 <+ .CIRCLE 1>>
	       <COND (<EQUAL? .L ,GL-PLACE-CUR>
		      <TELL CR CTHE ,CH-TRAINED-PIGEON " circles above you." CR>)>)>>

<ROUTINE RT-I-SHERMANS-REVENGE ()
	<COND (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
	       <RT-ALARM-SET-REL ,RT-I-SHERMANS-REVENGE <RT-PARM-SET 0 1 0>>
	       <RFALSE>)
	      (T
	       <TELL CR "Suddenly, you see Sherman the animal trainer running
towards you. He is accompanied by a constable.
Sherman is beside himself with rage. \"There they are,
constable. They killed my bird. Arrest them.\" The constable
takes both you and Sherlock into custody, and although everything is
eventually straightened out, it takes far too long for you to have enough
time left to solve the mystery." CR CR>
			<RT-QSR>)>>

<ROUTINE RT-IMPOLITE-MSG (STR1 STR2)
	<TELL "It isn't polite to " .STR1 " without " .STR2 "." CR>
	<RTRUE>>

<CONSTANT K-BELL-AWAY 0>	; "Big Ben is swung away from the player."
<CONSTANT K-BELL-TOWARDS 1>	; "Big Ben is swung towards the player."

<GLOBAL GL-WAIT-BELL:FLAG <>>	;"Don't ring bell until done waiting."

; "Number of times to ring Big Ben is stored in the AUX1 property of TH-BELL."
; "Bell position is stored in the AUX2 property of TH-BELL."
; "Grabs required to get the sapphire is stored in the AUX1 property of"
; "TH-SAPPHIRE."

<ROUTINE RT-I-BIGBEN ("AUX" HRS MIN SEC YRS MON DAY (RET <>))
      <COND (<MC-IS? ,CH-PLAYER ,FL-ASLEEP>
	     <RFALSE>)>
      <COND (<AND <MC-T? ,GL-WAIT-BELL>
		  <MC-VERB? WAIT-FOR WAIT>>
	     <SET RET T>)
	    (<AND <MC-VERB? WAIT-FOR WAIT>
		  <NOT <MC-HERE? RM-CLOCK-TOWER>>>
	     <RT-CLOCK-INC-SET 1 0 0>
	     <RT-CLOCK-INC>
	     <COND (<EQUAL? <RT-CLOCK-CMP <GETB ,GL-TEMP-TIME ,K-HRS>
					  <GETB ,GL-TEMP-TIME ,K-MIN>
					  <GETB ,GL-TEMP-TIME ,K-SEC>
					  <GETB ,GL-TEMP-TIME ,K-DAY>> 1>
		    <COND (<MC-F? ,GL-WAIT-BELL>
			   <TELL CR "While you wait, you hear Big Ben strike each hour." CR>)>
		    <SET RET T>)>
	     <RT-CLOCK-INC-SET -1 0 0>
	     <RT-CLOCK-INC>
	     <SETG GL-WAIT-BELL T>)
	    (T
	     <SETG GL-WAIT-BELL <>>)>
      <RT-ALARM-SET-REL ,RT-I-BIGBEN <RT-PARM-SET 1 0 0>>
      <COND (<MC-T? .RET>
	     <RFALSE>)>
      <SET HRS <GETB ,GL-TIME ,K-HRS>>
      <COND (<NOT <EQUAL? ,GL-PLACE-CUR ,RM-CLOCK-TOWER>>
	     <TELL CR "In the distance, you hear Big Ben strike the hour." CR>
	     <IFSOUND <COND (<F? ,SOUND-QUEUED?>
			     <COND (<G? .HRS 12>
				    <SETG TH-BELL-AUX1 <- .HRS 12>>)
				   (T
				    <SETG TH-BELL-AUX1 .HRS>)>
			     <SOUNDS ,S-FARBEN ,S-START 3 ,TH-BELL-AUX1>)>>)
	    (T
	     <COND (<G? .HRS 12>
		    <SETG TH-BELL-AUX1 <- .HRS 12>>)
		   (T
		    <SETG TH-BELL-AUX1 .HRS>)>
	     <RT-I-SWING-BELL>)>>

<GLOBAL HEARD-SWING? <>>

<ROUTINE RT-I-SWING-BELL ("AUX" OBJ NUM POS WHO)
	<SET NUM ,TH-BELL-AUX1>
	<SET POS ,TH-BELL-AUX2>
	<COND (<NOT <EQUAL? ,GL-PLACE-CUR ,RM-CLOCK-TOWER>>
	       <RT-RELIEF>
	       <SETG HEARD-SWING? <>>
	       <SETG TH-BELL-AUX1 0>
	       <SETG TH-BELL-AUX2 ,K-BELL-AWAY>
	       <RT-ZERO-SECONDS>
	       <RFALSE>)>
	<COND (<G? .NUM 0>
	       <RT-CLOCK-INC-SET 0 0 2>
	       <RT-ALARM-SET-REL ,RT-I-SWING-BELL <RT-PARM-SET 0 0 2>>)>
	<IFSOUND <COND (<F? ,HEARD-SWING?>
			<SOUNDS ,S-CLOCK ,S-INIT>)>>
	<TELL CR "The bell swings ">
	<COND (<EQUAL? .POS ,K-BELL-AWAY>
	       <SETG TH-BELL-AUX2 ,K-BELL-TOWARDS>
	       <TELL "towards you, ">
	       <COND (<MC-IS? ,TH-COTTON-BALLS ,FL-WORN>
		      <TELL "ringing loudly, but the cotton protects your
ears">
		      <SET WHO <RT-WHO-SAYS?>>
		      <COND (<AND .WHO <F? ,HEARD-SWING?>>
			     <TELL ". " CTHE .WHO 			     
" claps his hands to his ears in an attempt to protect them">
			     <COND (<FIRST? .WHO>
				    <RT-MOVE-ALL .WHO ,RM-CLOCK-TOWER>
				    <TELL
", dropping everything he was carrying in the process">)>)>
		      <TELL ". The clapper swings up within reach." CR>
		      <IFSOUND <SOUNDS ,S-CLOCK ,S-START 6>>
		      <SETG HEARD-SWING? T>)
		     (T
		      <TELL "ringing unbearably loud. BONG!">
		      <IFSOUND <SOUNDS ,S-CLOCK>>
		      <COND (<AND <F? ,HEARD-SWING?>
				  <MC-ISNOT? ,TH-HANDS ,FL-LOCKED>>
			     <SETG HEARD-SWING? T>
			     <SET WHO <RT-WHO-SAYS?>>
			     <MC-MAKE ,TH-HANDS ,FL-LOCKED>
			     <RT-MOVE-ALL-BUT-WORN ,CH-PLAYER ,RM-CLOCK-TOWER>
			     <TELL " You ">
			     <COND (.WHO
				    <RT-MOVE-ALL .WHO ,RM-CLOCK-TOWER>
				    <TELL "and " D .WHO " ">)>
			     <TELL
"clap your hands to your ears in an attempt to protect them, dropping
everything you are carrying in the process.">)>
		      <CRLF>)>
	       <SETG TH-BELL-AUX1 <- .NUM 1>>)
	      (T
	       <SETG TH-BELL-AUX2 ,K-BELL-AWAY>
	       <TELL "away from you">
	       <COND (<ZERO? .NUM>
		      <TELL ", finishing the ringing of the hour." CR>
		      <RT-RELIEF>
		      <RT-ZERO-SECONDS>)
		     (T
		      <TELL "." CR>)>)>>

<ROUTINE RT-RELIEF ()
	<SETG HEARD-SWING? <>>
	<COND (<MC-IS? ,TH-HANDS ,FL-LOCKED>
	       <MC-UNMAKE ,TH-HANDS ,FL-LOCKED>
	       <TELL "You breath a sigh of relief as you take your
hands away from your ears." CR>)>>

<ROUTINE RT-ZERO-SECONDS ("AUX" SEC)
	<SET SEC <GETB ,GL-TIME ,K-SEC>>
	<COND (<NOT <ZERO? .SEC>>
	       <RT-CLOCK-INC-SET 0 0 <- 60 .SEC>>
	       <RT-CLOCK-INC>
	       <RT-COPY-TIME ,GL-TIME ,GL-TEMP-TIME>)>>

<ROUTINE RT-I-EXHALE ()
	<COND (<MC-IS? ,TH-BREATH ,FL-LOCKED>
	       <RT-ALARM-SET-REL ,RT-I-INHALE <RT-PARM-SET 0 1 0>>
	       <TELL CR "You can't hold your breath much longer..." CR>)>>

<ROUTINE RT-I-INHALE ()
      <COND (<MC-IS? ,TH-BREATH ,FL-LOCKED>
	     <TELL CR "Your lungs scream for air. You take a deep breath." CR>
	     <MC-UNMAKE ,TH-BREATH ,FL-LOCKED>
	     <SETG RUN-SMELL-ETHERIUM? T>
	     <RTRUE>)>>

<ROUTINE RT-I-TAKE-WATSONS-STUFF ()
	<COND (<MC-ISNOT? ,CH-AKBAR ,FL-ASLEEP>
	       <TELL CR "Akbar">
	       <COND (<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
		      <TELL " apologizes to you,">)>
	       <TELL
" removes everything from your hands, and then hits you over the head. The
last thing you see before losing consciousness is the look of defeat on
Holmes's face." CR CR

"You awake sometime later to find yourself bound hand and foot. Moriarty is
standing over you with a newspaper in his hand." CR CR

,K-FOUGHT-WELL-MSG CR CR

"Moriarty takes the Crown Jewels and departs, leaving you to ponder your
defeat and the inevitable demise of the British Empire." CR CR>
	       <RT-QSR>)>
	<RFALSE>>

<ROUTINE RT-I-OUT-OF-TIME ()
	<CRLF>
	<COND (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
	       <TELL "Outside you hear">)
	      (T
	       <TELL "You see">)>
	<TELL " the paper boy run through the streets shouting out,
\"Crown Jewels stolen... the end is near.\"" CR CR>
	<COND (<EQUAL? ,GL-PLACE-CUR ,RM-LAIR>
	       <TELL D ,CH-MORIARTY>
	       <COND (<MC-IS? ,CH-MORIARTY ,FL-ASLEEP>
		      <MC-UNMAKE ,CH-MORIARTY ,FL-ASLEEP>
		      <TELL " awakens from his stupor and">)>
	       <TELL " says, " ,K-FOUGHT-WELL-MSG CR CR>)>
	<RT-QSR>>

<ROUTINE RT-ETHERIUM-EFFECT (ASLEEP? "OPTIONAL" (OBJ <>) (TOP T) "AUX" (CNT 0))
  <COND (<MC-F? .OBJ>
	 <SET OBJ ,GL-PLACE-CUR>)>
  <REPEAT ()
    <COND (<MC-F? .OBJ>
	   <RETURN>)
	  (<AND <MC-IS? .OBJ ,FL-ALIVE>
		<OR <NOT <EQUAL? .OBJ ,CH-PLAYER>>
		    <MC-ISNOT? ,TH-BREATH ,FL-LOCKED>>>
	   <COND (<MC-T? .ASLEEP?>
		  <COND (<OR <NOT <EQUAL? .OBJ ,CH-HOLMES>>
			     <MC-ISNOT? ,TH-BREATH ,FL-LOCKED>>
			 <MC-MAKE .OBJ ,FL-ASLEEP>
			 <INC .CNT>
			 <COND (<EQUAL? ,GL-PUPPY .OBJ>
				<SETG GL-FORMER-PUPPY .OBJ>
				<SETG GL-PUPPY <>>)
			       ;(<EQUAL? .OBJ ,CH-TRAINED-PIGEON>
				<TELL
			" Unfortunately, the gas kills the poor pigeon.">
				<RT-KILL-PIGEON>)>)>)
		 (T
		  <MC-UNMAKE .OBJ ,FL-ASLEEP>
		  <INC .CNT>)>)
	  (<FIRST? .OBJ>
	   <SET CNT <+ .CNT
		       <RT-ETHERIUM-EFFECT .ASLEEP? <FIRST? .OBJ> <>>>>)>
    <COND (<MC-F? .TOP>
	   <SET OBJ <NEXT? .OBJ>>)
	  (T
	   <RETURN>)>>
  <RETURN .CNT>>

;<GLOBAL GL-PEOPLE:TABLE <ITABLE 25 0>> ; "People in the room"

<ROUTINE RT-I-WAKE-UP ("AUX" OBJ)
	<RT-ETHERIUM-EFFECT <> <LOC ,TH-ETHERIUM-GAS>>
	<REMOVE ,TH-ETHERIUM-GAS>>

<ROUTINE RT-SMELL-ETHERIUM? ()
	<COND
	 (<MC-HERE? <LOC ,TH-ETHERIUM-GAS>>
	  <COND (<MC-ISNOT? ,TH-BREATH ,FL-LOCKED>
		 <REMOVE ,TH-ETHERIUM-GAS>
		 <TELL CR "The etherium knocks you out." CR CR>
		 <MC-MAKE ,CH-PLAYER ,FL-ASLEEP>
		 <COND (<MC-HERE? ,RM-LAIR>
			<RT-ALARM-CLR ,RT-I-WAKE-UP>
			<RT-DOES-MORIARTY-WIN>)
		       (T
			<COND (<RT-ALARM-SET? ,RT-I-WAKE-UP>
			       <COPYT ,GL-TIME-PARM ,GL-TIME ,K-A-TWDTH>
			       <RT-ALARM-CHK <>>
			       <SETG GL-CLOCK-WAIT T>
			       <TELL ,K-WAKE-UP-MSG CR>)
			      (T
			       <RT-CLOCK-JMP 6 0 0>
			       <TELL ,K-WAKE-UP-MSG CR>)>
			<COND (<AND <MC-T? ,GL-FORMER-PUPPY>
				    <IN? ,GL-FORMER-PUPPY ,GL-PLACE-CUR>
				    <F? ,GL-PUPPY>>
			       <FCLEAR ,GL-FORMER-PUPPY ,FL-ASLEEP>
			       <SETG GL-PUPPY ,GL-FORMER-PUPPY>
			       <SETG GL-FORMER-PUPPY <>>)>)>)
		(<AND ,GL-PUPPY
		      <N==? ,GL-PUPPY ,CH-HOLMES>
		      <RT-ETHERIUM-EFFECT T ,GL-PUPPY>>
		 <TELL CTHE ,GL-FORMER-PUPPY " passes out." CR>)>
	       <RTRUE>)>
	<RFALSE>>

<ROUTINE RT-FIND-FLAME ("OPTIONAL" (OBJ <>) (TOP T) "AUX" FST)
	<COND (<MC-F? .OBJ>
	       <SET OBJ ,GL-PLACE-CUR>)>
	<REPEAT ()
		<COND (<MC-F? .OBJ>
		       <RETURN>)
		      (<AND <MC-IS? .OBJ ,FL-BURNABLE>
			    <MC-IS? .OBJ ,FL-LIGHTED>>
		       <RTRUE>)>
		<SET FST <FIRST? .OBJ>>
		<COND (<AND <MC-T? .FST>
			    <RT-FIND-FLAME .FST <>>>
		       <RTRUE>)>
		<COND (<MC-F? .TOP>
		       <SET OBJ <NEXT? .OBJ>>)
		      (T
		       <RETURN>)>>
	<RFALSE>>

<ROUTINE RT-DOES-MORIARTY-WIN ()
	<COND (<AND <MC-IS? ,CH-MORIARTY ,FL-LOCKED>
		    <MC-IS? ,CH-AKBAR ,FL-LOCKED>>
	       <RT-CLOCK-SET 8 30 0 20>
	       <RT-ALARM-CLR ,RT-I-OUT-OF-TIME>
	       <RT-ALARM-CHK <>>
	       <SETG GL-CLOCK-WAIT T>
	       <RT-ALARM-SET-ABS ,RT-I-OUT-OF-TIME <RT-PARM-SET 9 0 0 20>>
	       <TELL
"You awaken slowly and stumble to your feet. Moriarty and Akbar have already
recovered, and they are struggling fiercely to free themselves. It seems as
if you were unconscious for quite a while, but it's hard to tell. You
probably don't have a lot of time." CR>
	       <MC-UNMAKE ,CH-PLAYER ,FL-ASLEEP>
	       <MC-UNMAKE ,CH-HOLMES ,FL-ASLEEP>
	       <MC-UNMAKE ,CH-AKBAR ,FL-ASLEEP>
	       <MC-UNMAKE ,CH-MORIARTY ,FL-ASLEEP>
	       <RTRUE>)
	      (T
	       <TELL
"Unfortunately, Moriarty and Akbar recovered before you did. You find
yourself bound securely to Holmes." CR CR

"Moriarty looks at you and says, " ,K-FOUGHT-WELL-MSG CR CR>
	       <RT-QSR>)>>

<ROUTINE RT-PROCESS-PASSWORD ()
	<COND (<MC-HERE? ,RM-BAR-OF-GOLD>
	       <TELL CTHE ,CH-DENKEEPER>
	       <COND (<AND <IN? ,TH-CARNATION ,TH-LAPEL>
		           <MC-ISNOT? ,CH-AKBAR ,FL-SEEN>
		           <EQUAL? <RT-CLOCK-CMP 2 0 0 20> -1 0>>
		      <MC-MAKE ,CH-AKBAR ,FL-SEEN>
		      <MOVE ,CH-AKBAR ,RM-BAR-OF-GOLD>
		      <TELL
" disappears into a back room and reappears moments later,
accompanied by a tall, silent man who has dark skin and wears a white
turban." CR CR "The Indian glances at your ">
		      <COND (<MC-ISNOT? ,TH-WATSONS-HAT ,FL-WORN>
		      <TELL "uncovered ">)>
		      <TELL "head and then intones, \"I am Akbar">
		      <COND (<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
			     <TELL ", honourable sir">)>
		      <TELL ". What is it that you wish?\"" CR>)
		     (T
		      <TELL
" says, \"Not now, mate. Can't you see I'm busy?\"" CR>)>)
	      (<MC-HERE? ,RM-BYWARD-TOWER>
		      <TELL
CTHE ,CH-TOWER-GUARD " pauses and looks at you strangely. Then he
says, \"An interesting guess. But wrong.\"" CR>)
	      (T
	       <TELL "Thatsa no swordfish. Thatsa duck." CR>)>
	<RTRUE>>

<ROUTINE V-SWORDFISH ()
	<DEBUGGING? <RT-DEBUG-VERB "V-SWORDFISH">>
	<RT-PROCESS-PASSWORD>>

<ROUTINE RT-ROPE-MSG ()
	<TELL "As">
	<RT-YOU-MSG "reach" "reaches">
	<TELL "for " THE ,TH-ROPE ", Akbar">
	<COND (<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
	       <TELL " says, \"Pardon me, honourable sir,\" and">)>
	<TELL
" hits you over the head." CR CR

"When you regain consciousness, you find that your hands and feet are bound.
Outside you hear the paper boy run through the streets shouting out
\"Crown Jewels stolen! Prime Minister resigns in disgrace!\"" CR>
	<RT-QSR>>

<ROUTINE RT-INSCRIPTION-APPEARS-MSG ()
 	<TELL "After a few moments, the tomb's inscription comes through
onto the piece of paper." CR>>

<ROUTINE RT-PROCESS-TOMB (TOMB-NUMBER)
	<COND (<MC-VERB? READ>
	       <RT-READ-INSCRIPTION .TOMB-NUMBER>)
	      (<MC-VERB? TRANSLATE>
	       <TELL
"Unfortunately, what little Latin you remember from your school days is
limited to medical matters." CR>)
	      (<MC-VERB? RUB-WITH>
	       <TELL
"Rubbing the paper with the crayon would probably yield better results." CR>)
	      (<MC-VERB? LOOK-INSIDE SEARCH>
	       <RT-CYOU-MSG>
	       <RT-WOULD-HAVE-TO-MSG "open" ,TH-IT>
	       <TELL " first." CR>
	       <RTRUE>)
	      (<MC-VERB? OPEN>
	       <TELL "Getting just a little bit morbid, aren't we?" CR>)
	      (<MC-VERB? TOUCH>
	       <COND (<EQUAL? .TOMB-NUMBER 1 2 3>
		      <TELL "It feels a little sticky." CR>)
		     (T
		      <RT-CYOU-MSG "do" "does">
		      <TELL
"not feel anything " <RT-PICK-NEXT ,GL-BORING-TXT> "." CR>)>)
	      (<MC-VERB? SHOOT>
	       <RT-SHOOT-DEAD-MSG>)>>

<ROUTINE RT-READ-INSCRIPTION (NUM)
	<TELL "The inscription">
	<COND (<EQUAL? 2 .NUM>
	       <TELL " reads, \"ISAACVS NEWTON  Eques Auratus">)
	      (<EQUAL? 1 .NUM>
	       <TELL " reads, \"REGNO CONSORTES & VRNA HIC OBDOR
MIMVS ELIZABETHA ET MARIA SORORES IN SPE RESVRRECTIONIS">)
	      (<EQUAL? 7 .NUM>
	       <TELL " is a long one, but in the middle of it you see the name
\"GALFRIDVS CHAVCER">)
	      (<EQUAL? 9 .NUM>
	       <TELL "s are written in Latin, but you can make out the names
\"Edward V\" and \"Richard, Duke of York">)
	      (T
	       <TELL " is written in Latin, but you can make out the name \"">
	       <COND (<EQUAL? 3 .NUM>
		      <TELL "Henry V">)
		     (<EQUAL? 4 .NUM>
		      <TELL "Edward the Confessor">)
		     (<EQUAL? 5 .NUM>
		      <TELL "Alexander Pope">)
		     (<EQUAL? 6 .NUM>
		      <TELL "Charles Dickens">)
		     (<EQUAL? 8 .NUM>
		      <TELL "Anne of Cleves">)
		     (<EQUAL? 10 .NUM>
		      <TELL "Mary, Queen of Scots">)
		     (<EQUAL? 11 .NUM>
		      <TELL "Henry VII">)
		     (<EQUAL? 12 .NUM>
		      <TELL "Pitt">)
		     (<EQUAL? 13 .NUM>
		      <TELL "Francis Vere">)>)>
	<TELL ".\"" CR>
	<RTRUE>>

<ROUTINE RT-READ-PAPER (PAPER-NAME WRITING PHEAT)
	<COND (<MC-F? .WRITING>
	       <TELL "The paper appears to be blank." CR>
	       <RTRUE>)
	      (T
	       <COND (<MC-F? <GETP .PAPER-NAME ,P?FLIPPED>>
		      <RT-READ-INSCRIPTION .WRITING>
		      <RTRUE>)
		     (T
		      <COND (<ZERO? .PHEAT>
			     <TELL "This side appears to be blank." CR>)
			    (<EQUAL? 1 .PHEAT>
			     <TELL "You see a faint discolouration." CR>)
			    (<EQUAL? 2 .PHEAT>
			     <COND (<EQUAL? 1 .WRITING>
				    <TELL
INDENT "Hickory Dickory Dock." CR
INDENT "Your enemy is the clock." CR
INDENT "When it strikes nine," CR
INDENT "The victory's mine." CR
INDENT "Hickory Dickory Dock." CR CR

INDENT ,K-ASTERISK-MSG CR CR

INDENT "Here comes a candle to light you to bed." CR
INDENT "Here comes a chopper" WRAP "to chop off your head." CR>
				    <MC-MAKE .PAPER-NAME ,FL-LOCKED>
				    <SETG TH-PACKET-OF-PAPER-AUX1
					  <BOR ,TH-PACKET-OF-PAPER-AUX1 1>>)
				   (<EQUAL? 2 .WRITING>
				    <TELL
INDENT "London Bridge is falling down." CR
INDENT "All that's under it will drown." CR
INDENT "With it falls Victoria's reign." CR
INDENT "Britannia ne'er to rule again." CR CR

INDENT ,K-ASTERISK-MSG CR CR

INDENT "When a number you require," CR
INDENT "And you're banking all thereon." CR
INDENT "Subtract the conquest from the fire," CR
INDENT "Half a league, half a league." WRAP "Half a league on." CR>
				    <MC-MAKE .PAPER-NAME ,FL-LOCKED>
				    <SETG TH-PACKET-OF-PAPER-AUX1
					  <BOR ,TH-PACKET-OF-PAPER-AUX1 2>>)
				   (<EQUAL? 3 .WRITING>
				    <TELL
INDENT ,K-TWINKLE-MSG CR
INDENT "Fought at sea, midst masts and spars." CR
INDENT "Now above the world so high," CR
INDENT "Looking down with watchful eye." CR
INDENT ,K-TWINKLE-MSG CR
INDENT "England's hero, prince of tars." CR CR

INDENT ,K-ASTERISK-MSG CR CR

INDENT "Pussycat, pussycat," WRAP "where have you been?" CR
INDENT "I've been to the Tower" WRAP "to look at the Queen." CR
INDENT "Pussycat, pussycat," WRAP "what did you there?" CR
INDENT "I left something for you." WRAP "Go back, if you dare." CR>
				    <MC-MAKE .PAPER-NAME ,FL-LOCKED>
				    <SETG TH-PACKET-OF-PAPER-AUX1
					  <BOR ,TH-PACKET-OF-PAPER-AUX1 4>>)>
			     <COND (<MC-ISNOT? ,TH-PACKET-OF-PAPER ,FL-ASLEEP>
				    <MC-MAKE ,TH-PACKET-OF-PAPER ,FL-ASLEEP>
				    <RT-UPDATE-SCORE 5>)
				   (<AND <EQUAL? ,TH-PACKET-OF-PAPER-AUX1 7>
					 <EQUAL? <RT-WHO-SAYS?> ,CH-HOLMES>>
				    <SETG TH-PACKET-OF-PAPER-AUX1 15>
				    <TELL CR
"Holmes leans forward with an excited expression upon his hawk-like features
and says, \"There is only one man in all London clever enough to plan this,
Watson - Professor Moriarty. See how boldly he hides clues in public places,
knowing all the while that they will remain hidden from the casual eye.
Onward, Doctor. Let us solve these riddles and see what the good Professor
has in mind for us.\"" CR>)>)>
		      <RTRUE>)>)>>

<ROUTINE RT-PROCESS-PAPER (PAPER-NAME "AUX" WRITING PHEAT)
	<SET WRITING <GETP .PAPER-NAME ,P?INSCRIPTION>> 
	<SET PHEAT <GETP .PAPER-NAME ,P?HEATED>> 
	<COND (<MC-VERB? TAKE>
	       <COND (<AND <EQUAL? <LOC .PAPER-NAME> ,TH-ELIZABETH-TOMB ,TH-NEWTON-TOMB ,TH-HENRY-V-TOMB>
			   <EQUAL? .WRITING 1 2 3>>
		      <TELL "You pick at the paper for a few seconds, but it
seems to be stuck to the inscription. After a few seconds you manage to peel
it off." CR>
		      <MOVE .PAPER-NAME ,CH-PLAYER>
		      <RTRUE>)
		     (T
		      <RFALSE>)>)
	      (<OR <AND <MC-VERB? RAISE>
			<MC-PRSO? .PAPER-NAME>
			<RT-VISIBLE? ,LG-SHAFT-OF-LIGHT>>
		   <AND <MC-VERB? PUT>
			<MC-PRSO? .PAPER-NAME>
			<MC-PRSI? ,LG-SHAFT-OF-LIGHT>>
		   <AND <MC-VERB? TOUCH-TO>
			<OR <MC-PRSI? ,LG-SHAFT-OF-LIGHT>
			    <AND <MC-PRSI? ,TH-LAMP>
				 <MC-IS? ,TH-LAMP ,FL-LIGHTED>>>>>
	       <COND (<EQUAL? .PHEAT 1>
		      <RT-CYOU-MSG "see" "sees">
		      <TELL "a discolouration">
		      <COND (<ZERO? <GETP .PAPER-NAME ,P?FLIPPED>>
			     <TELL " which appears to be on the back">)>)
		     (<EQUAL? .PHEAT 2>
		      <TELL "There seems to be some writing">
		      <COND (<ZERO? <GETP .PAPER-NAME ,P?FLIPPED>>
			     <TELL " on the back">)>)
		     (<EQUAL? .WRITING 1 2 3>
		      <RT-CYOU-MSG "see" "sees">
		      <TELL "a faint discolouration">)
		     (T
		      <RT-CYOU-MSG "see" "sees">
		      <TELL "a watermark">)>
	       <TELL "." CR>
	       <RTRUE>)
	      (<MC-VERB? HEAT HOLD-OVER LIGHT-WITH BURN-WITH TOUCH-TO>
	       <COND (<NOT <IN? .PAPER-NAME ,GL-WINNER>>
		      <RT-CYOU-MSG "are" "is">
		      <TELL "not holding " THE .PAPER-NAME "." CR>
		      <RTRUE>)
		     (<AND <NOT <MC-VERB? LIGHT-WITH BURN-WITH TOUCH-TO>>
			   <MC-PRSI? ,TH-BANK-OF-CANDLES>>
		      <TELL "The paper is heated by the bank of candles">
		      <COND (<AND <==? <GETP .PAPER-NAME ,P?HEATED> 2>
				  <EQUAL? .WRITING 1 2 3>>
			     <TELL ", but nothing more appears">)
			    (<EQUAL? .WRITING 1 2 3>
			     <PUTP .PAPER-NAME ,P?HEATED 2>
			     <TELL ". Something seems to be gradually appearing on ">
			     <COND (<ZERO? <GETP .PAPER-NAME ,P?FLIPPED>>
				    <TELL "the back of ">)>
			     <TELL THE .PAPER-NAME>)>
		      <TELL "." CR>
		      <RTRUE>)
		     (<AND <NOT <MC-VERB? LIGHT-WITH BURN-WITH TOUCH-TO>>
			   <MC-PRSI? ,TH-PIPE ,TH-TOBACCO ,TH-MATCH>>
		      <COND (<OR <AND <MC-PRSI? ,TH-PIPE ,TH-TOBACCO>
				      <MC-IS? ,TH-TOBACCO ,FL-LIGHTED>>
				 <AND <MC-PRSI? ,TH-MATCH>
				      <MC-IS? ,TH-MATCH ,FL-LIGHTED>>>
			     <TELL "The paper is warmed by " THEI "." CR>
			     <COND (<AND <EQUAL? .WRITING 1 2 3>
					 <ZERO? .PHEAT>>
				    <PUTP .PAPER-NAME ,P?HEATED 1>)>)
			    (T
			     <TELL CTHEI>
			     <RT-ISNT-ARENT-MSG ,GL-PRSI>
			     <TELL "lit." CR>)>
		      <RTRUE>)
		     (<OR <AND <MC-IS? ,GL-PRSI ,FL-BURNABLE>
			       <MC-IS? ,GL-PRSI ,FL-LIGHTED>>
			  <AND <MC-PRSI? ,TH-PIPE>
			       <MC-IS? ,TH-TOBACCO ,FL-LIGHTED>>
			  <AND <MC-PRSI? ,PSEUDO-OBJECT>
			       <==? <GETP ,GL-PRSI ,P?ACTION>
				    ,RT-AC-TH-FIREPLACE>>>
		      <TELL "The paper catches fire quickly.">
		      <COND (<AND <EQUAL? .WRITING 1 2 3>
				  <MC-ISNOT? .PAPER-NAME ,FL-LOCKED>>
			     <TELL " As it burns, you catch a glimpse of
writing you could swear hadn't been there before.">)>
		      <TELL CR CR CTHE .PAPER-NAME " vanishes in a poof of smoke." CR>
		      <REMOVE .PAPER-NAME>
		      <RTRUE>)>
	       <RFALSE>)
	      (<MC-VERB? READ EXAMINE>
	       <COND (<IN? .PAPER-NAME ,TH-PACKET-OF-PAPER>
		      <RT-CYOU-MSG>
		      <TELL "cannot do that while it is in the pacquet of paper." CR>
		      <RTRUE>)>
	       <COND (<==? <ZGET ,GL-P-OFW 0> ,W?BACK>
		      <RT-PERFORM ,V?FLIP ,GL-PRSO>
		      <RTRUE>)>
	       <RT-READ-PAPER .PAPER-NAME .WRITING .PHEAT>
	       <RTRUE>)
	      (<MC-VERB? FLIP>
	       <COND (<NOT <IN? .PAPER-NAME ,GL-WINNER>>
		      <RT-CYOU-MSG "are" "is">
		      <TELL "not holding " THE .PAPER-NAME "." CR>
		      <RTRUE>)
		     (<MC-F? .WRITING>
		      <TELL CTHE .PAPER-NAME " seems to be blank on both sides." CR>)
		     (T
		      <RT-CYOU-MSG "turn" "turns">
		      <TELL THE .PAPER-NAME " over." CR CR>
		      <PUTP .PAPER-NAME ,P?FLIPPED <- 1 <GETP .PAPER-NAME ,P?FLIPPED>>>
		      <RT-READ-PAPER .PAPER-NAME .WRITING .PHEAT>)>
	       <RTRUE>)
	      (<MC-VERB? RUB-WITH>
	       <COND (<NOT <MC-PRSO? .PAPER-NAME>>
		      <RFALSE>)
		     (<NOT <MC-PRSI? ,TH-CRAYON>>
		      <TELL "Rubbing the paper with " THEI " doesn't do anything." CR>
		      <RTRUE>)
		     (<MC-T? .WRITING>
		      <TELL "You don't really want to do that. You would mess up your inscription." CR>
               <RTRUE>)
		     (<FIRST? .PAPER-NAME>
		      <RT-CYOU-MSG>
		      <TELL
"cannot do a rubbing while there is something on " THE .PAPER-NAME "." CR>
		      <RTRUE>)
		     (<IN? .PAPER-NAME ,TH-ELIZABETH-TOMB>
		      <RT-INSCRIPTION-APPEARS-MSG>
		      <PUTP .PAPER-NAME ,P?INSCRIPTION 1>
		      <RTRUE>)
		     (<IN? .PAPER-NAME ,TH-NEWTON-TOMB>
		      <RT-INSCRIPTION-APPEARS-MSG>
		      <PUTP .PAPER-NAME ,P?INSCRIPTION 2>
		      <RTRUE>)
		     (<IN? .PAPER-NAME ,TH-HENRY-V-TOMB>
		      <RT-INSCRIPTION-APPEARS-MSG>
		      <PUTP .PAPER-NAME ,P?INSCRIPTION 3>
		      <RTRUE>)
		     (<IN? .PAPER-NAME ,TH-EDWARD-TOMB>
		      <RT-INSCRIPTION-APPEARS-MSG>
		      <PUTP .PAPER-NAME ,P?INSCRIPTION 4>
		      <RTRUE>)
		     (<IN? .PAPER-NAME ,TH-POPE-TOMB>
		      <RT-INSCRIPTION-APPEARS-MSG>
		      <PUTP .PAPER-NAME ,P?INSCRIPTION 5>
		      <RTRUE>)
		     (<IN? .PAPER-NAME ,TH-DICKENS-TOMB>
		      <RT-INSCRIPTION-APPEARS-MSG>
		      <PUTP .PAPER-NAME ,P?INSCRIPTION 6>
		      <RTRUE>)
		     (<IN? .PAPER-NAME ,TH-CHAUCER-TOMB>
		      <RT-INSCRIPTION-APPEARS-MSG>
		      <PUTP .PAPER-NAME ,P?INSCRIPTION 7>
		      <RTRUE>)
		     (<IN? .PAPER-NAME ,TH-ANNE-OF-CLEVES-TOMB>
		      <RT-INSCRIPTION-APPEARS-MSG>
		      <PUTP .PAPER-NAME ,P?INSCRIPTION 8>
		      <RTRUE>)
		     (<IN? .PAPER-NAME ,TH-LITTLE-PRINCES-TOMB>
		      <RT-INSCRIPTION-APPEARS-MSG>
		      <PUTP .PAPER-NAME ,P?INSCRIPTION 9>
		      <RTRUE>)
		     (<IN? .PAPER-NAME ,TH-MARY-QUEEN-OF-SCOTS-TOMB>
		      <RT-INSCRIPTION-APPEARS-MSG>
		      <PUTP .PAPER-NAME ,P?INSCRIPTION 10>
		      <RTRUE>)
		     (<IN? .PAPER-NAME ,TH-HENRY-VII-TOMB>
		      <RT-INSCRIPTION-APPEARS-MSG>
		      <PUTP .PAPER-NAME ,P?INSCRIPTION 11>
		      <RTRUE>)
		     (<IN? .PAPER-NAME ,TH-PITT-TOMB>
		      <RT-INSCRIPTION-APPEARS-MSG>
		      <PUTP .PAPER-NAME ,P?INSCRIPTION 12>
		      <RTRUE>)
		     (<IN? .PAPER-NAME ,TH-VERE-TOMB>
		      <RT-INSCRIPTION-APPEARS-MSG>
		      <PUTP .PAPER-NAME ,P?INSCRIPTION 13>
		      <RTRUE>)
		     (T
		      <TELL "Rubbing " THE .PAPER-NAME " while it is">
		      <COND (<EQUAL? <LOC <LOC .PAPER-NAME>> ,ROOMS>
			     <TELL " on ">
			     <COND (<MC-IS? <LOC .PAPER-NAME> ,FL-INDOORS>
				    <TELL-THE-FLOOR>)
				   (T
				    <TELL-THE-GROUND>)>)
			     (T
			      <RT-IN-ON-MSG <LOC .PAPER-NAME>>
			      <TELL THE <LOC .PAPER-NAME>>)>
			    <TELL " would">
			    <RT-WASTE-OF-TIME-MSG>
			    <RTRUE>)>)
	       (<AND <MC-VERB? LOOK-THRU>
		     <MC-PRSI? ,TH-MAGNIFYING-GLASS>>
		<TELL "All">
		<RT-YOU-MSG "see" "sees">
		<TELL "is a faint watermark." CR>
		<RTRUE>)
	       (<AND <MC-VERB? TAKE>
		     <FIRST? .PAPER-NAME>>
		<RT-CYOU-MSG>
		<RT-WOULD-HAVE-TO-MSG "take">
		<TELL THE <FIRST? .PAPER-NAME> " off of " THE .PAPER-NAME
" first." CR>
		<RTRUE>)>
	<RFALSE>>

<ROUTINE RT-PAPER-WARMING (PAPER-NAME)
	<COND (<AND <IN? .PAPER-NAME ,CH-PLAYER>
		    <EQUAL? <GETP .PAPER-NAME ,P?INSCRIPTION> 1 2 3>
		    <ZERO? <GETP .PAPER-NAME ,P?HEATED>>>
	       <PUTP .PAPER-NAME ,P?HEATED 1>)>
	<RFALSE>>

<ROUTINE RT-I-FLASH-WESTMINSTER-LIGHTS ()
	<COND (,PLAYER-IN-ABBEY
	       <TELL CR
"The lights flicker off and on, and you remember that the Abbey
closes at six o'clock." CR>)>>

<ROUTINE RT-I-WESTMINSTER-LIGHTS-ON ()
	<MC-MAKE ,RM-NAVE ,FL-LIGHTED>
	<MC-MAKE ,RM-SOUTH-AISLE ,FL-LIGHTED>
	<MC-MAKE ,RM-JERICHO-PARLOUR ,FL-LIGHTED>
	<MC-MAKE ,RM-JERUSALEM-CHAMBER ,FL-LIGHTED>
	<MC-MAKE ,RM-NORTH-CLOISTER ,FL-LIGHTED>
	<MC-MAKE ,RM-NORTH-TRANSEPT ,FL-LIGHTED>
	<MC-MAKE ,RM-SOUTH-TRANSEPT ,FL-LIGHTED>
	<MC-MAKE ,RM-EVANGELIST-CHAPEL ,FL-LIGHTED>
	<MC-MAKE ,RM-NORTH-AMBULATORY ,FL-LIGHTED>
	<MC-MAKE ,RM-SANCTUARY ,FL-LIGHTED>
	<MC-MAKE ,RM-SOUTH-AMBULATORY ,FL-LIGHTED>
	<MC-MAKE ,RM-POETS-CORNER ,FL-LIGHTED>
	<MC-MAKE ,RM-NORTH-CHAPEL-AISLE ,FL-LIGHTED>
	<MC-MAKE ,RM-HENRY-VII-CHAPEL ,FL-LIGHTED>
	<MC-MAKE ,RM-SOUTH-CHAPEL-AISLE ,FL-LIGHTED>
	<MC-MAKE ,RM-CONFESSOR-CHAPEL ,FL-LIGHTED>
	<MC-MAKE ,RM-INNOCENTS-CORNER ,FL-LIGHTED>
	<COND (,PLAYER-IN-ABBEY
	       <TELL CR "The lights come on." CR>)>>

<ROUTINE RT-I-WESTMINSTER-LIGHTS-OFF ()
	<MC-UNMAKE ,RM-NAVE ,FL-LIGHTED>
	<MC-UNMAKE ,RM-SOUTH-AISLE ,FL-LIGHTED>
	<MC-UNMAKE ,RM-JERICHO-PARLOUR ,FL-LIGHTED>
	<MC-UNMAKE ,RM-JERUSALEM-CHAMBER ,FL-LIGHTED>
	<MC-UNMAKE ,RM-NORTH-CLOISTER ,FL-LIGHTED>
	<MC-UNMAKE ,RM-NORTH-TRANSEPT ,FL-LIGHTED>
	<MC-UNMAKE ,RM-SOUTH-TRANSEPT ,FL-LIGHTED>
	<MC-UNMAKE ,RM-EVANGELIST-CHAPEL ,FL-LIGHTED>
	<MC-UNMAKE ,RM-NORTH-AMBULATORY ,FL-LIGHTED>
	<MC-UNMAKE ,RM-SANCTUARY ,FL-LIGHTED>
	<MC-UNMAKE ,RM-SOUTH-AMBULATORY ,FL-LIGHTED>
	<MC-UNMAKE ,RM-POETS-CORNER ,FL-LIGHTED>
	<MC-UNMAKE ,RM-NORTH-CHAPEL-AISLE ,FL-LIGHTED>
	<MC-UNMAKE ,RM-HENRY-VII-CHAPEL ,FL-LIGHTED>
	<MC-UNMAKE ,RM-SOUTH-CHAPEL-AISLE ,FL-LIGHTED>
	<MC-UNMAKE ,RM-CONFESSOR-CHAPEL ,FL-LIGHTED>
	<MC-UNMAKE ,RM-INNOCENTS-CORNER ,FL-LIGHTED>
	<COND (,PLAYER-IN-ABBEY
	       <TELL CR "The lights go out." CR>)>>

<ROUTINE RT-I-LOCKED-IN-END-GAME ()
	<COND (,PLAYER-IN-ABBEY
	       <TELL
CR "In the distance you hear the huge door of the Abbey clang
shut. You run to the Nave, only to discover that you have been locked
in. After spending a spooky night in the Abbey, you emerge in the morning
to discover that the theft of the Crown Jewels has been discovered." CR CR>
	       <RT-QSR>)>>

<ROUTINE RT-I-OPEN-WESTMINSTER-DOOR ()
	<RT-ALARM-SET-REL ,RT-I-CLOSE-WESTMINSTER-DOOR <RT-PARM-SET 11 0 0>>
	<MC-MAKE ,LG-WESTMINSTER-DOOR ,FL-OPENED>
	<COND (<MC-HERE? ,RM-BROAD-SANCTUARY>
	       <TELL
CR "A verger appears, unlocks the huge door, and pushes it open." CR>)
	      (<MC-HERE? ,RM-NAVE>
	       <TELL
CR "Suddenly you hear the west door opening. The sunlight streaming in the
door blinds you after your night-long vigil. A verger enters, gives you a
strange look, and disappears into the South Aisle." CR>)>>

<ROUTINE RT-I-CLOSE-WESTMINSTER-DOOR ()
	<RT-ALARM-SET-REL ,RT-I-OPEN-WESTMINSTER-DOOR <RT-PARM-SET 13 0 0>>
	<MC-UNMAKE ,LG-WESTMINSTER-DOOR ,FL-OPENED>
	<COND (<MC-HERE? ,RM-BROAD-SANCTUARY>
	       <TELL
CR "The verger says goodnight and closes the door." CR>)
	      (<MC-HERE? ,RM-NAVE>
	       ;<COND (<MC-IS? ,CH-PLAYER ,FL-ASLEEP>
		      <RT-HOSPITAL-MSG "verger">
		      <RT-QSR>)>
	       <SETG PLAYER-IN-ABBEY <>>
	       <TELL
CR "A verger comes up to you and coughs deferentially. \"I'm sorry sir,
but it's six o'clock and I have to close up now.\" He escorts you to
the door and closes it behind you as you exit." CR CR>
	       <RT-GOTO ,RM-BROAD-SANCTUARY>)>>

<ROUTINE RT-CF-TH-BOAT ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-BOAT" .CONTEXT>>
	<COND (<AND <MC-VERB? WALK>
		    <EQUAL? ,GL-P-WALK-DIR ,P?OUT>>
	       <RT-PERFORM ,V?EXIT ,TH-BOAT>)
	      (<AND <MC-VERB? WALK>
		    <EQUAL? ,GL-P-WALK-DIR ,P?NORTH>
		    <EQUAL? ,GL-PLACE-CUR ,RM-THE-EMBANKMENT ,RM-OUTSIDE-TRAITORS-GATE>>
	       <TELL ,K-GET-OUT-FIRST-MSG CR>)
	      (<AND <MC-VERB? ENTER>
		    <NOT <MC-PRSO? ,TH-BOAT>>>
	       <TELL ,K-GET-OUT-FIRST-MSG CR>)>>

<ROUTINE RT-PROCESS-BOAT-ON-THAMES ("AUX" UP? WRD)
  <COND (<AND <IN? ,TH-ANCHOR ,TH-BOAT>
	      <NOT <RT-ALARM-SET? ,RT-I-MOVE-DOWNSTREAM>>>
	 <RT-ALARM-SET-REL ,RT-I-MOVE-DOWNSTREAM <RT-PARM-SET 0 0 0>>)>
  <COND (<OR <AND <MC-VERB? EXIT SWIM> <MC-PRSO? ,ROOMS ,TH-BOAT>>
	     <AND <MC-VERB? LEAP CLIMB-DOWN ENTER> <MC-PRSO? ,LG-WATER>>>
	 <RT-CYOU-MSG "jump" "jumps">
	 <TELL
"out of the boat, and then suddenly remember that you can't
swim. Unable to climb back in, you cling to the boat for hours, until
you are rescued by a Scotland Yard launch. Naturally, Lestrade is
aboard, and as he bundles you off to the hospital to recover from the
dread disease you caught while floating in the river, he tells you that
he - personally - will take on the case." CR CR

"Somehow this doesn't make you feel any better." CR CR>
	 <RT-QSR>)
	(<MC-VERB? ROW PADDLE PADDLE-WITH>
	 <COND (<OR <AND <MC-PRSO? <> ,ROOMS ,TH-BOAT>
			 <MC-PRSI? <>>>
		    <AND <MC-VERB? PADDLE-WITH>
			 <MC-PRSI? <>>>>
		<RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>
		<TELL "[Please specify a direction to " VW ".]" CR>
		<RTRUE>)
	       (<OR <MC-PRSO? ,LG-UP-DOWN-STREAM>
		    <AND <MC-PRSO? ,TH-INTDIR>
			 <EQUAL? ,GL-P-DIRECTION
				 ,P?WEST ,P?EAST>>
		    <AND <MC-PRSO? ,TH-BOAT>
			 <MC-PRSI? ,TH-INTDIR>>>
		<SET UP? <OR <AND <MC-PRSO? ,LG-UP-DOWN-STREAM>
				  <==? <GETP ,GL-PRSO ,P?OBJ-NOUN>
				       ,W?UPSTREAM>>
			     <EQUAL? ,GL-P-DIRECTION ,P?WEST>>>
		<RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>
		<COND (<NOT <IN? ,TH-ANCHOR ,TH-BOAT>>
		       <RT-CYOU-MSG>
		       <TELL "can " VW
			     " like blue blazes, but the anchor is restraining the boat."
			     CR>)
		      (<AND <MC-VERB? ROW>
			    <NOT <IN? ,TH-OAR-2
				      ,TH-OAR-LOCK>>>
		       <COND (<IN? ,TH-OAR-1 ,TH-BOAT>
			      <RT-CYOU-MSG "pull" "pulls">
			      <TELL
			       "hard on the oar. The boat spins round and round. Wheeeee!" CR>)
			     (T
			      <RT-CYOU-MSG "do" "does">
			      <TELL "not have any oars." CR>)>)
		      (<AND <MC-VERB? PADDLE-WITH>
			    <NOT <MC-PRSI? ,TH-PADDLE>>>
		       <COND (<MC-PRSI? ,TH-VIOLIN>
			      <RFALSE>)
			     (T
			      <RT-CYOU-MSG>
			      <TELL "can't paddle with " THEI "."
				    CR>)>)
		      (<AND <MC-VERB? PADDLE PADDLE-WITH>
			    <NOT <IN? ,TH-PADDLE ,GL-WINNER>>>
		       <RT-CYOU-MSG "do" "does">
		       <TELL "not have " A ,TH-PADDLE "." CR>)
		      (<MC-T? .UP?>
		       <RT-MOVE-UPSTREAM>)
		      (T
		       <RT-I-MOVE-DOWNSTREAM>)>
		<RTRUE>)
	       (<AND <OR <MC-PRSO? ,TH-INTDIR>
			 <MC-PRSI? ,TH-INTDIR>>
		     <EQUAL? ,GL-P-DIRECTION ,P?NORTH>>
		<RT-LAND-BOAT>
		<RTRUE>)
	       (<OR <MC-PRSO? ,TH-INTDIR>
		    <MC-PRSI? ,TH-INTDIR>>
		<RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>
		<TELL
		 "There doesn't seem to be anything in that direction."
		 CR>
		<RTRUE>)
	       (T
		<RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>
		<TELL
		 "I don't recognize the direction you are asking me to "
		 VW "." CR>
		<RTRUE>)>)
	(<MC-VERB? STAND STAND-ON>
	 <TELL "It isn't safe to stand in a boat." CR>
	 <RTRUE>)
	(<MC-VERB? SIT>
	 <TELL "You're already seated." CR>
	 <RTRUE>)
	(<MC-VERB? LEAP>
	 <TELL "It isn't safe to jump around in a boat." CR>
	 <RTRUE>)
	(<AND <EQUAL? ,TH-FLOOR-ETC ,GL-PRSO ,GL-PRSI>
	      <OR <RT-IDENTIFY-FLOOR? ,W?FLOOR>
		  <RT-IDENTIFY-FLOOR? ,W?GROUND>>>
	 <TELL "There is no " D ,TH-FLOOR-ETC
	       " in the middle of a river." CR>)>>

<ROUTINE RT-I-MOVE-DOWNSTREAM ()
	<COND (<AND <==? ,GL-WINNER ,CH-PLAYER> <MC-VERB? ROW>>
	       <RT-CYOU-MSG "row" "rows">)
	      (<AND <==? ,GL-WINNER ,CH-PLAYER> <MC-VERB? PADDLE PADDLE-WITH>>
	       <RT-CYOU-MSG "paddle" "paddles">)
	      (T
	       <TELL CR "The boat drifts ">)>
	<TELL "down the river">
	<SETG GL-NOW-LIT? <RT-IS-LIT?>>
	<COND (<EQUAL? <LOC ,TH-BOAT> ,RM-THAMES-ONE ,RM-THAMES-TWO
				      ,RM-THAMES-THREE ,RM-THAMES-FOUR>
	       <TELL ". ">)>
	<COND (<IN? ,TH-BOAT ,RM-THAMES-ONE>
	       <MOVE ,TH-BOAT ,RM-THAMES-TWO>
	       <COND (<MC-T? ,GL-NOW-LIT?>
		      <TELL "Downstream you see the London Bridge.">)>)
	      (<IN? ,TH-BOAT ,RM-THAMES-TWO>
	       <MOVE ,TH-BOAT ,RM-THAMES-THREE>
	       <COND (<MC-T? ,GL-NOW-LIT?>
		      <TELL "You pass under the London Bridge.">)>)
	      (<IN? ,TH-BOAT ,RM-THAMES-THREE>
	       <MOVE ,TH-BOAT ,RM-THAMES-FOUR>
	       <COND (<MC-T? ,GL-NOW-LIT?>
		      <TELL "To the north you see the Traitors Gate.">)>)
	      (<IN? ,TH-BOAT ,RM-THAMES-FOUR>
	       <MOVE ,TH-BOAT ,RM-THAMES-FIVE>
	       <COND (<MC-T? ,GL-NOW-LIT?>
		      <TELL
"Downstream you see the open seas... the strong currents would surely
leave you stranded in your small boat if you were to drift further.">)>)
	      (<IN? ,TH-BOAT ,RM-THAMES-FIVE>
	       <TELL
", and you drift out to sea." CR CR

"After drifting for several days, a passing ship rescues you. By
coincidence, another passenger happens to be Lestrade, who
has resigned in the wake of the Crown Jewel scandal and is retiring to
the island of Pago Pago. After some reflection, you decide
to join him." CR CR>
	       <RT-QSR>)>
	<SETG GL-PLACE-CUR <LOC ,TH-BOAT>>
	<CRLF>>

<ROUTINE RT-MOVE-UPSTREAM ()
	<TELL "Fighting against the current, you " VW " upstream. ">
	<SETG GL-NOW-LIT? <RT-IS-LIT?>>
	<COND (<IN? ,TH-BOAT ,RM-THAMES-ONE>
	       <TELL
CR CR "As you proceed you find yourself among the flotilla of warships that
have come for the celebration of the Jubilee. You quickly decide that
it's too dangerous here so you turn back and head downstream.">)
	      (<IN? ,TH-BOAT ,RM-THAMES-TWO>
	       <COND (<MC-T? ,GL-NOW-LIT?>
		      <TELL "To the north you see the Embankment.">)>
	       <MOVE ,TH-BOAT ,RM-THAMES-ONE>)
	      (<IN? ,TH-BOAT ,RM-THAMES-THREE>
	       <MOVE ,TH-BOAT ,RM-THAMES-TWO>)
	      (<IN? ,TH-BOAT ,RM-THAMES-FOUR>
	       <COND (<MC-T? ,GL-NOW-LIT?>
		      <TELL "You pass under the London Bridge.">)>
	       <MOVE ,TH-BOAT ,RM-THAMES-THREE>)
	      (<IN? ,TH-BOAT ,RM-THAMES-FIVE>
	       <COND (<MC-T? ,GL-NOW-LIT?>
		      <TELL
"Upstream, you see the London Bridge, to the north you see the Traitors
Gate.">)>
	       <MOVE ,TH-BOAT ,RM-THAMES-FOUR>)>
	<CRLF>
	<SETG GL-PLACE-CUR <LOC ,TH-BOAT>>
	<RTRUE>>

; "RT-THAMES-TIDE"
; "    0 = HIGH TIDE"
; "    1 = TIDE COMING IN"
; "    2 = LOW TIDE"
; "    3 = TIDE GOING OUT"

<ROUTINE RT-THAMES-TIDE ()
	<COND (<EQUAL? <RT-CLOCK-CMP  8 32 0 18> 1>
	       <RETURN 1>)
	      (<EQUAL? <RT-CLOCK-CMP  8 48 0 18> 1>
	       <RETURN 0>)
	      (<EQUAL? <RT-CLOCK-CMP 14 35 0 18> 1>
	       <RETURN 3>)
	      (<EQUAL? <RT-CLOCK-CMP 14 51 0 18> 1>
	       <RETURN 2>)
	      (<EQUAL? <RT-CLOCK-CMP 20 38 0 18> 1>
	       <RETURN 1>)
	      (<EQUAL? <RT-CLOCK-CMP 20 54 0 18> 1>
	       <RETURN 0>)
	      (<EQUAL? <RT-CLOCK-CMP  2 41 0 19> 1>
	       <RETURN 3>)
	      (<EQUAL? <RT-CLOCK-CMP  2 57 0 19> 1>
	       <RETURN 2>)
	      (<EQUAL? <RT-CLOCK-CMP  8 44 0 19> 1>
	       <RETURN 1>)
	      (<EQUAL? <RT-CLOCK-CMP  9  0 0 19> 1>
	       <RETURN 0>)
	      (<EQUAL? <RT-CLOCK-CMP 14 47 0 19> 1>
	       <RETURN 3>)
	      (<EQUAL? <RT-CLOCK-CMP 15  3 0 19> 1>
	       <RETURN 2>)
	      (<EQUAL? <RT-CLOCK-CMP 20 50 0 19> 1>
	       <RETURN 1>)
	      (<EQUAL? <RT-CLOCK-CMP 21  6 0 19> 1>
	       <RETURN 0>)
	      (<EQUAL? <RT-CLOCK-CMP  2 53 0 20> 1>
	       <RETURN 3>)
	      (<EQUAL? <RT-CLOCK-CMP  3  9 0 20> 1>
	       <RETURN 2>)
	      (<EQUAL? <RT-CLOCK-CMP  8 56 0 20> 1>
	       <RETURN 1>)
	      (<EQUAL? <RT-CLOCK-CMP  9 12 0 20> 1>
	       <RETURN 0>)
	      (T
	       <RETURN 3>)>>

<ROUTINE RT-TOWER-PASSWORD (WORD-NUM "AUX" PASSWORD)
  <SET PASSWORD ,PASSWORD-ID>
  <COND (<OR <ZERO? .PASSWORD>
	     <NOT <MC-HERE? ,RM-BYWARD-TOWER>>>
	 <TELL "Wasn't she one of the six wives of Henry VIII?" CR>)
	(<EQUAL? ,GL-PLACE-PRV ,RM-OUTER-WARD>
	 <TELL "\"I am sorry, but I have strict orders to allow
absolutely no one to leave the Tower, whether or not he knows the
password. The Prime Minister himself could not get out of here before
Monday morning." CR>)
	(<NOT <EQUAL? .WORD-NUM .PASSWORD>>
	 <TELL "\"I am sorry but that password is no longer valid.\"" CR>)
	(T
	 <TELL "The guard steps aside as you walk in." CR CR>
	 <RT-GOTO ,RM-OUTER-WARD>
	 <RT-UPDATE-SCORE 3>
	 <SETG PASSWORD-ID 9>
	 <SETG ALLOW-IN-TOWER T>
	 <RTRUE>)>>

<ROUTINE V-BOLEYN ()
	<DEBUGGING? <RT-DEBUG-VERB "V-BOLEYN">>
	<RT-TOWER-PASSWORD 1>>

<ROUTINE V-CLEVES ()
	<DEBUGGING? <RT-DEBUG-VERB "V-CLEVES">>
	<RT-TOWER-PASSWORD 2>>

<ROUTINE V-HOWARD ()
	<DEBUGGING? <RT-DEBUG-VERB "V-HOWARD">>
	<RT-TOWER-PASSWORD 3>>

<ROUTINE V-PARR ()
	<DEBUGGING? <RT-DEBUG-VERB "V-PARR">>
	<RT-TOWER-PASSWORD 4>>

<ROUTINE V-ARAGON ()
	<DEBUGGING? <RT-DEBUG-VERB "V-ARAGON">>
	<RT-TOWER-PASSWORD 5>>

<ROUTINE V-SEYMOUR ()
	<DEBUGGING? <RT-DEBUG-VERB "V-SEYMOUR">>
	<RT-TOWER-PASSWORD 6>>

<ROUTINE RT-I-OPEN-MUSEUM-DOOR ()
	<RT-ALARM-SET-REL ,RT-I-CLOSE-MUSEUM-DOOR <RT-PARM-SET 10 0 0>>
	<MC-MAKE ,LG-BRITISH-MUSEUM-DOOR ,FL-OPENED>
	<COND (<MC-HERE? ,RM-GREAT-RUSSELL-ST>
	       <TELL
CR "A guard opens the door and then disappears inside the museum." CR>)>>

<ROUTINE RT-I-CLOSE-MUSEUM-DOOR ()
	<RT-ALARM-SET-REL ,RT-I-OPEN-MUSEUM-DOOR <RT-PARM-SET 14 0 0>>
	<MC-UNMAKE ,LG-BRITISH-MUSEUM-DOOR ,FL-OPENED>
	<COND (<MC-HERE? ,RM-GREAT-RUSSELL-ST>
	       <TELL
CR "The guard says goodnight and closes the door." CR>)
	      (<AND <MC-HERE? ,RM-MANUSCRIPT-ROOM>
		    <IN? ,CH-LIBRARIAN ,RM-MANUSCRIPT-ROOM>>
	       <TELL
CR "The librarian looks at his pocket-watch and exclaims, \"Goodness! It's
closing time already! I really have enjoyed this chat, but I'm afraid
you'll have to let me go. Why don't I see you out?\"" CR CR

"He escorts you to the front door, discoursing all the while on the evolution
of the use of mud by the Hittites. He waves goodbye as he closes the door
behind you." CR CR>
	       <MC-MAKE ,CH-LIBRARIAN ,FL-ASLEEP>
	       <RT-GOTO ,RM-GREAT-RUSSELL-ST>
	       <MC-UNMAKE ,CH-LIBRARIAN ,FL-ASLEEP>)
	      (<MC-HERE? ,RM-MANUSCRIPT-ROOM ,RM-BRITISH-MUSEUM>
	       ;<COND (<MC-IS? ,CH-PLAYER ,FL-ASLEEP>
		      <RT-HOSPITAL-MSG "guard">
		      <RT-QSR>)>
	       <TELL
CR "A guard comes up to you and says, \"I'm sorry sir, its closing time. I
have to lock up now.\" He escorts you to the front door, and then closes it
behind you as you leave." CR CR>
	       <RT-GOTO ,RM-GREAT-RUSSELL-ST>)>>

<ROUTINE RT-INDENT-PRINT ()
	<COND (<G=? ,GL-ALLSCREEN 75>
	       <TELL "     ">)>>

<ROUTINE RT-WRAP-PRINT ()
	<COND (<L? ,GL-ALLSCREEN 75>
	       <TELL CR "    ">)
	      (T
	       <TELL " ">)>>

;<ROUTINE RT-HOSPITAL-MSG (STR)
	<TELL
CR "While you were unconscious, a " .STR " discovered your insensate body and
shipped you off to the nearest hospital. When you awoke, Lestrade was
standing by your bed, causing you to relapse into unconsciousness." CR CR>>
