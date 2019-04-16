;*****************************************************************************
; "game : SHERLOCK!"
; "file : PLACES2.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   28 Oct 1987  4:31:22  $"
; "rev  : $Revision:   1.72  $"
; "vers : 1.00"
;*****************************************************************************

<ROUTINE RT-SURGE ()
	<COND (<EQUAL? <RT-TIME-OF-DAY> 0>
	       <TELL
"The fog is so thick that even your light cannot penetrate it,
so you retrace your steps." CR>
	       <RFALSE>)
	      (T
	       <TELL "Surging crowds of ">
	       <COND (<EQUAL? ,GL-PLACE-CUR ,RM-KENSINGTON-GARDENS>
		      <TELL "haughty nannies">)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-COVENT-GARDEN>
		      <TELL "housewives intent on a bargain">)
		     (T
		      <TELL "tourists">)>
	       <TELL " block your path." CR>
	       <RFALSE>)>>

<ROUTINE RT-AC-RM-MADAME-TUSSAUDS ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-MADAME-TUSSAUDS" .CONTEXT>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1>
		      <MC-MAKE ,TH-ASH ,FL-SEEN>
		      <MC-MAKE ,TH-WILLIAM-STATUE ,FL-SEEN>
		      <MC-MAKE ,TH-WALTER-STATUE ,FL-SEEN>
		      <MC-MAKE ,TH-ELIZABETH-STATUE ,FL-SEEN>
		      <MC-MAKE ,TH-DRAKE-STATUE ,FL-SEEN>
		      <MC-MAKE ,TH-JOHN-STATUE ,FL-SEEN>)>
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1 ,K-M-DESC-2>
		      <COND (<EQUAL? ,GL-PLACE-PRV ,RM-MARYLEBONE-RD>
			     <TELL "You come in off the street and are now standing in">)
			    (T
			     <TELL "You leave the Chamber of Horrors and go back into">)>)
		     (T
		      <TELL "You are in">)>
	       <TELL " the lobby." CR CR "All around you are wax statues of
famous people. To the west is a dark and ominous-looking doorway with a sign
over it. The exit to the street is to the south." CR>
	       <COND (<AND <MC-IS? ,TH-ASH ,FL-ASLEEP>
			   <IN? ,CH-HOLMES ,GL-PLACE-CUR>>
		      <MC-MAKE ,TH-ASH ,FL-SEEN>
		      <MC-UNMAKE ,TH-ASH ,FL-ASLEEP>
		      <MC-UNMAKE ,TH-ASH ,FL-NODESC>
		      <TELL CR CTHE ,CH-HOLMES 
" drops to his hands and knees and begins a minute examination of the floor.
After a few moments he cries, \"Aha! Look here, Watson.\" He points to a
miniscule speck of ash on the floor." CR>
		      <SETG GL-PUPPY-MSG? <>>
		      <RTRUE>)
		     (T
		      <RFALSE>)>)
	      (<AND <EQUAL? .CONTEXT ,K-M-ENTERED>
		    <MC-ISNOT? ,TH-TOBACCO ,FL-ASLEEP>
		    <MC-IS? ,TH-TOBACCO ,FL-LIGHTED>>
	       <RT-UPDATE-SCORE 1>
	       <MC-MAKE ,TH-TOBACCO ,FL-ASLEEP>)
	      (<F? .CONTEXT>
	       <COND (<MC-VERB? ENTER>
		      <COND (<MC-HERE? ,RM-MARYLEBONE-RD>
			     <RT-DO-WALK ,P?NORTH>
			     <RTRUE>)
			    (<MC-HERE? ,RM-CHAMBER-OF-HORRORS>
			     <RT-DO-WALK ,P?EAST>
			     <RTRUE>)>)>)>
	<RFALSE>>

; "FL-OPENED = player exited room while librarian was talking to him"
<ROUTINE RT-AC-RM-MANUSCRIPT-ROOM ("OPTIONAL" (CONTEXT <>) "AUX" VALUE)
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-MANUSCRIPT-ROOM" .CONTEXT>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1 ,K-M-DESC-2>
		      <TELL "The deserted corridor leads to">)
		     (T
		      <TELL "You are in">)>
	       <TELL
" the manuscript room, which contains a dusty collection of
old books on obscure subjects. ">
	       <COND (<IN? ,CH-LIBRARIAN ,RM-MANUSCRIPT-ROOM>
		      <TELL
"There is an old librarian here, on whose desk sits a handwritten sign that
reads \"Quiet, please.\" ">)>
	       <TELL "There are thousands of books behind glass cases">
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1>
		      <TELL ", but one is lying unattended on a table">)>
	       <TELL ". The only exit is to the west." CR>
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1>
		      <MC-MAKE ,CH-LIBRARIAN ,FL-SEEN>
		      <MC-MAKE ,TH-CLUE-BOOK ,FL-SEEN>
		      ;<MC-MAKE ,TH-LIBRARY-OBJ ,FL-SEEN>
		      <MC-MAKE ,TH-LIBRARY-TABLE ,FL-SEEN>
		      <TELL
CR "The librarian - who is as dusty as the books - looks up in surprise as
you come in. He ">
		      <COND (<MC-IS? ,TH-COTTON-BALLS ,FL-WORN>
			     <TELL "whispers">)
			    (T
			     <TELL "says loudly">)>
		      <TELL
", \"Oh, I say! Hello! I don't get many visitors here. Is there
something I can help you with? Some information about the Jubilee,
perhaps? It's quite rare, you know, for a British ruler to
celebrate 50 years on the throne. Unique, in fact. The closest anyone
else came was Elizabeth, who ruled 45 years - although our records are
somewhat vague before the year 900. The Anglo-Saxon chronicles do get rather
sketchy, what? Still, they're the best we have. I think I can find a copy
for you somewhere here.\"" CR CR

"The librarian's voice trails off as he bustles from shelf to shelf,
squinting at the books to find the one he thinks you want." CR>
		      <RTRUE>)
		     (T
		      <RFALSE>)>)
	      (<AND .CONTEXT
		    <IN? ,CH-LIBRARIAN ,RM-MANUSCRIPT-ROOM>
		    <MC-ISNOT? ,CH-LIBRARIAN ,FL-ASLEEP>>
	       <COND (<AND <EQUAL? .CONTEXT ,K-M-ENTERED>
			   <MC-IS? ,CH-LIBRARIAN ,FL-OPENED>>
		      <TELL CR
CTHE ,CH-LIBRARIAN " says, \"Welcome back! I have more interesting things to
tell you!\"" CR>
		      <RTRUE>)
		     (<EQUAL? .CONTEXT ,K-M-EXIT>
		      <TELL
"As you leave, the librarian calls out, \"Must you be going? I have
so many other interesting things to tell you.\"" CR CR>
		      <MC-MAKE ,CH-LIBRARIAN ,FL-OPENED>)
		     (<EQUAL? .CONTEXT ,K-M-BEG>
		      <COND (<OR <MC-VERB? WALK EXIT> 
				 <INTBL? ,GL-PRSA <REST ,GL-GAME-VERBS 2> <GET ,GL-GAME-VERBS 0>>>
			     <RFALSE>)
			    (<MC-VERB? WAIT LISTEN>
			     <TELL "The librarian says ">
			     <COND (<MC-IS? ,TH-COTTON-BALLS ,FL-WORN>
				    <TELL "softly">)
				   (T
				    <TELL "loudly">)>
			     <TELL ", ">
			     <RT-LIBRARIAN-SAYS-MSG>
			     <RTRUE>)
			    (<MC-VERB? HUSH>
			     <TELL
"The librarian stops in midsentence and gets an embarrassed look on
his face. \"Oh, I say. I'm sorry to have rambled on like this, but I do
so enjoy speaking with visitors. I get them so seldom, you know. Thank
you for listening.\"" CR CR

"He leaves the room, mumbling something to himself about the articulation of
the third joint of the hind leg of an extinct species of dung beetle." CR>
			     <REMOVE ,CH-LIBRARIAN>
			     <RTRUE>)
			    (<MC-VERB? LOOK>
			     <RT-DESC-ALL <> T>
			     <TELL CR "As you look around, the librarian says ">
			     <COND (<MC-IS? ,TH-COTTON-BALLS ,FL-WORN>
				    <TELL "softly">)
				   (T
				    <TELL "loudly">)>
			     <TELL ", ">
			     <RT-LIBRARIAN-SAYS-MSG>
			     <RTRUE>)
			    (<AND <MC-VERB? TELL>
				  <MC-PRSO? ,CH-LIBRARIAN>>
			     <RFALSE>)
			    ;(<EQUAL? ,GL-P-PRSA-WORD ,W?ECHO>
			      <TELL
"The librarian pauses for a second as if he is finally going to stop
talking...but then he continues ">
			      <COND (<MC-IS? ,TH-COTTON-BALLS ,FL-WORN>
				     <TELL "quietly">)
				    (T
				     <TELL "noisily">)>
			      <TELL " and says, ">
			      <RT-LIBRARIAN-SAYS-MSG>
			      <RTRUE>)
			    (<RT-TALK-VERB?>
			     <TELL
"The librarian interrupts you as you attempt to speak, and ">
			     <COND (<MC-IS? ,TH-COTTON-BALLS ,FL-WORN>
				    <TELL "whispers">)
				   (T
				    <TELL "says">)>
			     <TELL ", ">
			     <RT-LIBRARIAN-SAYS-MSG>
			     <RFATAL>)
			    (T
			     <TELL "The librarian launches off into another
speech, and it distracts you from what you wanted to do. ">
			     <RT-LIBRARIAN-SAYS-MSG>
			     <RTRUE>)>)>)
	      (.CONTEXT <RFALSE>)
	      (T
	       <COND (<MC-VERB? ENTER>
		      <COND (<MC-HERE? ,RM-BRITISH-MUSEUM>
			     <RT-DO-WALK ,P?EAST>
			     <RTRUE>)>)
		     (<MC-VERB? EXIT>
		      <COND (<MC-HERE? ,RM-MANUSCRIPT-ROOM>
			     <RT-DO-WALK ,P?WEST>
			     <RTRUE>)>)>
	       <RFALSE>)>>

<ROUTINE RT-AC-RM-VICTORIA-STREET ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-VICTORIA-STREET" .CONTEXT>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1 ,K-M-DESC-2>
		      <TELL "You enter">)
		     (T
		      <TELL "You are loitering in">)>
	       <TELL
" Victoria Street, which runs east and west between Victoria Square
and Broad Sanctuary." CR CR

"You see a sign outside one of the shops." CR>
	       <RFALSE>)
	      (<AND <==? .CONTEXT ,K-M-BEG>
		    <MC-VERB? WAIT>>
	       <COND (<MC-ISNOT? ,RM-VICTORIA-STREET ,FL-ASLEEP>
		      <MC-MAKE ,RM-VICTORIA-STREET ,FL-ASLEEP>
		      <TELL
"After a few moments, a constable strolls by, bops you on the head
with his billy club, and says, \"Move along, you.\"" CR>
		      <RTRUE>)
		     (T
		      <TELL
"The same constable as before walks by and says, \"You again? That's it,
mate. Come along with me.\" He bops you on the head again and arrests you
on a charge of vagrancy." CR CR

"You spend the night in gaol, and in the morning Inspector Lestrade drops
by to tell you that there has been a mix-up in the paperwork and you are
to be deported to Australia the following day. He gives you a letter to
deliver to his sister in Melbourne and wishes you luck." CR CR>
		      <RT-QSR>)>)
	      (<T? .CONTEXT> <RFALSE>)>>

<ROUTINE RT-AC-RM-CLOCK-TOWER ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-CLOCK-TOWER" .CONTEXT>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1 ,K-M-DESC-2>
		      <TELL
"The stairs seem to wind up forever. Finally, you emerge into">)
		     (T
		      <TELL "You are in">)>
	       <TELL " the interior of the clock tower, high above the Houses
of Parliament." CR CR

"The immense bell known as Big Ben is hanging from the
ceiling, suspended over a hollow shaft that is so deep it might as
well be bottomless. A wooden railing runs around the shaft
for safety." CR CR

"Inside the bell, you see an enormous clapper">
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1>
		      <MC-MAKE ,TH-BELL ,FL-SEEN>
		      <MC-MAKE ,TH-SAPPHIRE ,FL-SEEN>
		      <MC-MAKE ,TH-CLAPPER ,FL-SEEN>
		      <MC-MAKE ,TH-SHAFT ,FL-SEEN>
		      <MC-MAKE ,TH-RAILING ,FL-SEEN>
		      <TELL ,K-SAPPHIRE-MSG CR>
		      <RTRUE>)
		     (T
		      <COND (<IN? ,TH-SAPPHIRE ,TH-CLAPPER>
			     <TELL ,K-SAPPHIRE-MSG CR>)
			    (T
			     <TELL "." CR>)>
		      <RFALSE>)>)
	      (<NOT <RT-ALARM-SET? ,RT-I-SWING-BELL>>
	       <RT-ZERO-SECONDS>)>
	<RFALSE>>

<ROUTINE RT-AC-RM-THAMES-ONE ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-THAMES-ONE" .CONTEXT>>
	;<IFSOUND <COND (<==? .CONTEXT ,K-M-BEG>
			<SOUNDS ,S-BOATING ,S-START>)>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <TELL "You are">
	       <RT-IN-VEHICLE-MSG>
	       <TELL "on the Thames, just south of the Embankment." CR>
	       <RFALSE>)
	      (T
	       <RT-PROCESS-BOAT-ON-THAMES>)>>

<ROUTINE RT-AC-RM-THAMES-TWO ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-THAMES-TWO" .CONTEXT>>
	;<IFSOUND <COND (<==? .CONTEXT ,K-M-BEG>
			<SOUNDS ,S-BOATING ,S-START>)>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <TELL "You are">
	       <RT-IN-VEHICLE-MSG>
	       <TELL "on the Thames. Downstream you can see London Bridge." CR>
	       <RFALSE>)
	      (T
	       <RT-PROCESS-BOAT-ON-THAMES>)>>

<ROUTINE RT-AC-RM-THAMES-THREE ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-THAMES-THREE" .CONTEXT>>
	;<IFSOUND <COND (<==? .CONTEXT ,K-M-BEG>
			<SOUNDS ,S-BOATING ,S-START>)>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <TELL "You are">
	       <RT-IN-VEHICLE-MSG>
	       <TELL "underneath London Bridge." CR>
	       <RFALSE>)
		(<OR <AND <MC-VERB? EXAMINE LOOK-UNDER>
			  <MC-PRSO? ,RM-LONDON-BRIDGE>>
		     <AND <MC-VERB? LOOK-UP>
			  <MC-PRSO? ,ROOMS ,RM-LONDON-BRIDGE>>>
		 <TELL "You see nothing of interest">
		 <COND (<IN? ,TH-CLUMP-OF-MOSS ,RM-THAMES-THREE>
			<MC-MAKE ,TH-CLUMP-OF-MOSS ,FL-SEEN>
			<TELL
", other than a clump of moss lodged among the supports overhead." CR>)
		       (T
			<TELL "." CR>)>
		 <RT-PROCESS-BOAT-ON-THAMES>
		 <RTRUE>)
		(T
		 <RT-PROCESS-BOAT-ON-THAMES>)>>

<ROUTINE RT-AC-RM-THAMES-FOUR ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-THAMES-FOUR" .CONTEXT>>
	;<IFSOUND <COND (<==? .CONTEXT ,K-M-BEG>
			<SOUNDS ,S-BOATING ,S-START>)>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <TELL "You are">
	       <RT-IN-VEHICLE-MSG>
	       <TELL "on the Thames, just south of Traitor's Gate." CR>
	       <RFALSE>)
	      (T
	       <RT-PROCESS-BOAT-ON-THAMES>)>>

<ROUTINE RT-AC-RM-THAMES-FIVE ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-THAMES-FIVE" .CONTEXT>>
	;<IFSOUND <COND (<==? .CONTEXT ,K-M-BEG>
			<SOUNDS ,S-BOATING ,S-START>)>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <TELL "You are">
	       <RT-IN-VEHICLE-MSG>
	       <TELL "on the Thames, in danger of drifting out to sea." CR>
	       <RFALSE>)
	      (T
	       <RT-PROCESS-BOAT-ON-THAMES>)>>

<ROUTINE RT-AC-RM-SHERMANS-HOUSE ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-SHERMANS-HOUSE" .CONTEXT>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1>
		      <RT-THIS-IS-IT ,CH-SHERMAN>
		      <MC-MAKE ,CH-SHERMAN ,FL-SEEN>
		      <MC-MAKE ,RM-SHERMANS-HOUSE ,FL-SEEN>
		      <TELL "You enter the cramped quarters of Sherman's
shop. The old animal-trainer's eyes brighten up when he sees you." CR CR

"\"You've probably come looking for Toby,\" he says. \"But I'm afraid I
won't be able to help you this time. Toby's not feeling too well, and all my
other animals are already out on loan. All I have left is a half-trained
pigeon.\"" CR>
		      <RTRUE>)
		     (<EQUAL? .CONTEXT ,K-M-DESC-2 ,K-M-DESC-3>
		      <TELL "Sherman's shop is dingy and cramped. Dozens of
empty cages are stacked up against the walls." CR>
		      <RFALSE>)>)
	      (<EQUAL? .CONTEXT ,K-M-ENTERED>
; "If the house is asleep, then the player has entered it for the first time,
	and Sherman should not act -- DEB"
	       <COND (<MC-IS? ,RM-SHERMANS-HOUSE ,FL-ASLEEP>
		      <MC-UNMAKE ,RM-SHERMANS-HOUSE ,FL-ASLEEP>
		      <RFALSE>)
; "If the house is not asleep, then the player has entered it more than once,
  and Sherman should act based on whether or not the trained pigeon is alive
	-- DEB"
              (<MC-IS? ,CH-SHERMAN ,FL-ASLEEP>
	       <RFALSE>)
	      (<MC-IS? ,CH-TRAINED-PIGEON ,FL-ALIVE>
	       <TELL CR
"Sherman says, \"Welcome back. It's a pleasure to see you again.\"" CR>
	       <RT-THIS-IS-IT ,CH-SHERMAN>)
	      (T
	       <RT-SHERMAN-RAGE T>)>)
	      (<T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? ENTER>
	       <COND (<MC-HERE? ,RM-PINCHIN-LANE>
		      <RT-DO-WALK ,P?WEST>
		      <RTRUE>)>)
	      (<MC-VERB? EXIT>
	       <COND (<MC-HERE? ,RM-SHERMANS-HOUSE>
		      <RT-DO-WALK ,P?EAST>
		      <RTRUE>)>)>>

<ROUTINE RT-AC-RM-THREADNEEDLE-ST ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-THREADNEEDLE-ST" .CONTEXT>>
	<COND (<F? .CONTEXT>
	       <COND (<MC-VERB? ENTER>
		      <COND (<MC-HERE? ,RM-BANK-OF-ENGLAND>
			     <RT-DO-WALK ,P?SOUTH>
			     <RTRUE>)>)>
	       <RFALSE>)>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <MC-MAKE ,CH-BANK-GUARD ,FL-SEEN>
	<MC-MAKE ,CH-URCHINS ,FL-SEEN>
	<MC-MAKE ,TH-GUARDS-POCKET ,FL-SEEN>
	<COND (<EQUAL? .CONTEXT ,K-M-DESC-1 ,K-M-DESC-2>
	       <COND (<EQUAL? ,GL-PLACE-PRV ,RM-BANK-OF-ENGLAND>
		      <TELL "You emerge into">)
		     (T
		      <TELL "You enter">)>
	       <TELL " Threadneedle Street and are now">)
	      (T
	       <TELL "You are">)>
	<TELL " in front of the Bank of England. The entrance to
the bank is to the north, Cheapside leads off to the west, and King
William Street ">
	<COND (<EQUAL? <RT-TIME-OF-DAY> 0>
	       <TELL "disappears off into the darkness">)
	      (T
	       <TELL "continues">)>
	<TELL " to the southeast. On the wall is a small sign." CR>
	<COND (<OR <EQUAL? .CONTEXT ,K-M-DESC-1>
		   <IN? ,CH-BANK-GUARD ,RM-THREADNEEDLE-ST>>
	       <TELL
CR "A bank guard is lounging up against the wall, idly jangling some keys
in his pocket while he watches a group of urchins playing in the street." CR>
	       <COND (<MC-IS? ,CH-WIGGINS ,FL-BROKEN>
		      <TELL CR ,K-URCHIN-MSG CR>
		      <RTRUE>)>)
	      (T
	       <TELL CR "A group of urchins is playing in the street." CR>)>
	<RFALSE>)
	      (<AND <EQUAL? .CONTEXT ,K-M-BEG>
		    <IN? ,CH-HOLMES ,RM-LAIR>
		    <MC-ISNOT? ,TH-TOPAZ ,FL-LOCKED>>
	       <RT-WIGGINS-HELP-MSG>
	       <CRLF>
	       <MC-MAKE ,TH-TOPAZ ,FL-LOCKED>)
	      (<AND <EQUAL? .CONTEXT ,K-M-ENTERED>
		    <EQUAL? ,GL-PLACE-PRV ,RM-BANK-OF-ENGLAND>
		    <MC-ISNOT? ,TH-TOPAZ ,FL-ASLEEP>>
	       <RT-KIDNAP>
	       <MC-MAKE ,TH-TOPAZ ,FL-ASLEEP>)>
	<RFALSE>>

<ROUTINE RT-AC-RM-LONDON-BRIDGE ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-LONDON-BRIDGE" .CONTEXT>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1 ,K-M-DESC-2>
		      <COND (<EQUAL? ,GL-PLACE-PRV ,RM-LAIR>
			     <TELL
"When you emerge from the lair you are momentarily disoriented, blinking
your eyes in the bright sunlight. After a few moments, you realize you
are standing on London bridge, but you have no idea from which direction
you came." CR>
			     <RTRUE>)
			    (T
			     <TELL "You">
			     <RT-DRIVE-WALK-MSG?>
			     <TELL "up onto">)>)
		     (T
		      <TELL "You are">
		      <RT-IN-VEHICLE-MSG>
		      <TELL "on">)>
	       <TELL " London Bridge. ">
	       <COND (<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
		      <TELL "The view of the river from here is spectacular,
and hoards of sightseers are here with you to share the view." CR>)
		     (T
		      <TELL
"The fog is so dense you can barely see the river from here." CR>)>
	       <RFALSE>)
	      (<OR <AND <F? .CONTEXT>
			<MC-VERB? LOOK-UNDER LOOK-DOWN>
			<MC-PRSO? ,RM-LONDON-BRIDGE>>
		   <AND <==? .CONTEXT ,K-M-BEG>
			<MC-VERB? LOOK-DOWN>
			<MC-PRSO? ,ROOMS>>>
	       <TELL "You see the Thames flowing slowly by, just as it has
done for centuries past." CR>
	       <RTRUE>)
	      (<T? .CONTEXT> <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? ENTER>
		      <COND (<MC-HERE? ,RM-LOWER-THAMES-ST>
			     <RT-DO-WALK ,P?SOUTH>
			     <RTRUE>)
			    (<MC-HERE? ,RM-THAMES-THREE>
			     <TELL "You can't climb onto the bridge." CR>
			     <RTRUE>)>)
		     (<MC-VERB? EXIT>
		      <COND (<MC-HERE? ,RM-LONDON-BRIDGE>
			     <RT-DO-WALK ,P?NORTH>
			     <RTRUE>)>)
		     (<MC-VERB? SHOOT>
		      <TELL ,K-RICOCHET-MSG CR>
		      <RTRUE>)>)
	      (<MC-THIS-PRSI?>
	       <COND (<AND <IN? ,CH-PLAYER ,TH-BOAT>
			   <MC-VERB? PUT PUT-ON>>
		      <TELL "You can't attach anything to the bridge." CR>
		      <RTRUE>)>)>>

<ROUTINE RT-AC-RM-SWAN-LANE ("OPTIONAL" (CONTEXT <>))
     <DEBUGGING? <RT-DEBUG-RM-AC "RM-SWAN-LANE" .CONTEXT>>
     <COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	    <COND (<EQUAL? .CONTEXT ,K-M-DESC-1 ,K-M-DESC-2>
		   <COND (<EQUAL? ,GL-PLACE-PRV ,RM-LOWER-THAMES-ST>
			  <TELL "With increasing apprehension, you descend">)
			 (T
			  <TELL "With considerable relief, you emerge">)>
		   <TELL " into">)
		  (T
		   <TELL "With increasing apprehension, you are standing in">)>
	    <TELL " Swan Lane, which runs along the waterfront of the Thames." CR CR>
	    <COND (<EQUAL? .CONTEXT ,K-M-DESC-1>
		   <TELL "It is a seedy, disreputable, run-down part of town
that normally you wouldn't be caught dead in. After a moment's reflection,
you wish you hadn't thought of it in quite those terms." CR CR>)>	
	    <TELL
"To the west is the entrance to one of the least savory buildings
you have ever seen. There is a faded sign above the door that informs
you that the establishment was, in better days, known as the Bar
of Gold." CR CR

"Fortunately, it is only a short walk back up the stairs to Lower
Thames Street." CR>
	    <RFALSE>)
	   (<AND <EQUAL? .CONTEXT ,K-M-ENTERED>
		 <EQUAL? ,GL-PLACE-PRV ,RM-BAR-OF-GOLD>
		 <IN? ,CH-WIGGINS ,RM-SWAN-LANE>>
	    <TELL CR
CTHE ,CH-WIGGINS " says, \"Blimey!! I didn't think you would make it
out of there alive.\"" CR>
	    <SETG GL-PUPPY ,CH-WIGGINS>
	    ;<MC-UNMAKE ,CH-WIGGINS ,FL-NODESC> ;"FLAGS NEVER SET"
	    ;<MC-UNMAKE ,CH-WIGGINS ,FL-BROKEN>)
	   (<T? .CONTEXT> <RFALSE>)
	   (<MC-VERB? ENTER>
	    <COND (<MC-HERE? ,RM-BAR-OF-GOLD>
		   <RT-DO-WALK ,P?EAST>
		   <RTRUE>)>)>>

<ROUTINE RT-AC-RM-BAR-OF-GOLD ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-BAR-OF-GOLD" .CONTEXT>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1>
		      <MC-MAKE ,CH-DENKEEPER ,FL-SEEN>
		      <MC-MAKE ,TH-OPIUM-GAS ,FL-SEEN>)>
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1 ,K-M-DESC-2>
		      <TELL
"After fighting the urge to turn and run, you enter and find yourself ">)
		     (T
		      <TELL "You are standing - rather nervously - ">)>
	       <TELL
"in the Bar of Gold, the most infamous opium den in London. The
proprietor is a most unsavory character who ">
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1 ,K-M-DESC-2>
		      <TELL
"gives you a sidelong glance as you enter and then ignores you">)
		     (T
		      <TELL "hasn't given you a second look since you came in">)>
	       <TELL "." CR>
	       <RFALSE>)
	      (<AND <EQUAL? .CONTEXT ,K-M-ENTERING>
		    <EQUAL? ,GL-PUPPY ,CH-WIGGINS>>
	       <TELL THE ,CH-WIGGINS " says, \"You must be stark raving
bonkers. That's the most dangerous place in London. I'll wait
out here, thank you very much!\"" CR CR>
	       <SETG GL-PUPPY <>>)
	      (<T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? ENTER>
	       <COND (<MC-HERE? ,RM-SWAN-LANE>
		      <RT-DO-WALK ,P?WEST>
		      <RTRUE>)>)
	      (<MC-VERB? EXIT>
	       <COND (<MC-HERE? ,RM-BAR-OF-GOLD>
		      <RT-DO-WALK ,P?EAST>
		      <RTRUE>)>)>>

<ROUTINE RT-AC-RM-LAIR ("OPTIONAL" (CONTEXT <>))
  <DEBUGGING? <RT-DEBUG-RM-AC "RM-LAIR" .CONTEXT>>
  <COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	 <COND (<EQUAL? .CONTEXT ,K-M-DESC-1>
		<MC-MAKE ,CH-MORIARTY ,FL-SEEN>
		<MC-MAKE ,TH-LAIR-KEY ,FL-SEEN>
		<MC-MAKE ,TH-CROWN-JEWELS ,FL-SEEN>
		<MC-MAKE ,TH-MORIARTY-DESK ,FL-SEEN>
		<MC-MAKE ,TH-ROPE ,FL-SEEN>
		<TELL "At last you come face to face with the evil
Professor. He is sitting placidly behind his desk, looking at you as if
you were some botanical specimen." CR CR

"As you look around the room, you see Sherlock Holmes tied to a
chair. He is only inches away from the Crown Jewels, which Moriarty has
spread out on his desk, the better to taunt Holmes." CR CR

"Holmes looks up and says, \"Ah, there you are Watson.\" He turns his head
towards Moriarty and says, \"You see, Professor, you grossly underestimate
the intelligence and determination of your fellow countrymen.\"" CR CR

"\"Watson,\" he continues. \"The Professor and I have just been chatting about
why he led us on this merry chase. If you care to ask him, I'm sure he would
be happy to fill you in as well.\"" CR>
		<RTRUE>)
	       (<EQUAL? .CONTEXT ,K-M-DESC-3>
		<TELL "The room is simply, but elegantly, furnished.">
		<COND (<MC-IS? ,CH-HOLMES ,FL-LOCKED>
		       <SETG GL-PUPPY-MSG? <>>
		       <TELL " " <RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
				   	       ,K-SECURELY-BOUND-MSG ".">)>
		<CRLF>)>
	 <RFALSE>)
	(<EQUAL? .CONTEXT ,K-M-ENTERED>
	 <SETG GL-PUPPY ,CH-HOLMES>)>
  <COND (<==? .CONTEXT ,K-M-BEG>
	 <COND (<MC-VERB? TAKE SHOW>
		<COND (<MC-PRSO? ,TH-BREATH>
		       <RFALSE>)
		      (<MC-IS? ,GL-PRSO ,FL-BODYPART>
		       <RFALSE>)
		      (<MC-IS? ,GL-PRSO ,FL-WORN>
		       <RFALSE>)
		      (<AND <MC-ISNOT? ,CH-MORIARTY ,FL-LOCKED>
			    <MC-ISNOT? ,CH-MORIARTY ,FL-ASLEEP>>
		       <COND (<RT-META-IN? ,GL-PRSO ,GL-WINNER>
			      <RT-ALARM-SET-REL ,RT-I-TAKE-WATSONS-STUFF
						     <RT-PARM-SET 0 1 0>>
			      <MOVE ,GL-PRSO ,GL-WINNER>
			      <TELL
"Moriarty's normally emotionless features dissolve in rage. He shouts at
Akbar, \"Why didn't you take that from him when you brought him
in?\"" CR CR

"The outburst startles Akbar into momentary inaction, but he quickly recovers
and starts to come towards you with a violent look in his eyes." CR>)
			     (T
			      <TELL "Akbar steps in your way">
			      <COND (<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
				     <TELL ", says, \"Pardon me, honourable sir,\"">)>
			      <TELL " and stops you from taking " THEO "." CR>)>)>)
	       (<AND <MC-VERB? RELEASE>
		     <MC-PRSO? ,TH-BREATH>>
		<RFALSE>)
	       (<MC-VERB? UNTIE RELEASE>
		<COND (<==? ,GL-PRSO ,TH-ROPE>
		       <RFALSE>)
		      (<MC-IS? ,GL-PRSO ,FL-LOCKED>
		       <COND (<OR <MC-IS? ,CH-AKBAR ,FL-ASLEEP>
				  <MC-IS? ,CH-AKBAR ,FL-LOCKED>>
			      <MC-UNMAKE ,GL-PRSO ,FL-LOCKED>
			      <RT-CYOU-MSG "untie" "unties">
			      <TELL THEO>
			      <COND (<EQUAL? ,GL-PRSO ,TH-ROPE-AUX1>
				     <SETG TH-ROPE-AUX1 ,TH-ROPE-AUX2>
				     <SETG TH-ROPE-AUX2 -1>
				     <COND (<EQUAL? ,TH-ROPE-AUX1 -1>
					    <MOVE ,TH-ROPE ,CH-PLAYER>
					    <MC-UNMAKE ,TH-ROPE ,FL-NODESC>
					    <TELL ", keeping " THE ,TH-ROPE>)>)
				    (<EQUAL? ,GL-PRSO ,TH-ROPE-AUX2>
				     <SETG TH-ROPE-AUX2 -1>)>
			      <TELL "." CR>
			      <COND (<AND <MC-PRSO? ,CH-MORIARTY ,CH-AKBAR>
					  <MC-ISNOT? ,CH-AKBAR ,FL-ASLEEP>>
				     <CRLF>
				     <COND (<EQUAL? ,GL-PRSO ,CH-MORIARTY>
					    <TELL
"Bad move. As soon as he is free, Moriarty">)
					   (T
					    <TELL	
"Akbar immediately unties Moriarty, who">)>
				     <TELL
" unlocks his desk and pulls out a pistol. \"Thank you for releasing
me, gentlemen,\" he says, waving the gun at you. \"Very sporting of
you.\" He glances at his pocketwatch. \"We shouldn't have too long to
wait.\" Minutes later you hear newsboys running through the
streets shouting about the resignation of the Prime Minister." CR>
				     <RT-QSR>)>
			      <RTRUE>)
			     (T
			      <RT-ROPE-MSG>)>)
		      (<MC-VERB? RELEASE>
		       <RFALSE>)
		      (T
		       <TELL CTHEO>
		       <RT-ISNT-ARENT-MSG ,GL-PRSO>
		       <TELL "tied up." CR>)>)
	       (<AND <MC-VERB? TIE-UP>
		     <NOT <MC-PRSI? ,TH-ROPE ROOMS>>>
		<RT-IMPOSSIBLE-MSG>)
	       (<AND <MC-VERB? TIE TIE-UP>
		     <OR <MC-PRSO? ,CH-PLAYER ,CH-ME>
			 <MC-PRSI? ,CH-PLAYER ,CH-ME>>>
		<TELL "We'll assume you're joking." CR>
		<RTRUE>)
	       (<MC-VERB? TIE TIE-UP>
		<COND (<RT-VISIBLE? ,TH-ROPE>
		       <COND (<OR <MC-IS? ,CH-AKBAR ,FL-ASLEEP>
				  <MC-IS? ,CH-AKBAR ,FL-LOCKED>>
			      <COND (<EQUAL? ,CH-HOLMES ,GL-PRSI ,GL-PRSO>
				     <TELL "Surely you jest." CR>
				     <RTRUE>)>
			      <COND (<EQUAL? ,TH-ROPE-AUX1 -1>
				     <SETG TH-ROPE-AUX1 ,GL-PRSO>)
				    (<EQUAL? ,TH-ROPE-AUX2 -1>
				     <SETG TH-ROPE-AUX2 ,GL-PRSO>)
				    (T
				     <TELL CTHE ,TH-ROPE " is not long enough." CR>
				     <RTRUE>)>
			      <COND (<EQUAL? ,GL-PRSI ,ROOMS>
				     <SETG GL-PRSI <>>)>
			      <MOVE ,TH-ROPE ,GL-PLACE-CUR>
			      <MC-MAKE ,TH-ROPE ,FL-NODESC>
			      <MC-MAKE ,GL-PRSO ,FL-LOCKED>
			      <COND (<MC-PRSI? <> ,TH-ROPE>
				     <RT-CYOU-MSG "tie" "ties">
				     <TELL "up " THEO "." CR>)
				    (<NOT <EQUAL? ,TH-ROPE-AUX2 -1>>
				     <RT-CYOU-MSG "tie" "ties">
				     <TELL "up " THEO ", but "
THE ,TH-ROPE " is not long enough to tie up " THEI " as well." CR>)
				    (T
				     <MC-MAKE ,GL-PRSI ,FL-LOCKED>
				     <TELL "You tie " THEO " to " THEI "." CR>)>)
			     (T
			      <RT-ROPE-MSG>)>)
		      (T
		       <TELL "You don't have " A ,TH-ROPE "." CR>)>)>)>>

<ROUTINE RT-AC-RM-NAVE ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-NAVE" .CONTEXT>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1>
		      <MC-MAKE ,TH-NEWTON-TOMB ,FL-SEEN>
		      <TELL
"You enter the Abbey and pause in the Nave, struck by the sheer magnificence
of the building. Massive Purbeck columns march the length of the Nave, and
they rise in perfect proportion to meet each other in a series of pointed
arches that are the hallmark of the Gothic style." CR CR

"The interior of the Abbey is dark, cold, and gloomy - but after a few
moments your eyes adjust and you can make out a tomb at the far end of
the room." CR>
		      <RTRUE>)
		     (<EQUAL? .CONTEXT ,K-M-DESC-2 ,K-M-DESC-3>
		      <COND (<EQUAL? .CONTEXT ,K-M-DESC-2>
			     <COND (<EQUAL? ,GL-PLACE-PRV ,RM-BROAD-SANCTUARY>
				    <TELL
"You walk through the massive door and find yourself once again in">)
				   (T
				    <TELL "You return to">)>)
			    (<EQUAL? .CONTEXT ,K-M-DESC-3>
			     <TELL "You are standing in">)>
		      <TELL
" the Nave. Amidst the massive columns, one tomb in particular catches your
attention." CR>
		      <RFALSE>)>)
	      (<EQUAL? .CONTEXT ,K-M-ENTERED>
	       <SETG PLAYER-IN-ABBEY T>)
	      (<AND <EQUAL? .CONTEXT ,K-M-EXIT>
		    <EQUAL? ,GL-P-WALK-DIR ,P?OUT ,P?WEST>>
	       <SETG PLAYER-IN-ABBEY <>>)>
	<RFALSE>>

<ROUTINE RT-AC-RM-EVANGELIST-CHAPEL ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-EVANGELIST-CHAPEL" .CONTEXT>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1>
		      <MC-MAKE ,TH-BANK-OF-CANDLES ,FL-SEEN>
		      <MC-MAKE ,TH-VERE-TOMB ,FL-SEEN>
		      <TELL
"You enter the Evangelist Chapel and wonder what it is
about this room that makes you feel it is somehow different from the
rest of the Abbey." CR>)
		     (<EQUAL? .CONTEXT ,K-M-DESC-2>
		      <TELL "You return to the welcome warmth provided by
the array of candles in the Evangelist Chapel." CR>)
		     (T
		      <TELL "Light! Warmth! There is a bank of candles
here lit by devoted worshippers. The candles warm the room so effectively
that after a few moments you actually become uncomfortable." CR CR

"One of the most unusual tombs in the Abbey is here." CR>)>
	       <RFALSE>)
	      (<EQUAL? .CONTEXT ,K-M-BEG>
	       <RT-PAPER-WARMING ,TH-WHITE-PAPER>
	       <RT-PAPER-WARMING ,TH-BLUE-PAPER>
	       <RT-PAPER-WARMING ,TH-ORANGE-PAPER>
	       <RT-PAPER-WARMING ,TH-YELLOW-PAPER>
	       <RT-PAPER-WARMING ,TH-BROWN-PAPER>
	       <RT-PAPER-WARMING ,TH-GREEN-PAPER>
	       <RFALSE>)>>

<ROUTINE RT-AC-RM-HENRY-VII-CHAPEL ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-RM-AC "RM-HENRY-VII-CHAPEL" .CONTEXT>>
	<COND (<RT-DESCFCN-CONTEXT .CONTEXT>
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1>
		      <MC-MAKE ,TH-HENRY-VII-TOMB ,FL-SEEN>)>
	       <COND (<EQUAL? .CONTEXT ,K-M-DESC-1 ,K-M-DESC-2>
		      <TELL "You enter">)
		     (T
		      <TELL "You are in">)>
	       <TELL
" Henry VII's chapel, which is one of the most beautiful chapels
in the world. The ceiling is a masterpiece of delicate fan vaulting, and
the Renaissance gilt-bronze tomb is obviously the work of one of the
Italian masters." CR>
	       <RFALSE>)
	      (<MC-VERB? LOOK-UP>
	       <TELL ,K-BREATH-TAKING-MSG CR>)>>

<ROUTINE RT-EX-ENTER-BANK-OF-ENGLAND ()
	 <COND (<L? ,CH-BANK-GUARD-AUX1 4>
		<TELL 
"The guard stops you as you try to enter. \"Excuse me, sir. You can't go
in there. And don't even THINK about trying to bribe me.\"" CR>
		<RT-THIS-IS-IT ,CH-BANK-GUARD>
		<RFALSE>)
	       (<IN? ,TH-BOX-KEY ,TH-GUARDS-POCKET>
		<TELL
"Holmes takes you to one side and whispers, \"It is obvious, dear fellow, that
it would be pointless to enter the bank with no means of unlocking anything we
may find inside.\"" CR>
		<RFALSE>)
	       (T
		<COND (<IN? ,CH-BANK-GUARD ,RM-THREADNEEDLE-ST>
		       <TELL "As soon as you enter, the guard leaves." CR CR>
		       <REMOVE ,CH-BANK-GUARD>)>
		<RETURN ,RM-BANK-OF-ENGLAND>)>>

<ROUTINE RT-AC-RM-BUCKINGHAM-PALACE ("OPT" (CONTEXT <>))
	<COND (<T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? ENTER>
	       <COND (<MC-HERE? ,RM-QUEENS-GARDENS>
		      <RT-DO-WALK ,P?WEST>
		      <RTRUE>)>)
	      (<MC-VERB? EXIT>
	       <COND (<MC-HERE? ,RM-BUCKINGHAM-PALACE>
		      <RT-DO-WALK ,P?EAST>
		      <RTRUE>)>)>>

<ROUTINE RT-EX-RM-ENTER-BUCKINGHAM-PALACE ()
	 <COND (<AND <EQUAL? ,GL-PRSO ,P?WEST ,P?IN>
		     <MC-HERE? ,RM-QUEENS-GARDENS>>
		<TELL CTHE ,CH-PALACE-GUARD
" steps into your path and says, \"I'm sorry, but I've
been instructed to let no one into the Palace unless I receive certain items
of interest to the Crown.\"" CR>
		<RFALSE>)>>

<ROUTINE RT-EX-RM-STEER-BOAT ()
	 <RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>
	 <TELL
"[To move the boat, ROW or PADDLE in a given direction, or LAND it.]" CR>
	 <RFALSE>>

<ROUTINE RT-EX-RM-LAND-BOAT ()
	<TELL "[Land the Boat.]" CR>
	<RT-LAND-BOAT>
	<RFALSE>>

<ROUTINE RT-EX-RM-LAUNCH-BOAT ()
	<COND (<IN? ,CH-PLAYER ,TH-BOAT>
	       <TELL "[Launch the Boat.]" CR>
	       <RT-LAUNCH-BOAT>)
	      (T
	       <TELL
"The last man who walked on water was killed by a bunch of Romans. Why
don't you play it safe and use a boat?" CR>)>
	<RFALSE>>

<ROUTINE RT-EX-PARLOUR-ENTRY ()
	<COND (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
	       <TELL CTHE ,CH-HUDSON ,K-HUDSON-WORRIED-MSG CR>
	       <RFALSE>)
	      (<MC-ISNOT? ,LG-PARLOUR-DOOR ,FL-OPENED>
	       <TELL CTHE ,LG-PARLOUR-DOOR " is closed." CR>
	       <RFALSE>)
	      (<AND <MC-PRSO? ,P?NORTH ,P?IN>
		    <MC-HERE? ,RM-ENTRY-HALL>>
	       <RETURN ,RM-PARLOUR>)>>

<ROUTINE RT-EX-LEAVE-EMBANKMENT ()
	<COND (<MC-IS? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
	       <TELL ,K-HEAVY-ARMOUR-MSG CR>
	       <RFALSE>)>
	<COND (<IN? ,GL-WINNER ,TH-BOAT>
	       <RT-PERFORM ,V?EXIT ,TH-BOAT>
	       <COND (<NOT <IN? ,GL-WINNER ,RM-THE-EMBANKMENT>>
		      <RFALSE>)>)>
	<COND (<AND <EQUAL? ,GL-PRSO ,P?NORTH>
		    <MC-HERE? ,RM-THE-EMBANKMENT>>
	       <RETURN ,RM-FLEET-STREET>)
	      (<AND <EQUAL? ,GL-PRSO ,P?EAST>
		    <MC-HERE? ,RM-THE-EMBANKMENT>>
	       <RETURN ,RM-UPPER-THAMES-ST>)>>
