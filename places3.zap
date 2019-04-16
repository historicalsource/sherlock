

	.FUNCT	RT-AC-RM-221B-BAKER-ST,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL3
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-ENTRY-HALL \FALSE
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESC-2 \?CND1
	EQUAL?	GL-PLACE-PRV,RM-ENTRY-HALL \?CCL14
	PRINTI	"You emerge from the house into"
	JUMP	?CND12
?CCL14:	PRINTI	"You"
	ICALL1	RT-DRIVE-WALK-MSG?
	PRINTI	"into"
?CND12:	PRINTI	" Baker Street."
	CRLF	
	CRLF	
?CND1:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \?CND15
	PRINTI	"You are"
	ICALL1	RT-IN-VEHICLE-MSG
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,0,1,3 \?CND17
	PRINTI	"in the spill of a gas streetlight "
?CND17:	PRINTI	"outside Holmes's house. The street "
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL21
	PRINTI	"disappears into the fog"
	JUMP	?CND19
?CCL21:	PRINTI	"continues"
?CND19:	PRINTI	" to the north and south. The door to the house is to the west."
	CRLF	
?CND15:	EQUAL?	CONTEXT,K-M-DESC-1 \?CCL24
	FSET	LG-BAKER-ST-DOOR,FL-SEEN
	FSET	CH-PLAYER,FL-SEEN
	CRLF	
	PRINTR	"You have come in response to an urgent summons from your old landlady, Mrs Hudson. As the fog swirls around you, you huddle into your coat and shiver in the predawn chill."
?CCL24:	EQUAL?	CONTEXT,K-M-DESC-3,K-M-DESC-2 \?CCL26
	IN?	CH-HOLMES,RM-221B-BAKER-ST \FALSE
	ZERO?	GL-PUPPY \FALSE
	CRLF	
	ICALL2	RT-CTHEO-PRINT,CH-HOLMES
	PRINTI	" says, ""Ah, there you are Watson. While you were inside I gave our little problem some thought. Obviously the person who stole the Crown Jewels wanted the authorities to turn to me for help, and it is equally obvious that the thief has laid down a trail for me to follow, in hopes of somehow entrapping me."
	CRLF	
	CRLF	
	PRINTI	"""So let's play his game, Doctor. But let's play it by our rules. The thief will have tried to anticipate the sequence of my actions, and I'm sure he has laid his trap accordingly. But if "
	HLIGHT	K-H-ITL
	PRINTI	"you"
	HLIGHT	K-H-NRM
	PRINTI	" were to guide the course of our investigations, he will certainly be thrown off the scent."
	CRLF	
	CRLF	
	PRINTI	"""Therefore, let us take surprise onto our side and rely on your instincts as the man of action I know you to be - despite your frequent modest assertions to the contrary."" He steps to one side and says, ""Lead on, good Doctor. I will follow."" Holmes gestures for you to lead the way."
	CRLF	
	SET	'GL-PUPPY,CH-HOLMES
	SET	'GL-PUPPY-MSG?,FALSE-VALUE
	RTRUE	
?CCL26:	EQUAL?	CONTEXT,K-M-DESC-2,K-M-DESC-3 /FALSE
	RFALSE	


	.FUNCT	RT-AC-RM-ENTRY-HALL,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL3
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-221B-BAKER-ST \?CCL10
	ICALL2	RT-DO-WALK,P?WEST
	RTRUE	
?CCL10:	EQUAL?	GL-PLACE-CUR,RM-PARLOUR \?CCL12
	ICALL2	RT-DO-WALK,P?SOUTH
	RTRUE	
?CCL12:	EQUAL?	GL-PLACE-CUR,RM-VESTIBULE \?CCL14
	ICALL2	RT-DO-WALK,P?DOWN
	RTRUE	
?CCL14:	PRINTI	"You'll have to be more explicit."
	CRLF	
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESC-1 \?CCL16
	FSET	CH-HUDSON,FL-SEEN
	FSET	RM-ENTRY-HALL,FL-TOUCHED
	CRLF	
	PRINTI	"You step inside and Mrs Hudson closes the door behind you. The entry hall is just as you remember it - small, underheated, and lit by a feeble gas light. "
	PRINT	K-WELL-WORN-MSG
	RTRUE	
?CCL16:	EQUAL?	CONTEXT,K-M-DESC-2 \?CCL18
	EQUAL?	GL-PLACE-PRV,RM-221B-BAKER-ST \?CCL21
	PRINTI	"You enter the house and pause in the entry hall. "
	PRINT	K-WELL-WORN-MSG
	CRLF	
	RFALSE	
?CCL21:	EQUAL?	GL-PLACE-PRV,RM-VESTIBULE \?CCL23
	PRINTI	"You descend the stairs into the entry hall. The parlour door is to the north. "
	ICALL2	RT-OPEN-CLOSED-MSG,LG-BAKER-ST-DOOR
	CRLF	
	RFALSE	
?CCL23:	PRINTI	"You walk out into the entry hall. "
	ICALL2	RT-OPEN-CLOSED-MSG,LG-BAKER-ST-DOOR
	CRLF	
	RFALSE	
?CCL18:	EQUAL?	CONTEXT,K-M-DESC-3 \?CCL25
	PRINT	K-WELL-WORN-MSG
	PRINTC	32
	ICALL2	RT-OPEN-CLOSED-MSG,LG-BAKER-ST-DOOR
	CRLF	
	RFALSE	
?CCL25:	GETP	RM-ENTRY-HALL,P?OBJ-NOUN
	EQUAL?	STACK,W?HOUSE \FALSE
	CALL1	RT-AC-LG-HOLMES-HOUSE
	RSTACK	


	.FUNCT	RT-AC-RM-PARLOUR,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL3
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \?CCL8
	EQUAL?	GL-PLACE-CUR,RM-ENTRY-HALL \FALSE
	ICALL2	RT-DO-WALK,P?NORTH
	RTRUE	
?CCL8:	EQUAL?	GL-PRSA,V?EXIT \FALSE
	EQUAL?	GL-PLACE-CUR,RM-PARLOUR \FALSE
	ICALL2	RT-DO-WALK,P?SOUTH
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	TH-MATCHBOOK,FL-SEEN
?CND1:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL17
	PRINTI	"You walk into"
	JUMP	?CND15
?CCL17:	EQUAL?	CONTEXT,K-M-DESC-3 \?CND15
	PRINTI	"You are in"
?CND15:	PRINTI	" a dreary, late Victorian Era parlour."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-VESTIBULE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL3
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-HOLMES-STUDY \?CCL10
	ICALL2	RT-DO-WALK,P?SOUTH
	RTRUE	
?CCL10:	EQUAL?	GL-PLACE-CUR,RM-ENTRY-HALL \FALSE
	ICALL2	RT-DO-WALK,P?UP
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CND1
	EQUAL?	GL-PLACE-PRV,RM-ENTRY-HALL \?CCL15
	PRINTI	"You climb the stairs"
	JUMP	?CND13
?CCL15:	PRINTI	"You leave the study"
?CND13:	PRINTI	" and pause outside the door"
	EQUAL?	CONTEXT,K-M-DESC-1 \?CCL18
	FSET	LG-HOLMES-STUDY-DOOR,FL-SEEN
	PRINTI	" to Holmes's study, nervous about what you might find inside. "
	JUMP	?CND1
?CCL18:	PRINTI	". "
?CND1:	EQUAL?	CONTEXT,K-M-DESC-2,K-M-DESC-3 \?CND19
	PRINTI	"You are on a landing at the top of the stairs."
?CND19:	CRLF	
	CRLF	
	PRINTI	"Holmes's study is to the north."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-HOLMES-STUDY,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL3
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-VESTIBULE \?CCL10
	ICALL2	RT-DO-WALK,P?NORTH
	RTRUE	
?CCL10:	EQUAL?	GL-PLACE-CUR,RM-HOLMES-BEDROOM \FALSE
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	PRINTI	"You step back through time to your bachelor days, when you shared these cluttered digs with the world's only consulting detective. Despite the mess, you can see that the room is unchanged. The fireplace to the north has a pile of letters transfixed to its mantelpiece by a jackknife. Next to them lies Holmes's six-shot revolver, the tobacco slipper, and Holmes's favorite pipe. The violin has been carelessly tossed onto a stack of obviously unread newspapers."
	CRLF	
	CRLF	
	ICALL2	RT-AC-CH-HOLMES,K-M-DESCFCN
	CRLF	
	FSET	TH-MANTELPIECE,FL-SEEN
	FSET	TH-VIOLIN,FL-SEEN
	FSET	TH-NEWSPAPER,FL-SEEN
	FSET	TH-SYRINGE,FL-SEEN
	FSET	TH-PHIAL,FL-SEEN
	FSET	TH-MAIL,FL-SEEN
	FSET	TH-GUN,FL-SEEN
	FSET	TH-KNIFE,FL-SEEN
	FSET	TH-PERSIAN-SLIPPER,FL-SEEN
	FSET	TH-PIPE,FL-SEEN
	FSET	TH-LIQUID,FL-SEEN
	FSET	TH-MOROCCO-CASE,FL-SEEN
	FSET	TH-SOFA,FL-SEEN
	FSET	CH-HOLMES,FL-SEEN
	FSET	LG-HOLMES-BEDROOM-DOOR,FL-SEEN
?CND1:	EQUAL?	CONTEXT,K-M-DESC-2 \?CCL15
	PRINTI	"You return to Holmes's study, which"
	JUMP	?CND13
?CCL15:	EQUAL?	CONTEXT,K-M-DESC-3 \?CND13
	PRINTI	"The study"
?CND13:	EQUAL?	CONTEXT,K-M-DESC-2,K-M-DESC-3 \?CND17
	PRINTI	" is in its usual disarray."
	CRLF	
	FSET?	CH-HOLMES,FL-ASLEEP \?CND19
	CRLF	
	ICALL2	RT-AC-CH-HOLMES,K-M-DESCFCN
?CND19:	IN?	CH-PRIME-MINISTER,RM-HOLMES-STUDY \?CCL23
	CRLF	
	FSET?	CH-PRIME-MINISTER,FL-SEEN /?CCL26
	FSET	CH-PRIME-MINISTER,FL-SEEN
	ICALL2	RT-THIS-IS-IT,CH-PRIME-MINISTER
	PRINTI	"You see a distinguished-looking visitor sitting in the armchair. "
	JUMP	?CND17
?CCL26:	PRINTI	"The visitor fidgets nervously in his chair. "
	JUMP	?CND17
?CCL23:	CRLF	
?CND17:	ICALL2	RT-CTHEO-PRINT,LG-HOLMES-BEDROOM-DOOR
	PRINTI	" to the west is "
	FSET?	LG-HOLMES-BEDROOM-DOOR,FL-OPENED \?CCL29
	PRINTI	"open"
	JUMP	?CND27
?CCL29:	PRINTI	"closed"
?CND27:	PRINTI	". The only other exit is the door to the south."
	CRLF	
	EQUAL?	CONTEXT,K-M-DESC-1 /TRUE
	EQUAL?	CONTEXT,K-M-DESC-2,K-M-DESC-3 /FALSE
	RFALSE	


	.FUNCT	RT-AC-RM-HOLMES-BEDROOM,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CND1
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-HOLMES-STUDY \FALSE
	ICALL2	RT-DO-WALK,P?WEST
	RTRUE	
?CND1:	PRINTI	"This is a sparsely furnished room, whose walls are adorned only by scores of pictures of famous criminals. On a disorderly workbench in the corner, a jumble of laboratory equipment suggests that Holmes is in the middle of one of his chemical experiments. "
	IN?	TH-ETHERIUM-AMPOULE,TH-WORKBENCH \?CND9
	PRINTI	"Set off to one side is a single ampoule with a neatly lettered label affixed to it. "
?CND9:	PRINTI	"The room's only exit is to the east."
	CRLF	
	EQUAL?	CONTEXT,K-M-DESC-1 \?CCL13
	FSET	TH-BED,FL-SEEN
	FSET	TH-BEDSIDE-TABLE,FL-SEEN
	FSET	TH-ETHERIUM-AMPOULE,FL-SEEN
	FSET	TH-LAB-EQUIPMENT,FL-SEEN
	FSET	TH-WORKBENCH,FL-SEEN
	FSET	TH-LAMP,FL-SEEN
	FSET	TH-MAGNIFYING-GLASS,FL-SEEN
	CRLF	
	PRINTR	"Next to the bed there is a table, on which you see a lamp and Holmes's favorite magnifying glass. "
?CCL13:	EQUAL?	CONTEXT,K-M-DESC-2,K-M-DESC-3 /FALSE
	RFALSE	


	.FUNCT	RT-AC-RM-YORK-PLACE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \?CND1
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL7
	PRINTI	"Through the mist you see"
	JUMP	?CND5
?CCL7:	PRINTI	"This is"
?CND5:	PRINTI	" a quiet, residential street, lined with undistinguished, four storey Georgian houses. To the south, York Place opens up into Baker Street, and Marylebone Road comes in from the east."
	CRLF	
?CND1:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \FALSE
	CRLF	
	PRINTI	"The street isn't as quiet as usual, due to the surging crowds of tourists."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-MARYLEBONE-RD,CONTEXT,WHO
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CND1
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-MADAME-TUSSAUDS \FALSE
	ICALL2	RT-DO-WALK,P?SOUTH
	RTRUE	
?CND1:	CALL1	RT-WHO-SAYS? >WHO
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL11
	EQUAL?	GL-PLACE-PRV,RM-MADAME-TUSSAUDS \?CCL14
	PRINTI	"You go out the door and are now"
	JUMP	?CND9
?CCL14:	PRINTI	"You find yourself"
	JUMP	?CND9
?CCL11:	PRINTI	"You are"
?CND9:	ICALL1	RT-IN-VEHICLE-MSG
	PRINTI	"in front of Madame Tussaud's famous wax museum. From here the street continues east and west."
	CRLF	
	CRLF	
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL17
	PRINTI	"The museum is closed for renovations, and there is a guard and a dog patrolling the street outside the entrance, which is just to the north of you. The guard "
	RANDOM	100
	LESS?	33,STACK /?CCL20
	PRINTI	"lights"
	JUMP	?CND18
?CCL20:	RANDOM	100
	LESS?	50,STACK /?CCL22
	PRINTI	"puffs on"
	JUMP	?CND18
?CCL22:	PRINTI	"puts out"
?CND18:	PRINTI	" a cigarette, tips his hat, and says, """
	EQUAL?	GL-PLACE-PRV,RM-MADAME-TUSSAUDS \?CCL25
	PRINTI	"Goodbye"
	JUMP	?CND23
?CCL25:	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL27
	PRINTI	"Hello"
	JUMP	?CND23
?CCL27:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1 \?CCL29
	PRINTI	"Top of the morning to you"
	JUMP	?CND23
?CCL29:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,2 \?CCL31
	PRINTI	"Good day"
	JUMP	?CND23
?CCL31:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,3 \?CND23
	PRINTI	"Good evening"
?CND23:	EQUAL?	WHO,CH-HOLMES \?CCL35
	PRINTI	", Mr Holmes"
	JUMP	?CND33
?CCL35:	PRINTI	", Doctor Watson"
?CND33:	PRINTI	"."""
	CRLF	
	JUMP	?CND15
?CCL17:	EQUAL?	CONTEXT,K-M-DESC-3 \?CND15
	PRINTI	"The guard and the dog are still here, and they show no signs of leaving."
	CRLF	
?CND15:	IN?	CH-PLAYER,TH-HANSOM-CAB /?CND37
	IN?	CH-PLAYER,TH-GROWLER-CAB /?CND37
	ICALL2	SOUNDS,S-GROWL
	CRLF	
	PRINTI	"The dog growls at you."
	CRLF	
?CND37:	EQUAL?	CONTEXT,K-M-DESC-1 \FALSE
	FSET	CH-TUSSAUDS-GUARD,FL-SEEN
	FSET	CH-MATCH-SNIFFING-DOG,FL-SEEN
	FSET	TH-CIGARETTE,FL-SEEN
	RTRUE	


	.FUNCT	RT-AC-RM-CHAMBER-OF-HORRORS,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL3
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \?CCL8
	EQUAL?	GL-PLACE-CUR,RM-MADAME-TUSSAUDS \FALSE
	ICALL2	RT-DO-WALK,P?WEST
	RTRUE	
?CCL8:	EQUAL?	GL-PRSA,V?EXIT \FALSE
	EQUAL?	GL-PLACE-CUR,RM-CHAMBER-OF-HORRORS \FALSE
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	TH-CHARLES-STATUE,FL-SEEN
	FSET	TH-THOMAS-STATUE,FL-SEEN
	FSET	TH-FAWKES-STATUE,FL-SEEN
?CND1:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL17
	PRINTI	"You enter"
	JUMP	?CND15
?CCL17:	PRINTI	"You are in"
?CND15:	PRINTI	" the Chamber of Horrors. Scattered around the room are wax groupings of some of the most gruesome scenes from English history. The only exit is to the east."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-TOTTENHAM-COURT-RD,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	LG-SHOPS,FL-SEEN
?CND1:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \?CND5
	PRINTI	"This part of London is known for its furniture dealers, but all the shops seem to be closed for the Jubilee."
	CRLF	
	CRLF	
	PRINTI	"Marylebone Road goes off to the west here, and Tottenham Court Road continues to the south."
	CRLF	
?CND5:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \?CCL9
	CRLF	
	PRINTI	"Throngs of shoppers peer in the windows of the closed shops."
	CRLF	
	RFALSE	
?CCL9:	CRLF	
	ICALL1	RT-FOG-MSG
	RFALSE	


	.FUNCT	RT-AC-RM-ST-GILES-CIRCUS,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \FALSE
	PRINTI	"You are"
	ICALL1	RT-IN-VEHICLE-MSG
	PRINTI	"in St Giles Circus. Roads lead off in many directions."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-OXFORD-ST,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	PRINTI	"Oxford Street is London's busiest shopping thoroughfare"
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CND3
	PRINTI	", although at this hour the street is deserted"
?CND3:	PRINTI	". Fashionable emporiums line the street on either side, offering goods from all over the British Empire. Unfortunately, they all seem to be closed for the Jubilee."
	CRLF	
	CRLF	
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \?CND5
	PRINTI	"Hoards of frustrated tourists mill about, peering in the windows of the closed shops."
	CRLF	
	CRLF	
?CND5:	PRINTI	"The street continues to the east and west."
	CRLF	
	EQUAL?	CONTEXT,K-M-DESC-1 \FALSE
	FSET	LG-SHOPS,FL-SEEN
	CALL2	RT-META-LOC,TH-GROWLER-CAB
	EQUAL?	STACK,RM-OXFORD-ST \TRUE
	IN?	CH-PLAYER,TH-GROWLER-CAB /TRUE
	FSET	TH-GROWLER-CAB,FL-SEEN
	CRLF	
	PRINTR	"At a cabstand along the curb you see a growler cab."


	.FUNCT	RT-AC-RM-ORCHARD-ST,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \?CND1
	PRINTI	"Orchard Street is the southern extension of Baker Street. From here you can see Oxford Street off to the east, Baker Street to the north, and Audley Street "
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL7
	PRINTI	"fading into the mists"
	JUMP	?CND5
?CCL7:	PRINTI	"continuing"
?CND5:	PRINTI	" to the south."
	CRLF	
	CRLF	
?CND1:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2 \?CCL10
	PRINTI	"Crowds of tourists stream eastward, "
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1 \?CCL13
	PRINTI	"looking forward to spending the day in the shops along Oxford Street."
	CRLF	
	RFALSE	
?CCL13:	PRINTI	"intent on finding some bargains in the shops on Oxford Street."
	CRLF	
	RFALSE	
?CCL10:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,3 \?CCL15
	PRINTI	"Frustrated tourists stream westward, angered by the closed shops in Oxford Street."
	CRLF	
	RFALSE	
?CCL15:	ICALL1	RT-FOG-MSG
	RFALSE	


	.FUNCT	RT-AC-RM-AUDLEY-ST,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	PRINTI	"This is a pleasant street that winds through Mayfair, a fashionable district which takes its name from an ancient fair held there in May of each year."
	CRLF	
	CRLF	
	PRINTI	"To the south is Hyde Park Corner, and to the north is Orchard Street."
	CRLF	
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \FALSE
	CRLF	
	ICALL1	RT-FOG-MSG
	RFALSE	


	.FUNCT	RT-AC-RM-HYDE-PARK-CORNER,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CND1
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-KENSINGTON-GARDENS \FALSE
	ICALL2	RT-DO-WALK,P?SE
	RTRUE	
?CND1:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \?CND9
	PRINTI	"Hyde Park Corner is dominated by the Wellington Arch, a soaring monument to the ""Iron Duke,"" who defeated Napoleon at the Battle of Waterloo."
	CRLF	
	CRLF	
?CND9:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \?CCL13
	PRINTI	"Huge crowds of tourists gape up at the Arch."
	CRLF	
	CRLF	
	JUMP	?CND11
?CCL13:	PRINTI	"The arch is enshrouded in fog."
	CRLF	
	CRLF	
?CND11:	PRINTI	"Roads lead off in many directions."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-KENSINGTON-GARDENS,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL3
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-HYDE-PARK-CORNER \FALSE
	ICALL2	RT-DO-WALK,P?NW
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	CH-NANNIES,FL-SEEN
	FSET	TH-PRAMS,FL-SEEN
	FSET	TH-PARK-FLOWERS,FL-SEEN
?CND1:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \?CCL13
	PRINTI	"A tide of perambulators pushed by well-starched nannies surges along the crowded walk. Everywhere you look there are rows and rows of beautiful flowers."
	CRLF	
	RFALSE	
?CCL13:	PRINTI	"The flower gardens are deserted."
	CRLF	
	CRLF	
	ICALL1	RT-FOG-MSG
	RFALSE	


	.FUNCT	RT-AC-RM-TRAFALGAR-SQUARE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL3
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-DIOGENES-CLUB \FALSE
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	TH-PIGEONS,FL-SEEN
	FSET	TH-NELSON-COLUMN,FL-SEEN
	FSET	TH-NELSON-EYE,FL-SEEN
	FSET	TH-NELSON-STATUE,FL-SEEN
?CND1:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \?CND11
	PRINTI	"Pigeons, pigeons, everywhere. You are"
	ICALL1	RT-IN-VEHICLE-MSG
	PRINTI	"in one of the great open spaces of London, named for Nelson's naval victory over Napoleon in 1805. Streets come in and go out at all angles, and everywhere you look there are "
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \?CND13
	PRINTI	"people feeding "
?CND13:	PRINTI	"pigeons."
	CRLF	
	CRLF	
	PRINTI	"The square is dominated by Nelson's Column, a 167 foot tall Corinthian column with"
	PRINT	K-NELSON-STATUE-MSG
	CRLF	
	CRLF	
	PRINTI	"The entrance to the Diogenes Club is to the west."
	CRLF	
?CND11:	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \FALSE
	CRLF	
	ICALL1	RT-FOG-MSG
	RFALSE	


	.FUNCT	RT-AC-RM-DIOGENES-CLUB,CONTEXT
	EQUAL?	CONTEXT,K-M-ENTERED \?CCL3
	ICALL	SOUNDS,S-SNORE,S-START
	JUMP	?CND1
?CCL3:	EQUAL?	CONTEXT,K-M-EXIT \?CND1
	ICALL	SOUNDS,S-SNORE,S-STOP
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL7
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-TRAFALGAR-SQUARE \FALSE
	ICALL2	RT-DO-WALK,P?WEST
	RTRUE	
?CCL7:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL15
	PRINTI	"You enter the hushed atmosphere of the Diogenes Club. The furnishings are aging and opulent. The members are aging and asleep. The only exit is to the east."
	CRLF	
	CRLF	
	FSET?	CH-BUTLER,FL-ASLEEP /?CCL18
	PRINTI	"An ancient butler totters forward to greet you and says in a barely audible whisper, ""May I be of some assistance?"""
	CRLF	
	JUMP	?CND5
?CCL18:	PRINT	K-EVERYONE-OUT-MSG
	CRLF	
	JUMP	?CND5
?CCL15:	PRINTI	"You are in the Diogenes Club. "
	FSET?	CH-BUTLER,FL-ASLEEP /?CCL21
	PRINTI	"The butler is here, waiting to serve you."
	JUMP	?CND19
?CCL21:	PRINT	K-EVERYONE-OUT-MSG
?CND19:	CRLF	
?CND5:	EQUAL?	CONTEXT,K-M-DESC-1 \FALSE
	FSET	CH-BUTLER,FL-SEEN
	FSET	CH-MEMBERS,FL-SEEN
	RTRUE	


	.FUNCT	RT-AC-RM-GREAT-RUSSELL-ST,CONTEXT
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \?CCL3
	PRINTI	"Great Russell Street is the home of the British Museum, the entrance of which is to the north. There is a sign next to the door."
	CRLF	
	CRLF	
	PRINTI	"To the southwest you can see St Giles Circus."
	CRLF	
	RFALSE	
?CCL3:	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-BRITISH-MUSEUM \FALSE
	ICALL2	RT-DO-WALK,P?SOUTH
	RTRUE	


	.FUNCT	RT-AC-RM-BRITISH-MUSEUM,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL3
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-GREAT-RUSSELL-ST \?CCL10
	ICALL2	RT-DO-WALK,P?NORTH
	RTRUE	
?CCL10:	EQUAL?	GL-PLACE-CUR,RM-MANUSCRIPT-ROOM \FALSE
	ICALL2	RT-DO-WALK,P?WEST
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL13
	EQUAL?	GL-PLACE-PRV,RM-GREAT-RUSSELL-ST \?CCL16
	PRINTI	"You walk up the grand staircase and into"
	JUMP	?CND1
?CCL16:	PRINTI	"You walk back down the long corridor and return to"
	JUMP	?CND1
?CCL13:	PRINTI	"You are standing in"
?CND1:	PRINTI	" the entrance hall of the museum. All the corridors leading to the exhibit halls are packed with tourists, and there is a steady stream of people going in and out of the street entrance to the south. Only the corridor to the east seems to be of no interest to the sightseers."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-GROSVENOR-PLACE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	PRINTI	"This is a pleasant but out-of-the-way street that runs northwest to southeast. Few tourists ever visit here. "
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,3 \?CCL5
	PRINTI	"Despite the "
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1 \?CCL8
	PRINTI	"early"
	JUMP	?CND6
?CCL8:	PRINTI	"late"
?CND6:	PRINTI	" hour, some"
	JUMP	?CND3
?CCL5:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,2 \?CND3
	PRINTI	"Some"
?CND3:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \?CCL12
	PRINTI	" people are standing on the corner."
	CRLF	
	RFALSE	
?CCL12:	ICALL1	RT-FOG-MSG
	RFALSE	


	.FUNCT	RT-AC-RM-VICTORIA-SQUARE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL5
	PRINTI	"You come upon"
	JUMP	?CND1
?CCL5:	PRINTI	"You are in"
?CND1:	PRINTI	" Victoria Square. Streets go off in many directions."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-BROAD-SANCTUARY,CONTEXT
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \?CCL3
	FSET	LG-WESTMINSTER-DOOR,FL-SEEN
	PRINTI	"You are"
	ICALL1	RT-IN-VEHICLE-MSG
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \?CND4
	PRINTI	"in the midst of a crowd of tourists "
?CND4:	PRINTI	"in front of the west door of Westminster Abbey. The towers of the Abbey"
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL8
	PRINTI	" loom in the fog"
	JUMP	?CND6
?CCL8:	PRINTI	" soar high"
?CND6:	PRINTI	" above you, and you marvel at this perfect example of Gothic architecture, as generations have done before you."
	CRLF	
	CRLF	
	ICALL2	RT-OPEN-CLOSED-MSG,LG-WESTMINSTER-DOOR
	CRLF	
	CRLF	
	PRINTI	"On the wall next to the door is a small, discreet sign."
	CRLF	
	RFALSE	
?CCL3:	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-NAVE \FALSE
	CALL2	RT-DO-WALK,P?WEST
	RSTACK	


	.FUNCT	RT-AC-RM-PARLIAMENT-SQUARE,CONTEXT
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \?CCL3
	PRINTI	"This is an attractive square at the foot of Whitehall. "
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \?CCL6
	PRINTI	"Large crowds mill around"
	JUMP	?CND4
?CCL6:	PRINTI	"Through the mist you see"
?CND4:	PRINTI	" the entrance to the Houses of Parliament to the southeast. To the west is Birdcage Walk. Broad Sanctuary goes off to the southwest, and Whitehall "
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL9
	PRINTI	"disappears into the gloom"
	JUMP	?CND7
?CCL9:	PRINTI	"is"
?CND7:	PRINTI	" to the north."
	CRLF	
	RFALSE	
?CCL3:	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-PARLIAMENT \FALSE
	ICALL2	RT-DO-WALK,P?NW
	RFALSE	


	.FUNCT	RT-AC-RM-PARLIAMENT,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL3
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-PARLIAMENT-SQUARE \FALSE
	ICALL2	RT-DO-WALK,P?SE
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL11
	EQUAL?	GL-PLACE-PRV,RM-PARLIAMENT-SQUARE \?CCL14
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL17
	PRINTI	"You enter"
	JUMP	?CND1
?CCL17:	PRINTI	"You push your way into"
	JUMP	?CND1
?CCL14:	PRINTI	"You descend the stairs into"
	JUMP	?CND1
?CCL11:	PRINTI	"You are standing in"
?CND1:	PRINTI	" the "
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \?CND18
	PRINTI	"jam-packed "
?CND18:	PRINTI	"entrance hall of the House of Commons."
	CRLF	
	CRLF	
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \?CCL22
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,3 \?CCL25
	PRINTI	"Despite the "
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1 \?CCL28
	PRINTI	"early"
	JUMP	?CND26
?CCL28:	PRINTI	"late"
?CND26:	PRINTI	" hour, there"
	JUMP	?CND23
?CCL25:	PRINTI	"There"
?CND23:	PRINTI	" are hundreds of people lined up to get in. But"
	JUMP	?CND20
?CCL22:	PRINTI	"The Chamber is closed, but"
?CND20:	PRINTI	" off to one side you see a flight of old stone steps leading up into the darkness."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-BUCKINGHAM-PALACE-RD,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	PRINTI	"Buckingham Palace Road connects Queens Gardens to the northeast with Victoria Square to the southwest."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-QUEENS-GARDENS,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	CH-PALACE-GUARD,FL-SEEN
?CND1:	PRINTI	"You are"
	ICALL1	RT-IN-VEHICLE-MSG
	PRINTI	"outside the gate to Buckingham Palace."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-BIRDCAGE-WALK,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL5
	PRINTI	"As you enter Birdcage Walk, your attention is diverted to"
	JUMP	?CND1
?CCL5:	PRINTI	"You see"
?CND1:	PRINTI	" a man who has set up a small souvenir stand near where the parade will pass on Tuesday. "
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL8
	PRINTI	"Oblivious to the fact that there are no crowds here to buy his wares"
	JUMP	?CND6
?CCL8:	PRINTI	"Hoping to attract the attention of the crowd"
?CND6:	PRINTI	", he is waving a handful of overpriced trinkets over his head."
	CRLF	
	EQUAL?	CONTEXT,K-M-DESC-1 \FALSE
	FSET	CH-VENDOR,FL-SEEN
	FSET	TH-TELESCOPE,FL-SEEN
	FSET	TH-TRINKETS,FL-SEEN
	CRLF	
	PRINTI	"As soon as he sees you, the salesman "
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \?CND12
	PRINTI	"ignores everyone else and "
?CND12:	PRINTR	"says, ""'Ere, Guv. Come early for the parade, 'ave you? There'll be thousands of people, you know. Now at the last Jubilee - about a year and a 'alf ago, as I remembers it - I could 'ardly see a fing. But if you was to buy one of my telescopes, you wouldn't 'ardly 'ave any problem, now would you? 'Ow 'bout it, Guv?"""


	.FUNCT	RT-AC-RM-THE-MALL,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	PRINTI	"The Mall runs southwest to northeast between the Queens Gardens and Trafalgar Square."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-WHITEHALL,CONTEXT
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \?CCL3
	PRINTI	"Impressive government buildings line the street on either side. The street continues north and south, and the entrance to Scotland Yard is to the east."
	CRLF	
	RFALSE	
?CCL3:	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-SCOTLAND-YARD \FALSE
	ICALL2	RT-DO-WALK,P?WEST
	RTRUE	


	.FUNCT	RT-AC-RM-SCOTLAND-YARD,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL3
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \?CCL8
	EQUAL?	GL-PLACE-CUR,RM-THE-BLACK-MUSEUM \?CCL11
	ICALL1	RT-ALREADY-IN-ROOM-MSG
	RTRUE	
?CCL11:	EQUAL?	GL-PLACE-CUR,RM-WHITEHALL \FALSE
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	
?CCL8:	EQUAL?	GL-PRSA,V?EXIT \FALSE
	EQUAL?	GL-PLACE-CUR,RM-SCOTLAND-YARD \?CCL16
	ICALL2	RT-DO-WALK,P?WEST
	RTRUE	
?CCL16:	EQUAL?	GL-PLACE-CUR,RM-THE-BLACK-MUSEUM \FALSE
	ICALL2	RT-DO-WALK,P?UP
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL19
	EQUAL?	GL-PLACE-PRV,RM-WHITEHALL \?CCL22
	PRINTI	"You walk up the steps and into the building. Inside, it"
	JUMP	?CND1
?CCL22:	EQUAL?	GL-PLACE-PRV,RM-THE-BLACK-MUSEUM \?CND1
	PRINTI	"You return to the ground floor. It"
	JUMP	?CND1
?CCL19:	PRINTI	"It"
?CND1:	PRINTI	" looks just like any other government building - drab and worn. The door to the street is to the west, and you see some steps leading down."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-THE-BLACK-MUSEUM,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CND1
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \?CCL7
	EQUAL?	GL-PLACE-CUR,RM-SCOTLAND-YARD \FALSE
	ICALL2	RT-DO-WALK,P?DOWN
	RTRUE	
?CCL7:	EQUAL?	GL-PRSA,V?EXIT \FALSE
	EQUAL?	GL-PLACE-CUR,RM-THE-BLACK-MUSEUM \FALSE
	ICALL2	RT-DO-WALK,P?UP
	RTRUE	
?CND1:	FSET	TH-BLIGH-BOAT,FL-SEEN
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \FALSE
	PRINTI	"This is the Black Museum, where the Yard keeps relics and mementos of famous crimes."
	CRLF	
	CRLF	
	PRINTI	"Along one wall is a full-size rowboat with a small sign attached to it."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-NEW-OXFORD-ST,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL5
	EQUAL?	GL-PLACE-PRV,RM-CHEAPSIDE,RM-ST-GILES-CIRCUS \?CCL8
	PRINTI	"The quality of the neighborhood seems to be "
	EQUAL?	GL-PLACE-PRV,RM-ST-GILES-CIRCUS \?CCL11
	PRINTI	"deteriorating"
	JUMP	?CND9
?CCL11:	PRINTI	"improving"
?CND9:	PRINTI	" as you"
	ICALL1	RT-DRIVE-WALK-MSG?
	EQUAL?	GL-PLACE-PRV,RM-ST-GILES-CIRCUS \?CCL14
	PRINTI	"eastward"
	JUMP	?CND12
?CCL14:	PRINTI	"westward"
?CND12:	PRINTI	" along"
	JUMP	?CND1
?CCL8:	EQUAL?	GL-PLACE-PRV,RM-COVENT-GARDEN \?CCL16
	PRINTI	"You leave Covent Garden and enter"
	JUMP	?CND1
?CCL16:	PRINTI	"The cab stops in"
	JUMP	?CND1
?CCL5:	PRINTI	"You are"
	ICALL1	RT-IN-VEHICLE-MSG
	PRINTI	"in"
?CND1:	PRINTI	" New Oxford Street."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-COVENT-GARDEN,CONTEXT
	EQUAL?	CONTEXT,K-M-ENTERED \?CCL3
	ICALL	SOUNDS,S-CROWD,S-START
	JUMP	?CND1
?CCL3:	EQUAL?	CONTEXT,K-M-EXIT \?CND1
	ICALL	SOUNDS,S-CROWD,S-STOP
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL9
	PRINTI	"You enter"
	JUMP	?CND5
?CCL9:	PRINTI	"You are in"
?CND5:	PRINTI	" Covent Garden, which is the central market for all of London. Everywhere you look there are stalls packed with produce from the English countryside."
	CRLF	
	CRLF	
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL12
	PRINTI	"Despite the hour, the"
	JUMP	?CND10
?CCL12:	PRINTI	"The"
?CND10:	PRINTI	" open-air market is crowded with housewives who are shopping for fruits and vegetables."
	CRLF	
	IN?	CH-ELIZA-DOOLITTLE,RM-COVENT-GARDEN \?CND13
	CRLF	
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL17
	PRINTI	"After looking around for a few moments, you"
	JUMP	?CND15
?CCL17:	PRINTI	"You"
?CND15:	PRINTI	" see a crowd of women gathered around a girl who has collapsed on the ground. Her lifeless hand clutches a bunch of flowers."
	CRLF	
?CND13:	EQUAL?	CONTEXT,K-M-DESC-1 \FALSE
	FSET	CH-ELIZA-DOOLITTLE,FL-SEEN
	FSET	CH-HOUSEWIVES,FL-SEEN
	FSET	TH-ELIZAS-FLOWERS,FL-SEEN
	FSET	TH-ELIZAS-MOUTH,FL-SEEN
	RTRUE	


	.FUNCT	RT-AC-RM-THE-STRAND,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL5
	PRINTI	"You enter"
	JUMP	?CND3
?CCL5:	PRINTI	"You are lingering in"
?CND3:	PRINTI	" the Strand, which is the heart of London's theatre district"
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,3 \?CCL8
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL11
	PRINTI	", and fight your way through"
	JUMP	?CND9
?CCL11:	PRINTI	", and you are enjoying being in the midst of"
?CND9:	PRINTI	" the crowds of happy theatre goers"
	JUMP	?CND6
?CCL8:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2 \?CND6
	PRINTC	46
	CRLF	
	CRLF	
	PRINTI	"Crowds are gathering in front of the theatres, trying to select a show to see later in the day"
?CND6:	PRINTI	". Streets lead off to the north, east, and southwest."
	CRLF	
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \FALSE
	CRLF	
	PRINTI	"As you"
	ICALL1	RT-DRIVE-WALK-MSG?
	PRINTI	"through the fog, the empty streets seem haunted by the ghosts of actors from years gone by."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-FLEET-STREET,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	PRINTI	"Fleet Street is the centre of London's thriving newspaper industry"
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL5
	PRINTI	". The presses roar all night, turning out papers that will be delivered by train around the country the next day."
	CRLF	
	JUMP	?CND3
?CCL5:	PRINTI	", and it is crowded with the thousands of people who put out the nation's newspapers."
	CRLF	
?CND3:	CRLF	
	PRINTI	"A street leads off to the west, and there is a passage south to the Embankment."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-THE-EMBANKMENT,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL3
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-THAMES-ONE \FALSE
	ICALL2	RT-DO-WALK,P?NORTH
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL11
	PRINTI	"You arrive at"
	JUMP	?CND1
?CCL11:	PRINTI	"You are"
	ICALL1	RT-IN-VEHICLE-MSG
	PRINTI	"on"
?CND1:	PRINTI	" the Victoria Embankment, on the left bank of the Thames. "
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1 \?CCL14
	PRINTI	"The early morning mist clings to the water and muffles the sounds of the river."
	JUMP	?CND12
?CCL14:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,2 \?CCL16
	PRINTI	"The river is crowded with pleasure boats here for the Jubilee."
	JUMP	?CND12
?CCL16:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,3 \?CCL18
	PRINTI	"The river looks quiet and peaceful in the fading light."
	JUMP	?CND12
?CCL18:	PRINTI	"The river is barely visible through the thick fog."
?CND12:	CRLF	
	EQUAL?	CONTEXT,K-M-DESC-1 \FALSE
	FSET	TH-BOAT,FL-SEEN
	FSET	TH-OAR-1,FL-SEEN
	FSET	TH-OAR-LOCK,FL-SEEN
	CRLF	
	PRINTR	"There is an incredibly old rowboat here. It's got one empty oarlock, and it probably leaks, but it looks as if it might float."


	.FUNCT	RT-AC-RM-UPPER-THAMES-ST,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	PRINTI	"Upper Thames Street runs east and west between the Embankment and Lower Thames Street."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-PINCHIN-LANE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL3
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \FALSE
	EQUAL?	GL-PLACE-CUR,RM-SHERMANS-HOUSE \FALSE
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL11
	EQUAL?	GL-PLACE-PRV,RM-CHEAPSIDE \?CCL14
	PRINTI	"You enter"
	JUMP	?CND1
?CCL14:	EQUAL?	GL-PLACE-PRV,RM-SHERMANS-HOUSE \?CCL16
	PRINTI	"You emerge from Sherman's shop into"
	JUMP	?CND1
?CCL16:	PRINTI	"The cab stops in"
	JUMP	?CND1
?CCL11:	PRINTI	"You are"
	ICALL1	RT-IN-VEHICLE-MSG
	PRINTI	"in"
?CND1:	PRINTI	" Pinchin Lane, a dingy little alley that runs"
	EQUAL?	GL-PLACE-PRV,RM-CHEAPSIDE \?CCL19
	PRINTI	" south from"
	JUMP	?CND17
?CCL19:	PRINTI	" north to"
?CND17:	PRINTI	" Cheapside."
	CRLF	
	CRLF	
	PRINTI	"To the west is the entrance to "
	EQUAL?	CONTEXT,K-M-DESC-1 /?CTR21
	FSET?	RM-SHERMANS-HOUSE,FL-SEEN /?CCL22
?CTR21:	PRINTI	"what looks like a pet shop"
	JUMP	?CND20
?CCL22:	PRINTI	"Sherman's shop"
?CND20:	PRINTC	46
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL27
	EQUAL?	GL-PLACE-PRV,RM-SHERMANS-HOUSE /?CCL27
	PRINTI	" Despite the hour, you see a light shining inside."
	CRLF	
	RFALSE	
?CCL27:	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-CHEAPSIDE,CONTEXT
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \FALSE
	PRINTI	"This is a ramshackle part of town, with dark alleys leading off the main street, which continues east and west. Pinchin Lane leads off to the south."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-BANK-OF-ENGLAND,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CND1
	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \?CCL7
	EQUAL?	GL-PLACE-CUR,RM-THREADNEEDLE-ST \FALSE
	ICALL2	RT-DO-WALK,P?NORTH
	RTRUE	
?CCL7:	EQUAL?	GL-PRSA,V?EXIT \FALSE
	EQUAL?	GL-PLACE-CUR,RM-BANK-OF-ENGLAND \?CCL13
	ICALL2	RT-DO-WALK,P?SOUTH
	RTRUE	
?CCL13:	EQUAL?	GL-PLACE-CUR,RM-BANK-VAULT \FALSE
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	
?CND1:	FSET	LG-BANK-VAULT-DOOR,FL-SEEN
	FSET	TH-DIAL,FL-SEEN
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \FALSE
	PRINTI	"The bank has the eerie silence that normally crowded places have when no one is there. The door to the vault is set into the west wall."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-BANK-VAULT,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK \?CCL3
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL6
	EQUAL?	GL-PLACE-CUR,RM-BANK-OF-ENGLAND \?CCL9
	FSET?	LG-BANK-VAULT-DOOR,FL-OPENED \?CCL12
	ICALL2	RT-AC-RM-BANK-VAULT,K-M-DESC-3
	ICALL2	RT-DESCRIBE-PLACE-CONTENTS,RM-BANK-VAULT
	RTRUE	
?CCL12:	PRINTI	"It's a huge, reinforced-steel door that's set firmly into the wall."
	CRLF	
	CRLF	
	PRINTR	"In the middle of the door you see a big shiny dial."
?CCL9:	ICALL2	RT-AC-RM-BANK-VAULT,K-M-DESC-3
	ICALL2	RT-DESCRIBE-PLACE-CONTENTS,RM-BANK-VAULT
	RTRUE	
?CCL6:	ZERO?	CONTEXT \FALSE
	ZERO?	GL-NOW-PRSI? \FALSE
	EQUAL?	GL-PRSA,V?ENTER \?CCL18
	EQUAL?	GL-PLACE-CUR,RM-BANK-OF-ENGLAND \FALSE
	ICALL2	RT-DO-WALK,P?WEST
	RTRUE	
?CCL18:	EQUAL?	GL-PRSA,V?EXIT \?CCL22
	EQUAL?	GL-PLACE-CUR,RM-BANK-VAULT \FALSE
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	
?CCL22:	EQUAL?	GL-PRSA,V?LOOK-INSIDE,V?SEARCH \?CCL26
	FSET?	LG-BANK-VAULT-DOOR,FL-OPENED \?CCL29
	ICALL	RT-CYOU-MSG,STR?665,STR?666
	PRINTI	"row upon row of "
	ICALL2	DPRINT,TH-BOXES
	PRINTR	"."
?CCL29:	ICALL2	RT-CTHEO-PRINT,LG-BANK-VAULT-DOOR
	PRINTR	" is closed."
?CCL26:	EQUAL?	GL-PRSA,V?UNLOCK \?CCL31
	FSET?	LG-BANK-VAULT-DOOR,FL-OPENED \?CCL34
	ICALL2	RT-CTHEO-PRINT,LG-BANK-VAULT-DOOR
	PRINTR	" is already opened."
?CCL34:	PRINT	K-HOW-TO-MSG
	CRLF	
	RTRUE	
?CCL31:	EQUAL?	GL-PRSA,V?OPEN \?CCL36
	FSET?	LG-BANK-VAULT-DOOR,FL-OPENED \?CCL39
	PRINTR	"The vault door is already open."
?CCL39:	FSET?	TH-DIAL,FL-LOCKED \?CCL41
	PRINTR	"The vault door is locked."
?CCL41:	FSET	LG-BANK-VAULT-DOOR,FL-OPENED
	PRINTR	"The vault door swings open."
?CCL36:	EQUAL?	GL-PRSA,V?SHOOT \FALSE
	PRINT	K-RICOCHET-MSG
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	TH-BOXES,FL-SEEN
	FSET	TH-BOX-LOCK,FL-SEEN
	FSET	TH-SAFETY-DEPOSIT-BOX,FL-SEEN
?CND1:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL46
	PRINTI	"Upon entering, you"
	JUMP	?CND44
?CCL46:	PRINTI	"You"
?CND44:	PRINTI	" see rows and rows of safety deposit boxes."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-KING-WILLIAM-ST,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	PRINTI	"King William Street runs northwest to southeast, from Threadneedle Street to Monument."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-MONUMENT,CONTEXT
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \?CCL3
	PRINTI	"The intersection is dominated by the Monument, a huge obelisk that commemorates the Great Fire of London. On the side of the monument is a plaque."
	CRLF	
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL5
	PRINTR	"It's a huge obelisk designed by Christopher Wren that towers 202 feet in the air."
?CCL5:	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \?CCL9
	EQUAL?	GL-PLACE-CUR,RM-MONUMENT \FALSE
	PRINTI	"You can't go inside "
	ICALL1	RT-THEO-PRINT
	PRINTR	"."
?CCL9:	EQUAL?	GL-PRSA,V?EXIT \FALSE
	EQUAL?	GL-PLACE-CUR,RM-MONUMENT \FALSE
	PRINTI	"You're not in "
	ICALL1	RT-THEO-PRINT
	PRINTR	"."


	.FUNCT	RT-AC-RM-LOWER-THAMES-ST,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL5
	PRINTI	"You enter"
	JUMP	?CND1
?CCL5:	PRINTI	"You are in"
?CND1:	PRINTI	" Lower Thames Street. Roads lead off in many directions, some more savory than others. There is a set of particularly slovenly stairs leading down to an alley that runs alongside the river."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-TOWER-ENTRANCE,CONTEXT
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2,K-M-DESC-3 \FALSE
	PRINTI	"You are"
	ICALL1	RT-IN-VEHICLE-MSG
	PRINTI	"outside the entrance to the Tower of London. Next to the entrance there is a sign."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-SOUTH-AISLE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	TH-POPE-TOMB,FL-SEEN
?CND1:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL7
	PRINTI	"You enter"
	JUMP	?CND5
?CCL7:	PRINTI	"You are in"
?CND5:	PRINTI	" the South Aisle of the Nave. "
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CND8
	PRINTI	"In the gloom, you bump into one of the tombs. "
?CND8:	PRINTI	"There is an exit to the southeast and a door set into the south wall."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-JERICHO-PARLOUR,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL5
	EQUAL?	GL-PLACE-PRV,RM-SOUTH-AISLE \?CCL8
	PRINTI	"From the vastness of the Nave, you pass into"
	JUMP	?CND6
?CCL8:	PRINTI	"You leave the Chamber for"
?CND6:	PRINTI	" the more intimate"
	JUMP	?CND1
?CCL5:	PRINTI	"You are in the"
?CND1:	PRINTI	" Jericho Parlour"
	EQUAL?	CONTEXT,K-M-DESC-2 \?CCL11
	EQUAL?	GL-PLACE-PRV,RM-JERUSALEM-CHAMBER \?CCL11
	PRINTC	46
	CRLF	
	JUMP	?CND9
?CCL11:	PRINTI	", which is the anteroom to the famous Jerusalem Chamber just to the west."
	CRLF	
?CND9:	CRLF	
	PRINTI	"The exit to the Nave is to the north."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-JERUSALEM-CHAMBER,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL5
	PRINTI	"You enter"
	JUMP	?CND3
?CCL5:	PRINTI	"You are standing in"
?CND3:	PRINTI	" the Jerusalem Chamber, one of the oldest parts of the Abbey. In contrast to the cold and forbidding stone elsewhere in the Abbey, this room is panelled in oak and cedar. Just inside the entrance you see a small sign."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-NORTH-CLOISTER,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CCL5
	FSET	TH-PACKET-OF-PAPER,FL-SEEN
	FSET	TH-CRAYON,FL-SEEN
	FSET	TH-RUBBINGS,FL-SEEN
	PRINTI	"You enter"
	JUMP	?CND1
?CCL5:	PRINTI	"You are now in"
?CND1:	PRINTI	" the North Cloister, which is the brass-rubbing centre of the abbey. On the walls are completed rubbings that others have made."
	EQUAL?	CONTEXT,K-M-DESC-1 \?CCL8
	PRINTR	" Someone has left a pacquet of paper and a rubbing crayon here."
?CCL8:	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-SOUTH-TRANSEPT,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	TH-DICKENS-TOMB,FL-SEEN
?CND1:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL7
	PRINTI	"You enter"
	JUMP	?CND5
?CCL7:	PRINTI	"You are in"
?CND5:	PRINTI	" the South "
	PRINT	K-TRANSEPT-MSG
	CRLF	
	CRLF	
	PRINT	K-SHAFT-OF-LIGHT-MSG
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-NORTH-TRANSEPT,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	TH-PITT-TOMB,FL-SEEN
	FSET	TH-FIGURES,FL-SEEN
?CND1:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL7
	PRINTI	"You enter"
	JUMP	?CND5
?CCL7:	PRINTI	"You are in"
?CND5:	PRINTI	" the North "
	PRINT	K-TRANSEPT-MSG
	CRLF	
	CRLF	
	PRINT	K-SHAFT-OF-LIGHT-MSG
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-POETS-CORNER,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	TH-CHAUCER-TOMB,FL-SEEN
?CND1:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL7
	PRINTI	"You walk into"
	JUMP	?CND5
?CCL7:	PRINTI	"You are in"
?CND5:	PRINTI	" the hushed, secluded part of the Abbey known as Poets' Corner. The monuments here are dedicated to Britain's literary giants. The oldest of the tombs is that of Geoffrey Chaucer, who died in the year 1400."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-SOUTH-AMBULATORY,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	PRINT	K-AMBULATORY-MSG
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-SANCTUARY,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	TH-ANNE-OF-CLEVES-TOMB,FL-SEEN
?CND1:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL7
	PRINTI	"You walk into"
	JUMP	?CND5
?CCL7:	PRINTI	"You are in"
?CND5:	PRINTI	" the Sanctuary. This is where the actual Coronation Ceremony takes place whenever a new monarch is crowned. A modest tomb is near the south wall."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-NORTH-AMBULATORY,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	PRINT	K-AMBULATORY-MSG
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-CONFESSOR-CHAPEL,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	TH-EDWARD-TOMB,FL-SEEN
	FSET	TH-HENRY-V-TOMB,FL-SEEN
?CND1:	PRINTI	"The Confessor Chapel is dominated by the tomb of the founder of the Abbey, although there are several other tombs here. It is this chapel that first gave Westminster the name ""Burial place of kings."""
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-SOUTH-CHAPEL-AISLE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	TH-MARY-QUEEN-OF-SCOTS-TOMB,FL-SEEN
?CND1:	PRINTI	"The South Chapel Aisle is the final resting place of Mary, Queen of Scots."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-NORTH-CHAPEL-AISLE,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	TH-ELIZABETH-TOMB,FL-SEEN
?CND1:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL7
	PRINTI	"You enter"
	JUMP	?CND5
?CCL7:	PRINTI	"You are in"
?CND5:	PRINTI	" the North Chapel Aisle. There is a very large tomb here."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-INNOCENTS-CORNER,CONTEXT
	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND1
	FSET	TH-LITTLE-PRINCES-TOMB,FL-SEEN
?CND1:	PRINTI	"This is Innocents' corner, the traditional burial site of royalty who die in infancy. There are several tombs here."
	CRLF	
	RFALSE	


	.FUNCT	RT-AC-RM-DRAWBRIDGE,CONTEXT
	EQUAL?	CONTEXT,K-M-ENTERED \?CCL3
	SET	'ALLOW-IN-TOWER,FALSE-VALUE
	RFALSE	
?CCL3:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CCL7
	PRINTI	"So far, so good. No one has challenged your right to be here. Maybe the Tower has been left unguarded."
	JUMP	?CND1
?CCL7:	EQUAL?	CONTEXT,K-M-DESC-2 \?CCL9
	EQUAL?	GL-PLACE-PRV,RM-TOWER-ENTRANCE \?CCL12
	PRINTI	"You walk back up onto the drawbridge."
	JUMP	?CND1
?CCL12:	PRINTI	"Stung by the guard's rejection, you retrace your steps to the drawbridge."
	JUMP	?CND1
?CCL9:	PRINTI	"You are standing on the drawbridge to the Tower of London."
?CND1:	CRLF	
	CRLF	
	PRINTI	"To the east you see the Byward Tower, and to the west is the Tower Entrance."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-BYWARD-TOWER,CONTEXT
	EQUAL?	CONTEXT,K-M-EXIT \?CND1
	FSET?	TH-SUIT-OF-ARMOUR,FL-WORN \?CND1
	ICALL2	SOUNDS,S-ARMOR
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND5
	FSET	CH-TOWER-GUARD,FL-SEEN
	FSET	LG-RAVENS,FL-SEEN
	PRINTI	"Your luck runs out. "
?CND5:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CND9
	PRINTI	"A costumed Yeoman of the Guard steps forward to challenge you."
	CRLF	
?CND9:	EQUAL?	CONTEXT,K-M-DESC-3 \?CND11
	PRINTI	"You are standing in the Byward Tower, which was built by Edward I in the thirteenth century to control access to the fortress. A burly Beefeater stands in your path."
	CRLF	
?CND11:	CRLF	
	PRINTI	"A few of the Tower's famous ravens are perched here, watching your every move."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-OUTER-WARD,CONTEXT
	EQUAL?	CONTEXT,K-M-EXIT \?CND1
	FSET?	TH-SUIT-OF-ARMOUR,FL-WORN \?CND1
	ICALL2	SOUNDS,S-ARMOR
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	PRINTI	"This is the Outer Ward. From here you can go north, south, or west."
	CRLF	
	CRLF	
	PRINTI	"A few of the Tower's famous ravens are perched here, watching your every move."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-BLOODY-TOWER,CONTEXT
	EQUAL?	CONTEXT,K-M-EXIT \?CND1
	FSET?	TH-SUIT-OF-ARMOUR,FL-WORN \?CND1
	ICALL2	SOUNDS,S-ARMOR
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL9
	PRINTI	"You enter"
	JUMP	?CND5
?CCL9:	PRINTI	"You are in"
?CND5:	PRINTI	" the Bloody Tower where, allegedly, the ""Little Princes in the Tower"" met their death. One exit leads north. The other leads south."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-WAKEFIELD-TOWER,CONTEXT
	EQUAL?	CONTEXT,K-M-EXIT \?CND1
	FSET?	TH-SUIT-OF-ARMOUR,FL-WORN \?CND1
	ICALL2	SOUNDS,S-ARMOR
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	GL-PLACE-PRV,RM-TOWER-GREEN \?CCL9
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CND5
	PRINTI	"You leave the"
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,0,1,3 \?CND12
	PRINTI	" gloom of the"
?CND12:	PRINTI	" Tower Green for the gloom of the Wakefield Tower."
	JUMP	?CND5
?CCL9:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CND5
	PRINTI	"You descend the stairs into the ground floor of the Wakefield Tower."
?CND5:	EQUAL?	CONTEXT,K-M-DESC-3 \?CND16
	PRINTI	"You see only the thick stone walls of the Wakefield Tower."
?CND16:	CRLF	
	CRLF	
	PRINTI	"There is a dark stone staircase leading up, and the only other exit is to the northwest."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-JEWEL-ROOM,CONTEXT
	EQUAL?	CONTEXT,K-M-EXIT \?CND1
	FSET?	TH-SUIT-OF-ARMOUR,FL-WORN \?CND1
	ICALL2	SOUNDS,S-ARMOR
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL9
	PRINTI	"The stairs take you up to"
	JUMP	?CND5
?CCL9:	PRINTI	"You are in"
?CND5:	PRINTI	" the Jewel Room of the Tower of London. The case that once held the Regalia is twisted and smashed"
	EQUAL?	CONTEXT,K-M-DESC-1 \?CCL12
	FSET	TH-MACE,FL-SEEN
	FSET	TH-JEWEL-CASE,FL-SEEN
	PRINTR	", and the weapon that the thief used is lying on the ground nearby."
?CCL12:	PRINTC	46
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-DUNGEON,CONTEXT
	EQUAL?	CONTEXT,K-M-EXIT \?CND1
	FSET?	TH-SUIT-OF-ARMOUR,FL-WORN \?CND1
	ICALL2	SOUNDS,S-ARMOR
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL9
	PRINTI	"You inch your way down the dark stairs and arrive"
	JUMP	?CND5
?CCL9:	PRINTI	"You are"
?CND5:	PRINTI	" in the oldest part of the Tower, the Dungeon."
	CRLF	
	EQUAL?	CONTEXT,K-M-DESC-1 \FALSE
	FSET	TH-SUIT-OF-ARMOUR,FL-SEEN
	ICALL	SOUNDS,S-ARMOR,S-INIT
	CRLF	
	PRINTR	"The room has been converted into museum space, and prominently featured is a man-size suit of armour."


	.FUNCT	RT-DF-RM-TORTURE-ROOM,CONTEXT
	EQUAL?	CONTEXT,K-M-EXIT \?CND1
	FSET?	TH-SUIT-OF-ARMOUR,FL-WORN \?CND1
	ICALL2	SOUNDS,S-ARMOR
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL9
	PRINTI	"You enter"
	JUMP	?CND7
?CCL9:	PRINTI	"You are in"
?CND7:	PRINTI	" the torture room below the Bowyer Tower. Around the walls are hung various instruments of torture. The stairs leading up are the only way out."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-WHITE-TOWER,CONTEXT
	EQUAL?	CONTEXT,K-M-EXIT \?CND1
	FSET?	TH-SUIT-OF-ARMOUR,FL-WORN \?CND1
	ICALL2	SOUNDS,S-ARMOR
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	PRINTI	"This is the White Tower, which was started by William the Conqueror in 1078. Exits lead out and down."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-TOWER-GREEN,CONTEXT
	EQUAL?	CONTEXT,K-M-EXIT \?CND1
	FSET?	TH-SUIT-OF-ARMOUR,FL-WORN \?CND1
	ICALL2	SOUNDS,S-ARMOR
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	PRINTI	"You are on Tower Green, which is at the centre of the Tower of London. Entrances to various towers lie to the northeast, east, southeast, and south. A few ravens are strolling around the green, eyeing you with interest."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-BOWYER-TOWER,CONTEXT
	EQUAL?	CONTEXT,K-M-EXIT \?CND1
	FSET?	TH-SUIT-OF-ARMOUR,FL-WORN \?CND1
	ICALL2	SOUNDS,S-ARMOR
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND5
	FSET	TH-BUNG,FL-SEEN
	FSET	TH-BUTT-OF-MALMSEY,FL-SEEN
	FSET	TH-MALMSEY,FL-SEEN
?CND5:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL11
	PRINTI	"You enter"
	JUMP	?CND9
?CCL11:	PRINTI	"You are in"
?CND9:	PRINTI	" the Bowyer Tower. It was in this room that the Duke of Clarence was drowned in a Butt of Malmsey in 1478. The keg still stands over in the corner."
	CRLF	
	CRLF	
	PRINTI	"Exits lead out and down."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-INSIDE-TRAITORS-GATE,CONTEXT
	EQUAL?	CONTEXT,K-M-EXIT \?CND1
	FSET?	TH-SUIT-OF-ARMOUR,FL-WORN \?CND1
	ICALL2	SOUNDS,S-ARMOR
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1 \?CND5
	FSET	TH-PORTCULLIS-CHAIN,FL-SEEN
?CND5:	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL11
	EQUAL?	GL-PLACE-PRV,RM-OUTSIDE-TRAITORS-GATE \?CCL14
	PRINTI	"You pass under the portcullis"
	JUMP	?CND12
?CCL14:	PRINTI	"You walk south from the Outer Ward"
?CND12:	PRINTI	" and find yourself"
	JUMP	?CND9
?CCL11:	PRINTI	"You are"
?CND9:	PRINTI	" just north of Traitors Gate. The portcullis is "
	FSET?	LG-PORTCULLIS-DOOR,FL-OPENED \?CCL17
	PRINTI	"up"
	JUMP	?CND15
?CCL17:	PRINTI	"down"
?CND15:	PRINTI	". From the wall near the portcullis hangs a chain, and perched on top of the wall are some ravens."
	CRLF	
	RFALSE	


	.FUNCT	RT-DF-RM-OUTSIDE-TRAITORS-GATE,CONTEXT
	EQUAL?	CONTEXT,K-M-EXIT \?CND1
	FSET?	TH-SUIT-OF-ARMOUR,FL-WORN \?CND1
	ICALL2	SOUNDS,S-ARMOR
?CND1:	CALL2	RT-DESCFCN-CONTEXT,CONTEXT
	ZERO?	STACK /FALSE
	EQUAL?	CONTEXT,K-M-DESC-1,K-M-DESC-2 \?CCL9
	EQUAL?	GL-PLACE-PRV,RM-INSIDE-TRAITORS-GATE \?CCL12
	PRINTI	"You pass under the portcullis"
	JUMP	?CND10
?CCL12:	PRINTI	"You leave the boat"
?CND10:	PRINTI	" and find yourself"
	JUMP	?CND5
?CCL9:	PRINTI	"You are"
?CND5:	PRINTI	" just south of Traitors Gate, through which condemned prisoners were brought in to the Tower prior to being executed. The massive iron portcullis is "
	FSET?	LG-PORTCULLIS-DOOR,FL-OPENED \?CCL15
	PRINTI	"up"
	JUMP	?CND13
?CCL15:	PRINTI	"down"
?CND13:	PRINTC	46
	CRLF	
	RFALSE	

	.ENDI
