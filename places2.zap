

	.FUNCT	RT-SURGE
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL3
	PRINTI	"The fog is so thick that even your light cannot penetrate it, so you retrace your steps."
	CRLF	
	RFALSE	
?CCL3:	PRINTI	"Surging crowds of "
	EQUAL?	GL-PLACE-CUR,RM-KENSINGTON-GARDENS \?CCL6
	PRINTI	"haughty nannies"
	JUMP	?CND4
?CCL6:	EQUAL?	GL-PLACE-CUR,RM-COVENT-GARDEN \?CCL8
	PRINTI	"housewives intent on a bargain"
	JUMP	?CND4
?CCL8:	PRINTI	"tourists"
?CND4:	PRINTI	" block your path."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-MADAME-TUSSAUDS,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND4
	FSET	TH-ASH,FL-SEEN
	FSET	TH-WILLIAM-STATUE,FL-SEEN
	FSET	TH-WALTER-STATUE,FL-SEEN
	FSET	TH-ELIZABETH-STATUE,FL-SEEN
	FSET	TH-DRAKE-STATUE,FL-SEEN
	FSET	TH-JOHN-STATUE,FL-SEEN
?CND4:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL8
	EQUAL?	GL-PLACE-PRV,RM-MARYLEBONE-RD \?CCL11
	PRINTI	"You come in off the street and are now standing in"
	JUMP	?CND6
?CCL11:	PRINTI	"You leave the Chamber of Horrors and go back into"
	JUMP	?CND6
?CCL8:	PRINTI	"You are in"
?CND6:	PRINTI	" the lobby."
	CRLF	
	CRLF	
	PRINTI	"All around you are wax statues of famous people. To the west is a dark and ominous-looking doorway with a sign over it. The exit to the street is to the south."
	CRLF	
	FSET?	TH-ASH,FL-ASLEEP \FALSE
	IN?	CH-HOLMES,GL-PLACE-CUR \FALSE
	FSET	TH-ASH,FL-SEEN
	FCLEAR	TH-ASH,FL-ASLEEP
	FCLEAR	TH-ASH,FL-NODESC
	CRLF	
	ICALL2	RT-CTHEO-PRINT,CH-HOLMES
	PRINTI	" drops to his hands and knees and begins a minute examination of the floor. After a few moments he cries, ""Aha! Look here, Watson."" He points to a miniscule speck of ash on the floor."
	CRLF	
	SET	'GL-PUPPY-MSG?,FALSE-VALUE
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-ENTERED \?CCL18
	FSET?	TH-TOBACCO,FL-ASLEEP /?CCL18
	FSET?	TH-TOBACCO,FL-LIGHTED \?CCL18
	ICALL2	RT-UPDATE-SCORE,1
	FSET	TH-TOBACCO,FL-ASLEEP
	RFALSE	
?CCL18:	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-MARYLEBONE-RD \?CCL27
	ICALL2	RT-DO-WALK,P?NORTH
	RTRUE	
?CCL27:	EQUAL?	GL-PLACE-CUR,RM-CHAMBER-OF-HORRORS \FALSE
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	


	.FUNCT	RT-AC-RM-MANUSCRIPT-ROOM,CONTEXT,VALUE
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL6
	PRINTI	"The deserted corridor leads to"
	JUMP	?CND4
?CCL6:	PRINTI	"You are in"
?CND4:	PRINTI	" the manuscript room, which contains a dusty collection of old books on obscure subjects. "
	IN?	CH-LIBRARIAN,RM-MANUSCRIPT-ROOM \?CND7
	PRINTI	"There is an old librarian here, on whose desk sits a handwritten sign that reads ""Quiet, please."" "
?CND7:	PRINTI	"There are thousands of books behind glass cases"
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND9
	PRINTI	", but one is lying unattended on a table"
?CND9:	PRINTI	". The only exit is to the west."
	CRLF	
	EQUAL?	CONTEXT,K-M-DESC-1 \FALSE
	FSET	CH-LIBRARIAN,FL-SEEN
	FSET	TH-CLUE-BOOK,FL-SEEN
	FSET	TH-LIBRARY-TABLE,FL-SEEN
	CRLF	
	PRINTI	"The librarian - who is as dusty as the books - looks up in surprise as you come in. He "
	FSET?	TH-COTTON-BALLS,FL-WORN \?CCL16
	PRINTI	"whispers"
	JUMP	?CND14
?CCL16:	PRINTI	"says loudly"
?CND14:	PRINTI	", ""Oh, I say! Hello! I don't get many visitors here. Is there something I can help you with? Some information about the Jubilee, perhaps? It's quite rare, you know, for a British ruler to celebrate 50 years on the throne. Unique, in fact. The closest anyone else came was Elizabeth, who ruled 45 years - although our records are somewhat vague before the year 900. The Anglo-Saxon chronicles do get rather sketchy, what? Still, they're the best we have. I think I can find a copy for you somewhere here."""
	CRLF	
	CRLF	
	PRINTR	"The librarian's voice trails off as he bustles from shelf to shelf, squinting at the books to find the one he thinks you want."
?CCL3:	ZERO?	CONTEXT /?CCL18
	IN?	CH-LIBRARIAN,RM-MANUSCRIPT-ROOM \?CCL18
	FSET?	CH-LIBRARIAN,FL-ASLEEP /?CCL18
	EQUAL?	CONTEXT,K-M-ENTERED \?CCL24
	FSET?	CH-LIBRARIAN,FL-OPENED \?CCL24
	CRLF	
	ICALL2	RT-CTHEO-PRINT,CH-LIBRARIAN
	PRINTR	" says, ""Welcome back! I have more interesting things to tell you!"""
?CCL24:	EQUAL?	CONTEXT,K-M-EXIT \?CCL28
	PRINTI	"As you leave, the librarian calls out, ""Must you be going? I have so many other interesting things to tell you."""
	CRLF	
	CRLF	
	FSET	CH-LIBRARIAN,FL-OPENED
	RTRUE	
?CCL28:	EQUAL?	CONTEXT,K-M-BEG \FALSE
	EQUAL?	GL-PRSA,V?WALK,V?EXIT /FALSE
	INTBL?	GL-PRSA,GL-GAME-VERBS+2,10 /FALSE
	EQUAL?	GL-PRSA,V?WAIT,V?LISTEN \?CCL37
	PRINTI	"The librarian says "
	FSET?	TH-COTTON-BALLS,FL-WORN \?CCL40
	PRINTI	"softly"
	JUMP	?CND38
?CCL40:	PRINTI	"loudly"
?CND38:	PRINTI	", "
	ICALL1	RT-LIBRARIAN-SAYS-MSG
	RTRUE	
?CCL37:	EQUAL?	GL-PRSA,V?HUSH \?CCL42
	PRINTI	"The librarian stops in midsentence and gets an embarrassed look on his face. ""Oh, I say. I'm sorry to have rambled on like this, but I do so enjoy speaking with visitors. I get them so seldom, you know. Thank you for listening."""
	CRLF	
	CRLF	
	PRINTI	"He leaves the room, mumbling something to himself about the articulation of the third joint of the hind leg of an extinct species of dung beetle."
	CRLF	
	REMOVE	CH-LIBRARIAN
	RTRUE	
?CCL42:	EQUAL?	GL-PRSA,V?LOOK \?CCL44
	ICALL	RT-DESC-ALL,FALSE-VALUE,TRUE-VALUE
	CRLF	
	PRINTI	"As you look around, the librarian says "
	FSET?	TH-COTTON-BALLS,FL-WORN \?CCL47
	PRINTI	"softly"
	JUMP	?CND45
?CCL47:	PRINTI	"loudly"
?CND45:	PRINTI	", "
	ICALL1	RT-LIBRARIAN-SAYS-MSG
	RTRUE	
?CCL44:	EQUAL?	GL-PRSA,V?TELL \?CCL49
	EQUAL?	GL-PRSO,CH-LIBRARIAN /FALSE
?CCL49:	CALL1	RT-TALK-VERB?
	ZERO?	STACK /?CCL53
	PRINTI	"The librarian interrupts you as you attempt to speak, and "
	FSET?	TH-COTTON-BALLS,FL-WORN \?CCL56
	PRINTI	"whispers"
	JUMP	?CND54
?CCL56:	PRINTI	"says"
?CND54:	PRINTI	", "
	ICALL1	RT-LIBRARIAN-SAYS-MSG
	RETURN	2
?CCL53:	PRINTI	"The librarian launches off into another speech, and it distracts you from what you wanted to do. "
	ICALL1	RT-LIBRARIAN-SAYS-MSG
	RTRUE	
?CCL18:	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \?CCL61
	EQUAL?	GL-PLACE-CUR,RM-BRITISH-MUSEUM \FALSE
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	
?CCL61:	EQUAL?	GL-PRSA,V?EXIT \FALSE
	EQUAL?	GL-PLACE-CUR,RM-MANUSCRIPT-ROOM \FALSE
	ICALL2	RT-DO-WALK,P?WEST
	RTRUE	


	.FUNCT	RT-AC-RM-VICTORIA-STREET,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL6
	PRINTI	"You enter"
	JUMP	?CND4
?CCL6:	PRINTI	"You are loitering in"
?CND4:	PRINTI	" Victoria Street, which runs east and west between Victoria Square and Broad Sanctuary."
	CRLF	
	CRLF	
	PRINTI	"You see a sign outside one of the shops."
	CRLF	
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,K-M-BEG \?CCL8
	EQUAL?	GL-PRSA,V?WAIT \?CCL8
	FSET?	RM-VICTORIA-STREET,FL-ASLEEP /?CCL13
	FSET	RM-VICTORIA-STREET,FL-ASLEEP
	PRINTR	"After a few moments, a constable strolls by, bops you on the head with his billy club, and says, ""Move along, you."""
?CCL13:	PRINTI	"The same constable as before walks by and says, ""You again? That's it, mate. Come along with me."" He bops you on the head again and arrests you on a charge of vagrancy."
	CRLF	
	CRLF	
	PRINTI	"You spend the night in gaol, and in the morning Inspector Lestrade drops by to tell you that there has been a mix-up in the paperwork and you are to be deported to Australia the following day. He gives you a letter to deliver to his sister in Melbourne and wishes you luck."
	CRLF	
	CRLF	
	CALL1	RT-QSR
	RSTACK	
?CCL8:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-AC-RM-CLOCK-TOWER,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL6
	PRINTI	"The stairs seem to wind up forever. Finally, you emerge into"
	JUMP	?CND4
?CCL6:	PRINTI	"You are in"
?CND4:	PRINTI	" the interior of the clock tower, high above the Houses of Parliament."
	CRLF	
	CRLF	
	PRINTI	"The immense bell known as Big Ben is hanging from the ceiling, suspended over a hollow shaft that is so deep it might as well be bottomless. A wooden railing runs around the shaft for safety."
	CRLF	
	CRLF	
	PRINTI	"Inside the bell, you see an enormous clapper"
	EQUAL?	CONTEXT,K-M-DESC-1 \?CCL9
	FSET	TH-BELL,FL-SEEN
	FSET	TH-SAPPHIRE,FL-SEEN
	FSET	TH-CLAPPER,FL-SEEN
	FSET	TH-SHAFT,FL-SEEN
	FSET	TH-RAILING,FL-SEEN
	PRINT	K-SAPPHIRE-MSG
	CRLF	
	RTRUE	
?CCL9:	IN?	TH-SAPPHIRE,TH-CLAPPER \?CCL12
	PRINT	K-SAPPHIRE-MSG
	CRLF	
	RFALSE	
?CCL12:	PRINTC	46
	CRLF	
	RFALSE	
?CCL3:	CALL2	RT-ALARM-SET?,RT-I-SWING-BELL
	ZERO?	STACK \FALSE
	ICALL1	RT-ZERO-SECONDS
	RFALSE	


	.FUNCT	RT-AC-RM-THAMES-ONE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	PRINTI	"You are"
	ICALL1	RT-IN-VEHICLE-MSG
	PRINTI	"on the Thames, just south of the Embankment."
	CRLF	
	RFALSE	
?CCL3:	CALL1	RT-PROCESS-BOAT-ON-THAMES
	RSTACK	


	.FUNCT	RT-AC-RM-THAMES-TWO,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	PRINTI	"You are"
	ICALL1	RT-IN-VEHICLE-MSG
	PRINTI	"on the Thames. Downstream you can see London Bridge."
	CRLF	
	RFALSE	
?CCL3:	CALL1	RT-PROCESS-BOAT-ON-THAMES
	RSTACK	


	.FUNCT	RT-AC-RM-THAMES-THREE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	PRINTI	"You are"
	ICALL1	RT-IN-VEHICLE-MSG
	PRINTI	"underneath London Bridge."
	CRLF	
	RFALSE	
?CCL3:	EQUAL?	GL-PRSA,V?EXAMINE,V?LOOK-UNDER \?PRD7
	EQUAL?	GL-PRSO,RM-LONDON-BRIDGE /?CTR4
?PRD7:	EQUAL?	GL-PRSA,V?LOOK-UP \?CCL5
	EQUAL?	GL-PRSO,ROOMS,RM-LONDON-BRIDGE \?CCL5
?CTR4:	PRINTI	"You see nothing of interest"
	IN?	TH-CLUMP-OF-MOSS,RM-THAMES-THREE \?CCL14
	FSET	TH-CLUMP-OF-MOSS,FL-SEEN
	PRINTI	", other than a clump of moss lodged among the supports overhead."
	CRLF	
	JUMP	?CND12
?CCL14:	PRINTC	46
	CRLF	
?CND12:	ICALL1	RT-PROCESS-BOAT-ON-THAMES
	RTRUE	
?CCL5:	CALL1	RT-PROCESS-BOAT-ON-THAMES
	RSTACK	


	.FUNCT	RT-AC-RM-THAMES-FOUR,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	PRINTI	"You are"
	ICALL1	RT-IN-VEHICLE-MSG
	PRINTI	"on the Thames, just south of Traitor's Gate."
	CRLF	
	RFALSE	
?CCL3:	CALL1	RT-PROCESS-BOAT-ON-THAMES
	RSTACK	


	.FUNCT	RT-AC-RM-THAMES-FIVE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	PRINTI	"You are"
	ICALL1	RT-IN-VEHICLE-MSG
	PRINTI	"on the Thames, in danger of drifting out to sea."
	CRLF	
	RFALSE	
?CCL3:	CALL1	RT-PROCESS-BOAT-ON-THAMES
	RSTACK	


	.FUNCT	RT-AC-RM-SHERMANS-HOUSE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	EQUAL?	CONTEXT,K-M-DESC-1 \?CCL6
	ICALL2	RT-THIS-IS-IT,CH-SHERMAN
	FSET	CH-SHERMAN,FL-SEEN
	FSET	RM-SHERMANS-HOUSE,FL-SEEN
	PRINTI	"You enter the cramped quarters of Sherman's shop. The old animal-trainer's eyes brighten up when he sees you."
	CRLF	
	CRLF	
	PRINTR	"""You've probably come looking for Toby,"" he says. ""But I'm afraid I won't be able to help you this time. Toby's not feeling too well, and all my other animals are already out on loan. All I have left is a half-trained pigeon."""
?CCL6:	EQUAL?	CONTEXT,K-M-DESC-2,K-M-DESC-3 \FALSE
	PRINTI	"Sherman's shop is dingy and cramped. Dozens of empty cages are stacked up against the walls."
	CRLF	
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,K-M-ENTERED \?CCL10
	FSET?	RM-SHERMANS-HOUSE,FL-ASLEEP \?CCL13
	FCLEAR	RM-SHERMANS-HOUSE,FL-ASLEEP
	RFALSE	
?CCL13:	FSET?	CH-SHERMAN,FL-ASLEEP /FALSE
	FSET?	CH-TRAINED-PIGEON,FL-ALIVE \?CCL17
	CRLF	
	PRINTI	"Sherman says, ""Welcome back. It's a pleasure to see you again."""
	CRLF	
	CALL2	RT-THIS-IS-IT,CH-SHERMAN
	RSTACK	
?CCL17:	CALL2	RT-SHERMAN-RAGE,TRUE-VALUE
	RSTACK	
?CCL10:	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \?CCL21
	EQUAL?	GL-PLACE-CUR,RM-PINCHIN-LANE \FALSE
	ICALL2	RT-DO-WALK,P?WEST
	RTRUE	
?CCL21:	EQUAL?	GL-PRSA,V?EXIT \FALSE
	EQUAL?	GL-PLACE-CUR,RM-SHERMANS-HOUSE \FALSE
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	


	.FUNCT	RT-AC-RM-THREADNEEDLE-ST,CONTEXT
	ZERO?	CONTEXT \?CND1
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-BANK-OF-ENGLAND \FALSE
	ICALL2	RT-DO-WALK,P?SOUTH
	RTRUE	
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL9
	FSET	CH-BANK-GUARD,FL-SEEN
	FSET	CH-URCHINS,FL-SEEN
	FSET	TH-GUARDS-POCKET,FL-SEEN
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL12
	EQUAL?	GL-PLACE-PRV,RM-BANK-OF-ENGLAND \?CCL15
	PRINTI	"You emerge into"
	JUMP	?CND13
?CCL15:	PRINTI	"You enter"
?CND13:	PRINTI	" Threadneedle Street and are now"
	JUMP	?CND10
?CCL12:	PRINTI	"You are"
?CND10:	PRINTI	" in front of the Bank of England. The entrance to the bank is to the north, Cheapside leads off to the west, and King William Street "
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL18
	PRINTI	"disappears off into the darkness"
	JUMP	?CND16
?CCL18:	PRINTI	"continues"
?CND16:	PRINTI	" to the southeast. On the wall is a small sign."
	CRLF	
	EQUAL?	CONTEXT,K-M-DESC-1 /?CTR20
	IN?	CH-BANK-GUARD,RM-THREADNEEDLE-ST \?CCL21
?CTR20:	CRLF	
	PRINTI	"A bank guard is lounging up against the wall, idly jangling some keys in his pocket while he watches a group of urchins playing in the street."
	CRLF	
	FSET?	CH-WIGGINS,FL-BROKEN \FALSE
	CRLF	
	PRINT	K-URCHIN-MSG
	CRLF	
	RTRUE	
?CCL21:	CRLF	
	PRINTI	"A group of urchins is playing in the street."
	CRLF	
	RFALSE	
?CCL9:	EQUAL?	CONTEXT,K-M-BEG \?CCL27
	IN?	CH-HOLMES,RM-LAIR \?CCL27
	FSET?	TH-TOPAZ,FL-LOCKED /?CCL27
	ICALL1	RT-WIGGINS-HELP-MSG
	CRLF	
	FSET	TH-TOPAZ,FL-LOCKED
	RFALSE	
?CCL27:	EQUAL?	CONTEXT,K-M-ENTERED \FALSE
	EQUAL?	GL-PLACE-PRV,RM-BANK-OF-ENGLAND \FALSE
	FSET?	TH-TOPAZ,FL-ASLEEP /FALSE
	ICALL1	RT-KIDNAP
	FSET	TH-TOPAZ,FL-ASLEEP
	RFALSE	


	.FUNCT	RT-AC-RM-LONDON-BRIDGE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL6
	EQUAL?	GL-PLACE-PRV,RM-LAIR \?CCL9
	PRINTR	"When you emerge from the lair you are momentarily disoriented, blinking your eyes in the bright sunlight. After a few moments, you realize you are standing on London bridge, but you have no idea from which direction you came."
?CCL9:	PRINTI	"You"
	ICALL1	RT-DRIVE-WALK-MSG?
	PRINTI	"up onto"
	JUMP	?CND4
?CCL6:	PRINTI	"You are"
	ICALL1	RT-IN-VEHICLE-MSG
	PRINTI	"on"
?CND4:	PRINTI	" London Bridge. "
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \?CCL12
	PRINTI	"The view of the river from here is spectacular, and hoards of sightseers are here with you to share the view."
	CRLF	
	RFALSE	
?CCL12:	PRINTI	"The fog is so dense you can barely see the river from here."
	CRLF	
	RFALSE	
?CCL3:	ZERO?	CONTEXT \?PRD16
	EQUAL?	GL-PRSA,V?LOOK-UNDER,V?LOOK-DOWN \?PRD16
	EQUAL?	GL-PRSO,RM-LONDON-BRIDGE /?CTR13
?PRD16:	EQUAL?	CONTEXT,K-M-BEG \?CCL14
	EQUAL?	GL-PRSA,V?LOOK-DOWN \?CCL14
	EQUAL?	GL-PRSO,ROOMS \?CCL14
?CTR13:	PRINTR	"You see the Thames flowing slowly by, just as it has done for centuries past."
?CCL14:	ZERO?	CONTEXT \FALSE
	ZERO?	GL-NOW-PRSI? \?CCL26
	EQUAL?	GL-PRSA,V?ENTER \?CCL29
	EQUAL?	GL-PLACE-CUR,RM-LOWER-THAMES-ST \?CCL32
	ICALL2	RT-DO-WALK,P?SOUTH
	RTRUE	
?CCL32:	EQUAL?	GL-PLACE-CUR,RM-THAMES-THREE \FALSE
	PRINTR	"You can't climb onto the bridge."
?CCL29:	EQUAL?	GL-PRSA,V?EXIT \?CCL36
	EQUAL?	GL-PLACE-CUR,RM-LONDON-BRIDGE \FALSE
	ICALL2	RT-DO-WALK,P?NORTH
	RTRUE	
?CCL36:	EQUAL?	GL-PRSA,V?SHOOT \FALSE
	PRINT	K-RICOCHET-MSG
	CRLF	
	RTRUE	
?CCL26:	ZERO?	GL-NOW-PRSI? /FALSE
	IN?	CH-PLAYER,TH-BOAT \FALSE
	EQUAL?	GL-PRSA,V?PUT,V?PUT-ON \FALSE
	PRINTR	"You can't attach anything to the bridge."


	.FUNCT	RT-AC-RM-SWAN-LANE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL6
	EQUAL?	GL-PLACE-PRV,RM-LOWER-THAMES-ST \?CCL9
	PRINTI	"With increasing apprehension, you descend"
	JUMP	?CND7
?CCL9:	PRINTI	"With considerable relief, you emerge"
?CND7:	PRINTI	" into"
	JUMP	?CND4
?CCL6:	PRINTI	"With increasing apprehension, you are standing in"
?CND4:	PRINTI	" Swan Lane, which runs along the waterfront of the Thames."
	CRLF	
	CRLF	
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND10
	PRINTI	"It is a seedy, disreputable, run-down part of town that normally you wouldn't be caught dead in. After a moment's reflection, you wish you hadn't thought of it in quite those terms."
	CRLF	
	CRLF	
?CND10:	PRINTI	"To the west is the entrance to one of the least savory buildings you have ever seen. There is a faded sign above the door that informs you that the establishment was, in better days, known as the Bar of Gold."
	CRLF	
	CRLF	
	PRINTI	"Fortunately, it is only a short walk back up the stairs to Lower Thames Street."
	CRLF	
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,K-M-ENTERED \?CCL13
	EQUAL?	GL-PLACE-PRV,RM-BAR-OF-GOLD \?CCL13
	IN?	CH-WIGGINS,RM-SWAN-LANE \?CCL13
	CRLF	
	ICALL2	RT-CTHEO-PRINT,CH-WIGGINS
	PRINTI	" says, ""Blimey!! I didn't think you would make it out of there alive."""
	CRLF	
	SET	'GL-PUPPY,CH-WIGGINS
	RETURN	GL-PUPPY
?CCL13:	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-BAR-OF-GOLD \FALSE
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	


	.FUNCT	RT-AC-RM-BAR-OF-GOLD,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND4
	FSET	CH-DENKEEPER,FL-SEEN
	FSET	TH-OPIUM-GAS,FL-SEEN
?CND4:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL8
	PRINTI	"After fighting the urge to turn and run, you enter and find yourself "
	JUMP	?CND6
?CCL8:	PRINTI	"You are standing - rather nervously - "
?CND6:	PRINTI	"in the Bar of Gold, the most infamous opium den in London. The proprietor is a most unsavory character who "
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL11
	PRINTI	"gives you a sidelong glance as you enter and then ignores you"
	JUMP	?CND9
?CCL11:	PRINTI	"hasn't given you a second look since you came in"
?CND9:	PRINTC	46
	CRLF	
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,K-M-ENTERING \?CCL13
	EQUAL?	GL-PUPPY,CH-WIGGINS \?CCL13
	ICALL2	RT-THEO-PRINT,CH-WIGGINS
	PRINTI	" says, ""You must be stark raving bonkers. That's the most dangerous place in London. I'll wait out here, thank you very much!"""
	CRLF	
	CRLF	
	SET	'GL-PUPPY,FALSE-VALUE
	RETURN	GL-PUPPY
?CCL13:	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \?CCL19
	EQUAL?	GL-PLACE-CUR,RM-SWAN-LANE \FALSE
	ICALL2	RT-DO-WALK,P?WEST
	RTRUE	
?CCL19:	EQUAL?	GL-PRSA,V?EXIT \FALSE
	EQUAL?	GL-PLACE-CUR,RM-BAR-OF-GOLD \FALSE
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	


	.FUNCT	RT-AC-RM-LAIR,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	EQUAL?	CONTEXT,K-M-DESC-1 \?CCL6
	FSET	CH-MORIARTY,FL-SEEN
	FSET	TH-LAIR-KEY,FL-SEEN
	FSET	TH-CROWN-JEWELS,FL-SEEN
	FSET	TH-MORIARTY-DESK,FL-SEEN
	FSET	TH-ROPE,FL-SEEN
	PRINTI	"At last you come face to face with the evil Professor. He is sitting placidly behind his desk, looking at you as if you were some botanical specimen."
	CRLF	
	CRLF	
	PRINTI	"As you look around the room, you see Sherlock Holmes tied to a chair. He is only inches away from the Crown Jewels, which Moriarty has spread out on his desk, the better to taunt Holmes."
	CRLF	
	CRLF	
	PRINTI	"Holmes looks up and says, ""Ah, there you are Watson."" He turns his head towards Moriarty and says, ""You see, Professor, you grossly underestimate the intelligence and determination of your fellow countrymen."""
	CRLF	
	CRLF	
	PRINTR	"""Watson,"" he continues. ""The Professor and I have just been chatting about why he led us on this merry chase. If you care to ask him, I'm sure he would be happy to fill you in as well."""
?CCL6:	EQUAL?	CONTEXT,K-M-DESC-3 \FALSE
	PRINTI	"The room is simply, but elegantly, furnished."
	FSET?	CH-HOLMES,FL-LOCKED \?CND8
	SET	'GL-PUPPY-MSG?,FALSE-VALUE
	PRINTC	32
	CALL2	RT-PICK-NEXT,GL-HOLMES-DESC-TXT
	PRINT	STACK
	PRINT	K-SECURELY-BOUND-MSG
	PRINTC	46
?CND8:	CRLF	
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,K-M-ENTERED \?CND1
	SET	'GL-PUPPY,CH-HOLMES
?CND1:	EQUAL?	CONTEXT,K-M-BEG \FALSE
	EQUAL?	GL-PRSA,V?TAKE,V?SHOW \?CCL16
	EQUAL?	GL-PRSO,TH-BREATH /FALSE
	FSET?	GL-PRSO,FL-BODYPART /FALSE
	FSET?	GL-PRSO,FL-WORN /FALSE
	FSET?	CH-MORIARTY,FL-LOCKED /FALSE
	FSET?	CH-MORIARTY,FL-ASLEEP /FALSE
	CALL	RT-META-IN?,GL-PRSO,GL-WINNER
	ZERO?	STACK /?CCL30
	CALL	RT-DO-CLOCK-SET,GL-TIME-PARM,0,1,0
	ICALL	RT-ALARM-SET-REL,RT-I-TAKE-WATSONS-STUFF,STACK
	MOVE	GL-PRSO,GL-WINNER
	PRINTI	"Moriarty's normally emotionless features dissolve in rage. He shouts at Akbar, ""Why didn't you take that from him when you brought him in?"""
	CRLF	
	CRLF	
	PRINTR	"The outburst startles Akbar into momentary inaction, but he quickly recovers and starts to come towards you with a violent look in his eyes."
?CCL30:	PRINTI	"Akbar steps in your way"
	FSET?	TH-WATSONS-HAT,FL-WORN \?CND31
	PRINTI	", says, ""Pardon me, honourable sir,"""
?CND31:	PRINTI	" and stops you from taking "
	ICALL1	RT-THEO-PRINT
	PRINTR	"."
?CCL16:	EQUAL?	GL-PRSA,V?RELEASE \?CCL34
	EQUAL?	GL-PRSO,TH-BREATH /FALSE
?CCL34:	EQUAL?	GL-PRSA,V?UNTIE,V?RELEASE \?CCL38
	EQUAL?	GL-PRSO,TH-ROPE /FALSE
	FSET?	GL-PRSO,FL-LOCKED \?CCL43
	FSET?	CH-AKBAR,FL-ASLEEP /?CTR45
	FSET?	CH-AKBAR,FL-LOCKED \?CCL46
?CTR45:	FCLEAR	GL-PRSO,FL-LOCKED
	ICALL	RT-CYOU-MSG,STR?720,STR?721
	ICALL1	RT-THEO-PRINT
	EQUAL?	GL-PRSO,TH-ROPE-AUX1 \?CCL51
	SET	'TH-ROPE-AUX1,TH-ROPE-AUX2
	SET	'TH-ROPE-AUX2,-1
	EQUAL?	TH-ROPE-AUX1,-1 \?CND49
	MOVE	TH-ROPE,CH-PLAYER
	FCLEAR	TH-ROPE,FL-NODESC
	PRINTI	", keeping "
	ICALL2	RT-THEO-PRINT,TH-ROPE
	JUMP	?CND49
?CCL51:	EQUAL?	GL-PRSO,TH-ROPE-AUX2 \?CND49
	SET	'TH-ROPE-AUX2,-1
?CND49:	PRINTC	46
	CRLF	
	EQUAL?	GL-PRSO,CH-MORIARTY,CH-AKBAR \TRUE
	FSET?	CH-AKBAR,FL-ASLEEP /TRUE
	CRLF	
	EQUAL?	GL-PRSO,CH-MORIARTY \?CCL61
	PRINTI	"Bad move. As soon as he is free, Moriarty"
	JUMP	?CND59
?CCL61:	PRINTI	"Akbar immediately unties Moriarty, who"
?CND59:	PRINTI	" unlocks his desk and pulls out a pistol. ""Thank you for releasing me, gentlemen,"" he says, waving the gun at you. ""Very sporting of you."" He glances at his pocketwatch. ""We shouldn't have too long to wait."" Minutes later you hear newsboys running through the streets shouting about the resignation of the Prime Minister."
	CRLF	
	ICALL1	RT-QSR
	RTRUE	
?CCL46:	CALL1	RT-ROPE-MSG
	RSTACK	
?CCL43:	EQUAL?	GL-PRSA,V?RELEASE /FALSE
	ICALL1	RT-CTHEO-PRINT
	ICALL2	RT-ISNT-ARENT-MSG,GL-PRSO
	PRINTR	"tied up."
?CCL38:	EQUAL?	GL-PRSA,V?TIE-UP \?CCL65
	EQUAL?	GL-PRSI,TH-ROPE,ROOMS /?CCL65
	CALL1	RT-IMPOSSIBLE-MSG
	RSTACK	
?CCL65:	EQUAL?	GL-PRSA,V?TIE,V?TIE-UP \?CCL69
	EQUAL?	GL-PRSO,CH-PLAYER,CH-ME /?CTR68
	EQUAL?	GL-PRSI,CH-PLAYER,CH-ME \?CCL69
?CTR68:	PRINTR	"We'll assume you're joking."
?CCL69:	EQUAL?	GL-PRSA,V?TIE,V?TIE-UP \FALSE
	CALL2	RT-VISIBLE?,TH-ROPE
	ZERO?	STACK /?CCL78
	FSET?	CH-AKBAR,FL-ASLEEP /?CTR80
	FSET?	CH-AKBAR,FL-LOCKED \?CCL81
?CTR80:	EQUAL?	CH-HOLMES,GL-PRSI,GL-PRSO \?CND84
	PRINTR	"Surely you jest."
?CND84:	EQUAL?	TH-ROPE-AUX1,-1 \?CCL88
	SET	'TH-ROPE-AUX1,GL-PRSO
	JUMP	?CND86
?CCL88:	EQUAL?	TH-ROPE-AUX2,-1 \?CCL90
	SET	'TH-ROPE-AUX2,GL-PRSO
?CND86:	EQUAL?	GL-PRSI,ROOMS \?CND91
	SET	'GL-PRSI,FALSE-VALUE
?CND91:	MOVE	TH-ROPE,GL-PLACE-CUR
	FSET	TH-ROPE,FL-NODESC
	FSET	GL-PRSO,FL-LOCKED
	EQUAL?	GL-PRSI,FALSE-VALUE,TH-ROPE \?CCL95
	ICALL	RT-CYOU-MSG,STR?722,STR?723
	PRINTI	"up "
	ICALL1	RT-THEO-PRINT
	PRINTR	"."
?CCL90:	ICALL2	RT-CTHEO-PRINT,TH-ROPE
	PRINTR	" is not long enough."
?CCL95:	EQUAL?	TH-ROPE-AUX2,-1 /?CCL97
	ICALL	RT-CYOU-MSG,STR?722,STR?723
	PRINTI	"up "
	ICALL1	RT-THEO-PRINT
	PRINTI	", but "
	ICALL2	RT-THEO-PRINT,TH-ROPE
	PRINTI	" is not long enough to tie up "
	ICALL1	RT-THEI-PRINT
	PRINTR	" as well."
?CCL97:	FSET	GL-PRSI,FL-LOCKED
	PRINTI	"You tie "
	ICALL1	RT-THEO-PRINT
	PRINTI	" to "
	ICALL1	RT-THEI-PRINT
	PRINTR	"."
?CCL81:	CALL1	RT-ROPE-MSG
	RSTACK	
?CCL78:	PRINTI	"You don't have "
	ICALL2	RT-A-PRINT,TH-ROPE
	PRINTR	"."


	.FUNCT	RT-AC-RM-NAVE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	EQUAL?	CONTEXT,K-M-DESC-1 \?CCL6
	FSET	TH-NEWTON-TOMB,FL-SEEN
	PRINTI	"You enter the Abbey and pause in the Nave, struck by the sheer magnificence of the building. Massive Purbeck columns march the length of the Nave, and they rise in perfect proportion to meet each other in a series of pointed arches that are the hallmark of the Gothic style."
	CRLF	
	CRLF	
	PRINTR	"The interior of the Abbey is dark, cold, and gloomy - but after a few moments your eyes adjust and you can make out a tomb at the far end of the room."
?CCL6:	EQUAL?	CONTEXT,K-M-DESC-2,K-M-DESC-3 \FALSE
	EQUAL?	CONTEXT,K-M-DESC-2 \?CCL10
	EQUAL?	GL-PLACE-PRV,RM-BROAD-SANCTUARY \?CCL13
	PRINTI	"You walk through the massive door and find yourself once again in"
	JUMP	?CND8
?CCL13:	PRINTI	"You return to"
	JUMP	?CND8
?CCL10:	EQUAL?	CONTEXT,K-M-DESC-3 \?CND8
	PRINTI	"You are standing in"
?CND8:	PRINTI	" the Nave. Amidst the massive columns, one tomb in particular catches your attention."
	CRLF	
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,K-M-ENTERED \?CCL16
	SET	'PLAYER-IN-ABBEY,TRUE-VALUE
	RFALSE	
?CCL16:	EQUAL?	CONTEXT,K-M-EXIT \FALSE
	EQUAL?	GL-P-WALK-DIR,P?OUT,P?WEST \FALSE
	SET	'PLAYER-IN-ABBEY,FALSE-VALUE
	RFALSE	


	.FUNCT	RT-AC-RM-EVANGELIST-CHAPEL,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	EQUAL?	CONTEXT,K-M-DESC-1 \?CCL6
	FSET	TH-BANK-OF-CANDLES,FL-SEEN
	FSET	TH-VERE-TOMB,FL-SEEN
	PRINTI	"You enter the Evangelist Chapel and wonder what it is about this room that makes you feel it is somehow different from the rest of the Abbey."
	CRLF	
	RFALSE	
?CCL6:	EQUAL?	CONTEXT,K-M-DESC-2 \?CCL8
	PRINTI	"You return to the welcome warmth provided by the array of candles in the Evangelist Chapel."
	CRLF	
	RFALSE	
?CCL8:	PRINTI	"Light! Warmth! There is a bank of candles here lit by devoted worshippers. The candles warm the room so effectively that after a few moments you actually become uncomfortable."
	CRLF	
	CRLF	
	PRINTI	"One of the most unusual tombs in the Abbey is here."
	CRLF	
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,K-M-BEG \FALSE
	ICALL2	RT-PAPER-WARMING,TH-WHITE-PAPER
	ICALL2	RT-PAPER-WARMING,TH-BLUE-PAPER
	ICALL2	RT-PAPER-WARMING,TH-ORANGE-PAPER
	ICALL2	RT-PAPER-WARMING,TH-YELLOW-PAPER
	ICALL2	RT-PAPER-WARMING,TH-BROWN-PAPER
	ICALL2	RT-PAPER-WARMING,TH-GREEN-PAPER
	RFALSE	


	.FUNCT	RT-AC-RM-HENRY-VII-CHAPEL,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /?CCL3
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND4
	FSET	TH-HENRY-VII-TOMB,FL-SEEN
?CND4:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL8
	PRINTI	"You enter"
	JUMP	?CND6
?CCL8:	PRINTI	"You are in"
?CND6:	PRINTI	" Henry VII's chapel, which is one of the most beautiful chapels in the world. The ceiling is a masterpiece of delicate fan vaulting, and the Renaissance gilt-bronze tomb is obviously the work of one of the Italian masters."
	CRLF	
	RFALSE	
?CCL3:	EQUAL?	GL-PRSA,V?LOOK-UP \FALSE
	PRINT	K-BREATH-TAKING-MSG
	CRLF	
	RTRUE	


	.FUNCT	RT-EX-ENTER-BANK-OF-ENGLAND
	LESS?	CH-BANK-GUARD-AUX1,4 \?CCL3
	PRINTI	"The guard stops you as you try to enter. ""Excuse me, sir. You can't go in there. And don't even THINK about trying to bribe me."""
	CRLF	
	ICALL2	RT-THIS-IS-IT,CH-BANK-GUARD
	RFALSE	
?CCL3:	IN?	TH-BOX-KEY,TH-GUARDS-POCKET \?CCL5
	PRINTI	"Holmes takes you to one side and whispers, ""It is obvious, dear fellow, that it would be pointless to enter the bank with no means of unlocking anything we may find inside."""
	CRLF	
	RFALSE	
?CCL5:	IN?	CH-BANK-GUARD,RM-THREADNEEDLE-ST /?CCL7
	RETURN	RM-BANK-OF-ENGLAND
?CCL7:	PRINTI	"As soon as you enter, the guard leaves."
	CRLF	
	CRLF	
	REMOVE	CH-BANK-GUARD
	RETURN	RM-BANK-OF-ENGLAND


	.FUNCT	RT-AC-RM-BUCKINGHAM-PALACE,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \?CCL5
	EQUAL?	GL-PLACE-CUR,RM-QUEENS-GARDENS \FALSE
	ICALL2	RT-DO-WALK,P?WEST
	RTRUE	
?CCL5:	EQUAL?	GL-PRSA,V?EXIT \FALSE
	EQUAL?	GL-PLACE-CUR,RM-BUCKINGHAM-PALACE \FALSE
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	


	.FUNCT	RT-EX-RM-ENTER-BUCKINGHAM-PALACE
	EQUAL?	GL-PRSO,P?WEST,P?IN \FALSE
	EQUAL?	GL-PLACE-CUR,RM-QUEENS-GARDENS \FALSE
	ICALL2	RT-CTHEO-PRINT,CH-PALACE-GUARD
	PRINTI	" steps into your path and says, ""I'm sorry, but I've been instructed to let no one into the Palace unless I receive certain items of interest to the Crown."""
	CRLF	
	RFALSE	


	.FUNCT	RT-EX-RM-STEER-BOAT
	ICALL2	RT-ALARM-CLR,RT-I-MOVE-DOWNSTREAM
	PRINTI	"[To move the boat, ROW or PADDLE in a given direction, or LAND it.]"
	CRLF	
	RFALSE	


	.FUNCT	RT-EX-RM-LAND-BOAT
	PRINTI	"[Land the Boat.]"
	CRLF	
	ICALL1	RT-LAND-BOAT
	RFALSE	


	.FUNCT	RT-EX-RM-LAUNCH-BOAT
	IN?	CH-PLAYER,TH-BOAT \?CCL3
	PRINTI	"[Launch the Boat.]"
	CRLF	
	ICALL1	RT-LAUNCH-BOAT
	RFALSE	
?CCL3:	PRINTI	"The last man who walked on water was killed by a bunch of Romans. Why don't you play it safe and use a boat?"
	CRLF	
	RFALSE	


	.FUNCT	RT-EX-PARLOUR-ENTRY
	FSET?	CH-HOLMES,FL-ASLEEP \?CCL3
	ICALL2	RT-CTHEO-PRINT,CH-HUDSON
	PRINT	K-HUDSON-WORRIED-MSG
	CRLF	
	RFALSE	
?CCL3:	FSET?	LG-PARLOUR-DOOR,FL-OPENED /?CCL5
	ICALL2	RT-CTHEO-PRINT,LG-PARLOUR-DOOR
	PRINTI	" is closed."
	CRLF	
	RFALSE	
?CCL5:	EQUAL?	GL-PRSO,P?NORTH,P?IN \FALSE
	EQUAL?	GL-PLACE-CUR,RM-ENTRY-HALL \FALSE
	RETURN	RM-PARLOUR


	.FUNCT	RT-EX-LEAVE-EMBANKMENT
	FSET?	TH-SUIT-OF-ARMOUR,FL-WORN \?CND1
	PRINT	K-HEAVY-ARMOUR-MSG
	CRLF	
	RFALSE	
?CND1:	IN?	GL-WINNER,TH-BOAT \?CND3
	ICALL	RT-PERFORM,V?EXIT,TH-BOAT
	IN?	GL-WINNER,RM-THE-EMBANKMENT \FALSE
?CND3:	EQUAL?	GL-PRSO,P?NORTH \?CCL9
	EQUAL?	GL-PLACE-CUR,RM-THE-EMBANKMENT \?CCL9
	RETURN	RM-FLEET-STREET
?CCL9:	EQUAL?	GL-PRSO,P?EAST \FALSE
	EQUAL?	GL-PLACE-CUR,RM-THE-EMBANKMENT \FALSE
	RETURN	RM-UPPER-THAMES-ST

	.ENDI
