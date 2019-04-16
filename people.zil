;*****************************************************************************
; "game : SHERLOCK!"
; "file : PEOPLE1.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   23 Oct 1987 20:09:34  $"
; "rev  : $Revision:   1.26  $"
; "vers : 1.00"
;*****************************************************************************

<OBJECT CH-THEM
   (LOC GLOBAL-OBJECTS)
   (DESC "them")
   (FLAGS FL-NOARTC FL-PLURAL)
   (SYNONYM THEM THEMSELVES)>

<OBJECT CH-ME
   (LOC GLOBAL-OBJECTS)
   (DESC "yourself")
   (FLAGS FL-NOARTC FL-ALIVE FL-PERSON)
   (SYNONYM I ME MYSELF BODY SELF)
   (ADJECTIVE MY)>

<OBJECT CH-YOU
   (LOC GLOBAL-OBJECTS)
   (DESC "myself")
   (FLAGS FL-NOARTC FL-ALIVE FL-PERSON)
   (SYNONYM YOU YOURSELF)>

<OBJECT CH-HIM
   (LOC GLOBAL-OBJECTS)
   (DESC "him")
   (FLAGS FL-NOARTC FL-ALIVE FL-PERSON)
   (SYNONYM HIM HIMSELF)>

<OBJECT CH-HER
   (LOC GLOBAL-OBJECTS)
   (DESC "her")
   (FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-FEMALE)
   (SYNONYM HER HERSELF)>

<OBJECT CH-PLAYER
   (DESC "you")
   (FLAGS FL-NOARTC FL-NODESC FL-ALIVE FL-PERSON)
   (SYNONYM DOCTOR WATSON)
   (ADJECTIVE DOCTOR)
   (SIZE 99 MASS 0 CAPACITY 60)
   (STRENGTH 999)
   (DEXTERITY 15)
   (ACTION RT-AC-CH-PLAYER)>

<OBJECT CH-HOLMES
   (LOC TH-SOFA)
   (DESC "Holmes")
   (FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-ASLEEP
    	  FL-HAS-DESCFCN)
   (SYNONYM HOLMES SHERLOCK DETECTIVE FRIEND COMPANION)
   (ADJECTIVE SHERLOCK)
   (SIZE 99 CAPACITY 60)
   (STRENGTH 999)
   (DEXTERITY 10)
   (ACTION RT-AC-CH-HOLMES)>

<OBJECT CH-MATCH-SNIFFING-DOG
	(LOC RM-MARYLEBONE-RD)
	(DESC "dog")
	(FLAGS FL-NODESC FL-ALIVE FL-TRYTAKE FL-NOALL FL-HAS-DESCFCN)
	(SYNONYM DOG)
	(ADJECTIVE TRAINED)
	(SIZE 15 CAPACITY 15)
	(ACTION RT-AC-CH-MATCH-SNIFFING-DOG)>

<OBJECT CH-TUSSAUDS-GUARD
	(LOC RM-MARYLEBONE-RD)
	(DESC "guard")
	(FLAGS FL-NODESC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL
	       FL-HAS-DESCFCN)
	(SYNONYM GUARD)
	(ADJECTIVE TUSSAUDS)
	(SIZE 99 CAPACITY 60)
	(ACTION RT-AC-CH-TUSSAUDS-GUARD)>

<OBJECT CH-TRAINED-PIGEON
	(LOC CH-SHERMAN)
	(DESC "pigeon")
	(FLAGS FL-ALIVE FL-TAKEABLE FL-HAS-DESCFCN)
	(SYNONYM PIGEON BIRD)
	(ADJECTIVE TRAINED)
	(SIZE 10 CAPACITY 5 MASS 5)
	(VALUE 1)
	(GENERIC RT-GN-PIGEON)
	(ACTION RT-AC-CH-TRAINED-PIGEON)>

<OBJECT CH-SHERMAN
	(LOC RM-SHERMANS-HOUSE)
	(DESC "Sherman")
	(FLAGS FL-NODESC FL-NOARTC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL
	       FL-HAS-DESCFCN)
	(SYNONYM SHERMAN TRAINER)
	(ADJECTIVE OLD)
	(SIZE 99 CAPACITY 60)
	(ACTION RT-AC-CH-SHERMAN)>

<OBJECT CH-BANK-GUARD
	(LOC RM-THREADNEEDLE-ST)
	(DESC "guard")
	(FLAGS FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-NODESC
	       FL-HAS-DESCFCN)
	(SYNONYM GUARD)
	(ADJECTIVE BANK)
	(SIZE 99 CAPACITY 60)
	(ACTION RT-AC-CH-BANK-GUARD)>

<OBJECT CH-WIGGINS
	(LOC RM-THREADNEEDLE-ST)
	(DESC "Wiggins")
	(FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-NODESC
	       FL-BROKEN FL-HAS-DESCFCN)
	(SYNONYM WIGGINS URCHIN BOY COMPANION)
	(SIZE 20 CAPACITY 15)
	(STRENGTH 999)
	(DEXTERITY 10)
	(CONTFCN RT-AC-CH-WIGGINS)
	(ACTION RT-AC-CH-WIGGINS)>

<OBJECT CH-ELIZA-DOOLITTLE
	(LOC RM-COVENT-GARDEN)
	(FLAGS FL-ALIVE FL-PERSON FL-FEMALE FL-TRYTAKE FL-NOALL
	       FL-NEEDS-IDENTITY FL-LOSE-IDENTITY
	       FL-ASLEEP FL-NODESC FL-HAS-DESCFCN FL-HAS-SDESC)
	(OBJ-ADJ 0)
	(OBJ-NOUN 0)
	(ADJECTIVE HER ELIZA\'S GIRL\'S)
	(SYNONYM ELIZA DOOLITTLE GIRL HEART HEARTBEAT)
	(SIZE 99 CAPACITY 10)
	(VALUE 5)
	(ACTION RT-AC-CH-ELIZA-DOOLITTLE)>

<OBJECT CH-PRIME-MINISTER
	(DESC "Prime Minister")
	(FLAGS ;FL-NOARTC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-NODESC
	       FL-HAS-DESCFCN)
	(SYNONYM MINISTER OFFICIAL VISITOR MAN)
	(ADJECTIVE PRIME)
	(SIZE 15)
	(CONTFCN RT-AC-CH-PRIME-MINISTER)
	(ACTION RT-AC-CH-PRIME-MINISTER)>

<OBJECT CH-AKBAR
	(LOC RM-LAIR)
	(DESC "Akbar")
	(FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-HAS-DESCFCN)
	(SYNONYM AKBAR)
	(SIZE 99 CAPACITY 20)
	(VALUE 1)
	(ACTION RT-AC-CH-AKBAR)>

<OBJECT CH-MORIARTY
	(LOC RM-LAIR)
	(DESC "Moriarty")
	(FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL
	       FL-HAS-DESCFCN)
	(SYNONYM PROFESSOR PROF MORIARTY)
	(ADJECTIVE JAMES PROFESSOR PROF)
	(SIZE 99 CAPACITY 20)
	(VALUE 1)
	(ACTION RT-AC-CH-MORIARTY)>

<OBJECT CH-HUDSON
   (LOC RM-ENTRY-HALL)
   (DESC "Mrs Hudson")
   (FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-FEMALE FL-TRYTAKE FL-NOALL
	  FL-HAS-DESCFCN)
   (SYNONYM MRS HUDSON HOUSEKEEPER)
   (ADJECTIVE MRS)
   (SIZE 99 CAPACITY 99)
   (CONTFCN RT-AC-CH-HUDSON)
   (ACTION RT-AC-CH-HUDSON)>

<OBJECT CH-DENKEEPER
	(LOC RM-BAR-OF-GOLD)
	(DESC "denkeeper")
	(FLAGS FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-NODESC
	       FL-HAS-DESCFCN)
	(SYNONYM DENKEEPER PROPRIETOR MAN)
	(SIZE 99 CAPACITY 20)
	(ACTION RT-AC-CH-DENKEEPER)>

<OBJECT CH-LIBRARIAN
	(LOC RM-MANUSCRIPT-ROOM)
	(DESC "lonely librarian")
	(FLAGS FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-NODESC)
	(SYNONYM LIBRARIAN MAN)
	(ADJECTIVE LONELY)
	(SIZE 99 CAPACITY 99)
	(ACTION RT-AC-CH-LIBRARIAN)>

<OBJECT CH-BUTLER
	(LOC RM-DIOGENES-CLUB)
	(DESC "butler")
	(FLAGS FL-NODESC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM BUTLER MAN)
	(SIZE 99 CAPACITY 99)
	(ACTION RT-AC-CH-BUTLER)>

<OBJECT CH-NANNIES
	(LOC RM-KENSINGTON-GARDENS)
	(DESC "nannies")
	(FLAGS FL-NODESC FL-PLURAL FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM NANNIES)
	(SIZE 99 CAPACITY 99)
	(ACTION RT-AC-CH-NANNIES)>

<OBJECT CH-QUEEN
	(LOC RM-BUCKINGHAM-PALACE)
	(DESC "Queen Victoria")
	(FLAGS FL-NOARTC FL-PERSON FL-ALIVE FL-TRYTAKE FL-NOALL FL-FEMALE)
	(SYNONYM QUEEN VICTORIA)
	(ADJECTIVE QUEEN)
	(SIZE 99 CAPACITY 99)>

<OBJECT CH-HOUSEWIVES
	(LOC RM-COVENT-GARDEN)
	(DESC "women")
	(FLAGS FL-NODESC FL-PLURAL FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL
	       FL-HAS-DESCFCN)
	(SYNONYM HOUSEWIVES WIVES WOMEN PEOPLE CROWDS CROWD SHOPPERS)
	(SIZE 99 CAPACITY 99)
	(ACTION RT-AC-CH-HOUSEWIVES)>

<OBJECT CH-PALACE-GUARD
	(LOC RM-QUEENS-GARDENS)
	(DESC "Palace guard")
	(FLAGS FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-HAS-DESCFCN)
	(SYNONYM GUARD)
	(ADJECTIVE PALACE)
	(SIZE 99 CAPACITY 20)
	(ACTION RT-AC-CH-PALACE-GUARD)>

<OBJECT CH-URCHINS
	(LOC RM-THREADNEEDLE-ST)
	(DESC "urchins")
	(FLAGS FL-NODESC FL-PLURAL FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL
	       FL-HAS-DESCFCN)
	(SYNONYM URCHINS)
	(SIZE 99 CAPACITY 99)
	(ACTION RT-AC-CH-URCHINS)>

<OBJECT CH-MEMBERS
	(LOC RM-DIOGENES-CLUB)
	(DESC "members")
	(FLAGS FL-NODESC FL-PLURAL FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL
	       FL-HAS-DESCFCN)
	(SYNONYM MEMBERS)
	(ADJECTIVE CLUB AGING)
	(SIZE 99 CAPACITY 99)
	(ACTION RT-AC-CH-MEMBERS)>

<ROUTINE RT-LIBRARIAN-SAYS-MSG ()
	<COND (<MC-ISNOT? ,CH-LIBRARIAN ,FL-OPENED>
	       <TELL "\"" <RT-PICK-NEXT ,GL-LIBRARIAN-TXT1> ".\"" CR>)
	      (T
	       <TELL "\"" <RT-PICK-NEXT ,GL-LIBRARIAN-TXT2> "\"" CR>)>
	<RTRUE>>

<ROUTINE RT-TELL-ABOUT? (PERSON)
	 <OR <AND <MC-VERB? ASK-ABOUT>
		  <MC-PRSO? .PERSON>>
	     <AND <MC-VERB? TELL-ABOUT>
		  <MC-PRSO? ,CH-ME ,CH-PLAYER>
		  <EQUAL? ,GL-WINNER .PERSON>>
	     <AND <MC-VERB? WHO>
		  <MC-IS? ,GL-PRSO ,FL-PERSON>
		  <EQUAL? ,GL-WINNER .PERSON>>
	     <AND <MC-VERB? WHAT>
		  ;<MC-ISNOT? ,GL-PRSO ,FL-PERSON>
		  <EQUAL? ,GL-WINNER .PERSON>>>>

<ROUTINE RT-WHO-WHAT-FAIL? ()
      <COND (<MC-VERB? WHO WHAT>
	     <TELL "\"Sorry. I don't know what you're talking about.\"" CR>)>>

<ROUTINE RT-NO-CONDITION-MSG (PERSON "OPTIONAL" (STR <>))
	<TELL CTHE .PERSON>
	<RT-IS-ARE-MSG .PERSON>
	<TELL "in no condition to ">
	<COND (.STR
	       <TELL .STR>)
	      (T
	       <TELL "respond">)>
	<TELL "." CR>>

<ROUTINE RT-AC-CH-HOLMES ("OPTIONAL" (CONTEXT <>) "AUX" OBJ)
	<DEBUGGING? <RT-DEBUG-CH-AC "CH-HOLMES" .CONTEXT>>
	<RT-THIS-IS-IT ,CH-HOLMES>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <RT-THIS-IS-IT ,CH-HOLMES>
	       <COND (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
		      <TELL <RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
" is slouched on the sofa, lost in a black mood of despair. He is pale and
emaciated, and his sharp eyes burn with fever. He is staring at a phial that
he holds in one hand. His free hand rests near a hypodermic syringe in a neat
morocco case at his side. You realize that he is fighting a depression brought
on by what he calls \"the dull routine of existence.\"" CR>
		      <RTRUE>)
		     (<MC-IS? ,CH-HOLMES ,FL-LOCKED>
		      <TELL <RT-PICK-NEXT ,GL-HOLMES-DESC-TXT> 
						,K-SECURELY-BOUND-MSG>)
		     (<MC-IS? ,CH-MORIARTY ,FL-LOCKED>
		      <TELL
"Despite his cool exterior, you can tell that Holmes is excited
about nearing the end of the chase">)
		     (<IN? ,CH-HOLMES ,TH-BOAT>
		      <TELL <RT-PICK-NEXT ,GL-HOLMES-DESC-TXT> ,K-SEASICK-MSG>)
		     (<OR <IN? ,CH-HOLMES ,TH-HANSOM-CAB>
			  <IN? ,CH-HOLMES ,TH-GROWLER-CAB>>
		      <TELL <RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
						,K-SITTING-QUIETLY-MSG>)
		     (<IN? ,CH-HOLMES ,TH-SOFA>
		      <TELL <RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
" is sitting on the sofa, gazing intently at you">)
		     (<MC-HERE? ,RM-ENTRY-HALL ,RM-PARLOUR ,RM-VESTIBULE
		                ,RM-HOLMES-STUDY ,RM-HOLMES-BEDROOM>
		      <TELL <RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
			    <RT-PICK-NEXT ,GL-HOLMES-HOUSE-LOOK-TXT>>)
		     (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
		      <TELL <RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
			    <RT-PICK-NEXT ,GL-HOLMES-INDOORS-LOOK-TXT>>)
		     (T
		      <TELL <RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
			    <RT-PICK-NEXT ,GL-HOLMES-OUTDOORS-LOOK-TXT>>)>
	       <TELL "." CR>
	       <RETURN 2>)
	      (<RT-TELL-ABOUT? ,CH-HOLMES>
	       <SET OBJ <COND (<MC-VERB? WHO WHAT>
			       ,GL-PRSO)
			      (T
			       ,GL-PRSI)>>
	       <COND (<RT-HOLMES-DESCRIBE-MSG? .OBJ>
		      <RTRUE>)
		     (T
		      <TELL
"\"You must draw your own inferences, Watson.\"" CR>)>)
	      (<RT-WHO-WHAT-FAIL?>
	       <RFATAL>)
	      (<MC-THIS-WINNER?>
	       <COND (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
		      <TELL CTHE ,CH-HOLMES ,K-SEEMS-TO-HEAR-MSG CR>)
		     (<MC-VERB? HELLO>
		      <TELL "Holmes returns your greeting." CR>)
		     (<MC-VERB? GOODBYE>
		      <TELL "\"Farewell for now, Watson.\"" CR>)
		     (<MC-VERB? THANK>
		      <TELL
"\"No need for thanks, Watson. The work itself is my reward.\"" CR>)
		     (<MC-VERB? WHERE>
		      <COND (<AND <MC-PRSO? ,TH-STETHOSCOPE>
				  <MC-ISNOT? ,TH-STETHOSCOPE ,FL-TOUCHED>>
			     <TELL ,K-CUSTOMARILY-KEEP-MSG CR>)
			    (<RT-VISIBLE? ,GL-PRSO>
			     <TELL
"\"There's your problem in a nutshell, Watson. You see, but you do not
observe. ">
			     <COND (<MC-PRSO? ,CH-HOLMES>
				    <TELL "I am ">)
				   (<MC-PRSO? ,CH-ME ,CH-PLAYER>
				    <TELL "You are ">)
				   (T
				    <TELL CTHEO>
				    <RT-IS-ARE-MSG>)>
			     <TELL "right here!\"" CR>)
			    (T
			     <TELL ,K-WORK-OUT-YOURSELF-MSG CR>)>)
		     (<MC-VERB? WHO WHAT>
		      <TELL ,K-WORK-OUT-YOURSELF-MSG CR>)
		     (<MC-VERB? YES>
		      <TELL ,K-GOOD-SHOW-MSG CR>)
		     (<MC-VERB? NO>
		      <TELL ,K-PITY-MSG CR>)
		     (<MC-VERB? MAYBE>
		      <TELL ,K-MAYBE-MSG CR>)
		     (<OR <AND <MC-VERB? TAKE>
			       <MC-PRSO? TH-BREATH>>
			  <MC-VERB? INHALE>>
		      <COND (<MC-IS? ,TH-BREATH ,FL-LOCKED>
			     <TELL "Holmes seems to be holding his breath
already." CR>
			     <RTRUE>)>
		      <TELL
		       "Holmes hears your whispered instruction, and as you
draw a deep breath, he surreptitiously does the same." CR>
		      <RT-ALARM-SET-REL ,RT-I-EXHALE <RT-PARM-SET 0 2 0>>
		      <MC-MAKE ,TH-BREATH ,FL-LOCKED>
		      <SETG GL-CLOCK-WAIT T>
		      <RTRUE>)
		     (<AND <RT-TOUCH-VERB?>
			   <MC-IS? ,CH-HOLMES ,FL-LOCKED>>
		      <TELL "Holmes can't do that. He is tied up." CR>)
		     (<AND <MC-VERB? TAKE WEAR>
			   <OR <MC-PRSO? ,TH-RING>
			       <AND <MC-PRSO? ,TH-ETHERIUM-AMPOULE>
				    <MC-ISNOT? ,TH-ETHERIUM-AMPOULE 
							,FL-BROKEN>>>>
		      <TELL ,K-PLEASE-KEEP-IT-MSG CR>)
		     (<AND <MC-VERB? RAISE TAKE>
			   <MC-PRSO? ,CH-PLAYER ,CH-ME>>
		      <TELL "Holmes struggles to lift you">
		      <COND (<IN? ,CH-PLAYER ,TH-BOAT>
			     <TELL ", the boat starts to rock violently">)>
		      <TELL
", then he thinks better of it and abandons the attempt." CR>)
		     (<MC-VERB? TAKE GUESS DROP GIVE-SWP>
		      <RFALSE>)
		     (<AND <MC-VERB? READ EXAMINE LOOK-ON LOOK-INSIDE OPEN SEARCH>
			   <MC-PRSO? ,TH-MAIL>>
		      <TELL
"Holmes glances at the envelopes and shrugs. \"They are of no
consequence, Watson.\"" CR>)
		     (<AND <MC-VERB? PLAY>
			   <MC-PRSO? ,TH-VIOLIN>>
		      <COND (<NOT <IN? ,TH-VIOLIN ,CH-HOLMES>>
			     <TELL "Holmes is not holding " THEO "." CR>)
			    (T
			     <IFSOUND <SOUNDS ,S-VIOLIN>>
			     <TELL
"Holmes pauses for a moment in meditation, then lifts the violin to his chin
and plays a brief, haunting melody whose melancholy notes fill the air with
beauty. Then, just as quickly, he is finished." CR>)>)
		     (<AND <MC-VERB? GIVE>
			   <MC-PRSI? ,CH-ME ,CH-PLAYER>>
		      <COND (<IN? ,GL-PRSO ,CH-HOLMES>
			     <MOVE ,GL-PRSO ,CH-PLAYER>
			     <TELL "Holmes gives you " THEO "." CR>)
			    (<AND <MC-PRSO? ,TH-RING>
				  <IN? ,TH-RING ,LOCAL-GLOBALS>>
			     <TELL
"Holmes says, \"I haven't mentioned any ring, Watson.\"" CR>)
			    (T
			     <TELL
"Holmes says, \"I do not have " THEO ".\"" CR>)>)
		     (<MC-VERB? FOLLOW>
		      <COND (<IN? ,CH-HOLMES ,TH-SOFA>
			     <TELL
"Holmes says, \"We shouldn't leave until we have spoken with our
visitor.\"" CR>)
			    (<MC-PRSO? ,CH-ME ,CH-PLAYER>
			     <TELL
"Holmes says, \"Lead the way, Watson.\"" CR>
			     <SETG GL-PUPPY ,CH-HOLMES>)
			    (T
			     <TELL
"Holmes says, \"We should remain together, Watson.\"" CR>)>)
		     (T
		      <TELL "\"Come now, Watson. You must try it yourself.\"" CR>)>)
	      (<MC-THIS-PRSI?>
	       <COND (<MC-VERB? GIVE>
		      <COND (<AND <MC-PRSO? ,TH-NEWSPAPER>
				  <MC-IS? ,CH-HOLMES ,FL-ASLEEP>>
			     <RFALSE>)
			    (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
			     <TELL
"Holmes glances at " THEO ", but it doesn't seem to arouse his interest." CR>)
			    (<MC-IS? ,CH-HOLMES ,FL-LOCKED>
			     <TELL
"Holmes's hands aren't free. You can't give him anything." CR>)
			    (<OR <MC-PRSO? ,TH-RING>
				 <AND <MC-PRSO? ,TH-ETHERIUM-AMPOULE>
				      <MC-ISNOT? ,TH-ETHERIUM-AMPOULE 
							,FL-BROKEN>>>
			     <TELL ,K-PLEASE-KEEP-IT-MSG CR>)
			    (T
			     <MOVE ,GL-PRSO ,CH-HOLMES>
			     <RT-CYOU-MSG "give" "gives">
			     <TELL THEO
" to him. He examines it briefly and says, ">
			     <COND (<RT-HOLMES-DESCRIBE-MSG? ,GL-PRSO>
				    <RTRUE>)
				   (T
				    <TELL "\"Hmmph.\"" CR>)>)>)
		     (<MC-VERB? SHOW>
		      <COND (<AND <MC-PRSO? ,TH-NEWSPAPER>
				  <MC-IS? ,CH-HOLMES ,FL-ASLEEP>>
			     <RFALSE>)
			    (<RT-HOLMES-DESCRIBE-MSG? ,GL-PRSO>
			     <RTRUE>)
			    (T
			     <TELL
"Holmes glances at " THEO ", but makes no comment." CR>)>)>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? DIAGNOSE>
		      <COND (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
			     <TELL "He is in a trance-like state as he stares
at the phial. You quickly realize that unless he hears something of
interest, he will turn to the deadly drug to relieve his boredom." CR>)>)
		     (<MC-VERB? HIT ALARM>
		      <COND (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
			     <TELL ,K-HOLMES-DISTRACTION-MSG CR>)>)
		     (<MC-VERB? ASK-FOR>
		      <COND (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
			     <TELL "Holmes does not respond." CR>)
			    (<MC-IS? ,CH-HOLMES ,FL-LOCKED>
			     <TELL
"Holmes can't give you anything. He is tied up." CR>)
			    (<AND <MC-PRSI? ,TH-RING>
				  <IN? ,TH-RING ,LOCAL-GLOBALS>>
			     <TELL
"Holmes says, \"I haven't mentioned any ring, Watson.\"" CR>)
			    (<IN? ,GL-PRSI ,CH-HOLMES>
			     <MOVE ,GL-PRSI ,CH-PLAYER>
			     <TELL "Holmes gives you " THEI "." CR>)
			    (T
			     <TELL
"Holmes says, \"I do not have " THEI ".\"" CR>)>)
		     (<MC-VERB? TELL-ABOUT>
		      <COND (<AND <MC-PRSI? ,LG-TOWER ,TH-NEWSPAPER
							 ,CH-PRIME-MINISTER>
				  <MC-IS? ,CH-HOLMES ,FL-ASLEEP>>
			     <MC-MAKE ,GL-PRSI ,FL-HOLMES-TOLD>
			     <RT-WAKE-UP-HOLMES>)
			    (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
			     <TELL CTHE ,CH-HOLMES ,K-SEEMS-TO-HEAR-MSG CR>)
			    (<MC-ISNOT? ,GL-PRSI ,FL-HOLMES-TOLD>
			     <MC-MAKE ,GL-PRSI ,FL-HOLMES-TOLD>
			     <TELL
"Holmes nods thoughtfully and says, \"Most interesting, old fellow.\"" CR>)
			    (T
			     <TELL
"\"Don't be tedious, Watson. You have mentioned ">
			     <RT-SAY-HIM-HER-THEM-IT-MSG ,GL-PRSI>
			     <TELL " to me already.\"" CR>)>)>)>>

<ROUTINE RT-HOLMES-SAYS-AGRA-MSG ()
	<TELL
" says, \"It's obviously not one of the Crown Jewels, Watson. In fact,
this gem belongs to the Agra treasure, which was stolen in India many years
ago and has never been recovered.\"" CR CR

"\"The case grows more complex, Watson. We are in more danger than I
had at first suspected.\" He removes a ring from one of his long, slender
fingers and hands it to you. \"Here, Watson. Take this signet ring of
mine. If anything should happen to me, take it to my brother Mycroft
at the Diogenes Club. He'll tell you what to do.\"" CR>>

<ROUTINE RT-HOLMES-DESCRIBE-MSG? (OBJ "AUX" WRD)
	<COND (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
	       <TELL CTHE ,CH-HOLMES ,K-SEEMS-TO-HEAR-MSG CR>)
	      (<MC-IS? ,CH-MORIARTY ,FL-LOCKED>
	       <TELL
"\"There is no time for questions, Watson. We must get the Crown Jewels to
Buckingham Palace before nine o'clock.\"" CR>)
	      (<AND <MC-VERB? WHO>
		    <MC-PRSO? ,CH-HOLMES>>
	       <TELL
"\"Watson, as my biographer, you know me as well as anyone.\"" CR>)
	      (<EQUAL? .OBJ ,CH-MORIARTY>
	       <COND (<MC-IS? ,CH-HOLMES ,FL-LOCKED>
		      <TELL
"\"He appears to have the upper hand, Watson.\"" CR>)
		     (T
		      <TELL
"\"He is the Napoleon of crime, Watson. He is the organizer of half that is
evil and of nearly all that is undetected in this great city.\"" CR>)>)
	      (<RT-IDENTIFY-EVENT? ,W?MYCROFT .OBJ>
	       <TELL
"\"Mycroft is my older brother, of whom you have heard me speak. As you know,
he is a highly placed official within Her Majesty's government. Because of
the confidential nature of his work, you cannot call upon him in his offices.
However, he is usually to be found in his club, just off Trafalgar
Square.\"" CR>)
	      (<EQUAL? .OBJ ,CH-HOLMES>
	       <TELL "\"I'm well, Watson. Thank you for asking.\"" CR>)
	      (<EQUAL? .OBJ ,CH-PRIME-MINISTER>
	       <COND (<IN? ,CH-PRIME-MINISTER ,RM-HOLMES-STUDY>
		      <TELL "\"Hush, my friend. Wait until we're alone.\"" CR>)
		     (<MC-ISNOT? ,CH-PRIME-MINISTER ,FL-SEEN>
		      <TELL
"\"I haven't seen this visitor of whom you speak, Watson, but surely it is
obvious that he has come because the Crown Jewels have been stolen from the
Tower of London.\"" CR>) 
		     (T
		      <TELL
"\"Surely you recognized him, old fellow. He is the Prime Minister of
England.\"" CR>)>)
	      (<EQUAL? .OBJ ,CH-QUEEN>
	       <TELL
"\"She must be worried, Watson. We must get the gems back for her.\"" CR>)
	      (<EQUAL? .OBJ ,CH-WIGGINS>
	       <TELL
"\"Surely you remember him, dear fellow. He is the head of the Baker Street
Irregulars.\"" CR>)
	      (<RT-IDENTIFY-EVENT? ,W?LESTRADE .OBJ>
	       <TELL
"\"Be kind to him, Watson. He has delusions of adequacy.\"" CR>)
	      (<RT-IDENTIFY-EVENT? ,W?THEFT .OBJ>
	       <TELL
"\"We must recover the jewels and return them to the Palace. The
alternative is too horrible to consider.\"" CR>)
	      (<EQUAL? .OBJ ,TH-CROWN-JEWELS>
	       <TELL
"\"We must recover them and return them to the Palace. The
alternative is too horrible to consider.\"" CR>)
	      (<OR <EQUAL? .OBJ ,LG-TOWER>
		   <RT-IDENTIFY-EVENT? ,W?THEFT .OBJ>>
	       <TELL
"\"The Tower is the safest stronghold in the nation. Our adversary
must be formidable indeed.\"" CR>)
	      (<RT-IDENTIFY-EVENT? ,W?JUBILEE .OBJ>
	       <TELL
"\"The Coronation Day festivities begin Monday morning at 9:00. We must
recover the Crown Jewels before then.\"" CR>)
	      (<EQUAL? .OBJ ,LG-TOMBS-ABBEY>
	       <TELL
"\"It is the burial place of our royalty, Watson. The spiritual centre
of the empire.\"" CR>)
	      (<RT-IDENTIFY-EVENT? ,W?PASSWORD .OBJ>
	       <COND (<MC-IS? ,CH-HOLMES ,FL-LOCKED>
		      <TELL
"\"Obviously you were able to deduce it without my help, Watson. Good show!\"" CR>)
		     (T
		      <TELL
"\"Patience, old fellow. We are not yet in possession of all the facts.\"" CR>)>)
	      (<OR <EQUAL? .OBJ ,TH-WALL>
		   <RT-IDENTIFY-FLOOR? ,W?GROUND .OBJ>
		   <RT-IDENTIFY-FLOOR? ,W?FLOOR .OBJ>>
	       <TELL
"\"No need to ask about that, old fellow. I'll tell you straight away if
I find anything of interest.\"" CR>)
	      (<RT-IDENTIFY-FLOOR? ,W?SKY .OBJ>
	       <TELL "Holmes glances up and says, \"It's an uncommonly fine ">
	       <COND (<EQUAL? <RT-TIME-OF-DAY> 0>
		      <TELL "night">)
		     (<EQUAL? <RT-TIME-OF-DAY> 1>
		      <TELL "morning">)
		     (<EQUAL? <RT-TIME-OF-DAY> 2>
		      <TELL "day">)
		     (T 
		      <TELL "evening">)>
	       <TELL ", Watson.\"" CR>)
	      (<AND <EQUAL? .OBJ ,TH-STETHOSCOPE>
		    <MC-ISNOT? ,TH-STETHOSCOPE ,FL-TOUCHED>>
	       <TELL ,K-CUSTOMARILY-KEEP-MSG CR>)
	      (<RT-IDENTIFY-EVENT? ,W?HENRY .OBJ>
	       <TELL
"\"He was the son of John of Gaunt, and the father of Henry V.\"" CR>)
	      (<RT-IDENTIFY-EVENT? ,W?WELLINGTON .OBJ>
	       <TELL
"\"My dear fellow, your memory is fading prematurely. Surely you
remember that the Duke of Wellington was the hero of the battle of
Waterloo.\"" CR>)
	      (<RT-IDENTIFY-EVENT? ,W?TOBY .OBJ>
	       <TELL
"\"He is a noble hound whose olfactory prowess is unrivaled.">
	       <COND (<MC-IS? ,CH-SHERMAN ,FL-SEEN>
		      <TELL
" It is unfortunate that he is unavailable to help us in our quest.">)>
	       <TELL "\"" CR>)
	      (<RT-IDENTIFY-EVENT? ,W?AGRA .OBJ>
	       <TELL
"\"The Agra treasure disappeared during the Sepoy rebellion in
India. Clearly it has found its way to London.\"" CR>)
	      (<RT-IDENTIFY-EVENT? ,W?KIDNAPPING .OBJ>
	       <COND (<0? <ANDB ,MYCROFT-STATE ,MYCROFT-SEEN>>
		      <TELL ,K-NEVER-THEORIZE-MSG CR>)
		     (T
		      <TELL
"\"The professor was as surprised as we, Watson. Evidently it was a mistake
on the part of one of his minions.\"" CR>)>)
	      (<EQUAL? .OBJ ,CH-HUDSON>
	       <TELL
"\"A splendid housekeeper, Watson, although she worries about me too
much.\"" CR>)
	      (<EQUAL? .OBJ ,CH-PLAYER ,CH-ME>
	       <TELL
"\"Good old Watson! You are the one fixed point in a changing age. I am
honoured that you have become my biographer.\"" CR>)
	      (<EQUAL? .OBJ ,TH-PHIAL ,TH-SYRINGE ,TH-LIQUID>
	       <TELL
"Holmes gives you a grateful look and says, \"We need no longer worry
about that, Watson, thanks to your timely intervention.\"" CR>)
	      (<MC-ISNOT? .OBJ ,FL-SEEN>
	       <TELL ,K-NEVER-THEORIZE-MSG CR>)
	      (<EQUAL? .OBJ ,CH-MATCH-SNIFFING-DOG>
	       <TELL
"\"It's not the Hound of the Baskervilles. But I certainly wouldn't
care to make it angry.\"" CR>)
	      (<EQUAL? .OBJ ,CH-TUSSAUDS-GUARD>
	       <TELL
"\"Beyond the obvious facts that he is left-handed, ate kippers for
breakfast, and had a poor night's sleep, I can tell you that he is
a good, honest workman. Britain could use more like him.\"" CR>)
	      (<EQUAL? .OBJ ,CH-TRAINED-PIGEON>
	       <TELL "\"A fine bird, Watson.">
	       <COND (<RT-VISIBLE? ,CH-TRAINED-PIGEON>
		      <TELL
" Note the broad band on his wing that distinguishes his breed from all
others.">)>
	       <TELL "\"" CR>)
	      (<EQUAL? .OBJ ,CH-SHERMAN>
	       <TELL
"\"Oh, he's an old friend of mine. He has an extraordinary bloodhound
named Toby who has been of invaluable assistance to me in the past.\"" CR>)
	      (<EQUAL? .OBJ ,CH-BANK-GUARD>
	       <TELL
"\"Watch him carefully, Watson. He is a petty criminal on the lowest
rung of Moriarty's organization. He's not to be trusted.\"" CR>)
	      (<EQUAL? .OBJ ,CH-AKBAR>
	       <TELL
"\"He is the gentleman from India whom we discussed earlier.\"" CR>)
	      (<EQUAL? .OBJ ,CH-DENKEEPER>
	       <TELL
"\"Be careful of him Watson. He is one of Moriarty's minions.\"" CR>)
	      (<EQUAL? .OBJ ,CH-LIBRARIAN>
	       <TELL
"\"He's just a harmless old fellow who is starved for companionship. It's
a wonder he hasn't retired and joined his twin brother who lives in
New Zealand.\"" CR>)
	      (<EQUAL? .OBJ ,CH-URCHINS>
	       <TELL
"\"They're all members of the Baker Street Irregulars.\"" CR>)
	      (<EQUAL? .OBJ ,CH-VENDOR>
	       <TELL
"\"He's harmless enough, although his goods are terribly overpriced.\"" CR>)
	      (<EQUAL? .OBJ ,CH-GROWLER-CABBIE>
	       <TELL
"\"He doesn't seem very bright, does he?\"" CR>)
	      (<EQUAL? .OBJ ,CH-HANSOM-CABBIE>
	       <TELL
"\"It's clear that he has a loving wife and that he is a retired marine
sergeant. Beyond that I can tell you little.\"" CR>)
	      (<EQUAL? .OBJ ,CH-BUTLER>
	       <TELL
"\"He's a supercilious old coot who ought to be stuffed.\"" CR>)
	      (<EQUAL? .OBJ ,CH-NANNIES>
	       <TELL
"\"They are the backbone of the empire, Watson.\"" CR>)
	      (<EQUAL? .OBJ ,CH-PALACE-GUARD>
	       <TELL
"\"He is obviously one of the Queen's finest - dedicated, loyal, and
completely incorruptible.\"" CR>)
	      (<EQUAL? .OBJ ,CH-TOWER-GUARD>
	       <TELL
"\"I can tell you little about him, other than that he is incorruptible,
he lives near Wandsworth Common, and he once worked in a tin mine.\"" CR>)
	      (<EQUAL? .OBJ ,CH-ELIZA-DOOLITTLE>
	       <COND (<MC-IS? ,CH-ELIZA-DOOLITTLE ,FL-ASLEEP>
		      <TELL
"\"I bow to your medical expertise, doctor. What is your diagnosis?\"" CR>)
		     (T
		      <TELL
"\"You saved her life, Watson. Professor Higgins will be most grateful.\"" CR>)>)
	      (<EQUAL? .OBJ ,LG-RAVENS>
	       <TELL
"\"According to the legend, when the ravens leave the Tower of London,
the British Empire will fall.\"" CR>)
	      (<EQUAL? .OBJ ,TH-GUN ,TH-TOBACCO ,TH-PERSIAN-SLIPPER
		       ,TH-MAGNIFYING-GLASS ,TH-LAMP ,TH-BED
		       ,TH-BEDSIDE-TABLE ,TH-PIPE>
	       <TELL
"\"Surely you remember it, Watson. Little has changed in the time since you
left.\"" CR>)
	      (<EQUAL? .OBJ ,TH-WATSONS-HAT ,TH-STETHOSCOPE ,TH-POCKET
		            ,TH-WATSONS-COAT ,TH-BLACK-BAG ,TH-CAB-WHISTLE>
	       <TELL "\"Other than the obvious fact that it belongs to you, I can tell you nothing.\"" CR>)
	      (<EQUAL? .OBJ ,TH-BLUE-PILL-BOTTLE ,TH-BROWN-PILL-BOTTLE
			    ,TH-ORANGE-PILL ,TH-YELLOW-PILL>
	       <TELL 
"\"Surely you know more about it than I, Doctor.\"" CR>)
	      (<EQUAL? .OBJ ,TH-LAB-EQUIPMENT ,TH-ETHERIUM-GAS
		            ,TH-ETHERIUM-AMPOULE ,TH-WORKBENCH>
	       <TELL
"Holmes glances around quickly and then whispers, \"I know I can trust
your discretion, Watson, but you must promise to keep this under your
hat. I have been conducting secret experiments for the government at Mycroft's
request, and I have developed a new knockout gas that I call 'etherium.' It
is an extremely powerful derivative of ether, and one ampoule
of it will render unconscious an entire room of people for several hours. It
has no harmful side effects, but it is highly explosive and extremely
dangerous to use near open flames. You may keep it if you wish, but please
carry it in a secure place, safe from prying eyes.\"" CR>)
	      (<EQUAL? .OBJ ,TH-CHARLES-STATUE>
	       <TELL
"\"He is the only English king to have been beheaded.\"" CR>)
	      (<EQUAL? .OBJ ,TH-WILLIAM-STATUE>
	       <TELL
"\"They say when he first came ashore, he stumbled and fell, and his soldiers
took it as a bad omen. But then he arose with two fistfuls of sand and
shouted, 'See! Already I have taken my kingdom into my grasp.' His men
cheered and they marched on to victory at the Battle of Hastings.\"" CR>)
	      (<EQUAL? .OBJ ,TH-WALTER-STATUE>
	       <TELL
"\"His chivalry did him no good. Although a favourite of the Queen for many
years, his life ended on the executioner's block.\"" CR>)
	      (<EQUAL? .OBJ ,TH-VIOLIN>
	       <TELL "\"It's a Stradivarius.\"" CR>)
	      (<EQUAL? .OBJ ,TH-RING>
	       <TELL
"\"It's an heirloom that's been in my family for generations.\"" CR>)
	      (<EQUAL? .OBJ ,TH-TRINKETS>
	       <TELL
"\"They've been marked up for the Jubilee. I certainly wouldn't pay full
price for them.\"" CR>)
	      (<EQUAL? .OBJ ,TH-WESTMINSTER-CLUE>
	       <TELL
"\"Most curious, don't you agree Watson? All thieves unintentionaly leave
behind clues that are discernable to the trained eye. But it is highly
irregular for a thief to taunt the authorities with an actual message.
Especially one with references as obvious as this.\"" CR>)
	      (<EQUAL? .OBJ ,TH-RUBY ,TH-EMERALD ,TH-SAPPHIRE
		            ,TH-GARNET ,TH-OPAL ,TH-TOPAZ>
	       <COND (<BAND ,CH-HOLMES-AUX1 ,K-HOLMES-GEM?>
		      <TELL
"\"We have already discussed the significance of these gems, Watson.\"" CR>)
		     (<MC-IS? .OBJ ,FL-TOUCHED>
		      <SETG CH-HOLMES-AUX1
			    <BOR ,CH-HOLMES-AUX1 ,K-HOLMES-GEM?>>
		      <MOVE ,TH-RING ,CH-PLAYER>
		      <MC-MAKE ,TH-RING ,FL-SEEN>
		      <MC-MAKE ,TH-RING ,FL-TOUCHED>
		      <MC-UNMAKE ,TH-RING ,FL-NODESC>
		      <TELL "Holmes">
		      <RT-HOLMES-SAYS-AGRA-MSG>
		      <RT-UPDATE-SCORE <GETP ,TH-RING ,P?VALUE>>
		      <PUTP ,TH-RING ,P?VALUE 0>
		      <RTRUE>)
		     (T
		      <TELL
"\"We haven't had a good enough look at it yet, old fellow.\"" CR>)>)
	      (<EQUAL? .OBJ ,TH-ASH>
	       <TELL "\"">
	       <COND (<RT-VISIBLE? ,TH-ASH>
		      <TELL "Note the characteristic texture, Watson. ">)>
	       <TELL
"It is the ash of a Trichinopoly cigar, which is made from the dark tobacco
that grows only in the Madras district of India." CR CR

"Unless I miss my guess, Watson, our mastermind friend has joined forces
with an Indian accomplice who does his dirty work for him.\"" CR>)
	      ;(<EQUAL? .OBJ ,TH-UNINTERESTING-OBJECT>
		<TELL
"\"Quite outside my experience, Watson. I've never seen anything like
it. Not very interesting, though, is it?\"" CR>)>>

<ROUTINE RT-AC-CH-MATCH-SNIFFING-DOG ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-CH-AC "CH-MATCH-SNIFFING-DOG" .CONTEXT>>
	<RT-THIS-IS-IT ,CH-MATCH-SNIFFING-DOG>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL CTHE ,CH-MATCH-SNIFFING-DOG
" glares back at you menacingly." CR>
	       <RTRUE>)>
	<COND (<MC-THIS-WINNER?>
	       <TELL CTHE ,CH-MATCH-SNIFFING-DOG ,K-GNAWS-MSG CR>
	       <RTRUE>)
	      (<MC-THIS-PRSI?>
	       <COND (<AND <MC-VERB? GIVE SHOW>
		           <OR <AND <NOT <MC-PRSO? ,TH-TOBACCO>>
				    <FSET? ,GL-PRSO ,FL-BURNABLE>
				    <FSET? ,GL-PRSO ,FL-LIGHTED>>
			       <AND <MC-PRSO? ,TH-MATCH>
				    <FSET? ,GL-PRSO ,FL-BURNABLE>>
			       <MC-PRSO? ,TH-LAMP>>>
		      <IFSOUND <SOUNDS ,S-BARK ,S-START 8 4>>
		      <TELL CTHEI " barks loudly at " THEO "." CR>
		      <RTRUE>)	      
		     (T
		      <RFALSE>)>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? TOUCH KICK>
		      <TELL
"A quick snap and a glimpse of flashing teeth changes your mind." CR>
		      <RTRUE>)
		     (<MC-VERB? LISTEN>
		      <TELL CTHEO " growls at you." CR>
		      <IFSOUND <SOUNDS ,S-GROWL>>
		      <RTRUE>)
		     (<MC-VERB? ASK-FOR ASK-ABOUT>
		      <TELL CTHE ,CH-MATCH-SNIFFING-DOG ,K-GNAWS-MSG CR>
		      <RTRUE>)
		     (<AND <MC-VERB? SHOOT>
			   <MC-PRSO? CH-MATCH-SNIFFING-DOG>>
		      <RT-CYOU-MSG "shoot" "shoots">
		      <TELL
"the unfortunate dog. The guard, enraged by this
callous behavior, wrestles you to the ground and calls for a
policeman. Lestrade pops up out of nowhere and says, \"Tut, tut. Killing
a poor defenceless dog now, is it? You should be ashamed of yourself.\"" CR CR
"He hauls you away and enrolls you in a six-month course sponsored by
the RSPCA which teaches you to love animals and eat vegetables. You emerge
from the course a better man. Unfortunately no one cares because by then
the country has gone to the dogs." CR CR>
		      <RT-QSR>)>
	       <RFALSE>)>>

<ROUTINE RT-AC-CH-TUSSAUDS-GUARD ("OPTIONAL" (CONTEXT <>) OBJ)
	<DEBUGGING? <RT-DEBUG-CH-AC "CH-TUSSAUDS-GUARD" .CONTEXT>>
	<RT-THIS-IS-IT ,CH-TUSSAUDS-GUARD>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
CTHE ,CH-TUSSAUDS-GUARD " has his collar turned up against the cold. He is
pacing back and forth, puffing on a cigarette, and stamping his feet, all
in a futile effort to keep warm." CR>
	       <RTRUE>)
	      (<AND <MC-VERB? ASK-FOR>
		    <MC-PRSI? ,TH-CIGARETTE>>
	       <TELL "\"Sorry, sir. I'm running low.\"" CR>)
	      (<AND <MC-VERB? ASK-ABOUT>
		    <MC-PRSI? ,TH-CIGARETTE>>
	       <TELL "\"I'm a chain smoker. Fortunately, the dog doesn't seem to mind.\"" CR>)
	      (<RT-TELL-ABOUT? ,CH-TUSSAUDS-GUARD>
	       <SET OBJ <COND (<MC-VERB? WHO WHAT>
			       ,GL-PRSO)
			      (T
			       ,GL-PRSI)>>
	       <TELL ,K-ON-DUTY-MSG CR>)
	      (<RT-WHO-WHAT-FAIL?>
	       <RFATAL>)
	      (<MC-THIS-WINNER?>
	       <COND (<AND <MC-VERB? WHERE>
			   <RT-VISIBLE? ,GL-PRSO>>
		      <TELL "\"Right here, sir.\"" CR>
		      <RTRUE>)
		     (<MC-VERB? YES>
		      <TELL ,K-GOOD-SHOW-MSG CR>)
		     (<MC-VERB? NO>
		      <TELL ,K-PITY-MSG CR>)
		     (<MC-VERB? MAYBE>
		      <TELL ,K-MAYBE-MSG CR>)
		     (T
		      <TELL ,K-ON-DUTY-MSG CR>)>)
	      (<MC-THIS-PRSI?>
	       <COND (<MC-VERB? TAKE>
		      <RT-IMPOLITE-MSG "take things" "asking">)>)
	      (<MC-THIS-PRSO?>
	       <RFALSE>)>>

<ROUTINE RT-PIGEON-PANIC ()
	<MOVE ,CH-TRAINED-PIGEON ,CH-PLAYER>
	<TELL
CTHE ,CH-TRAINED-PIGEON " flies about in a panic for a few moments and then
flies right back into your hands." CR>>

<ROUTINE RT-PIGEON-FLY ()
	<TELL " flies up into the air">
	<COND (<==? ,GL-PLACE-CUR ,RM-TRAFALGAR-SQUARE>
	       <SETG CH-TRAINED-PIGEON-AUX3 ,TH-RED-GLASS>
	       <COND (<AND <BAND ,CH-TRAINED-PIGEON-AUX1 ,K-PIGEON-SHOWN-RUBY>
			   <BAND ,CH-TRAINED-PIGEON-AUX1 ,K-PIGEON-GET-RUBY>>
		      <TELL ", gets " THE ,TH-RUBY ",">
		      <SETG CH-TRAINED-PIGEON-AUX3 ,TH-RUBY>)
		     (<BAND ,CH-TRAINED-PIGEON-AUX1 ,K-PIGEON-SHOWN-RUBY>
		      <TELL ", sees " THE ,TH-RUBY " and " A ,TH-RED-GLASS
" that you didn't see, chooses " THE ,TH-RED-GLASS ",">)
		     (<BAND ,CH-TRAINED-PIGEON-AUX1 ,K-PIGEON-GET-RUBY>
		      <TELL ", sees " A ,TH-RED-GLASS " that you didn't see,
gets it,">)>)>
	<COND (<NOT <0? ,CH-TRAINED-PIGEON-AUX3>>
	       <MC-MAKE ,CH-TRAINED-PIGEON-AUX3 ,FL-TAKEABLE>
	       <MOVE ,CH-TRAINED-PIGEON-AUX3 ,CH-TRAINED-PIGEON>)>
	<MOVE ,CH-TRAINED-PIGEON ,GL-PLACE-CUR>
	<MC-MAKE ,CH-TRAINED-PIGEON ,FL-NODESC>
	<SETG CH-TRAINED-PIGEON-AUX2 1>
	<RT-ALARM-SET-REL ,RT-I-PIGEON-CIRCLE <RT-PARM-SET 0 1 0>>
	<TELL " and starts to circle high over your head." CR>>

<ROUTINE RT-AC-CH-TRAINED-PIGEON ("OPTIONAL" (CONTEXT <>) OBJ)
      <DEBUGGING? <RT-DEBUG-CH-AC "CH-TRAINED-PIGEON" .CONTEXT>>
      <RT-THIS-IS-IT ,CH-TRAINED-PIGEON>
      <COND (<==? .CONTEXT ,K-M-DESCFCN>
	     <COND (<IN? ,CH-TRAINED-PIGEON ,CH-SHERMAN>
		    <TELL D ,CH-SHERMAN " is holding " THE ,CH-TRAINED-PIGEON>)
		   (<MC-T? ,CH-TRAINED-PIGEON-AUX2>
		    <RTRUE>)
		   (T
		    <TELL CTHE ,CH-TRAINED-PIGEON>
		    <COND (<AND <BAND ,CH-TRAINED-PIGEON-AUX1
					    ,K-PIGEON-SHOWN-RUBY>
				<BAND ,CH-TRAINED-PIGEON-AUX1
					    ,K-PIGEON-GET-RUBY>>
			   <TELL " trembles with excitement">)
			  (<T? <BAND ,CH-TRAINED-PIGEON-AUX1 
				      	    <+ ,K-PIGEON-SHOWN-RUBY
						 ,K-PIGEON-GET-RUBY>>>
			   <TELL " looks interested">)
			  (T
			   <TELL " doesn't seem interested in anything">)>)>
	     <TELL "." CR>
	     <RTRUE>)
	    (<RT-TELL-ABOUT? ,CH-TRAINED-PIGEON>
	     <SET OBJ <COND (<MC-VERB? WHO WHAT>
			     ,GL-PRSO)
			    (T
			     ,GL-PRSI)>>
	     <TELL ,K-CONFUSED-MSG CR>)
	    (<RT-WHO-WHAT-FAIL?>
	     <RFATAL>)
	    (<MC-THIS-WINNER?>
	     <COND (<AND <MC-VERB? TAKE>
			 <MC-PRSO? ,TH-RUBY>>
		    <RT-THIS-IS-IT ,TH-RUBY>
		    <RT-PIGEON-INTEREST ,K-PIGEON-GET-RUBY>)
		   (T
		    <TELL ,K-CONFUSED-MSG CR>)>
	     <RTRUE>)
	    (<AND <MC-VERB? PUT>
		  <MC-THIS-PRSO?>>
	     <COND (<MC-PRSI? ,TH-SHAFT>
		    <SETG CH-TRAINED-PIGEON-AUX1 0>
		    <RT-PIGEON-PANIC>)
		   (<OR <NOT <MC-PRSI? ,TH-POCKET>>
			<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>>
		    <RT-PIGEON-PANIC>)
		   (T
		    <TELL "As soon as">
		    <RT-YOU-MSG "let" "lets">
		    <TELL "go of it, the pigeon">
		    <RT-PIGEON-FLY>)>
	     <RTRUE>)
	    (<AND <MC-VERB? DROP RELEASE THROW>
		  <MC-THIS-PRSO?>>
	     <COND (<IN? ,CH-TRAINED-PIGEON ,CH-PLAYER>
		    <RT-ALARM-CLR ,RT-I-PIGEON-LOSE-INTEREST>
		    <RT-ALARM-CLR ,RT-I-PIGEON-IMPATIENT>
		    <COND (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
			   <RT-PIGEON-PANIC>
			   <SETG CH-TRAINED-PIGEON-AUX1 0>)
			  (T
			   <TELL CTHE ,CH-TRAINED-PIGEON>
			   <RT-PIGEON-FLY>)>)
		   (T
		    <RT-CYOU-MSG>
		    <TELL "would have to be holding the pigeon." CR>)>
	     <RTRUE>)
	    (<MC-VERB? TAKE>
	     <COND (<MC-T? ,CH-TRAINED-PIGEON-AUX2>
		    <RT-CYOU-MSG>
		    <TELL "cannot reach " THEO "." CR>
		    <RTRUE>)
		   (<IN? ,CH-TRAINED-PIGEON ,CH-SHERMAN>
		    <RT-IMPOLITE-MSG "take things" "asking">
		    <RTRUE>)>)
	    (<AND <MC-VERB? ASK-FOR>
		  <MC-THIS-PRSI?>>
	     <RT-GET-PIGEON>
	     <RTRUE>)
	    (<AND <MC-VERB? SHOW>
		  <MC-THIS-PRSI?>>
	     <COND (<MC-PRSO? ,TH-RUBY>
		    <RT-THIS-IS-IT ,TH-RUBY>
		    <RT-PIGEON-INTEREST ,K-PIGEON-SHOWN-RUBY>)
		   (T
		    <TELL
"The pigeon doesn't seem to be interested in " THEO "." CR>)>
	     <RTRUE>)
	    (<AND <MC-VERB? KILL SHOOT>
		  <MC-PRSO? CH-TRAINED-PIGEON>>
	     <COND (<OR	<MC-PRSI? ,TH-GUN>
			<MC-VERB? SHOOT>>
		    <COND (<RT-META-IN? ,GL-PRSO ,CH-PLAYER>
			   <TELL ,K-DROP-IT-FIRST-MSG CR>
			   <RTRUE>)
			  (T
			   <COND (<MC-T? ,CH-TRAINED-PIGEON-AUX2>
				  <TELL "Flap. Flap. Flap. Thud." CR>)
				 (T
				  <TELL "You shoot " THEO " and it dies." CR>)>)>)
		   (<OR <MC-PRSI? ,TH-KNIFE>
			<==? ,GL-P-PRSA-WORD ,W?STAB>>
		    <COND (<MC-T? ,CH-TRAINED-PIGEON-AUX2>
			   <TELL "You throw " THEI " at " THEO
". Fortunately, it misses and falls on the ground nearby." CR>
			   <MOVE ,GL-PRSI ,GL-PLACE-CUR>
			   <RTRUE>)
			  (T
			   <TELL "You slice " THEO " into luncheon meat and cry
out, \"Squab, anyone?\"" CR>)>)
		   (<MC-PRSI? ,TH-HANDS>
		    <COND (<MC-T? ,CH-TRAINED-PIGEON-AUX2>
			   <TELL "You can't reach the pigeon." CR>
			   <RTRUE>)
			  (T
			   <TELL "You throttle the poor bird." CR>)>)
		   (T
		    <TELL "You can't kill " THEO " with " THEI "." CR>
		    <RTRUE>)>
	     <COND (<AND <MC-T? ,CH-TRAINED-PIGEON-AUX2>
			 <MC-T? ,CH-TRAINED-PIGEON-AUX3>>
		    <MOVE ,CH-TRAINED-PIGEON-AUX3 ,GL-PLACE-CUR>)>
	     <RT-KILL-PIGEON>
	     <RTRUE>)
	    (<AND <MC-VERB? TOUCH>
		  <MC-THIS-PRSO?>>
	     <TELL CTHEO " coos and nuzzles your hand." CR>)
	    (<AND <MC-VERB? CALL>
		  <MC-THIS-PRSO?>>
	     <COND (<RT-META-IN? ,CH-TRAINED-PIGEON ,GL-WINNER>
		    <RT-CYOU-MSG "already have" "already has">
		    <TELL THEO "." CR>
		    <RTRUE>)
		   (<MC-T? ,CH-TRAINED-PIGEON-AUX2>
		    <TELL CTHEO " ignores ">
		    <COND (<EQUAL? ,GL-WINNER ,CH-PLAYER ,CH-ME>
			   <TELL "you">)
			  (T
			   <TELL THE ,GL-WINNER>)>
		    <TELL ", intent on its task." CR>
		    <RTRUE>)
		   (T
		    <TELL CTHEO " looks at">
		    <RT-YOU-MSG>
		    <TELL "briefly, then loses interest." CR>
		    <RTRUE>)>)>>

<ROUTINE RT-AC-CH-SHERMAN ("OPTIONAL" (CONTEXT <>) "AUX" OBJ OBJ1 P-OBJ WHO)
	<RT-THIS-IS-IT ,CH-SHERMAN>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<FSET? ,CH-SHERMAN ,FL-ASLEEP>
		      <TELL "Sherman is quite unconscious." CR>
		      <RTRUE>)>
	       <RFALSE>)>
	<DEBUGGING? <RT-DEBUG-CH-AC "CH-SHERMAN" .CONTEXT>>
	<SET P-OBJ ,CH-TRAINED-PIGEON-AUX3>
	<COND (<AND <MC-THIS-WINNER?>
		    <FSET? ,CH-SHERMAN ,FL-ASLEEP>>
	       <RT-NO-CONDITION-MSG ,GL-WINNER>)
	      (<RT-TELL-ABOUT? ,CH-SHERMAN>
	       <SET OBJ <COND (<MC-VERB? WHO WHAT>
			       ,GL-PRSO)
			      (T
			       ,GL-PRSI)>>
	       <COND (<MC-IS? ,CH-SHERMAN ,FL-ASLEEP>
		      <RT-NO-CONDITION-MSG ,CH-SHERMAN>)
		     (<EQUAL? .OBJ ,CH-TRAINED-PIGEON>
		      <COND (<BAND ,CH-TRAINED-PIGEON-AUX1 ,K-PIGEON-TIRED>
			     <COND (<IN? .P-OBJ ,CH-SHERMAN>
				    <TELL
"Sherman says, \"He came back with " A .P-OBJ ". I don't know where he
found it.\" He gives you " THE .P-OBJ "." CR>
				    <RT-PIGEON-OBJ .P-OBJ>)
				   (T
				    <TELL "\"He's resting now.\"" CR>)>)
			    (T
			     <TELL
"\"He's a wonderful bird. All you have to do is show him something and tell
him to get it, and away he goes. The only catch is, he only seems to like
things that are red.\"" CR>
			     <RTRUE>)>)
		     (<RT-IDENTIFY-EVENT? ,W?TOBY .OBJ>
		      <TELL
"\"He seems to have a cold, which in his line of work renders him completely
useless.\"" CR>
		      <RTRUE>)
		     (<EQUAL? .OBJ ,CH-SHERMAN>
		      <TELL "\"I'm well. Thank you for asking.\"" CR>) 
		     (<EQUAL? .OBJ ,CH-HOLMES>
		      <TELL
"\"Sherlock and me? We've been mates for years.\"" CR>
		      <RTRUE>)
		     (<AND <EQUAL? .OBJ .P-OBJ>
			   <IN? .P-OBJ ,CH-SHERMAN>>
		      <TELL
"Sherman says, \"The pigeon came back with " A .P-OBJ ". I don't know where
he found it.\" He gives you " THE .P-OBJ "." CR>
		      <RT-PIGEON-OBJ .P-OBJ>)
		     (T
		      <TELL "\"I don't know anything about " THE .OBJ ".\"" CR>)>
	       <RTRUE>)
	      (<RT-WHO-WHAT-FAIL?>
	       <RFATAL>)
	      (<AND <MC-THIS-WINNER?>
		    <MC-VERB? TAKE>
		    <OR <MC-PRSO? ,CH-TRAINED-PIGEON>
			<RT-IDENTIFY-EVENT? ,W?TOBY ,GL-PRSO>>>
	       <SETG GL-WINNER ,CH-PLAYER>
	       <RT-PERFORM ,V?ASK-FOR ,CH-SHERMAN ,GL-PRSO>
	       <RTRUE>)
	      (<OR <AND <MC-VERB? ASK-FOR>
			<MC-THIS-PRSO?>
			<SET OBJ1 ,GL-PRSI>>
		   <AND <MC-VERB? GIVE>
			<MC-PRSI? ,CH-ME ,CH-PLAYER>
			<MC-THIS-WINNER?>
			<SET OBJ1 ,GL-PRSO>>>
	       <COND (<MC-IS? ,CH-SHERMAN ,FL-ASLEEP>
		      <RT-NO-CONDITION-MSG ,CH-SHERMAN>)
		     (<EQUAL? .OBJ1 ,CH-TRAINED-PIGEON>
		      <RT-GET-PIGEON>)
		     (<RT-IDENTIFY-EVENT? ,W?TOBY .OBJ1>
		      <TELL "\"He's not well enough to work.\"" CR>)
		     (<EQUAL? .OBJ1 .P-OBJ>
		      <COND (<IN? .P-OBJ ,CH-SHERMAN>
			     <TELL
"Sherman says, \"Oh, yes. The pigeon came back with " A .P-OBJ ". I don't
know where he found it.\" He gives you " THE .P-OBJ "." CR>
			     <RT-PIGEON-OBJ .P-OBJ>)
			    (T
			     <TELL "\"I already gave it to you.\"" CR>)>)
		     (<IN? ,GL-PRSI ,CH-SHERMAN>
		      <TELL "He gives you " THE .OBJ1 "." CR>
		      <MOVE .OBJ1 ,CH-PLAYER>
		      <RT-THIS-IS-IT .OBJ1>
		      <MC-MAKE .OBJ1 ,FL-SEEN>
		      <MC-MAKE .OBJ1 ,FL-TOUCHED>
		      <MC-UNMAKE .OBJ1 ,FL-NODESC>)
		     (T
		      <TELL "\"I don't have " A .OBJ1 ".\"" CR>)>
	       <RTRUE>)
	      (<AND <MC-VERB? TAKE>
		    <MC-THIS-PRSI?>>
	       <RT-IMPOLITE-MSG "take things" "asking">
	       <RTRUE>)
	      (<MC-THIS-WINNER?>
	       <COND (<MC-VERB? HELLO>
		      <TELL "\"Hello, Dr Watson.\"" CR>)
		     (<MC-VERB? GOODBYE>
		      <TELL "\"Goodbye, Dr Watson.\"" CR>)
		     (<MC-VERB? THANK>
		      <TELL "\"You're welcome.\"" CR>)
		     (<MC-VERB? GIVE-SWP>
		      <RFALSE>)
		     (<MC-VERB? YES>
		      <TELL ,K-GOOD-SHOW-MSG CR>)
		     (<AND <MC-VERB? WHERE>
			   <RT-VISIBLE? ,GL-PRSO>>
		      <TELL "\"Right here, Doctor.\"" CR>
		      <RTRUE>)
		     (<MC-VERB? NO>
		      <TELL ,K-PITY-MSG CR>)
		     (<MC-VERB? MAYBE>
		      <TELL ,K-MAYBE-MSG CR>)
		     (T
		      <TELL
CTHE ,CH-SHERMAN " says, \"Unfortunately, I won't be able to help you with
that.\"" CR>)>)>>

<ROUTINE RT-AC-CH-PRIME-MINISTER ("OPTIONAL" (CONTEXT <>) "AUX" OBJ)
	<RT-THIS-IS-IT ,CH-PRIME-MINISTER>
	<DEBUGGING? <RT-DEBUG-CH-AC "CH-PRIME-MINISTER" .CONTEXT>>
	<COND (<==? .CONTEXT ,K-M-CONT>
	       <TELL "You should be ashamed of yourself." CR>
	       <RTRUE>)
	      (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"He is an elderly man with bushy eyebrows and muttonchop whiskers.">
	       <COND (<FSET? ,CH-PRIME-MINISTER ,FL-ASLEEP>
		      <TELL " He is also unconscious, thanks to you.">)>
	       <CRLF>
	       <RTRUE>)
	      (<AND <MC-THIS-WINNER?>
		    <FSET? ,GL-WINNER ,FL-ASLEEP>>
	       <RT-NO-CONDITION-MSG ,GL-WINNER>)
	      (<RT-TELL-ABOUT? ,CH-PRIME-MINISTER>
	       <SET OBJ <COND (<MC-VERB? WHO WHAT>
			       ,GL-PRSO)
			      (T
			       ,GL-PRSI)>>
	       <COND (<EQUAL? .OBJ ,CH-QUEEN>
		      <TELL "\"It was she herself who suggested consulting
Mr Holmes.\"" CR>)
		     (<EQUAL? .OBJ ,TH-WESTMINSTER-CLUE>
		      <TELL "\"We are all baffled by it. That is why we
have come to Mr Holmes.\"" CR>)
		     (<EQUAL? .OBJ ,LG-TOWER>
		      <TELL "\"Naturally we have closed it until the
investigation is terminated. No one has been allowed to leave since
the theft was discovered.\"" CR>)
		     (<EQUAL? .OBJ ,CH-HOLMES>
		      <TELL "\"We learned of his talents from his brother,
Mycroft.\"" CR>)
		     (<RT-IDENTIFY-EVENT? ,W?MYCROFT .OBJ>
		      <TELL "\"As you are no doubt aware, his involvement with
the government is too sensitive for me to discuss.\"" CR>)
		     (<EQUAL? .OBJ ,CH-HUDSON>
		      <TELL "\"She was good enough to serve me tea while I
waited. Splendid woman.\"" CR>)
		     (<EQUAL? .OBJ ,CH-MORIARTY>
		      <TELL "\"I don't believe I'm familiar with that name.\"" CR>)
		     (<OR <EQUAL? .OBJ ,TH-CROWN-JEWELS>
			  <RT-IDENTIFY-EVENT? ,W?THEFT .OBJ>>
		      <TELL "\"If the theft is discovered, the public's faith
in this government will be shattered. I shall be forced to resign.\"" CR>)
		     (T
		      <TELL "\"Come, Doctor. Let us stick to the essentials.\"" CR>)>
	       <RTRUE>)
	      (<RT-WHO-WHAT-FAIL?>
	       <RFATAL>)
	      (<MC-THIS-WINNER?>
	       <COND (<MC-VERB? YES>
		      <TELL ,K-GOOD-SHOW-MSG CR>)
		     (<MC-VERB? NO>
		      <TELL ,K-PITY-MSG CR>)
		     (<MC-VERB? MAYBE>
		      <TELL ,K-MAYBE-MSG CR>)
		     (T
		      <TELL "\"Surely, Doctor, we should not waste our time
on such trivial activities.\"" CR>
		      <RTRUE>)>)>
	<RFALSE>>

<ROUTINE RT-AC-CH-AKBAR ("OPTIONAL" (CONTEXT <>) "AUX" (HAT <>) OBJ WRD ADJ)
     <RT-THIS-IS-IT ,CH-AKBAR>
     <DEBUGGING? <RT-DEBUG-CH-AC "CH-AKBAR" .CONTEXT>>
     <COND (<==? .CONTEXT ,K-M-DESCFCN>
	    <TELL
"He is a tall, dark-skinned Indian who wears a white turban." CR>
	    <RTRUE>)
	   (<AND <MC-THIS-WINNER?>
		 <FSET? ,GL-WINNER ,FL-ASLEEP>>
	    <RT-NO-CONDITION-MSG ,GL-WINNER>)
	   (<RT-TELL-ABOUT? ,CH-AKBAR>
	    <SET OBJ <COND (<MC-VERB? WHO WHAT> ,GL-PRSO)
			   (T ,GL-PRSI)>>
	    <COND (<MC-IS? ,CH-AKBAR ,FL-ASLEEP>
		   <RT-NO-CONDITION-MSG ,CH-AKBAR>)
		  (T
		   <TELL "\"I know little">
		   <COND (<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
			  <TELL ", honoured sir">)>
		   <TELL
". I have only been in your country a short distance.\"" CR>)>)
	   (<RT-WHO-WHAT-FAIL?>
	    <RFATAL>)
	   (<MC-THIS-WINNER?>
	     <COND (<MC-IS? ,CH-AKBAR ,FL-ASLEEP>
		    <RT-NO-CONDITION-MSG ,CH-AKBAR>)
		   (<MC-VERB? YES>
		    <TELL ,K-GOOD-SHOW-MSG CR>)
		   (<MC-VERB? NO>
		    <TELL ,K-PITY-MSG CR>)
		   (<MC-VERB? MAYBE>
		    <TELL ,K-MAYBE-MSG CR>)
		   (T
		    <RT-NOT-LIKELY-MSG ,CH-AKBAR "will do you any favours">)>)
	   (<MC-THIS-PRSO?>
	    <COND (<MC-VERB? CALL>
		   <COND ;(<MC-ISNOT? ,CH-AKBAR ,FL-SEEN>
			  <MC-MAKE ,CH-AKBAR ,FL-SEEN>
			  <MOVE ,CH-AKBAR ,RM-BAR-OF-GOLD>
			  <TELL
"A door in the back of the room opens and a swarthy looking man walks out. He
looks at you and says, \"What do you want?\"" CR>)
		        (<MC-IS? ,CH-AKBAR ,FL-ASLEEP>
			 <RT-NO-CONDITION-MSG ,CH-AKBAR>)
		        (T
			 <TELL "\"I am here">
			 <COND (<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
			        <TELL ", sahib">)>
			 <TELL ". What is it you wish?\"" CR>)>)
		  (<MC-VERB? TELL-ABOUT>
		   <SET WRD <GET ,GL-P-NAMW 1>>
		   <SET ADJ <GET ,GL-P-ADJW 1>>
		   <COND (<MC-IS? ,CH-AKBAR ,FL-ASLEEP>
			  <RT-NO-CONDITION-MSG ,CH-AKBAR>)
			 (<EQUAL? .WRD ,W?SWORDFISH ,W?PASSWORD ,W?HUSH>
			  <TELL
"\"Passwords are for others. I must have something tangible.\"" CR>)
			 (<EQUAL? .WRD ,W?GIN>
			  <TELL
"\"No thank you. My religion forbids alcoholic beverages.\"" CR>)
			 (<RT-IDENTIFY-EVENT? ,W?PASSWORD ,GL-PRSI>
			  <TELL
"\"She sounds interesting. Can she make curried mongoose?\"" CR>)
			 (<MC-PRSI? ,TH-GARNET>
			  <TELL "\"I must see it before I believe it.\"" CR>)
			 (<MC-PRSI? ,TH-ASH>
			  <TELL "Akbar hesitates, then says, \"I do not know
what you are talking about.\"" CR>)
			 (T
			  <TELL "\"" CTHEI>
			  <RT-DONT-DOESNT-MSG ,GL-PRSI>
			  <TELL "interest me.\"" CR>)>)>)
	   (<MC-THIS-PRSI?>
	    <COND (<AND <MC-VERB? GIVE SHOW>
			<MC-PRSO? ,TH-GARNET>>
		   <RT-ALARM-SET-REL ,RT-I-OUT-OF-TIME <RT-PARM-SET 0 50 0>>
		   <SET HAT <MC-IS? ,TH-WATSONS-HAT ,FL-WORN>>
		   <COND (<RT-META-IN? ,TH-BOX-KEY ,CH-PLAYER>
			  <REMOVE ,TH-BOX-KEY>)>
		   <RT-MOVE-ALL ,CH-PLAYER ,RM-LAIR>
		   <RT-MOVE-ALL ,TH-LAPEL ,RM-LAIR>
		   <RT-MOVE-ALL ,TH-POCKET ,RM-LAIR>
		   <RT-MOVE-ALL ,TH-WATSONS-COAT ,RM-LAIR>
		   <RT-MOVE-ALL ,TH-EARS ,RM-LAIR>
		   <MOVE ,TH-LAPEL ,TH-WATSONS-COAT>
		   <MOVE ,TH-POCKET ,TH-WATSONS-COAT>
		   <MOVE ,TH-WATSONS-COAT ,CH-PLAYER>
		   <COND (<MC-T? .HAT>
			  <MOVE ,TH-WATSONS-HAT ,CH-PLAYER>)
			 (T
			  <MC-UNMAKE ,TH-WATSONS-HAT ,FL-WORN>)>
		   <MC-UNMAKE ,TH-CAB-WHISTLE ,FL-WORN>
		   <MC-UNMAKE ,TH-STETHOSCOPE ,FL-WORN>
		   <MOVE ,CH-AKBAR ,RM-LAIR>
		   <REMOVE ,CH-WIGGINS>
		   <TELL "Akbar takes " THEO " and examines it closely. Then he ">
		   <COND (<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
			  <TELL
"says, \"I must ask you to come with me, sir. But first, I ask that you give
me all that you carry.\" He takes everything you give him, and then apologizes
as he places a blindfold over your eyes. He">)
			 (T
			  <TELL
"grabs you by the arm and drags you into a back room. He frisks you and takes
away everything you are carrying. Then he blindfolds you and">)>
		   <TELL
" leads you down a series of long winding corridors. You hear a door close
behind you, and when he finally removes the blindfold, you are standing in
Moriarty's lair. Akbar locks the door behind you, drops the key on Moriarty's
desk, and piles most of what you were carrying onto the floor." CR>
		   <RT-UPDATE-SCORE 5>
		   <CRLF>
		   <RT-GOTO ,RM-LAIR>)>)>>

<ROUTINE RT-AC-CH-MORIARTY ("OPTIONAL" (CONTEXT <>) OBJ WRD ADJ OFF)
       <DEBUGGING? <RT-DEBUG-CH-AC "CH-MORIARTY" .CONTEXT>>
       <RT-THIS-IS-IT ,CH-MORIARTY>
       <COND (<==? .CONTEXT ,K-M-DESCFCN>
	      <TELL
"The Professor has a high domed forehead that rises above heavily
lidded, almost reptilian eyes." CR>
	      <RTRUE>)
	     (<AND <MC-THIS-WINNER?>
		   <FSET? ,GL-WINNER ,FL-ASLEEP>>
	      <RT-NO-CONDITION-MSG ,GL-WINNER>)
	     (<RT-TELL-ABOUT? ,CH-MORIARTY>
	      <SET OBJ <COND (<MC-VERB? WHO WHAT>
			      ,GL-PRSO)
			     (T
			      ,GL-PRSI)>>
	      <SET OFF <COND (<MC-VERB? WHO WHAT> 0) (T 1)>>
	      <SET WRD <GET ,GL-P-NAMW .OFF>>
	      <SET ADJ <GET ,GL-P-ADJW .OFF>>
	      <COND (<MC-IS? ,CH-MORIARTY ,FL-ASLEEP>
		     <RT-NO-CONDITION-MSG ,CH-MORIARTY>)
		    (<MC-IS? ,CH-MORIARTY ,FL-LOCKED>
		     <TELL
"The Professor's cold, reptilian eyes glare at you in silent hatred." CR>)
		    (<EQUAL? .OBJ ,CH-MORIARTY>
		     <TELL  
"\"I am a mathematical machine, Doctor. I think. I plan. And as you and the
'great' Sherlock Holmes have now learned, all who oppose me suffer inexorable
destruction.\"" CR>)
		    (<OR <EQUAL? .OBJ ,CH-HOLMES ,CH-BANK-GUARD>
			 <RT-IDENTIFY-EVENT? ,W?KIDNAPPING .OBJ>>
		     <TELL
"\"Holmes is a worthy adversary, Doctor. And his kidnapping was purely
accidental. It was nothing more than a blunder on the part of an overeager
subordinate. The guard at the bank knew nothing of my plan. He merely saw a
chance to capture and deliver to me the famous Sherlock Holmes, and he took
it.\"" CR>)
		    (<EQUAL? .OBJ ,CH-AKBAR>
		     <TELL
"\"A trusted associate who was sensible enough to see the advantages of
joining forces with me.\"" CR>)
		    (<OR <EQUAL? .OBJ ,TH-CROWN-JEWELS>
			 <RT-IDENTIFY-EVENT? ,W?THEFT .OBJ>>
		     <COND (<==? .OBJ ,TH-CROWN-JEWELS>
			    <TELL
"\"Pretty, are they not? I purloined them">)
			   (T
			    <TELL "I purloined the Crown Jewels">)>
		     <TELL " at the request of a foreign
government whose identity need not concern you. My clients care nothing
about the Crown Jewels themselves - they wish only to undermine confidence
in the British monarchy as a first step towards weakening and ultimately
destroying the British Empire.\"" CR>)
		    (<OR <EQUAL? .OBJ ,TH-SAPPHIRE ,TH-EMERALD ,TH-RUBY
				      ,TH-OPAL ,TH-GARNET ,TH-TOPAZ>
			 <RT-IDENTIFY-EVENT? ,W?AGRA .OBJ>>
		     <TELL
"\"Merely bait to be used in the hunting of a greater prey.\"" CR>)
		    (<EQUAL? .OBJ ,CH-QUEEN>
		     <TELL
"\"A foolish old woman. Her empire deserves to fail.\"" CR>)
		    (T
		     <TELL
"\"Your lives and the fate of your precious monarchy hang in the balance,
Doctor. Have you nothing better to do than to query me about " THE .OBJ "?\""
CR>)>)
	     (<RT-WHO-WHAT-FAIL?>
	      <RFATAL>)
	     (<MC-THIS-WINNER?>
	      <COND (<MC-IS? ,CH-MORIARTY ,FL-ASLEEP>
		     <RT-NO-CONDITION-MSG ,CH-MORIARTY>)
		    (<MC-VERB? YES>
		     <TELL ,K-GOOD-SHOW-MSG CR>)
		    (<MC-VERB? NO>
		     <TELL ,K-PITY-MSG CR>)
		    (<MC-VERB? MAYBE>
		     <TELL ,K-MAYBE-MSG CR>)
		    (T
		     <RT-NOT-LIKELY-MSG ,CH-MORIARTY "will do you any favours">
		     <RTRUE>)>)
	     (<MC-THIS-PRSI?>
	      <RFALSE>)
	     (<MC-THIS-PRSO?>
	      <RFALSE>)>>

<ROUTINE RT-AC-CH-HUDSON ("OPTIONAL" (CONTEXT <>) "AUX" OBJ)
	<DEBUGGING? <RT-DEBUG-CH-AC "CH-HUDSON" .CONTEXT>>
	<RT-THIS-IS-IT ,CH-HUDSON>
	<COND ;(<AND <MC-THIS-WINNER?>
		    <FSET? ,GL-WINNER ,FL-ASLEEP>>
	       <RT-NO-CONDITION-MSG ,GL-WINNER>)
	      ;(<AND <==? .CONTEXT ,K-M-CONT>
		    <FSET? ,CH-HUDSON ,FL-ASLEEP>>
	       <TELL "You should be ashamed! After all Mrs Hudson has done
for you, you could at least not steal from her. ">
	       <RTRUE>)
	      (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND ;(<MC-IS? ,CH-HUDSON ,FL-ASLEEP>
		      <TELL "Mrs Hudson is quite unconscious." CR>
		      <RTRUE>)
		     (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
		      <TELL "Mrs Hudson appears agitated. She looks at you
and says, \"Mr Holmes is upstairs, Doctor. Please see what you can do for
him.\"" CR>)
		     (T
		      <TELL "Mrs Hudson appears happy that things are back to
normal." CR>)>
	       <RTRUE>)
	      (<RT-TELL-ABOUT? ,CH-HUDSON>
	       <SET OBJ <COND (<MC-VERB? WHO WHAT>
			       ,GL-PRSO)
			      (T
			       ,GL-PRSI)>>
	       <COND (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
		      <COND (<EQUAL? .OBJ ,CH-HOLMES>
			     <TELL
"\"He doesn't eat. He doesn't drink. He doesn't read the newspaper. I'm very
worried about him.\"" CR>)
			    (<EQUAL? .OBJ ,CH-PRIME-MINISTER>
			     <TELL
"\"He seems very worried. I gave him some tea.\"" CR>)
			    (T
			     <TELL 
CTHE ,CH-HUDSON " wrings her hands and looks at you anxiously. \"I'm too
worried to think, Doctor. Won't you see what you can do for Mr Holmes?\""
CR>)>
		      <RTRUE>)
		     (T
		      <COND (<EQUAL? .OBJ ,CH-HOLMES>
			     <TELL
"\"He seems much better now, Doctor. Thank you so much.\"" CR>)
			    (T
			     <TELL
"\"Shouldn't you be asking Mr Holmes?\"" CR>)>
		      <RTRUE>)>)
	      (<RT-WHO-WHAT-FAIL?>
	       <RFATAL>)
	      (<MC-THIS-WINNER?>
	       <COND (<MC-VERB? HELLO>
		      <TELL "\"Hello, Dr Watson.\"" CR>)
		     (<MC-VERB? GOODBYE>
		      <TELL "\"Goodbye, Dr Watson.\"" CR>)
		     (<MC-VERB? YES>
		      <TELL ,K-GOOD-SHOW-MSG CR>)
		     (<MC-VERB? NO>
		      <TELL ,K-PITY-MSG CR>)
		     (<MC-VERB? MAYBE>
		      <TELL ,K-MAYBE-MSG CR>)
		     (<MC-VERB? THANK>
		      <TELL "\"You're quite welcome, Dr Watson.\"" CR>)
		     (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
		      <TELL
"\"I'm sorry Doctor, but I cannot do anything for you until you have attended
to Mr Holmes.\"" CR>)
		     (T
		      <TELL "\"I'm sorry. I must get back to my other
duties.\"" CR>)>)>>

<ROUTINE RT-AC-CH-DENKEEPER ("OPTIONAL" (CONTEXT <>) OBJ)
	<DEBUGGING? <RT-DEBUG-CH-AC "CH-DENKEEPER" .CONTEXT>>
	<RT-THIS-IS-IT ,CH-DENKEEPER>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"He is a scrawny character with a weasel-like face and shifty eyes." CR>
	       <RTRUE>)
	      (<RT-TELL-ABOUT? ,CH-DENKEEPER>
	       <SET OBJ <COND (<MC-VERB? WHO WHAT>
			       ,GL-PRSO)
			      (T
			       ,GL-PRSI)>>
	       <RFALSE>)
	      (<RT-WHO-WHAT-FAIL?>
	       <RFATAL>)
	      (<OR <AND <MC-VERB? CALL>
			<MC-PRSO? ,CH-AKBAR>>
		   <AND <MC-VERB? ASK-FOR ASK-ABOUT>
			<MC-PRSI? ,CH-AKBAR>>>
	       <COND (<OR <MC-ISNOT? ,CH-AKBAR ,FL-SEEN>
			  <NOT <IN? ,CH-AKBAR ,RM-BAR-OF-GOLD>>>
		      <TELL CTHE ,CH-DENKEEPER " gives">
		      <RT-YOU-MSG>
		      <TELL
"a sideways look and says, \"He might be here, and then again he might not.
What's the password?\"" CR>)
		     (T
		      <TELL
CTHE ,CH-DENKEEPER " says, \"He's right there in front of you.\"" CR>)>
	       <RTRUE>)
	      (<MC-VERB? GIVE>
	       <FCLEAR ,GL-PRSO ,FL-WORN>
	       <REMOVE ,GL-PRSO>
	       <TELL
"The denkeeper gives you a quick look of surprise, then he shrugs his
shoulders and disappears briefly into a back room, returning moments later
without " THEO "." CR>
	       <RTRUE>)
	      (<AND <MC-THIS-WINNER?>
		    <NOT <MC-VERB? SWORDFISH PASSWORD>>>
	       <RT-NOT-LIKELY-MSG ,CH-DENKEEPER "will do you any favours">
	       <RTRUE>)>
	<RFALSE>>

<ROUTINE RT-AC-CH-LIBRARIAN ("OPTIONAL" (CONTEXT <>) OBJ)
	<DEBUGGING? <RT-DEBUG-CH-AC "CH-LIBRARIAN" .CONTEXT>>
	<RT-THIS-IS-IT ,CH-LIBRARIAN>
	<COND (<RT-TELL-ABOUT? ,CH-LIBRARIAN>
	       <SET OBJ <COND (<MC-VERB? WHO WHAT>
			       ,GL-PRSO)
			      (T
			       ,GL-PRSI)>>
	       <TELL "\"Let me finish telling you about this first.\"" CR>)
	      (<RT-WHO-WHAT-FAIL?>
	       <RFATAL>)
	      (<AND <MC-THIS-WINNER?>
		    <NOT <MC-VERB? HUSH>>>
	       <TELL "\"I will in a moment, but first let me finish telling you
about this.\"" CR>
	       <RTRUE>)
	      (<MC-THIS-PRSI?>
	       <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <RFALSE>)>>

<ROUTINE RT-AC-CH-NANNIES ("OPTIONAL" (CONTEXT <>) OBJ)
	<DEBUGGING? <RT-DEBUG-CH-AC "CH-NANNIES" .CONTEXT>>
	<RT-THIS-IS-IT ,CH-NANNIES>
	<COND (<RT-TELL-ABOUT? ,CH-NANNIES>
	       <SET OBJ <COND (<MC-VERB? WHO WHAT>
			       ,GL-PRSO)
			      (T
			       ,GL-PRSI)>>
	       <TELL ,K-TOO-HAUGHTY-MSG CR>)
	      (<RT-WHO-WHAT-FAIL?>
	       <RFATAL>)
	      (<MC-THIS-WINNER?>
	       <TELL ,K-TOO-HAUGHTY-MSG CR>
	       <RTRUE>)
	      (<MC-THIS-PRSI?>
	       <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <RFALSE>)>>

<ROUTINE RT-AC-CH-HOUSEWIVES ("OPTIONAL" (CONTEXT <>) OBJ)
	<DEBUGGING? <RT-DEBUG-CH-AC "CH-HOUSEWIVES" .CONTEXT>>
	<RT-THIS-IS-IT ,CH-HOUSEWIVES>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<IN? ,CH-ELIZA-DOOLITTLE ,RM-COVENT-GARDEN>
		      <TELL "The women have gathered in a circle around the
girl. They keep looking at you as if they expect you to do something." CR>)
		     (T
		      <TELL "The housewives mill among the stalls, haggling
with merchants over prices and looking for bargains." CR>)>
	       <RTRUE>)
	      (<RT-TELL-ABOUT? ,CH-HOUSEWIVES>
	       <SET OBJ <COND (<MC-VERB? WHO WHAT>
			       ,GL-PRSO)
			      (T
			       ,GL-PRSI)>>
	       <TELL "The women do not respond." CR>)
	      (<RT-WHO-WHAT-FAIL?>
	       <RFATAL>)
	      (<MC-THIS-WINNER?>
	       <COND (<IN? ,CH-ELIZA-DOOLITTLE ,RM-COVENT-GARDEN>
		      <TELL "The women are too upset about the girl to respond." CR>)
		     (T
		      <TELL "The housewives, intent on a bargain, ignore you." CR>)>)
	      (<MC-THIS-PRSI?>
	       <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? LISTEN>
		      <TELL CTHEO " are making a lot of noise." CR>
		      <RTRUE>)
		     (T
		      <RFALSE>)>)>>

<ROUTINE RT-AC-CH-PALACE-GUARD ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-CH-AC "CH-PALACE-GUARD" .CONTEXT>>
	<RT-THIS-IS-IT ,CH-PALACE-GUARD>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "Looks like any other " D ,CH-PALACE-GUARD "." CR>
	       <RTRUE>)
	      (<OR <RT-TELL-ABOUT? ,CH-PALACE-GUARD>
		   <MC-THIS-WINNER?>>
	       <TELL CTHE ,CH-PALACE-GUARD " stares straight ahead." CR>
	       <RTRUE>)
	      (<RT-WHO-WHAT-FAIL?>
	       <RFATAL>)
	      (<OR <AND <MC-VERB? GIVE SHOW>
			<MC-PRSO? ,TH-CROWN-JEWELS>>
		   <AND <EQUAL? .CONTEXT ,K-M-WINNER>
			<MC-VERB? TAKE>
			<MC-PRSO? ,TH-CROWN-JEWELS>>>
	       <TELL
CTHE ,CH-PALACE-GUARD " examines the regalia closely and then disappears
inside the palace. Moments later, he reappears with the Prime Minister, who
quickly ushers you and Holmes into the presence of the Queen." CR CR

"Overcome by emotion, for a few moments she says nothing. Finally she smiles
and says, \"Once again, Mr Holmes, we find ourselves in your debt. Until
now you have always refused our offers of gratitude. Do you intend to refuse
your Queen yet again?\"" CR CR

"Holmes returns her smile. \"I do, Your Majesty. But only because your thanks
would be misdirected. It is Doctor Watson here who deserves your
gratitude.\"" CR CR

"The Queen turns her gaze towards you. \"Indeed? And what reward would you
ask of us, Doctor?\"" CR CR

"Flustered, you stammer something about the service itself being reward
enough, and before you know it you have been royally thanked and ushered back
out of the palace into Queens Gardens. There, you and Holmes join the
cheering multitudes who greet the Queen when, promptly at 9:00 and wearing
the full regalia, she steps onto the balcony to begin the Coronation Day
festivities." CR>
	       <IFSOUND <SOUNDS ,S-FANFARE ,S-START 8 1 END-FANFARE>>
	       <RT-UPDATE-SCORE 1>
	       <TELL
CR "[Your score is " N ,GL-SCORE-CUR " out of " N ,GL-SCORE-MAX ", which
earns you a ranking of " <RT-RANK-STR ,GL-SCORE-CUR> ".]" CR CR>
	       <RT-UPDATE-STATUS-LINE>
	       <RT-QSR>)>
	<RFALSE>>

<ROUTINE RT-AC-CH-URCHINS ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-CH-AC "CH-URCHINS" .CONTEXT>>
	<RT-THIS-IS-IT ,CH-URCHINS>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<EQUAL? <RT-TIME-OF-DAY> 0>
		      <TELL "Despite the hour, the">)
		     (T
		      <TELL "The">)>
	       <TELL " urchins are playing games in the street." CR>
	       <COND (<MC-IS? ,CH-WIGGINS ,FL-BROKEN>
		      <TELL CR ,K-URCHIN-MSG CR>
		      <RTRUE>)>)
	      (<OR <RT-TELL-ABOUT? ,CH-URCHINS>
		   <MC-THIS-WINNER?>>
	       <TELL CTHE ,CH-URCHINS " ignore you." CR>
	       <RTRUE>)
	      (<MC-THIS-PRSI?>
	       <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <RFALSE>)>>

<ROUTINE RT-AC-CH-MEMBERS ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-CH-AC "CH-MEMBERS" .CONTEXT>>
	<RT-THIS-IS-IT ,CH-MEMBERS>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL CTHE ,CH-MEMBERS " are all asleep." CR>
	       ;<COND (<MC-ISNOT? ,CH-BUTLER ,FL-ASLEEP> ;"ALWAYS TRUE"
		      <TELL "asleep">)
		     (T
		      <TELL "knocked out by the etherium, although it's hard to tell">)>
	       ;<TELL "." CR>
	       <RTRUE>)
	      (<OR <RT-TELL-ABOUT? ,CH-MEMBERS>
		   <MC-THIS-WINNER?>>
	       ;<COND (<MC-IS? ,CH-MEMBERS ,FL-ASLEEP>
		      <RT-NO-CONDITION-MSG ,CH-MEMBERS>)
		     (T
		      <TELL CTHE ,CH-MEMBERS " are all asleep." CR>)>
	       <TELL CTHE ,CH-MEMBERS " are all asleep." CR>)
	      (<MC-THIS-PRSI?>
	       <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? ALARM>
		      <RT-CYOU-MSG>
		      <TELL "can't. No one can." CR>)
		     (<MC-VERB? LISTEN>
		      <TELL CTHE ,CH-MEMBERS " are all asleep." CR>)>)>>

